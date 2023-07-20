Return-Path: <SRS0=8tag=DG=gmail.com=james.hilliard1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFE0EB64DA
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 10:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2D22C433C9; Thu, 20 Jul 2023 10:49:30 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81481C433C8;
	Thu, 20 Jul 2023 10:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81481C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6b9b52724ccso515486a34.1;
        Thu, 20 Jul 2023 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689850168; x=1690454968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhN4Tm1KYjpSKgaucoal2D/MO/xFEnf9iPBeqXIBYto=;
        b=FDo+wK+fKrykg6fJwnakhqvmm4mPM1TMlHWu1GoH63RwqAWoa2JD7NYmo5l9ZdYEuq
         jQtJQhNbrPhfouvWviJN1E9k0+af4RzleYh5NcK5f4EJPRRefttiKiGCz/4xqvfE81F6
         QEmqY7eZeSXfDidft8HiaFd7gJ42px7R9vD/LC0IkrQ0jUf9+R4kmOrallrW4+Aga6Ix
         22AgopCBBQz0pfFxrx9SqBi3CBxSoluwsvjax0bm1rKcJvQg7K8ZYycsUP095hzo7ocJ
         CxjISIpfXJYsZEyICffKT7FA3x7osjs70By5zmOzBpB4TnwOVesLKrTto3jpakZkSTJn
         KNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689850168; x=1690454968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KhN4Tm1KYjpSKgaucoal2D/MO/xFEnf9iPBeqXIBYto=;
        b=T2paj0xkjYlZyKaElm4zX31asFt8vhIygmr3FCJDXcLY3oPpxxV9HnWK7Q52H435JD
         hyRqR2ejn4LLWTWBbnpeQVJQvYyIKGgqT4MuZadB2yuEWnP1PXm1wgKLc6MUi7z5uWmh
         bDecVkSOj8ajPuII5aSzIAjXO+OafeT9iOh4WXINApOo6ON4/VOFZK1E3o4c4ecmt7ix
         PqoODKcCbB69cudRn2rPHxTVUMKJu0pEbQJbdo70XhEe0oFmkTRPs7wIRJ4jz5NMG/UN
         tTMtGI/fca3DYVGR/kYpQnCxb/fIJcvtixVXO86SONvNcaxaP4UNDltPf63pOgJeBifj
         ZSxw==
X-Gm-Message-State: ABy/qLbUe7vDF0QHyW6pRrca7O24f1gzy89PQ/YErf1RjwI/CTtTy7QJ
	iPJMnd5J0Q23o0QXJ7WrSw59cExDb7eI6pabfL0=
X-Google-Smtp-Source: APBJJlEYhm2GNZGLGs7i8Dehn485BA5XN3NYGwh3lga6V7iEfyixTgdgTHIlaGVN2weD/L70gCaMVlbuofupbUdTmu8=
X-Received: by 2002:a05:6870:330f:b0:1b0:80d0:b895 with SMTP id
 x15-20020a056870330f00b001b080d0b895mr1483608oae.12.1689850168047; Thu, 20
 Jul 2023 03:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230719224141.3716815-1-james.hilliard1@gmail.com>
 <20230719224141.3716815-2-james.hilliard1@gmail.com> <0ad5a223-d70f-deaa-6261-a2bd2b2af40d@linaro.org>
In-Reply-To: <0ad5a223-d70f-deaa-6261-a2bd2b2af40d@linaro.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 20 Jul 2023 04:49:15 -0600
Message-ID: <CADvTj4qvXvuV=ASg5h4hPr8QG-NR48j6G36AZC5xHDdhLyjT7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx6q: Add Variscite MX6 Custom board support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Wahren <stefan.wahren@chargebyte.com>, 
	Andreas Kemnade <andreas@kemnade.info>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jesse Taube <mr.bossman075@gmail.com>, 
	Li Yang <leoyang.li@nxp.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 12:15=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/07/2023 00:41, James Hilliard wrote:
