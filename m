Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A38C433EF
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 15:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9E48C385AF; Sun,  8 May 2022 15:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8281CC385A4;
	Sun,  8 May 2022 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652023360;
	bh=XShqRcAiB8X6N5hGcIWGbxDRzWMd2hTGgh8tG0bWxvg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=DTvIYYpFulC4YnHXjCURqh7waLPxmJ7JlbpvqiQOQ8tIPGCHUCS8Ba3ECnj6kBtjL
	 kzNoycpI736PpIcgd7w7LAjiUWSRkZb5tBpwDAzj4NjDJiDRusg18kouSA8tH5yZHJ
	 PqW4aB7u7iKVbyr0+fKSuQGUI3/rZMzyG2oqgTOFm/ihNsnffxclTSq73qucqK1CQo
	 X5x9EkhYe7RcRLJ/r0Nw9DyYGFaGZlD9BvhDO1aNfXCRrp+goS0hGh+ko8Thudspgi
	 J5kZHOxp2rbmzt5WBJ6iz8IeDw6TtyEJ177X7mdAAWNeY2cIT9gWUSsJepm4qS4HIH
	 sAKgdHWEx288w==
Received: by pali.im (Postfix)
	id 6AE797F7; Sun,  8 May 2022 17:22:37 +0200 (CEST)
Date: Sun, 8 May 2022 17:22:37 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Mauri Sandberg <maukka@ext.kapsi.fi>, SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
Message-ID: <20220508152237.3hw657gcba2fvheq@pali>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <1509d16c-d244-19c7-610b-4c8ea8ca1624@ext.kapsi.fi>
 <CAK8P3a3g4CZjiVHHoBqJLrdN0chghaskODVvtWY1Fjj8TcB8KQ@mail.gmail.com>
 <b09847c4-90f8-509d-835b-85613712344d@ext.kapsi.fi>
 <CAK8P3a1miLk8YU+T5ozyf-X8qUB3sJq6cyTovBs9XWb9MrJxMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1miLk8YU+T5ozyf-X8qUB3sJq6cyTovBs9XWb9MrJxMw@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Sunday 08 May 2022 17:02:17 Arnd Bergmann wrote:
> On Sun, May 8, 2022 at 4:06 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> > On 28.4.2022 23.56, Arnd Bergmann wrote:
> > > On Thu, Apr 28, 2022 at 10:01 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> > >> On 27.4.2022 21.10, Arnd Bergmann wrote:
> > >>> On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> > >>>> - sata_mv fails to initialise with -22 (-EINVAL)
> > >>>
> > >>> No idea, I'd try inserting a printk in every code path that can return -EINVAL
> > >>> from there
> > >>>
> >
> > With debugging the reason for -EINVAL remains a bit mystery.
> >   - sata_mv calls ata_host_activate() [1]
> >   - later on, in request_threaded_irq(), there are sanity checks [2]
> >   - that fail with irq_settings_can_request() returning 0 [3]
> >
> > I cannot really put my finger on why the irq cannot be requested in DT
> > approach.
> 
> Are you sure the marvell,orion-intc driver is successfully probed
> at this point? If not, the interrupt won't be there.
> 
> I see that the "sata_mv" driver can be used either as a platform
> driver for the orion5x on-chip controller, or as a PCI driver for
> an add-on chip connected to the external bus. It sounds like
> your system has both. Do you know which one fails?
> 
> The PCI driver cannot work unless the PCI host works correctly,
> and that in turn requires a correct devicetree description for it.
> 
> > >> Is there a way to describe the PCIe bus in the
> > >> device tree? The initalisation of that bus is done for rev A1 only.
> > >
> > > I'm not too familiar with the platform, but my interpretation is that the
> > > DT support here is incomplete:
> > >
> > > The DT based PCI probe using drivers/pci/controller/pci-mvebu.c
> > > is not hooked up in orion5x.dtsi, and the traditional pci code does
> > > not work with DT.
> >
> > Can the existing pci code still be used to init the PCI bus and describe
> > the rest in the DT or is it a futile attempt?

Hello! Orion uses arch/arm/mach-orion5x/pci.c driver for both PCI and
PCIe buses. This is not device tree driver.

> > > I see that orion5x has two separate blocks --  a PCIe host that is
> > > similar to the kirkwood one, and a legacy PCI host that needs
> > > a completely separate driver.
> > >
> > > Which of the two do you actually need here?
> > >
> >
> > I really cannot say which one is it. How can I tell? The functions given
> > in struct hw_pci find their way to drivers/pci/probe.c eventually and
> > use pci_scan_root_bus_bridge(). Nothing seems to utilising mvebu or
> > kirkwood explicitly at least.
> >
> > Here's the output from lspci if the ids reveal anything.
> >
> > # lspci -v -k
> > 00:00.0 Class 0580: 11ab:5181
> > 01:00.0 Class 0580: 11ab:5181
> > 00:01.0 Class 0100: 11ab:7042 sata_mv
> 
> The first two seem to be the host bridges, but unfortunately they
>  seem both have the same device ID, despite being very different
> devices.  The first one (00:00.0) should be the PCIe driver, the
> second one (01.00.0) the legacy PCI one. In this case, the 11ab:7042
> device is a PCIe device, and it's on the bus (00) of the first host
> bridge. I think this should work with drivers/pci/controller/pci-mvebu.c
> if you add the bits for probing.

Last time when I looked on Orion PCIe controller registers, I though
that they are same as in Kirkwood PCIe controller registers. And
Kirkwood is already supported by pci-mvebu.c driver.

About PCI host bridge, I do not know.

Beware that PCI Class Id and all PCI registers which are different for
Type 0 and Type 1 are _broken_ on all PCIe Root Ports form all 32-bit
Marvell SoCs. Those registers on Marvell SoCs have different meaning as
what is defined in PCI and PCIe specs. So it means that lspci _may_
display bogus information about PCIe Root Port. pci-mvebu.c uses Root
Port emulator which fills correct data to make kernel and lspci happy.

If you are going to extend pci-mvebu.c to support also Orion PCIe
controller, I could try to help with it. But I do not have any Orion
hardware, so just basic help...

Links to Orion documentations, including PCIe errata is available in
kernel documentation. So this could help to understand some details:
https://www.kernel.org/doc/html/latest/arm/marvell.html

Anyway, could you please provide 'lspci -nn -vv' and 'lspci -nn -t -v'
outputs from Orion?

> Thomas Petazzoni originally wrote the new driver, and I think he was
> planning at one point to use it for orion5x. I don't know if there were
> any major problems preventing this at the time, or if it just needs to
> get hooked up in the dtsi file.
> 
>          Arnd
