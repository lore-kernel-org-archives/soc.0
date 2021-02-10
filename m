Return-Path: <SRS0=atnD=HM=xs4all.nl=mark.kettenis@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBD3C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 13:40:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0598A64E7A; Wed, 10 Feb 2021 13:40:49 +0000 (UTC)
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 619E864E15;
	Wed, 10 Feb 2021 13:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 619E864E15
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=fail smtp.mailfrom=mark.kettenis@xs4all.nl
Received: from localhost (bloch.sibelius.xs4all.nl [local])
	by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id fe8eed21;
	Wed, 10 Feb 2021 14:40:43 +0100 (CET)
Date: Wed, 10 Feb 2021 14:40:43 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: will@kernel.org, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	robh+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, olof@lixom.net, arnd@kernel.org
In-Reply-To: <475f7586-cabf-1169-8800-cdd2c012a5a6@marcan.st> (message from
	Hector Martin on Wed, 10 Feb 2021 21:24:15 +0900)
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com> <475f7586-cabf-1169-8800-cdd2c012a5a6@marcan.st>
Message-ID: <c1bc32139ad12bd8@bloch.sibelius.xs4all.nl>

> From: Hector Martin <marcan@marcan.st>
> Date: Wed, 10 Feb 2021 21:24:15 +0900

Hi Hector,

Since device tree bindings are widely used outside the Linux tree,
here are some thoughts from a U-Boot and OpenBSD perspective.

> Hi Will, I'm pulling you in at Marc's suggestion. Do you have an opinion 
> on what the better solution to this problem is?
> 
> The executive summary is that Apple SoCs require nGnRnE memory mappings 
> for MMIO, except for PCI space which uses nGnRE. ARM64 currently uses 
> nGnRE everywhere. Solutions discussed in this thread and elsewhere include:
> 
> 1. Something similar to the current hacky patch (which isn't really 
> intended as a real solution...); change ioremap to default to nGnRnE 
> using some kind of platform-level flag in the DT, then figure out how to 
> get the PCI drivers to bypass that. This requires changing almost every 
> PCI driver, since most of them use plain ioremap().
> 
> 2. A per-device DT property that tells of_address_to_resource to set a 
> flag in the struct resource, which is then used by 
> devm_ioremap_resource/of_iomap to pick a new ioremap_ variant for nGnRnE 
> (introduce ioremap_np() for nonposted?) (PCI would work with this 
> inasmuch as it would not support it, and thus fall back to the current 
> nGnRE default, which is correct for PCI...). This requires changing 
> DT-binding drivers that we depend on to not use plain ioremap() (if any 
> do so), but that is a finite subset (unlike PCI which involves 
> potentially every driver, because thunderbolt).

That solution is not dissimilar to how "dma-coherent", "big-endian"
and "little-endian" properties work.  U-Boot could simply ignore the
property since it already has a memory map with the required memory
attributes for each SoC.  I don't see any issue with this for the
OpenBSD kernel either.

The number of existing drivers that would need to be changed is small.
The dwc3 core driver already uses devm_ioremap_resource().  The nvme
driver uses plain ioremap() in the PCI-specific part of the driver,
but that will need new glue for a platform driver anyway.

As things stand now that leaves us with the samsung serial driver
which uses devm_ioremap().  That could be turned into a
devm_iomap_resource() without much trouble I think.

> 3. Encode the mapping type in the address of child devices, either 
> abusing the high bits of the reg or introducing an extra DT cell there, 
> introduce a new OF bus type that strips those away via a ranges mapping 
> and sets flags in the struct resource, similar to what the PCI bus does 
> with its 3-cell ranges, then do as (2) above and make 
> devm_ioremap_resource/of_iomap use it:
> 
> On 09/02/2021 07.57, Arnd Bergmann wrote:
> > #define MAP_NONPOSTED 0x80000000
> > 
> > arm-io { /* name for adt, should be changed */
> >       compatible = "apple,m1-internal-bus";
> >       #address-cells = <2>; /* or maybe <3> if we want */
> >       #size-cells = <2>;
> >       ranges =
> >                 /* on-chip MMIO */
> >                 <(MAP_NONPOSTED | 0x2) 0x0   0x2 0x0 0x1 0x0>,
> > 
> >                /* first PCI: 2GB control, 4GB memory space */
> >               <(MAP_NONPOSTED | 0x3) 0x80000000  0x3 0x80000000  0x0 0x80000000>,
> >                <0x4 0x0   0x4 0x0  0x1 0x0>,
> [...]
> 
> > The MAP_NONPOSTED flag then gets interpreted by the .translate() and
> > .get_flags() callbacks of "struct of_bus" in the kernel, where it is put into
> > a "struct resource" flag, and interpreted when the resource gets mapped.
> > 
> > The PCI host controller nests inside of the node above, and (in theory)
> > uses the same trick to distinguish between prefetchable and non-prefetchable
> > memory, except in practice this is handled in device drivers that already
> > know whether to call ioremap() or ioremap_wc().

Using the high bit in the address would be awkward I think.  For
example in U-Boot I'd have to mask that bit away but doing so in a
per-SoC way would be ugly.  Unless you map the high bit away using a
ranges property for the bus.

Using #address-cells = <3> wll cause some fallout as well as it is
convenient to store addresses as 64-bit integers.  I've written code
that just panics if that isn't possible.

> 4. Introduce a new top-level DT element in the style of reserved-memory, 
> that describes address ranges and the mapping type to use. This could be 
> implemented entirely in arch code, having arm64's ioremap look up the 
> address in a structure populated from this.

This isn't a strange idea either.  For UEFI such a mapping already
exists as a separate table that encodes the cache attributes of
certain memory regions.
 
> As an additional wrinkle, earlycon is almost certainly going to need a 
> special path to handle this very early, before OF stuff is available; it 
> also uses fixmap instead of ioremap, which has its own idea about what 
> type of mapping to use.
