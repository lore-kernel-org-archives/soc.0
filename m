Return-Path: <SRS0=38w0=TW=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40986C433EF
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 13:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1350CC340ED; Fri, 11 Mar 2022 13:38:25 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F56DC340E9;
	Fri, 11 Mar 2022 13:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F56DC340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MbAYo-1nzoMV1dnM-00bf9M; Fri, 11 Mar 2022 14:38:19 +0100
Received: by mail-wr1-f43.google.com with SMTP id p9so12963071wra.12;
        Fri, 11 Mar 2022 05:38:19 -0800 (PST)
X-Gm-Message-State: AOAM530zi0uXQl914y4VTKeHreonWW1KShXuhZi1PnuGg7/dBz27vHeh
	Ocb+fdowIxuO/VE8yVALSFOSxDXPWG9zkEtaFGA=
X-Google-Smtp-Source: ABdhPJyQyoYHZh+pVslr/vmoDVsDXk3gvhxbqLrROJJ+HWkN4Vk43usfrnZ6D257Ws7a0R12okqcFdfYA8OnpIhB5tk=
X-Received: by 2002:adf:f606:0:b0:203:8dff:f4ac with SMTP id
 t6-20020adff606000000b002038dfff4acmr5286812wrp.12.1647005899008; Fri, 11 Mar
 2022 05:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
 <20220311093800.18778-4-singh.kuldeep87k@gmail.com> <4aae560d-d266-d0d0-136f-32891b15bc01@mleia.com>
In-Reply-To: <4aae560d-d266-d0d0-136f-32891b15bc01@mleia.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 11 Mar 2022 14:38:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3a_WXbDKN-jJUt_Wuvop0rfaUs4ytwyhogOxdtJAPx0w@mail.gmail.com>
Message-ID: <CAK8P3a3a_WXbDKN-jJUt_Wuvop0rfaUs4ytwyhogOxdtJAPx0w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: lpc32xx: Update spi clock properties
To: Vladimir Zapolskiy <vz@mleia.com>
List-Id: <soc.lore.kernel.org>
Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wITAlrRD1apwwam4ovOeK17QAfIp5Vzu6jAO6K+fB5plPfpdAP7
 Xc0L0iShOyujXkUlwY5od0aDdXOOD4zOY7XFomnVKUNd//ftK6PDvFo5KHNlFffBPfBbeTK
 6Sy125oG02daCJ7h0wvYoNXZpDoo8ZrMyS0XSDiYsSS1B2agRSQVFQi8sjEWFFfVgkqohLF
 yfpgY75/ujhscOIT8z2TA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nE/fmhK4wjM=:1TCqExjXMcmJp8lz/Mt+yE
 xOd08yHgfhlknFFpLoPR/92G0j/CkuUcj31wHFlSEyHN3RuzNds6l6heIXR2s3aI1ZA0vNmuR
 VCymUVLmZx5bcNjf+8T/FT58OMMNetumS20WnI3/M6fLcYvKcuKje+KccVKOmJFSjdhH1L3Qn
 QNcU37TcP+9W+U7m5blyaDl7+hL9/bl7I1qtQ0930pPv5jxa43FO2q8+3HoqE7WAwQA0n4mT+
 PDXv/hIiPz5yT5uOKTg3dNDfdHAyck8x/n7rajals3GKPH1/HDs7opocejKCKM1i0A3r3usWU
 8mjheWCFKVLcwB5+ZDqSZaNcXWoepgGCLNijeMTKiLY3uP8w1jC2RuGZ62das0s5S+W41Ne99
 Rf8XqsBUs8oou/8/aKn6dH7OW9e1xjBqe7p/My3eOUjYOqhEZu4y2lIYmKxzAiVeNxPHjamZ7
 Iuljmke3U/0EETJL9Xnvpke6qmjK4263gfQ0a0PrY3eA+eYlIXJIxuWRP3wNKSfdr2juV+QiX
 aDDTl2k9XexELRtvyIkiYTf1iCS7WJUPEhNZZNhbFaVKeO5V3aDdeAKPVs//aoFzKrwkYW7cr
 uSN7Qi83oXHCawL0Veuo6iKbmW5Pv+8bQJ7o6VEsZBHRYm2aJrBxMWd3PcyQgpxCnLreAuGLP
 y/VR1ox6OwlktpiAOqQeFIz1XwdhdkfJ99IeAeDDIMircoBZxGUFE2ZiWM0QDMt+OrFE=

On Fri, Mar 11, 2022 at 2:20 PM Vladimir Zapolskiy <vz@mleia.com> wrote:
>
> On 3/11/22 11:38 AM, Kuldeep Singh wrote:
> > PL022 binding require two clocks to be defined but lpc platform doesn't
> > comply with bindings and define only one clock i.e apb_pclk.
> >
> > Update spi clocks and clocks-names property by adding appropriate clock
> > reference to make it compliant with bindings.
> >
> > CC: Vladimir Zapolskiy <vz@mleia.com>
> > Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> > ---
> > v2:
> > - New patch with similar changeset
> > - Send to soc ML
> >
> >   arch/arm/boot/dts/lpc32xx.dtsi | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
> > index c87066d6c995..30958e02d5e2 100644
> > --- a/arch/arm/boot/dts/lpc32xx.dtsi
> > +++ b/arch/arm/boot/dts/lpc32xx.dtsi
> > @@ -178,8 +178,8 @@ ssp0: spi@20084000 {
> >                               compatible = "arm,pl022", "arm,primecell";
> >                               reg = <0x20084000 0x1000>;
> >                               interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> > -                             clocks = <&clk LPC32XX_CLK_SSP0>;
> > -                             clock-names = "apb_pclk";
> > +                             clocks = <&clk LPC32XX_CLK_SSP0>, <&clk LPC32XX_CLK_SSP0>;
> > +                             clock-names = "sspclk", "apb_pclk";
>
> In fact I'm uncertain if it is the right change, could it happen that the commit
> cc0f6e96c4fd ("spi: dt-bindings: Convert Arm pl022 to json-schema") sets a wrong
> schema pattern?

Good pointm this doesn't quite seem right: it is unlikely that the same clock
is used for both the SPI bus and the APB bus.

> Apparently just one clock is wanted on all observed platforms and cases, this
> is implicitly confirmed by clock handling in the drivers/spi/spi-pl022.c :
>
>         pl022->clk = devm_clk_get(&adev->dev, NULL);
>
> So, I would vote to fix the device tree bindings schema.

Isn't this just using the wrong name? The name of the macro
LPC32XX_CLK_SSP0 might indicate that this is indeed the SPI clock
rather than the APB clock, so we only need to change clock-names
property here and leave it unchanged otherwise.

Looking at the driver, I also see that this refers to the clock as
"SSP/SPI bus clock", and it reads the rate from that.

In case of the LG platform, my impression is that the clocks listed
in DT don't reflect the system at all, they all refer to the same
fixed clock node at 198000000HZ, which is also used as for the
UART and timer nodes. Changing the name on that one doesn't
really make it correct, but should not hurt either.

        Arnd
