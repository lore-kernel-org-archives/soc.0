Return-Path: <SRS0=c4LD=VQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE40CC433EF
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 15:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 962AFC385B0; Sun,  8 May 2022 15:02:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75F00C385A4;
	Sun,  8 May 2022 15:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75F00C385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f177.google.com ([209.85.128.177]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MAtoX-1ngrkD0Suf-00BNpM; Sun, 08 May 2022 17:02:36 +0200
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2f7d7e3b5bfso121628727b3.5;
        Sun, 08 May 2022 08:02:35 -0700 (PDT)
X-Gm-Message-State: AOAM530dv/COTqiLsp1hX5r7FmXEFhKKFbFqSBdeNI6dhqisT0IpUT3Y
	GTKsT+xfvAVwjTTRbQ4qCk5tkqm7VZ51V97eizo=
X-Google-Smtp-Source: ABdhPJxbTpi++I6rfHDjCikv2HNJk3QYOfNP65hhn6On+1lujYkOPjF33yOfZnKt19tjyf5UPS8htLMILILGJixNd5w=
X-Received: by 2002:a81:1697:0:b0:2fa:32f9:78c8 with SMTP id
 145-20020a811697000000b002fa32f978c8mr10492606yww.135.1652022154717; Sun, 08
 May 2022 08:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220427162123.110458-1-maukka@ext.kapsi.fi> <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <1509d16c-d244-19c7-610b-4c8ea8ca1624@ext.kapsi.fi> <CAK8P3a3g4CZjiVHHoBqJLrdN0chghaskODVvtWY1Fjj8TcB8KQ@mail.gmail.com>
 <b09847c4-90f8-509d-835b-85613712344d@ext.kapsi.fi>
In-Reply-To: <b09847c4-90f8-509d-835b-85613712344d@ext.kapsi.fi>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 8 May 2022 17:02:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1miLk8YU+T5ozyf-X8qUB3sJq6cyTovBs9XWb9MrJxMw@mail.gmail.com>
Message-ID: <CAK8P3a1miLk8YU+T5ozyf-X8qUB3sJq6cyTovBs9XWb9MrJxMw@mail.gmail.com>
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
To: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lpBD683nspw/B9Ofa6NSkY2xuVC9dyTSuGGBVTRLdgBbb0iCKgT
 ZW2y5bUN4hoqP6iDyxzwEAAi8YHRpecp1HVZ5g/J/5Sko0zT62FptX8bM5d64K7cPDpDuNb
 u7qSBCQoQPt+dsEa1eOBxSssA5b7+U1Gt5NZIiH4abWkoHLhZxmak7uTH/Li+L7X8upvUUb
 QO98uMsgFFmLbMU0uht5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8P4Vq8d+Yrk=:YenCC2t7Ah61MdcTi2fVwG
 oZuIBgad5wlklZ1pi86y8ONnB+wrujbPjZbZOZCxjO56SYMSqC33fOiuXXnht0GZwvKTSsQ1a
 kngPiI8uxSlGo8IkKWk8DQJ//zemlxhU/S9knRGUbe99leHbu4J9Z5nuxVirMrmlphTDPs+7G
 uRf9bBA/kfXdxy3Tof1+8TxDLv0+i4XZwh1M2Y9iTTh7gQ2Sd6ctX6soJpTmmu29W7hKLcnrK
 dzzZiW0s6jwhKXR7YLZcD3R6Kpe42S42Ks+NMsD76Ks1ahExpN5egO+01tlthHsww2+YZy7gS
 7dZ/gq/hivoo06V/Pm0F+dbSvQffFe6IufBwtVzOYCDlmp0jS5ytdappU5djG1asqyWWpcC+P
 81f3hiDRCm8Vct0fXRu1NpQ4Tgig4otEgjZ2RHjmpRQV27vY9uhEaugu/ThkgCawJzUh24qCA
 Klz1HLVPNv7gZeIrKId+n5JqjGKB9zVY2iflNEkcNcWrnNoFrdKcQnCSNBiqsbEAQGUj8GoL0
 Co5dtDE8Sjf7727fXpcY5mO/S8jXLMsfQijm2OZAdsaaR9Y2g5U73vWWcP0hw+RNwn3CupkHi
 VA6ZOqaqkbAy9k5XgF1nxL0ctOjZokJmMFCGPVNv9vsS7kJnzgv0fgJcme7QRysvXfIfg8GuQ
 u6PtZMdyqdGp4CrW9SLrZZFYIr8czdqivv2QujbaWFeJLr4sRv+a8bUGKajj0quk7/zo=

On Sun, May 8, 2022 at 4:06 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> On 28.4.2022 23.56, Arnd Bergmann wrote:
> > On Thu, Apr 28, 2022 at 10:01 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> >> On 27.4.2022 21.10, Arnd Bergmann wrote:
> >>> On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> >>>> - sata_mv fails to initialise with -22 (-EINVAL)
> >>>
> >>> No idea, I'd try inserting a printk in every code path that can return -EINVAL
> >>> from there
> >>>
>
> With debugging the reason for -EINVAL remains a bit mystery.
>   - sata_mv calls ata_host_activate() [1]
>   - later on, in request_threaded_irq(), there are sanity checks [2]
>   - that fail with irq_settings_can_request() returning 0 [3]
>
> I cannot really put my finger on why the irq cannot be requested in DT
> approach.

Are you sure the marvell,orion-intc driver is successfully probed
at this point? If not, the interrupt won't be there.

I see that the "sata_mv" driver can be used either as a platform
driver for the orion5x on-chip controller, or as a PCI driver for
an add-on chip connected to the external bus. It sounds like
your system has both. Do you know which one fails?

The PCI driver cannot work unless the PCI host works correctly,
and that in turn requires a correct devicetree description for it.

> >> Is there a way to describe the PCIe bus in the
> >> device tree? The initalisation of that bus is done for rev A1 only.
> >
> > I'm not too familiar with the platform, but my interpretation is that the
> > DT support here is incomplete:
> >
> > The DT based PCI probe using drivers/pci/controller/pci-mvebu.c
> > is not hooked up in orion5x.dtsi, and the traditional pci code does
> > not work with DT.
>
> Can the existing pci code still be used to init the PCI bus and describe
> the rest in the DT or is it a futile attempt?
>
> > I see that orion5x has two separate blocks --  a PCIe host that is
> > similar to the kirkwood one, and a legacy PCI host that needs
> > a completely separate driver.
> >
> > Which of the two do you actually need here?
> >
>
> I really cannot say which one is it. How can I tell? The functions given
> in struct hw_pci find their way to drivers/pci/probe.c eventually and
> use pci_scan_root_bus_bridge(). Nothing seems to utilising mvebu or
> kirkwood explicitly at least.
>
> Here's the output from lspci if the ids reveal anything.
>
> # lspci -v -k
> 00:00.0 Class 0580: 11ab:5181
> 01:00.0 Class 0580: 11ab:5181
> 00:01.0 Class 0100: 11ab:7042 sata_mv

The first two seem to be the host bridges, but unfortunately they
 seem both have the same device ID, despite being very different
devices.  The first one (00:00.0) should be the PCIe driver, the
second one (01.00.0) the legacy PCI one. In this case, the 11ab:7042
device is a PCIe device, and it's on the bus (00) of the first host
bridge. I think this should work with drivers/pci/controller/pci-mvebu.c
if you add the bits for probing.

Thomas Petazzoni originally wrote the new driver, and I think he was
planning at one point to use it for orion5x. I don't know if there were
any major problems preventing this at the time, or if it just needs to
get hooked up in the dtsi file.

         Arnd
