Return-Path: <SRS0=aHvQ=S7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C478C433EF
	for <soc@archiver.kernel.org>; Wed, 16 Feb 2022 16:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42E1DC340E8; Wed, 16 Feb 2022 16:51:14 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C2A0C004E1;
	Wed, 16 Feb 2022 16:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C2A0C004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8ojI-1oO11C1NVW-015uUx; Wed, 16 Feb 2022 17:51:04 +0100
Received: by mail-wm1-f46.google.com with SMTP id k127-20020a1ca185000000b0037bc4be8713so4208073wme.3;
        Wed, 16 Feb 2022 08:51:04 -0800 (PST)
X-Gm-Message-State: AOAM530v/eOnzYjF1JPyhDqnPT9IVx2p4d3tJ4l96qkSsRw5glr/qfIo
	s+bckaFVgEPABifiym3Lo+wCJkC26l/P1qZPkho=
X-Google-Smtp-Source: ABdhPJx8RqMyzjqG4qRfmf4/0bQTcftVw4SQPsOIYZkGgW8WAtBynLxNtL5rZYmPjYJ0eMNasjhYVG/ePq+kp7P5uvU=
X-Received: by 2002:a05:600c:4ecb:b0:37c:9125:ac03 with SMTP id
 g11-20020a05600c4ecb00b0037c9125ac03mr2448520wmq.98.1645030263859; Wed, 16
 Feb 2022 08:51:03 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com> <20220216153632.40981-1-nick.hawkins@hpe.com>
 <CAK8P3a0NmyxrzxgfwfDXuFvhmc3OL_-yBj8PDdEHh-2qm4NVkw@mail.gmail.com> <PH0PR84MB17185157544CFEB1D8AE267088359@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB17185157544CFEB1D8AE267088359@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 16 Feb 2022 17:50:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1HuTMt5WmOw3aQcLwGZd_WQ5nsKZ2HFDPQ0CHFvKsygA@mail.gmail.com>
Message-ID: <CAK8P3a1HuTMt5WmOw3aQcLwGZd_WQ5nsKZ2HFDPQ0CHFvKsygA@mail.gmail.com>
Subject: Re: [PATCH] [v3] arch: arm: boot: dts: Create HPE GXP Device Tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k6EcqB3vc0e4MYFFqHZ+qpioD4GNC35xxLzZe0fm8oeGBtQD3BX
 GumaWS4Dni3BmMs+4C0xXNSz6aQ5OY6V4PDRW4YYK+GFEt2qORtNmWYm5kUFpNgNeQemfTE
 EJlki4PuW6wMhWd0+3BzS8Cqv0Zn4Q9n5ILwOI+Z2yWqRH9vdHDAE1u0PPnrjcUEAplZl/Y
 0IEFGAOw/FXe79D09Brbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TRewgSzZo3U=:2+c3KEf/1M0K88SyqPY58Y
 hJNsxrda58ntRRRdTA6RPkjKcMJgB1Zy7W8Hg/3+DrMfl4PiOtB7UnWEYQgFrep5wRCmhEmoH
 LNBjBQ8qQizsyS3lEHH1N+fSyAOdlrpsPD7XGMSxwLxHrfqz9qARnEsdyB4AWT/CVOdw3CIr9
 xULUPxj55+8DTfBk/gXGnSJcH4flhlKPcirO9P0uQw7GBGPSTnO0yQiewP2TC9kSwETeEDNGA
 gHV2Avuu3ga13FMOw7rk3twL5KBvxkfjdIMMieqLV53PfXOp55+EZtiodpwqs2FqHwwUzjrFj
 4blcQml0ZamZpKrNW5ABz4HObv+n4e/s6Xa6nlHPup3cr/aMhxRG7c54QuSHqkDU43kxdCp0L
 lEAmX3mBoAgTUaH+z5Y0YzjzJngAVDP5lGmerCcalzEQS1lhzL2L3GfTg50tvUwu6FPaKwH1+
 ny0bw7Cx8ES6qtTq47Gf5aD4kfaieFWZKV3YEypVq3VhEUJbdyTSg85PGZiIwwC1gXFzPeXhr
 lZHGTQwSwSoOaZrfngcs3pi/cXxjx/qrkkHjpxPhpQL12hFbCPhz2c5mhjUF5WxwNrRT6ITEm
 fw0J8/oD3EBX3QdmU616Z6+5tbVyiw3ndEA19oPDhQmxaYXpKkBc+/XNGN2rn8LZ0suMmk9ZA
 sqU86XQzl0zHCenJ5sRTwrOMHoZTOZVXYVDULUYUXxOAOjGARBKMWZOwd99ZM+NVpgwPTTCM1
 W8TN17ThmMY7zjr1rWjevIVCPmU4t4owAlaC/DQRWMAZxqlaIRLb1fmX5hn1fke9M/2ztJy+1
 Yt5RjZ1hmbTdVkhKgumfPlavFkIY4ujOMT0MoTXKv7kmMiWymA=

