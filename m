Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6A1C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 13:44:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8919164E16
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 13:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8919164E16
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:Subject:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+298Mi9J5Ms0fFgR6VmLlxN6KcZjitxxfDOgXFz1vY=; b=zkuIq8M6RAJBG+jOk4wF53vZgl
	3oQNyOx6w9+OtdsfrJpaUOhMTq4lLCI28Al2KeN7JeI/eXs9NXDWw48IUJay/tDbfn2AHWCBaqRcZ
	312ArVl3CVS9y5ivCgpaoHQE/XVH5NS/93NsNc8dBjB6ZuOFmOfPxGXDl9ih+bx33J6U0x4TsGoeE
	2gIiI24JyeFjh++ppfVwRTDh+DYBHjdbaQ9f174uCbaQHGD1Ncrigbl/rymYVa3C9z6Gc39xA0t+h
	DPN7HUXdHu83kfJcEHOd9IRmzUe0l8vjT1OVf3MgGyEnxCwJFmL6nSPJN2OrRz/GnUBSfe+2bBZml
	LB2y2r1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9pjh-0003TT-Ic; Wed, 10 Feb 2021 13:40:53 +0000
Received: from sibelius.xs4all.nl ([83.163.83.176])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9pje-0003Su-IF
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 13:40:51 +0000
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id fe8eed21;
 Wed, 10 Feb 2021 14:40:43 +0100 (CET)
Date: Wed, 10 Feb 2021 14:40:43 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Hector Martin <marcan@marcan.st>
In-Reply-To: <475f7586-cabf-1169-8800-cdd2c012a5a6@marcan.st> (message from
 Hector Martin on Wed, 10 Feb 2021 21:24:15 +0900)
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
 <475f7586-cabf-1169-8800-cdd2c012a5a6@marcan.st>
Message-ID: <c1bc32139ad12bd8@bloch.sibelius.xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_084050_839810_33D1B646 
X-CRM114-Status: GOOD (  27.24  )
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
Cc: devicetree@vger.kernel.org, arnd@kernel.org, maz@kernel.org,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 olof@lixom.net, will@kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210134043.0FhsjgFCW3TnUothD9RwRSE38OiKodUEwYrjlom0R3I@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
