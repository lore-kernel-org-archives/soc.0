Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD7CC433EF
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 20:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5933C385B3; Sun,  8 May 2022 20:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2928EC385B1;
	Sun,  8 May 2022 20:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652040647;
	bh=YIldatWH/BFwWJyQ6v1cp3yXkWBHiVeP3+8Sbrb3kx8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=lAXb1/KU0SSDZY7/HyzmFODEzkXgEYLe2rONv5zzK1g+4kYgsm5x8Pa5MLWkzWAUp
	 IKF54X/p50eB029jMMJGj6c3vGZ0I8bdjzMp7JJufR/ilaewfHL1ebOT996xPiPaVh
	 wm2nAgr4jN9DdLYcY2NniGes2yl6lfmmadh8vlkGKoR3bAWh+KuUDkIDManrowLIsd
	 V2c2ueKVoW6/XJA+LG9hGmZzg6EOAg70ah1TwOnpQ+oDKb8kwp2TW0xOaqbdk4PyKK
	 74cDHfjynnZoJ4+hwNP3vsAg6wYEgIyK3NA/fMf/uVTpLXWYtKQNzSkYOzI67y5TZ1
	 d1wS2yhe86+lw==
Received: by pali.im (Postfix)
	id 315597F7; Sun,  8 May 2022 22:10:44 +0200 (CEST)
Date: Sun, 8 May 2022 22:10:44 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
Message-ID: <20220508201044.qyh75mb4x64uuhfc@pali>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <1509d16c-d244-19c7-610b-4c8ea8ca1624@ext.kapsi.fi>
 <CAK8P3a3g4CZjiVHHoBqJLrdN0chghaskODVvtWY1Fjj8TcB8KQ@mail.gmail.com>
 <b09847c4-90f8-509d-835b-85613712344d@ext.kapsi.fi>
 <CAK8P3a1miLk8YU+T5ozyf-X8qUB3sJq6cyTovBs9XWb9MrJxMw@mail.gmail.com>
 <20220508152237.3hw657gcba2fvheq@pali>
 <a0908aaa-154e-a53b-7538-a0b6557a30ae@ext.kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0908aaa-154e-a53b-7538-a0b6557a30ae@ext.kapsi.fi>
User-Agent: NeoMutt/20180716

