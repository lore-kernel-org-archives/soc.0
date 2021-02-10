Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B13C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:25:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F0064E2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F0064E2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=43J3cVk1ZyVyo7qMwkJJACWBq8UHCEDWt3/VDj3Cnnc=; b=2jnE8HLzDDhzYZMF0YaHTXDGR
	xKvo6TYWZm/gqYLfElDIT+bMMN1GgmxVqL7V5mHTGPqahapnRbuROPB9rjMgISh19kayR00YX1fRz
	zhOu6NIN2IDldlnLJgBdia5ECEHuEyORm4mPcTJRC1ih0imJ+9tbsqKXkcUQiF9lBp1qxKu21oCG4
	YjCHepnLhE1YD9rDzWnq6bGJJGpfJN4JigEz8Ih+3pgLNslpTcZD4T1199bhnFOpHgVSyZN3/zppc
	C/+p5AjvXZ/xaCiEDm5k8qS7AYB2W570V+9WpPRXqE3ctfYCUd3rz+0SNrq16lURayMbNrTmeJcCI
	YA3o9ts1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9oXk-0006fV-VY; Wed, 10 Feb 2021 12:24:29 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9oXh-0006dw-IN
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 12:24:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 8CBC341FA3;
 Wed, 10 Feb 2021 12:24:18 +0000 (UTC)
To: Will Deacon <will@kernel.org>
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_072425_747810_DAADC72E 
X-CRM114-Status: GOOD (  18.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210122415.zmUxJFCphIBHjExp8PaZVr_TaQqMTeNSJILucngPlrk@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