On Wed, Feb 16, 2022 at 5:29 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:
> > +GXP ARM ARCHITECTURE
> > +M:     Nick Hawkins <nick.hawkins@hpe.com>
> > +M:     Jean-Marie <verdun@hpe.com>
>
> It looks like you are missing the family name here.
>
> NH: Do you mean I need to have an HPE in front of it?

No, I meant a 'Verdun' after Jean-Marie ;-)

> ...
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 235ad559acb2..a96b4d5b7f68 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1549,3 +1549,5 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >         aspeed-bmc-vegman-n110.dtb \
> >         aspeed-bmc-vegman-rx20.dtb \
> >         aspeed-bmc-vegman-sx20.dtb
> > +dtb-$(CONFIG_ARCH_HPE_GXP) +=3D \
> > +       hpe-bmc-dl360gen10.dtb
>
> This Kconfig symbol does not yet exist
>
> NH: Should I include the definition of this Kconfig symbol in this patch =
or just not modify the makefile when doing device tree changes?

I would start with a patch for the bindings, or one per binding, then
the Kconfig
patch, then the dts file and finally the MAINTAINERS entry.

The order is not super important, but it helps to do it in a way that one p=
atch
builds on the previous one in the series, rather than having a single big p=
atch,
or separate small patches that are not in a series.

>
> > +
> > +/ {
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <1>;
> > +       compatible =3D "hpe,gxp";
>
> No board specific compatible string? Also, this value is not documented a=
nywhere.
>
> NH: I was uncertain if this needed to be documented or not, checkpatch di=
d not notice it. Where would you recommend I should put this in documentati=
on? I was considering Documentation/devicetree/bindings/soc/hpe/

Documentation/devicetree/bindings/arm/hpe.yaml would be best.
The bindings/soc/ directory is not for the SoC as a whole but more
for components on the SoC that are either for identifying the chip
(as in struct soc_device in Linux)  or for things that don't fit anywhere
else but are specific to one soc.

> ...
>
> > +
> > +               watchdog: watchdog@c0000090 {
> > +                       compatible =3D "hpe,gxp-wdt";
> > +                       reg =3D <0xc0000090 0x02>, <0xc0000096 0x01>;
> > +               };
>
> As mentioned in a previous review, it would be helpful to have the driver=
s and bindings together in the same series for easier review.
>
> NH: Just to confirm, I need the driver source and the new DTS file in one=
 review? I also need to have a review to add files: arch/arm/configs/gxp_de=
fconfig, arch/arm/mach-hpe/gxp.c should those be included as well? I am try=
ing to not create too massive of a patch. I could also create completely se=
parate patches for these items so that reviewers could refer to it.

Yes, I think it's best to have all patches in a larger series for the
initial review. The defconfig
patch is usually separate, but the gxp.c file can be in the same patch
as maintainers entry
and the Kconfig and Makefile changes (outside of dts).

Try to keep each patch in the series self-contained, e.g. don't
separate a .c file from the Makefile
and Kconfig change, but don't group things into one patch that are not
directly related, e.g.
the dts file.

> ...
>
> To a lesser degree, the same is true for the uart.
>
> Please check the devicetree files in order to validate the bindings. In t=
his case, you should get a warning about the 'ehci@' name being non-standar=
d. The normal name is usb@
>
> NH: Which tool are you using to validate bindings? I did not receive any =
warnings but I did receive several errors which I corrected.

You can run "make dtbs W=3D1" to get most of the useful checks enabled.

> > +
> > +               vrom@58000000 {
> > +                       compatible =3D "mtd-ram";
>
> Same thing here, "vrom" is clearly not a standard name.
>
> NH: VROM is a Virtual ROM device that we use to create a memory mapping o=
f a SPI flash content copy that is served to a host system. How should I re=
name it?

Not sure, I don't remember seeing this case so far. Adding Joel to Cc,
maybe he knows of
another BMC that does the same thing.

         Arnd
