Return-Path: <SRS0=yZUZ=VL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5E0C433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 18:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8590C385A9; Tue,  3 May 2022 18:20:25 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03C5AC385A4;
	Tue,  3 May 2022 18:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03C5AC385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MekKJ-1oM7QY2Hor-00aj0w; Tue, 03 May 2022 20:20:15 +0200
Received: by mail-wm1-f51.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so1732016wmn.1;
        Tue, 03 May 2022 11:20:15 -0700 (PDT)
X-Gm-Message-State: AOAM531N1m6M757nDrfYEdxHCSk1Uza6WoMB3XZnWSDwBE1FIn0x0N8A
	YPwMYzBMwHBFd77lRdQjOYRdt2/IUcALMfH1mSs=
X-Google-Smtp-Source: ABdhPJzdLAi6LusGzpUmQqAEN7Ep7tmyrMxpq73q7upJ6tCWBfIvFV42Z7BCJneune7LbBwSqLK48yMk9eyVnxECpN8=
X-Received: by 2002:a05:600c:3798:b0:394:454a:df74 with SMTP id
 o24-20020a05600c379800b00394454adf74mr4515023wmr.174.1651602015176; Tue, 03
 May 2022 11:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220502204050.88316-1-nick.hawkins@hpe.com> <20220502204050.88316-7-nick.hawkins@hpe.com>
 <CAK8P3a2rzmVrpnf2r73iXB=T06OMOsgwyq1i8z7swuOW-q88eQ@mail.gmail.com> <PH0PR84MB17180215774D59A3EC277B1388C09@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB17180215774D59A3EC277B1388C09@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 May 2022 20:19:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1q6pJ6pdZav0rWJFR2dAWwz8mpiFRO6vc+TA+L-Sk5uQ@mail.gmail.com>
Message-ID: <CAK8P3a1q6pJ6pdZav0rWJFR2dAWwz8mpiFRO6vc+TA+L-Sk5uQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] ARM: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>, Joel Stanley <joel@jms.id.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:R+kCVdtK0x9ELlmfP7NYCUi/WlDfGkkfB7phlvAXr2Ws9xFDEF8
 hJsbQ8ZCbDY5VTLPWQz9xK+YIzHevUgHUZ5RLQvXMpvIoBsA/IAYI90UxLzY9u5Dqth4pp+
 dTRlxJwrdortioyfG7OFnhwfH2Bs03ps4D4te+EG51mb+FezIyvYBbseOaChGIJceWh1vol
 K94X2lOMhi02fBCEIAJOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UE9HOcOXtJ0=:/3kkRUI7m0Q1wn8zEbExBe
 BE8U80s/p9YupZ9gN444gU1rZn0/c3f30rZeEposx4+kfNKzPF3TsogObdzO9pHCC3abWmnGb
 IQkhqzoUI7u26PCAINZ483yPq1Ri4t//uSST5NLlvucy6H9JnfZI7Bxcxl5nciCxBw/cWkIOK
 1av2zcJloYmA2XRqXC3qIty4HFTyMWmvrdFQ0KJhM7hhM/nSTYx23mAwxKaSLy+nhHS5OxAID
 PYjHNw2Wu9/z+FjgIbZmbRAM7cb9BIOYwTBQYz5x0BUcjH9FuL1XAom2bPPGw09MuUsC44BHp
 GEDr2Xlu7GLzt+6LEautUENgdRgPnkf8+UtjNP4uYCQF0G/JsGOUIY5t1GJFhb17jeUwIwaEL
 A6l1CjFpml2JFsjwLBCFi0f+Qm+govJXAXDOS3M+kgHEcz2Bc9hpYKphE04owkstLqhaI/+FI
 kIK4NbaJduVqmmzqWXnbMwm8mPBKiyoRgdjJJCWzajtRxIU4xFjB/6a7Mcs+5c3AoaEncCvJ2
 KA5NWHnaa39UCBX6N2VEnPNAxwAWLl/cBv2n4aTFtQ1maDEJ5PV22urZFvN+L7RZc0M5zoZj6
 OShc7rp9U0KiuC5l+MBHPp3ZkiORz6kt4tlVWLZu/tmSSZdShI23YK4IBIhvjmAiKdnUXTtB5
 h7ie7fkPEDBF/MWOfUA6Xlz/Q6xFXjZ+etHLxZpPT9FWYwhe1fOHWI53ri8onYv2fyeg=

On Tue, May 3, 2022 at 5:07 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:
> On Mon, May 2, 2022 at 10:40 PM <nick.hawkins@hpe.com> wrote:
> > > +++ b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
>
> > In the board specific file, you normally have "aliases", "chosen" and "memory"
> > nodes that define e.g. which uart is used for the console.
>
> This is what I have come up with.
>
> / {
>         #address-cells = <1>;
>         #size-cells = <1>;
>         compatible = "hpe,gxp-dl360gen10", "hpe,gxp";
>         model = "Hewlett Packard Enterprise ProLiant dl360 Gen10";
>
>         aliases {
>                 serial2 = &uartc;
>         };

It's a bit unusual to have a serial2 uart when there is no serial0 or serial1.
Most boards that only have a single uart label it either '0' or '1'.
>
>         chosen {
>                 bootargs = "console=ttyS2,115200";
>         };

Use 'stdout-path' to pick the console device here, not the argument
string.

>
>         memory@40000000 {
>                 device_type = "memory";
>                 reg = <0x40000000 0x20000000>;
>         };
> };


> > > +       memory@40000000 {
> > > +               device_type = "memory";
> > > +               reg = <0x40000000 0x20000000>;
> > > +       };
>
> > If the memory is outside of the SoC, it should not be here.
>
> It is part of the SoC. Should I put it in the axi bus instead? If so would
> I need to create an axi for the .dts as well?

That's fine then. The memory node has to be at the root of the DT, not in a
child node. It's just that most SoCs have the memory in a separate chip
on the board, rather than inside of the SoC itself, so it would be part
of the board file. If the gxp package includes the memory and it's not
an option for the board design, you can leave it in the .dtsi file.

         Arnd