On Sunday 08 May 2022 22:34:19 Mauri Sandberg wrote:
> On 08.05.22 18:22, Pali Rohár wrote:
> > On Sunday 08 May 2022 17:02:17 Arnd Bergmann wrote:
> > > On Sun, May 8, 2022 at 4:06 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> > > > On 28.4.2022 23.56, Arnd Bergmann wrote:
> > > > > On Thu, Apr 28, 2022 at 10:01 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> > > > > > On 27.4.2022 21.10, Arnd Bergmann wrote:
> > > > > > > On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> > > > > > > > - sata_mv fails to initialise with -22 (-EINVAL)
> > > > > > > 
> > > > > > > No idea, I'd try inserting a printk in every code path that can return -EINVAL
> > > > > > > from there
> > > > > > > 
> > > > 
> > > > With debugging the reason for -EINVAL remains a bit mystery.
> > > >    - sata_mv calls ata_host_activate() [1]
> > > >    - later on, in request_threaded_irq(), there are sanity checks [2]
> > > >    - that fail with irq_settings_can_request() returning 0 [3]
> > > > 
> > > > I cannot really put my finger on why the irq cannot be requested in DT
> > > > approach.
> > > 
> > > Are you sure the marvell,orion-intc driver is successfully probed
> > > at this point? If not, the interrupt won't be there.
> 
> I made the pci setup to be the very last thing in the boot and
> results are still the same. There are other devices that do get
> their interrupts from intc.
> 
> > > 
> > > I see that the "sata_mv" driver can be used either as a platform
> > > driver for the orion5x on-chip controller, or as a PCI driver for
> > > an add-on chip connected to the external bus. It sounds like
> > > your system has both. Do you know which one fails?
> > > 
> > > The PCI driver cannot work unless the PCI host works correctly,
> > > and that in turn requires a correct devicetree description for it.
> > > 
> > > > > > Is there a way to describe the PCIe bus in the
> > > > > > device tree? The initalisation of that bus is done for rev A1 only.
> > > > > 
> > > > > I'm not too familiar with the platform, but my interpretation is that the
> > > > > DT support here is incomplete:
> > > > > 
> > > > > The DT based PCI probe using drivers/pci/controller/pci-mvebu.c
> > > > > is not hooked up in orion5x.dtsi, and the traditional pci code does
> > > > > not work with DT.
> > > > 
> > > > Can the existing pci code still be used to init the PCI bus and describe
> > > > the rest in the DT or is it a futile attempt?
> > 
> > Hello! Orion uses arch/arm/mach-orion5x/pci.c driver for both PCI and
> > PCIe buses. This is not device tree driver.
> > 
> > > > > I see that orion5x has two separate blocks --  a PCIe host that is
> > > > > similar to the kirkwood one, and a legacy PCI host that needs
> > > > > a completely separate driver.
> > > > > 
> > > > > Which of the two do you actually need here?
> > > > > 
> > > > 
> > > > I really cannot say which one is it. How can I tell? The functions given
> > > > in struct hw_pci find their way to drivers/pci/probe.c eventually and
> > > > use pci_scan_root_bus_bridge(). Nothing seems to utilising mvebu or
> > > > kirkwood explicitly at least.
> > > > 
> > > > Here's the output from lspci if the ids reveal anything.
> > > > 
> > > > # lspci -v -k
> > > > 00:00.0 Class 0580: 11ab:5181
> > > > 01:00.0 Class 0580: 11ab:5181
> > > > 00:01.0 Class 0100: 11ab:7042 sata_mv
> > > 
> > > The first two seem to be the host bridges, but unfortunately they
> > >   seem both have the same device ID, despite being very different
> > > devices.  The first one (00:00.0) should be the PCIe driver, the
> > > second one (01.00.0) the legacy PCI one. In this case, the 11ab:7042
> > > device is a PCIe device, and it's on the bus (00) of the first host
> > > bridge. I think this should work with drivers/pci/controller/pci-mvebu.c
> > > if you add the bits for probing.
> > 
> > Last time when I looked on Orion PCIe controller registers, I though
> > that they are same as in Kirkwood PCIe controller registers. And
> > Kirkwood is already supported by pci-mvebu.c driver.
> > 
> 
> I seemed that way to me too on the first glance. And it looks like there
> are no devices using the PCI driver. I knocked off that part altogether and
> the boot log looks pretty much the same it was. Perhaps I can do
> with describing the PCIe bus only.
> 
> > About PCI host bridge, I do not know.
> > 
> > Beware that PCI Class Id and all PCI registers which are different for
> > Type 0 and Type 1 are _broken_ on all PCIe Root Ports form all 32-bit
> > Marvell SoCs. Those registers on Marvell SoCs have different meaning as
> > what is defined in PCI and PCIe specs. So it means that lspci _may_
> > display bogus information about PCIe Root Port. pci-mvebu.c uses Root
> > Port emulator which fills correct data to make kernel and lspci happy.
> > 
> > If you are going to extend pci-mvebu.c to support also Orion PCIe
> > controller, I could try to help with it. But I do not have any Orion
> > hardware, so just basic help...
> 
> I could make an attempt at this. Should I try to look at an existing
> kirkwood based device first, say kirkwood-6281.dtsi? I didn't see
> anything SoC-specific in pci-mvebu.c. All different compatibles seem
> to share the same functionality.

Yes, this could be a good starting point. But you will need new
compatible string for orion, specially to implement workaround for
accessing config space.

