Return-Path: <SRS0=FMNg=SX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1555BC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 16:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5867C004E1; Tue,  8 Feb 2022 16:08:48 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 267FEC340EC;
	Tue,  8 Feb 2022 16:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 267FEC340EC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MFsAJ-1nXiL50EGd-00HOai; Tue, 08 Feb 2022 17:08:44 +0100
Received: by mail-wr1-f49.google.com with SMTP id v12so2951539wrv.2;
        Tue, 08 Feb 2022 08:08:43 -0800 (PST)
X-Gm-Message-State: AOAM531Hyzeiw0hDCQuRrWdpmOhhVYSnZc+hsiw9gORhNL1BJA4NcfZO
	wAA1HFBhGbnFQbf7s58YcQLL4qwgXWx59Vd7HyE=
X-Google-Smtp-Source: ABdhPJzbA1zhEbjBXruIegFSKr/HlmX/M9YfBzun4TpdLrkSYokD3NF400y+3a1CS0q9b/Y6jtkGtIJW7ls/Wf3lrm8=
X-Received: by 2002:a5d:568f:: with SMTP id f15mr974996wrv.407.1644336523635;
 Tue, 08 Feb 2022 08:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20220113080017.30155-1-kavyasree.kotagiri@microchip.com> <f8b83cf0-7ebf-1ecd-b544-f0d0079d9dde@microchip.com>
In-Reply-To: <f8b83cf0-7ebf-1ecd-b544-f0d0079d9dde@microchip.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Feb 2022 17:08:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2kRhCOoXnvcMyqS-zK2WDZjtUq4aqOzE5VV=VMg=pVOA@mail.gmail.com>
Message-ID: <CAK8P3a2kRhCOoXnvcMyqS-zK2WDZjtUq4aqOzE5VV=VMg=pVOA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: add DT for lan966x SoC and 2-port board pcb8291
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:aA+KkTpDQEhK/FO8qgVraXM6tzzciYbtNlMDTUXQXDqxsYZqbrV
 j3ZWSP/D3QV/v/7BdV074j5ugqSBkcUBeEOuHeq9blvXVXU8xuzgG1pvm04Mo+3z/D8UERU
 QKj19+LOG2VHg30PXRAaDXWGGA745Q/ASwHH5PIKbPM7rNphZ4VZcVcsNRa8vFd7q51wLEj
 e514O8+Ojx1Po5MMpxIkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aFlK09bIQyo=:10/M3v/Xmwvmada/p5gZXe
 WXxA0r28EMF4DliQrBO06sET8Cv+mbW6VsHbFiROLBLJDiCXqLRsL8mSf1BEe555yAJ2Dbcx4
 XR98fsynmIrWi/KHI0+Uis0LSR6ZxeBrCi8aetQw2eHae5dxVphJYF7c1nevUmS/esoe5gyeJ
 czNzFhjUBXudnXH4c8Wt24HKc+7C9qKLc8tSekrpf9qdL3j9Pms8OYvbm+blu0NjsPdz+3Cpf
 JAJya0TAPYA5aOjE0USkpcO4OACl/hnlqn5XQLSiIk3BiM6qbuJuPSZ3J4WYei/w5tJUNWA5z
 L/R7hO1xQoWGuU+wlVoLUS6Uh/Po8qlfkBU6ELo4sd76hX6ZwZZ/48O+Xs7j8rSFqTcR1V3gg
 IYBn8PMTgwmT7zjYA6SUmfKtcty3BQiN2Dh04/P8oBLlHXD9NOiuF4lPfoKy1iw2BwbqtgMHQ
 q8QDIILg2QXhZhMuf8VbLbD8n7QErMNunuC26llxtluCCt2E0NEZCH4EKJpqFkEOiwO1PCgut
 ZQPa2B2qlDEbPxwVc4XyfqqISAtFxSC6EnkPCIa9AJpMYu1CYiyCsFxxzOZOfLdPmLMqa35Gx
 kED7eLIiqXkCWM599HNtSODDPAau+aj9UMdjo2mhrphHOvqkBsU6enhJIurBNvUWQ6Mx08k0v
 csVUkJSTbv4tVTUUt3RfSvcjjZt/cNt3qIytagydVOY4rI4glvx9KB86/sKjDjtb/Xsc=

On Thu, Jan 13, 2022 at 9:33 AM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
>
> On 13/01/2022 at 09:00, Kavyasree Kotagiri wrote:
> > This patch adds basic DT for Microchip lan966x SoC and associated board
> > pcb8291(2-port EVB). Adds peripherals required to allow booting: IRQs,
> > clocks, timers, memory, flexcoms, GPIOs. Also adds other peripherals like
> > crypto(AES,SHA), DMA and watchdog.
> >
> > Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
>
> Looks good to me:
> Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

I'm not quite sure what to do with this, as this was sent to:soc@kernel.org,
which is normally for patches that are already reviewed and should just
get applied.

I can apply this, but I would normally expect board files to get picked up
in the at91 tree first. I'll drop this version from patchwork for now, as I
also have a couple of comments:

> > +
> > +/ {
> > +     model = "Microchip LAN966x family SoC";
> > +     compatible = "microchip,lan966x";

By convention, the 'compatible' strings should not contain 'x'
as a wildcard character. Just pick one of the models to be
compatible with. The .dtsi file doesn't really need a top-level
compatible or model property though, as they need to be
overridden by teh board anyway.

> > +
> > +     memory@60000000 {
> > +             device_type = "memory";
> > +             reg = <0x60000000 0x40000000>;  /* 1GB */
> > +     };

Probably also no memory node. This tends to be filled by the
boot loader, or it is part of the board when when the boot loader
is too old for that.

If the memory is part of the chip package, having it in the .dtsi
file is probably ok, but I would add a comment for that.

> > + */
> > +/dts-v1/;
> > +#include "lan966x.dtsi"
> > +
> > +/ {
> > +     model = "Microchip EVB - LAN9662";
> > +     compatible = "microchip,lan9662-pcb8291", "microchip,lan9662", "microchip,lan966";
> > +};

Here I would expect /chosen and /aliases nodes.

> > +&gpio {
> > +     fc_shrd7_pins: fc_shrd7-pins {
> > +             pins = "GPIO_49";
> > +             function = "fc_shrd7";
> > +     };

These properties don't look like most pinctrl nodes, has the binding
been reviewed?
I don't see it in Documentation/devicetree/bindings/pinctrl/

          Arnd
