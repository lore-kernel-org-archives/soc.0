Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59626C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:21:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3B064E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3B064E75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:Subject:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjbfZGGcTA8sWkF3NzaNYhK78E0YCBx+VeRHFutVdmM=; b=AyVxbhmZWyT/NPelqkeppjo6te
	Tlu2jTyYDfg0lsx4+yCwjyy+NcChhcJeRtJJG+bFFSfKqxmFlZPIAZ/SC9kss9b7fpfMFuDY0fXYs
	yaokVV3/aUigooomBevz4n/b29s3mzS6rG42JT7vCBnVqA5QgJPj8j5vpuxWXXFlHWj95UBREzwOH
	22KTjBgFurSdYQI5R2B7sQc9s4CSvDR8t/qtZ7LdMwXGzWl2OmCaxCxuymreWzyig6IfU7Sr178A+
	CeYWT0NS2IjSF6gcnrlJKTfOg5aNokoJDJTPuZeUtQzYuUbb7KkQVKujGnS38xEcVCTDvAnyqIfKi
	S9F+KhhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9FpV-0002Hd-0S; Mon, 08 Feb 2021 23:20:29 +0000
Received: from sibelius.xs4all.nl ([83.163.83.176])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9FpS-0002H8-Eb
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 23:20:27 +0000
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 114b1b6b;
 Tue, 9 Feb 2021 00:20:25 +0100 (CET)
Date: Tue, 9 Feb 2021 00:20:25 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
 (message from Arnd Bergmann on Mon, 8 Feb 2021 23:57:20 +0100)
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
Message-ID: <c1bc2a087747c4d9@bloch.sibelius.xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_182027_058196_C2A57961 
X-CRM114-Status: GOOD (  28.67  )
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
Cc: devicetree@vger.kernel.org, maz@kernel.org, marcan@marcan.st,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> From: Arnd Bergmann <arnd@kernel.org>
> Date: Mon, 8 Feb 2021 23:57:20 +0100
> 
> On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
> 
> > (3) Do it at a lower level, in ioremap() itself. This requires that
> >     ioremap() somehow discriminates based on address range to pick what
> >     kind of mapping to make.
> >
> >     Declaring these address ranges would be an issue. Options:
> >
> >     a) An out of band list in a DT node, a la /reserved-memory
> >
> >     b) Something based on the existing DT hierarchy, where we can scan
> >        bus ranges and locate buses with a property that says "nGnRnE" or
> >        "nGnRE" and dynamically build the list based on that.
> >
> >     The advantage of this option is that it doesn't touch non-arch code.
> >     The disadvantage is that it adds a complete new bespoke mechanism to
> >     the DT, and that it does not let device drivers actually select the
> >     IO mode, which might be desirable in the future anyway for some
> >     devices.
> 
> I tried investigating further what this would look like, but scanning through
> the ADT dump for what nodes use which register ranges. At first it seemed
> the range 0x200000000-0x2ffffffff is used for all normal devices, while
> the three PCI buses fall into the 0x380000000-0x4ffffffff,
> 0x500000000-0x67fffffff and 0x680000000-0x6ffffffff ranges
> respectively. This would allow a nice abstraction where one node
> contains all the devices in the 0x200000000-0x2ffffffff, and we do a
> translation in of_address_to_resource(),  similar to what we have for
> pci and isa nodes with their special addresses.
> 
> However, I did find that there are several nodes that use mmio
> addresses next to the PCI addresses, e.g. apciec0, dart-apciec0,
> apciec0-piodma, dart-acio0, acio0, acio-cpu0, atc0-dpin0, atc-phy0,
> dart-usb0, and usb-drd0 in the 0x380000000-0x3ffffffff range, just
> before the MMIO space of the first PCIe bus, so it gets a little
> more complicated.
> 
> The actual device node could look something like
> 
> #define MAP_NONPOSTED 0x80000000
> 
> arm-io { /* name for adt, should be changed */
>      compatible = "apple,m1-internal-bus";
>      #address-cells = <2>; /* or maybe <3> if we want */
>      #size-cells = <2>;
>      ranges =
>                /* on-chip MMIO */
>                <(MAP_NONPOSTED | 0x2) 0x0   0x2 0x0 0x1 0x0>,
> 
>               /* first PCI: 2GB control, 4GB memory space */
>              <(MAP_NONPOSTED | 0x3) 0x80000000  0x3 0x80000000  0x0 0x80000000>,
>               <0x4 0x0   0x4 0x0  0x1 0x0>,
> 
>               /* second PCI: 2GB control, 4GB memory space */
>              <(MAP_NONPOSTED | 0x5) 0x0  0x5 0x0  0x0 0x80000000>,
>               <0x5 0x80000000  0x5 0x80000000  0x1>,
> 
>               /* third PCI  0.5GB control, 1.5GB memory space*/
>              <(MAP_NONPOSTED | 0x6) 0x80000000  0x6 0x80000000  0x0 0x20000000>,
>              <0x6 0xa0000000   0x6 0xa0000000  0x0 0x60000000>;
> }
> 
> The MAP_NONPOSTED flag then gets interpreted by the .translate() and
> .get_flags() callbacks of "struct of_bus" in the kernel, where it is put into
> a "struct resource" flag, and interpreted when the resource gets mapped.
> 
> The PCI host controller nests inside of the node above, and (in theory)
> uses the same trick to distinguish between prefetchable and non-prefetchable
> memory, except in practice this is handled in device drivers that already
> know whether to call ioremap() or ioremap_wc().

It is only PCI mmio space that needs to be nGnRE.  The PCI host
controller register space itself needs nGnRnE just like all other
integrated peripherals (or at least it works that way).

For U-Boot I'm using the following memory map:

static struct mm_region apple_mem_map[] = {
	{
		/* I/O */
		.virt = 0x200000000,
		.phys = 0x200000000,
		.size = 8UL * SZ_1G,
		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
			 PTE_BLOCK_NON_SHARE |
			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
	}, {
		/* I/O */
		.virt = 0x500000000,
		.phys = 0x500000000,
		.size = 2UL * SZ_1G,
		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
			 PTE_BLOCK_NON_SHARE |
			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
	}, {
		/* I/O */
		.virt = 0x680000000,
		.phys = 0x680000000,
		.size = SZ_512M,
		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
			 PTE_BLOCK_NON_SHARE |
			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
	}, {
		/* PCIE */
		.virt = 0x6a0000000,
		.phys = 0x6a0000000,
		.size = SZ_512M,
		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRE) |
			 PTE_BLOCK_INNER_SHARE |
			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
	}, {
		/* PCIE */
		.virt = 0x6c0000000,
		.phys = 0x6c0000000,
		.size = SZ_1G,
		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRE) |
			 PTE_BLOCK_INNER_SHARE |
			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
	}, {
		/* RAM */
		.virt = 0x800000000,
		.phys = 0x800000000,
		.size = 8UL * SZ_1G,
		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
			 PTE_BLOCK_INNER_SHARE
	}, {
		/* List terminator */
		0,
	}
};

struct mm_region *mem_map = apple_mem_map;

This seems to work so far.  It only has the regions for one PCIe
controller.  I suppose the other two are there to support the TB4
ports?

So there is one 512M region for "32-bit" mmio starting at 0x6a0000000
and one 1G region for "64-bit" mmio starting at 0x6c0000000.

Cheers,

Mark


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