> > This patch adds support for the Variscite MX6 SoM Carrier Board.
> >
> > This Carrier-Board has the following :
> > - LVDS interface for the VLCD-CAP-GLD-LVDS 7" LCD 800 x 480 touch displ=
ay
> > - HDMI Connector
> > - USB Host + USB OTG Connector
> > - 10/100/1000 Mbps Ethernet
> > - miniPCI-Express slot
> > - SD Card connector
> > - Audio Headphone/Line In jack connectors
> > - S-ATA
> > - On-board DMIC
> > - RS485 Header
> > - CAN bus header
> > - SPI header
> > - Camera Interfaces header
> > - OnBoard RTC with Coin Backup battery socket
> > - RS232 Debug Header (IDC10)
> > - RS232 DTE
> >
> > Product Page : https://www.variscite.com/product/single-board-computers=
/var-mx6customboard
> >
> > The dts file based on the ones provided by Variscite on their own
> > kernel, but adapted for mainline.
> >
> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/arm/fsl.yaml          |   1 +
>
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.
>
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../arm/boot/dts/imx6q-var-mx6customboard.dts | 279 ++++++++++++++++++
> >  3 files changed, 281 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/imx6q-var-mx6customboard.dts
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documenta=
tion/devicetree/bindings/arm/fsl.yaml
> > index 15d411084065..0f583852de8a 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -298,6 +298,7 @@ properties:
> >                - udoo,imx6q-udoo           # Udoo i.MX6 Quad Board
> >                - uniwest,imx6q-evi         # Uniwest Evi
> >                - variscite,dt6customboard
> > +              - variscite,mx6customboard
> >                - wand,imx6q-wandboard      # Wandboard i.MX6 Quad Board
> >                - ysoft,imx6q-yapp4-crux    # i.MX6 Quad Y Soft IOTA Cru=
x board
> >                - ysoft,imx6q-yapp4-pegasus # i.MX6 Quad Y Soft IOTA Peg=
asus board
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 59829fc90315..9cfc3d3e91ea 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -665,6 +665,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
> >       imx6q-udoo.dtb \
> >       imx6q-utilite-pro.dtb \
> >       imx6q-var-dt6customboard.dtb \
> > +     imx6q-var-mx6customboard.dtb \
> >       imx6q-vicut1.dtb \
> >       imx6q-wandboard.dtb \
> >       imx6q-wandboard-revb1.dtb \
> > diff --git a/arch/arm/boot/dts/imx6q-var-mx6customboard.dts b/arch/arm/=
boot/dts/imx6q-var-mx6customboard.dts
> > new file mode 100644
> > index 000000000000..66047dff11ec
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6q-var-mx6customboard.dts
> > @@ -0,0 +1,279 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support for Variscite MX6 Carrier-board
> > + *
> > + * Copyright 2016 Variscite, Ltd. All Rights Reserved
> > + * Copyright 2022 Bootlin
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx6qdl-var-som.dtsi"
> > +#include <dt-bindings/pwm/pwm.h>
> > +
> > +/ {
> > +     model =3D "Variscite i.MX6 QUAD/DUAL VAR-SOM-MX6 Custom Board";
> > +     compatible =3D "variscite,mx6customboard", "fsl,imx6q";
>
> Where is the SoM compatible?

I mostly just copied this from the DART-MX6 device tree which is
another variscite
imx6q based modular SoM custom board combination:
https://github.com/torvalds/linux/blob/v6.5-rc2/arch/arm/boot/dts/nxp/imx/i=
mx6q-var-dt6customboard.dts#L17

The terminology is a bit confusing in general here, variscite has 2
families of pin2pin
modules, the "VAR-SOM" and the "DART" family.
https://www.variscite.com/variscite-pin2pin-system-on-module-families/

Within each connector family there are then multiple SoM boards that
can be used with the same carrier boards(ie the Custom Board carrier board
like the evaluation kit) although they are often bundled together with spec=
ific
boards in practice.

So the existing DART-MX6 I think uses the same SoC but is in a different
family and as such has a different carrier board. However as the relation
between the SoM and the carrier board is effectively the same, I just copie=
d
the way compatibile is being set there for the VAR-SOM-MX6 from the
existing DART-MX6 custom board device tree.

I think this roughly represents the SoM board device tree associations as I=
'm
understanding them:

pin2pin Family: DART
SoM: https://www.variscite.com/product/system-on-module-som/cortex-a9/dart-=
mx6-cpu-freescale-imx6/
SoM part: DART-MX6
SoM device tree: imx6qdl-var-dart.dtsi
SoM SoC: imx6q
Board: https://www.variscite.com/product/single-board-computers/dt6custombo=
ard/
Board device tree: imx6q-var-dt6customboard.dts
Board compatible: compatible =3D "variscite,dt6customboard", "fsl,imx6q";

pin2pin Family: VAR-SOM
SoM: https://www.variscite.com/product/system-on-module-som/cortex-a9/var-s=
om-mx6-cpu-freescale-imx6/
SoM part: VAR-SOM-MX6
SoM device tree: imx6qdl-var-som.dtsi
SoM SoC: imx6q
Board: mx6customboard
https://www.variscite.com/product/single-board-computers/var-mx6customboard=
/
Board device tree: imx6q-var-mx6customboard.dts
Board compatible: compatible =3D "variscite,mx6customboard", "fsl,imx6q";

What's confusing here is that the DART-MX6 is also described as a SoM:
"DART-MX6 from Variscite is the smallest System on Module (SoM) / Computer
on Module (CoM) supporting NXP/Freescale=E2=80=99s i.MX6 Quad and Dual-core
Cortex-A9=E2=84=A2 processor"

So we have a "DART-MX6" SoM part which corresponds to the "VAR-SOM-MX6"
SoM part, with both being SoM's but only one("VAR-SOM-MX6") having SoM in
the actual part name.

Does the compatible section for imx6qdl-var-dart.dtsi look correct?

I'm not sure what exactly a "SoM compatible" should look like here as SoM i=
s
both a generic term(used to describe by both the "DART-MX6" and
"VAR-SOM-MX6" parts) as well as term used within a part(used in the
part for "VAR-SOM-MX6" as well as other SoM's in the "VAR-SOM" family
but not the "DART-MX6" part or other SoM's in the "DART" family).

>
> Best regards,
> Krzysztof
>