> > 
> > Links to Orion documentations, including PCIe errata is available in
> > kernel documentation. So this could help to understand some details:
> > https://www.kernel.org/doc/html/latest/arm/marvell.html
> > 
> > Anyway, could you please provide 'lspci -nn -vv' and 'lspci -nn -t -v'
> > outputs from Orion?
> 
> # lspci -nn -vv
> 0000:00:00.0 Memory controller [0580]: Marvell Technology Group Ltd. 88f5181
> [Orion-1] ARM SoC [11ab:5181] (rev 03)
> 	Subsystem: Marvell Technology Group Ltd. Device [11ab:11ab]
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+
> Stepping- SERR+ FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 32 bytes
> 	Interrupt: pin A routed to IRQ 0
> 	Region 0: Memory at <ignored> (64-bit, prefetchable)
> 	Capabilities: [40] Power Management version 2
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [60] Express (v1) Root Port (Slot-), MSI 00
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag- RBE-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency L0s
> <256ns
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
> 		LnkCtl:	ASPM Disabled; RCB 128 bytes, Disabled- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> 		LnkSta:	Speed 2.5GT/s (ok), Width x1 (ok)
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		RootCap: CRSVisible-
> 		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
> 		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> 
> 0000:00:01.0 SCSI storage controller [0100]: Marvell Technology Group Ltd.
> 88SX7042 PCI-e 4-port SATA-II [11ab:7042] (rev 02)
> 	Subsystem: Marvell Technology Group Ltd. Device [11ab:11ab]
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+
> Stepping- SERR+ FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 32 bytes
> 	Interrupt: pin A routed to IRQ 12
> 	Region 0: Memory at e0000000 (64-bit, non-prefetchable) [size=1M]
> 	Region 2: I/O ports at 1000 [size=256]
> 	Capabilities: [40] Power Management version 2
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [60] Express (v1) Legacy Endpoint, MSI 00
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <256ns, L1 <1us
> 			ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L0s, Exit Latency L0s
> <256ns
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
> 		LnkCtl:	ASPM Disabled; RCB 128 bytes, Disabled- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> 		LnkSta:	Speed 2.5GT/s (ok), Width x1 (downgraded)
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 	Kernel driver in use: sata_mv
> 
> 0001:01:00.0 Memory controller [0580]: Marvell Technology Group Ltd. 88f5181
> [Orion-1] ARM SoC [11ab:5181] (rev 03)
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+
> Stepping- SERR+ FastB2B+ DisINTx-
> 	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
> <MAbort+ >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 32 bytes
> 	Interrupt: pin A routed to IRQ 0
> 	BIST result: 00
> 	Region 0: Memory at <unassigned> (64-bit, prefetchable)
> 	Region 2: Memory at <ignored> (64-bit, prefetchable)
> 	Region 4: Memory at <ignored> (64-bit, non-prefetchable)
> 	Expansion ROM at <ignored> [disabled]
> 	Capabilities: [40] Power Management version 2
> 		Flags: PMEClk+ DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME+
> 	Capabilities: [48] Vital Product Data
> 		Not readable
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [60] PCI-X non-bridge device
> 		Command: DPERE- ERO- RBC=512 OST=4
> 		Status: Dev=ff:1f.0 64bit+ 133MHz+ SCD- USC- DC=bridge DMMRBC=512 DMOST=4
> DMCRS=8 RSCEM- 266MHz- 533MHz-
> 	Capabilities: [68] CompactPCI hot-swap <?>
> 
> # lspci -nn -t -v
> -+-[0001:01]---00.0  Marvell Technology Group Ltd. 88f5181 [Orion-1] ARM SoC
> [11ab:5181]
>  \-[0000:00]-+-00.0  Marvell Technology Group Ltd. 88f5181 [Orion-1] ARM SoC
> [11ab:5181]
>              \-01.0  Marvell Technology Group Ltd. 88SX7042 PCI-e 4-port
> SATA-II [11ab:7042]

Ok, so domain 0 is PCIe bus for sure.
0000:00:00.0 is PCIe Root Port (PCI-to-PCI bridge) incorrectly detected
as Memory controller (known HW issue on all 32-bit Marvell SoCs).
0000:00:01.0 seems to be that SATA controller and this device is
connected behind the PCIe Root Port. Topology is also incorrectly
reports due to same known issue.

Then there is domain 1 (first line in -t output) on which is just one
device 0001:01:00.0 detected as Memory controller and has capability of
"PCI-X non-bridge device". This seems to be PCI bus. I guess that Memory
controller is also bogus information.

What is "PCI-X non-bridge device"? I thought that "root" of the PCI bus
should be Host Bridge.

Anyway, there is my pending patch which should fix Class ID to not
report incorrect Memory controller identification:
https://lore.kernel.org/linux-pci/20211102171259.9590-1-pali@kernel.org/#Z31arch:arm:mach-orion5x:pci.c

> > 
> > > Thomas Petazzoni originally wrote the new driver, and I think he was
> > > planning at one point to use it for orion5x. I don't know if there were
> > > any major problems preventing this at the time, or if it just needs to
> > > get hooked up in the dtsi file.
> > > 
> > >           Arnd
> 
> -- Mauri
