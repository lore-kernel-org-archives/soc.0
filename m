Return-Path: <SRS0=mEcO=WH=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D7CC433F5
	for <soc@archiver.kernel.org>; Tue, 31 May 2022 12:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDF5BC341C0; Tue, 31 May 2022 12:44:01 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5C6CC385A9
	for <soc@kernel.org>; Tue, 31 May 2022 12:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5C6CC385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-300312ba5e2so138548557b3.0
        for <soc@kernel.org>; Tue, 31 May 2022 05:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wv+lZyCaE5kbkLZpqQvi2xp+OoDSqLcG7HNruSmDfC8=;
        b=XNWi1d1oeE0HDSgunP6m9EOL2loWM0Nn14vYZ7RDHJApDMHysMiN9E9GxGPeft5nSa
         BTgo7Ek7+TpqeLvM+63oxN+U81RPwTIV96z04d7ugi/hj1bv9WfjpfefwvGxP+4Rt1DV
         4almvcFW6ZKDRTJWC/ranIrKv9t3ENmkKE/Z2a/Vl3yPIxFDZXTT+O8JJHNedz9ZGxCI
         K/xeYzvmmRJcY0+z5wO+eZPJ/cpNZXAXr70FT0SdPea0rDxWWoxMo3DZ3ks6lHCc7+Ty
         dhl1y8aMn2pppa3+ZjvqABteKAeQ/1DDZZkj0VSPfqXa3uTZO6uPE0+QSLJxhdfIy5ja
         Zf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wv+lZyCaE5kbkLZpqQvi2xp+OoDSqLcG7HNruSmDfC8=;
        b=gCrhqpInNVLEblovzJ7OArYDXtnkW5b/EJE/Em44g2474NU2R99EBmdMvAAaQuD9lD
         BQHHhmEm3WB0cTmniuOviptLZbgEQtyEkocSUscigqtrFearxTbmqQLhkzA7bPtZ3ANs
         oO8hfP357uhfiGxPWNVj6rctBCe64fqovzAkepiUC52AE8u30K+dAxkwTWDQF736p/uT
         dkJMOKp/8Yf8SpwwNv/T3R6exD2shMTg53QWe3xVEd1wvfEQZb3EfEKyfJxA08JGAp8R
         DMKaY/9JEwH9XA9MUVldVydWHhAiHZUh0yqLk+QUvUavTJkora0iX036ou21HyNuFVQD
         6Vkw==
X-Gm-Message-State: AOAM532MDD07bgeS5OwaJsqF9CdEfdjLz8nWlNfhr4hxFRSmVJj6Sytr
	2Veky0BwPvY4HN19FDLsKAH9bNuQIjt8cpExplIRMQ==
X-Google-Smtp-Source: ABdhPJzeGNxtL8TPdvCOrBOXNjOCKP8RSjF0qzXwrWGx09HwYJPlam/R5UHa322kEdYOs0PWmQPr2S/j6AIlnevJFPY=
X-Received: by 2002:a81:ccd:0:b0:30c:2ad6:925b with SMTP id
 196-20020a810ccd000000b0030c2ad6925bmr15444888ywm.498.1654001039770; Tue, 31
 May 2022 05:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220530130839.120710-1-pan@semihalf.com> <20220530130839.120710-2-pan@semihalf.com>
 <73f01056-e674-d910-1c0d-98c4001f909d@linaro.org>
In-Reply-To: <73f01056-e674-d910-1c0d-98c4001f909d@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Tue, 31 May 2022 14:43:49 +0200
Message-ID: <CAF9_jYQTTtK-MmEc11NnW8Aez6OtmZeJB7aPhYLoEvQ9vFiuLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dts: socfpga: Change Mercury+ AA1 devicetree to header
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review, I'm thinking of splitting this commit into
several smaller ones:
- remove all status =3D "okay" things and i2c aliases
- remove sdmmc-ecc node (it's a part of the Arria 10 SoC, not the mercury)
- add atsha204a node
- add copyright header
- style fixes (phy reg, memory)
What do you think?

Please see my other comments below.

On Mon, May 30, 2022 at 8:55 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/05/2022 15:08, Pawe=C5=82 Anikiel wrote:
> > The Mercury+ AA1 is not a standalone board, rather it's a module
> > with an Arria 10 SoC and some peripherals on it. Remove everything that
> > is not strictly related to the module.
>
> Subject has several issues:
> 1. Use prefix matching subsystem (git log --oneline)

Just to make sure, are you referring to the ARM: prefix?

> 2. You are not changing here anything to header. Header files have
> different format and end with .h. This is a DTSI file.

Yes, I meant dtsi.

>
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
>
> Thank you for your patch. There is something to discuss/improve.
>
> > ---
> >  arch/arm/boot/dts/Makefile                    |  1 -
> >  ...1.dts =3D> socfpga_arria10_mercury_aa1.dtsi} | 68 ++++-------------=
--
> >  2 files changed, 14 insertions(+), 55 deletions(-)
> >  rename arch/arm/boot/dts/{socfpga_arria10_mercury_aa1.dts =3D> socfpga=
_arria10_mercury_aa1.dtsi} (58%)
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index edfbedaa6168..023c8b4ba45c 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1146,7 +1146,6 @@ dtb-$(CONFIG_ARCH_S5PV210) +=3D \
> >       s5pv210-torbreck.dtb
> >  dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D \
> >       socfpga_arria5_socdk.dtb \
> > -     socfpga_arria10_mercury_aa1.dtb \
> >       socfpga_arria10_socdk_nand.dtb \
> >       socfpga_arria10_socdk_qspi.dtb \
> >       socfpga_arria10_socdk_sdmmc.dtb \
> > diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts b/arch/a=
rm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
> > similarity index 58%
> > rename from arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
> > rename to arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
> > index a75c059b6727..fee1fc39bb2b 100644
> > --- a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
> > +++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
> > @@ -1,57 +1,38 @@
> >  // SPDX-License-Identifier: GPL-2.0
> > -/dts-v1/;
> > -
> > +/*
> > + * Copyright 2022 Google LLC
> > + */
>
> How is this related to the patch?

