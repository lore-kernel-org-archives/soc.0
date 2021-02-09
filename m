Return-Path: <SRS0=SmIl=HL=xs4all.nl=mark.kettenis@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE29C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 09:58:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1AB5E64E79; Tue,  9 Feb 2021 09:58:47 +0000 (UTC)
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA7664E9D;
	Tue,  9 Feb 2021 09:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA7664E9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=fail smtp.mailfrom=mark.kettenis@xs4all.nl
Received: from localhost (bloch.sibelius.xs4all.nl [local])
	by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 628555bb;
	Tue, 9 Feb 2021 10:58:41 +0100 (CET)
Date: Tue, 9 Feb 2021 10:58:41 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: marcan@marcan.st, devicetree@vger.kernel.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, soc@kernel.org,
	robh+dt@kernel.org, olof@lixom.net,
	linux-arm-kernel@lists.infradead.org
In-Reply-To:
	<CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
	(message from Arnd Bergmann on Tue, 9 Feb 2021 10:15:31 +0100)
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
 <c1bc2a087747c4d9@bloch.sibelius.xs4all.nl> <635f1a81-58c8-f3b6-ab3f-1cf6a084aed0@marcan.st> <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
Message-ID: <c1bc2bfd75f8a238@bloch.sibelius.xs4all.nl>

> From: Arnd Bergmann <arnd@kernel.org>
> Date: Tue, 9 Feb 2021 10:15:31 +0100
> 
> On Tue, Feb 9, 2021 at 1:25 AM Hector Martin <marcan@marcan.st> wrote:
> > On 09/02/2021 08.20, Mark Kettenis wrote:
> > I probed writing to i<<28 for i = [0..255], using nGnRE. This reveals
> > that nGnRE writes are allowed (i.e. either succeed or error out
> > differently) in the following ranges:
> >
> > 0x400000000 - 0x4ffffffff (apciec0)
> > 0x580000000 - 0x67fffffff (apciec1)
> > 0x6a0000000 - 0x6ffffffff (apcie)
> >
> > Which matches the `ranges` properties of the respective apcie devices in
> > the ADT.
> 
> Right, these are the same ranges that I found in the adt and that Mark
> listed in his code snippet, so it seems we all see the same partitioning
> of the address space. I also see them reflected in the
> /defaults/pmap-io-ranges property in ADT, which seems to have an entry
> for every register range that has some mmio registers, along with what
> appears to be a bitmask of some attributes, and it clearly shows
> the above ranges as having a distinct set of bits from the others
> (in little-endian):
> 
>  00000000 04000000 00000080 00000000 27000080 65494350
>  00000080 04000000 00000080 00000000 27000080 65494350
>  00000080 05000000 00000080 00000000 27000080 65494350
>  00000000 06000000 00000080 00000000 27000080 65494350
>  000000a0 06000000 00000020 00000000 27000080 65494350
>  000000c0 06000000 00000040 00000000 27000080 65494350
>    ^64-bit address       ^64-bit length            ^ 64-bit flags?
> 
> As opposed to e.g.
> 
>  0000f002 05000000 00400000 00000000 07400000 54524144
>  0000f802 05000000 00400000 00000000 07400000 54524144
>  00800021 05000000 00400000 00000000 07400000 44495344
>  0000a801 05000000 00400000 00000000 07400000 54524144
> 00000367 02000000 00400000 00000000 07400000 54524144
> ...
> 
> There is one more entry for the 0x700000000-0x7ffffffff range, which
> has yet another distinct bitmask, but does not seem to correspond
> to any registers listed in other nodes.
> 
> > The first two are obviously the TB3 ports, and have more
> > features (three ranges instead of two, presumably IO port ranges are
> > supported on those, there's some extra DMA stuff, etc).
> 
> The PCI ranges property identifies these as 64-bit prefetchable (0x43),
> 32-bit non-prefetchable (0x02), and 32-bit pre prefetchable (0x42)
> respectively. The third bus only lacks the 32-bit prefetchable range,
> that is normally ok. Is this the NVMe host or something else?

Third bus has Broadcom WiFi, Fresco Logic xHCI and Broadcom Ethernet,
so all the onboard PCIe devices.
