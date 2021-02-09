Return-Path: <SRS0=VmVe=HL=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873BCC433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 11:22:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A22264E75; Tue,  9 Feb 2021 11:22:17 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2046C64E54;
	Tue,  9 Feb 2021 11:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2046C64E54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id C172941EE3;
	Tue,  9 Feb 2021 11:22:08 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Mark Kettenis <mark.kettenis@xs4all.nl>, DTML
 <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
 <c1bc2a087747c4d9@bloch.sibelius.xs4all.nl>
 <635f1a81-58c8-f3b6-ab3f-1cf6a084aed0@marcan.st>
 <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
Message-ID: <11cdf93c-0b25-e1c1-5d18-80ccb4a3f2d9@marcan.st>
Date: Tue, 9 Feb 2021 20:22:06 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 09/02/2021 18.15, Arnd Bergmann wrote:
> Right, these are the same ranges that I found in the adt and that Mark
> listed in his code snippet, so it seems we all see the same partitioning
> of the address space. I also see them reflected in the
> /defaults/pmap-io-ranges property in ADT, which seems to have an entry
> for every register range that has some mmio registers, along with what
> appears to be a bitmask of some attributes, and it clearly shows
> the above ranges as having a distinct set of bits from the others
> (in little-endian):
> 
>   00000000 04000000 00000080 00000000 27000080 65494350
>   00000080 04000000 00000080 00000000 27000080 65494350
>   00000080 05000000 00000080 00000000 27000080 65494350
>   00000000 06000000 00000080 00000000 27000080 65494350
>   000000a0 06000000 00000020 00000000 27000080 65494350
>   000000c0 06000000 00000040 00000000 27000080 65494350
>     ^64-bit address       ^64-bit length            ^ 64-bit flags?

That's ASCII :-)

'PCIe'

> 
> As opposed to e.g.
> 
>   0000f002 05000000 00400000 00000000 07400000 54524144

'DART'

>   00800021 05000000 00400000 00000000 07400000 44495344

'DSID'

> Ok, so if we want this to get encoded in a 'struct resource' flag, the PCI
> resources should work just fine as these resources come from the
> PCI layer rather than of_address_to_resource(). I think it would be
> reasonable here to add something to of_address_to_resource() to
> set such a flag if we can find an unused one, and then require the
> drivers for this platform to go through devm_ioremap_resource()
> or similar.

This sounds reasonable. For setting such a flag, I guess looking for a 
property (inherited from parents) would make sense. `mmio-map-mode = 
"nonposted"` or something like that?

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