I'll move this change to a seperate commit.

>
> >  #include "socfpga_arria10.dtsi"
> >
> >  / {
> > -
> > -     model =3D "Enclustra Mercury AA1";
> > -     compatible =3D "enclustra,mercury-aa1", "altr,socfpga-arria10", "=
altr,socfpga";
> > -
> >       aliases {
> >               ethernet0 =3D &gmac0;
> >               serial1 =3D &uart1;
> > -             i2c0 =3D &i2c0;
> > -             i2c1 =3D &i2c1;
> > -     };
> > -
> > -     memory@0 {
> > -             name =3D "memory";
> > -             device_type =3D "memory";
> > -             reg =3D <0x0 0x80000000>; /* 2GB */
> >       };
> >
> >       chosen {
> >               stdout-path =3D "serial1:115200n8";
> >       };
> > -};
> >
> > -&eccmgr {
> > -     sdmmca-ecc@ff8c2c00 {
> > -             compatible =3D "altr,socfpga-sdmmc-ecc";
> > -             reg =3D <0xff8c2c00 0x400>;
> > -             altr,ecc-parent =3D <&mmc>;
> > -             interrupts =3D <15 IRQ_TYPE_LEVEL_HIGH>,
> > -                          <47 IRQ_TYPE_LEVEL_HIGH>,
> > -                          <16 IRQ_TYPE_LEVEL_HIGH>,
> > -                          <48 IRQ_TYPE_LEVEL_HIGH>;
> > +     memory@0 {
> > +             name =3D "memory";
> > +             device_type =3D "memory";
> > +             reg =3D <0x0 0x80000000>; /* 2GB */
> >       };
> >  };
> >
> >  &gmac0 {
> >       phy-mode =3D "rgmii";
> > -     phy-addr =3D <0xffffffff>; /* probe for phy addr */
> > +     phy-handle =3D <&phy3>;
> >
> >       max-frame-size =3D <3800>;
> > -     status =3D "okay";
> > -
> > -     phy-handle =3D <&phy3>;
> >
> >       mdio {
> >               #address-cells =3D <1>;
> >               #size-cells =3D <0>;
> >               compatible =3D "snps,dwmac-mdio";
> >               phy3: ethernet-phy@3 {
> > +                     reg =3D <3>;
> >                       txd0-skew-ps =3D <0>; /* -420ps */
> >                       txd1-skew-ps =3D <0>; /* -420ps */
> >                       txd2-skew-ps =3D <0>; /* -420ps */
> > @@ -64,35 +45,23 @@ phy3: ethernet-phy@3 {
> >                       txc-skew-ps =3D <1860>; /* 960ps */
> >                       rxdv-skew-ps =3D <420>; /* 0ps */
> >                       rxc-skew-ps =3D <1680>; /* 780ps */
> > -                     reg =3D <3>;
>
> This and few other changes (like memory) are not related to the commit.
> Do not mix different cleanups together.

l'll put the cleanup changes into a seperate commit.

>
> >               };
> >       };
> >  };
> >
> > -&gpio0 {
> > -     status =3D "okay";
> > -};
> > -
> > -&gpio1 {
> > -     status =3D "okay";
> > -};
> > -
> > -&gpio2 {
> > -     status =3D "okay";
> > -};
>
> Why removing all these? Aren't they available on the SoM? The same
> question applies to several other pieces, for example UART and USB -
> aren't these part of SoM?

I'm removing them from here, but adding them to socfpga_arria10_chameleonv3=
.dts.
I think that enabling them should be done in the base board's dts, as
the connections
go to the base board. The Chameleon v3 has a USB port, but a different
base board might
not have one.

>
> > -
> >  &i2c1 {
> > -     status =3D "okay";
> > +     atsha204a: atsha204a@64 {
>
> How is this change related at all to what you described in commit? There
> was no atsha204a before.

As previously mentioned, I'll move this change to a seperate commit.

>
> > +             compatible =3D "atmel,atsha204a";
> > +             reg =3D <0x64>;
> > +     };
> > +
> >       isl12022: isl12022@6f {
> > -             status =3D "okay";
> >               compatible =3D "isil,isl12022";
> >               reg =3D <0x6f>;
> >       };
> >  };
> >
>
> Best regards,
> Krzysztof


Regards,
Pawe=C5=82
