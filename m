Return-Path: <SRS0=G/+E=HM=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C43C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 12:24:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D231E64E45; Wed, 10 Feb 2021 12:24:25 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1F664E31;
	Wed, 10 Feb 2021 12:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D1F664E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 8CBC341FA3;
	Wed, 10 Feb 2021 12:24:18 +0000 (UTC)
To: Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
Message-ID: <475f7586-cabf-1169-8800-cdd2c012a5a6@marcan.st>
Date: Wed, 10 Feb 2021 21:24:15 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Will, I'm pulling you in at Marc's suggestion. Do you have an opinion 
on what the better solution to this problem is?

The executive summary is that Apple SoCs require nGnRnE memory mappings 
for MMIO, except for PCI space which uses nGnRE. ARM64 currently uses 
nGnRE everywhere. Solutions discussed in this thread and elsewhere include:

1. Something similar to the current hacky patch (which isn't really 
intended as a real solution...); change ioremap to default to nGnRnE 
using some kind of platform-level flag in the DT, then figure out how to 
get the PCI drivers to bypass that. This requires changing almost every 
PCI driver, since most of them use plain ioremap().

2. A per-device DT property that tells of_address_to_resource to set a 
flag in the struct resource, which is then used by 
devm_ioremap_resource/of_iomap to pick a new ioremap_ variant for nGnRnE 
(introduce ioremap_np() for nonposted?) (PCI would work with this 
inasmuch as it would not support it, and thus fall back to the current 
nGnRE default, which is correct for PCI...). This requires changing 
DT-binding drivers that we depend on to not use plain ioremap() (if any 
do so), but that is a finite subset (unlike PCI which involves 
potentially every driver, because thunderbolt).

3. Encode the mapping type in the address of child devices, either 
abusing the high bits of the reg or introducing an extra DT cell there, 
introduce a new OF bus type that strips those away via a ranges mapping 
and sets flags in the struct resource, similar to what the PCI bus does 
with its 3-cell ranges, then do as (2) above and make 
devm_ioremap_resource/of_iomap use it:

On 09/02/2021 07.57, Arnd Bergmann wrote:
> #define MAP_NONPOSTED 0x80000000
> 
> arm-io { /* name for adt, should be changed */
>       compatible = "apple,m1-internal-bus";
>       #address-cells = <2>; /* or maybe <3> if we want */
>       #size-cells = <2>;
>       ranges =
>                 /* on-chip MMIO */
>                 <(MAP_NONPOSTED | 0x2) 0x0   0x2 0x0 0x1 0x0>,
> 
>                /* first PCI: 2GB control, 4GB memory space */
>               <(MAP_NONPOSTED | 0x3) 0x80000000  0x3 0x80000000  0x0 0x80000000>,
>                <0x4 0x0   0x4 0x0  0x1 0x0>,
[...]

> The MAP_NONPOSTED flag then gets interpreted by the .translate() and
> .get_flags() callbacks of "struct of_bus" in the kernel, where it is put into
> a "struct resource" flag, and interpreted when the resource gets mapped.
> 
> The PCI host controller nests inside of the node above, and (in theory)
> uses the same trick to distinguish between prefetchable and non-prefetchable
> memory, except in practice this is handled in device drivers that already
> know whether to call ioremap() or ioremap_wc().

4. Introduce a new top-level DT element in the style of reserved-memory, 
that describes address ranges and the mapping type to use. This could be 
implemented entirely in arch code, having arm64's ioremap look up the 
address in a structure populated from this.

As an additional wrinkle, earlycon is almost certainly going to need a 
special path to handle this very early, before OF stuff is available; it 
also uses fixmap instead of ioremap, which has its own idea about what 
type of mapping to use.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
