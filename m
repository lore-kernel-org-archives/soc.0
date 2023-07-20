Return-Path: <SRS0=8tag=DG=gmail.com=james.hilliard1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07227EB64DC
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 12:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD706C433C8; Thu, 20 Jul 2023 12:22:23 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A23BC433C7;
	Thu, 20 Jul 2023 12:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A23BC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1b00b0ab0daso581129fac.0;
        Thu, 20 Jul 2023 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689855741; x=1690460541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0t++U0Vzv/gH49HhmgSh4FeAcRNUY+jAecakl0C0Og=;
        b=sDKszMH+XdJKbFe18EPkj9WfFF4/EthlORZlOdACynwXWrV71iSbKDCkaY59TPtGXk
         gWwh5pBJ31p99UwUAzYd3QtjRwiXELGo6m+vsCMY++JgtOSI7o/PeFr9uK7kbX1nW/FE
         mVyW7t5gBtYkRS4GainYjAuo4KJIvrgPOrNVqs6N9smmAi6PW5UKa5bZ5zfU/XnYGVnr
         FrcYoSedq156yI51HPnCXsor6yDS7agu/2SaAlBnFKDF7IuhsHVNShbqAECbULjvAhSD
         pS5YgiQRi8O2EUwlbplk3nq8khp96O60y6NtrbIqJhF04P8qru4I0bXxHrEgRwhZRfRK
         I6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689855741; x=1690460541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0t++U0Vzv/gH49HhmgSh4FeAcRNUY+jAecakl0C0Og=;
        b=a8GDdnRmtNPFVIhXjWZ4dnViZWG+NaA3mfthoMm6Zb+JXMlFeKHR1LQhhGLuGzmSYA
         2MgLP70tTPPWFJCxHawPvvKOABcpwH5cNesrXriUlHcEA9wIFN01H/HnOUZWOYsxi6R3
         zmLkf7KiCNis5nj/n66acodRw1xx2vdp61zC9cv0s35MLdZlziE6S32qAbSuZ0iMQhGk
         Ictao29kHXl6s6NSiJ8QqBHJUp/QuuhWf1oHDhA3nOApi73E2gwdBaOpSuVerZZ4rU0w
         1dOFuHIxVU+yMg0aL3yBRtdBYkJmJq+AvDHI7Ra5KzCwrysa1qaLuW6YY8ge3OZ1I2U3
         Tthw==
X-Gm-Message-State: ABy/qLZYLk7lwGrHN1JY8+fYa65+RbMe+8kOlq2arIzJIsmWcpeR6CvX
	n7D9zUQ2jxe/aOQwLQdkdbLAirBgm9UBQSjj9RE=
X-Google-Smtp-Source: APBJJlGhbBHD6Ufj+gMknWKtnbND32FgQX3qiicmC8sqrHRmzn6zNmk/3hi2lqf12zL6fnARv6ZW/tV4MYlPV2brkvw=
X-Received: by 2002:a05:6870:790:b0:1b0:2c27:c959 with SMTP id
 en16-20020a056870079000b001b02c27c959mr1543974oab.16.1689855741131; Thu, 20
 Jul 2023 05:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230719224141.3716815-1-james.hilliard1@gmail.com>
 <20230719224141.3716815-2-james.hilliard1@gmail.com> <0ad5a223-d70f-deaa-6261-a2bd2b2af40d@linaro.org>
 <CADvTj4qvXvuV=ASg5h4hPr8QG-NR48j6G36AZC5xHDdhLyjT7w@mail.gmail.com> <c70e397e-dee8-2155-9f0b-538e95bda2eb@linaro.org>
In-Reply-To: <c70e397e-dee8-2155-9f0b-538e95bda2eb@linaro.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 20 Jul 2023 06:22:09 -0600
Message-ID: <CADvTj4p72nh5umeSRw2OhjA5NyyZY_BkMhzJBn4Y2AHZHA3+dw@mail.gmail.com>
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

On Thu, Jul 20, 2023 at 5:39=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/07/2023 12:49, James Hilliard wrote:
> > On Thu, Jul 20, 2023 at 12:15=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 20/07/2023 00:41, James Hilliard wrote:
> >>> This patch adds support for the Variscite MX6 SoM Carrier Board.
> >>>
> >>> This Carrier-Board has the following :
> >>> - LVDS interface for the VLCD-CAP-GLD-LVDS 7" LCD 800 x 480 touch dis=
play
> >>> - HDMI Connector
> >>> - USB Host + USB OTG Connector
> >>> - 10/100/1000 Mbps Ethernet
> >>> - miniPCI-Express slot
> >>> - SD Card connector
> >>> - Audio Headphone/Line In jack connectors
> >>> - S-ATA
> >>> - On-board DMIC
> >>> - RS485 Header
> >>> - CAN bus header
> >>> - SPI header
> >>> - Camera Interfaces header
> >>> - OnBoard RTC with Coin Backup battery socket
> >>> - RS232 Debug Header (IDC10)
> >>> - RS232 DTE
> >>>
> >>> Product Page : https://www.variscite.com/product/single-board-compute=
rs/var-mx6customboard
> >>>
> >>> The dts file based on the ones provided by Variscite on their own
> >>> kernel, but adapted for mainline.
> >>>
> >>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>  .../devicetree/bindings/arm/fsl.yaml          |   1 +
> >>
> >> Please run scripts/checkpatch.pl and fix reported warnings. Some
> >> warnings can be ignored, but the code here looks like it needs a fix.
> >> Feel free to get in touch if the warning is not clear.
> >>
> >>>  arch/arm/boot/dts/Makefile                    |   1 +
> >>>  .../arm/boot/dts/imx6q-var-mx6customboard.dts | 279 ++++++++++++++++=
++
> >>>  3 files changed, 281 insertions(+)
> >>>  create mode 100644 arch/arm/boot/dts/imx6q-var-mx6customboard.dts
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documen=
tation/devicetree/bindings/arm/fsl.yaml
> >>> index 15d411084065..0f583852de8a 100644
> >>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> >>> @@ -298,6 +298,7 @@ properties:
> >>>                - udoo,imx6q-udoo           # Udoo i.MX6 Quad Board
> >>>                - uniwest,imx6q-evi         # Uniwest Evi
> >>>                - variscite,dt6customboard
> >>> +              - variscite,mx6customboard
> >>>                - wand,imx6q-wandboard      # Wandboard i.MX6 Quad Boa=
rd
> >>>                - ysoft,imx6q-yapp4-crux    # i.MX6 Quad Y Soft IOTA C=
rux board
> >>>                - ysoft,imx6q-yapp4-pegasus # i.MX6 Quad Y Soft IOTA P=
egasus board
> >>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >>> index 59829fc90315..9cfc3d3e91ea 100644
> >>> --- a/arch/arm/boot/dts/Makefile
> >>> +++ b/arch/arm/boot/dts/Makefile
> >>> @@ -665,6 +665,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
> >>>       imx6q-udoo.dtb \
> >>>       imx6q-utilite-pro.dtb \
> >>>       imx6q-var-dt6customboard.dtb \
> >>> +     imx6q-var-mx6customboard.dtb \
> >>>       imx6q-vicut1.dtb \
> >>>       imx6q-wandboard.dtb \
> >>>       imx6q-wandboard-revb1.dtb \
> >>> diff --git a/arch/arm/boot/dts/imx6q-var-mx6customboard.dts b/arch/ar=
m/boot/dts/imx6q-var-mx6customboard.dts
> >>> new file mode 100644
> >>> index 000000000000..66047dff11ec
> >>> --- /dev/null
> >>> +++ b/arch/arm/boot/dts/imx6q-var-mx6customboard.dts
> >>> @@ -0,0 +1,279 @@
> >>> +// SPDX-License-Identifier: GPL-2.0+
> >>> +/*
> >>> + * Support for Variscite MX6 Carrier-board
> >>> + *
> >>> + * Copyright 2016 Variscite, Ltd. All Rights Reserved
> >>> + * Copyright 2022 Bootlin
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +
> >>> +#include "imx6qdl-var-som.dtsi"
> >>> +#include <dt-bindings/pwm/pwm.h>
> >>> +
> >>> +/ {
> >>> +     model =3D "Variscite i.MX6 QUAD/DUAL VAR-SOM-MX6 Custom Board";
> >>> +     compatible =3D "variscite,mx6customboard", "fsl,imx6q";
> >>
> >> Where is the SoM compatible?
> >
> > I mostly just copied this from the DART-MX6 device tree which is
> > another variscite
> > imx6q based modular SoM custom board combination:
> > https://github.com/torvalds/linux/blob/v6.5-rc2/arch/arm/boot/dts/nxp/i=
mx/imx6q-var-dt6customboard.dts#L17
> >
> > The terminology is a bit confusing in general here, variscite has 2
> > families of pin2pin
> > modules, the "VAR-SOM" and the "DART" family.
> > https://www.variscite.com/variscite-pin2pin-system-on-module-families/
>
> I know, I am familiar with them.
>
>
> >
> > Within each connector family there are then multiple SoM boards that
> > can be used with the same carrier boards(ie the Custom Board carrier bo=
ard
> > like the evaluation kit) although they are often bundled together with =
specific
> > boards in practice.
>
> No, they are being shipped to the customers which then use them in their
> products. Having common compatible can be useful, although it depends
> what's in the common part. For example for IMX8 it was quite a lot, thus
> it made sense.
>
> >
> > So the existing DART-MX6 I think uses the same SoC but is in a differen=
t
> > family and as such has a different carrier board. However as the relati=
on
> > between the SoM and the carrier board is effectively the same, I just c=
opied
> > the way compatibile is being set there for the VAR-SOM-MX6 from the
> > existing DART-MX6 custom board device tree.
> >
> > I think this roughly represents the SoM board device tree associations =
as I'm
> > understanding them:
> >
> > pin2pin Family: DART
> > SoM: https://www.variscite.com/product/system-on-module-som/cortex-a9/d=
art-mx6-cpu-freescale-imx6/
> > SoM part: DART-MX6
> > SoM device tree: imx6qdl-var-dart.dtsi
> > SoM SoC: imx6q
> > Board: https://www.variscite.com/product/single-board-computers/dt6cust=
omboard/
> > Board device tree: imx6q-var-dt6customboard.dts
> > Board compatible: compatible =3D "variscite,dt6customboard", "fsl,imx6q=
";
> >
> > pin2pin Family: VAR-SOM
> > SoM: https://www.variscite.com/product/system-on-module-som/cortex-a9/v=
ar-som-mx6-cpu-freescale-imx6/
> > SoM part: VAR-SOM-MX6
> > SoM device tree: imx6qdl-var-som.dtsi
> > SoM SoC: imx6q
> > Board: mx6customboard
> > https://www.variscite.com/product/single-board-computers/var-mx6customb=
oard/
> > Board device tree: imx6q-var-mx6customboard.dts
> > Board compatible: compatible =3D "variscite,mx6customboard", "fsl,imx6q=
";
> >
> > What's confusing here is that the DART-MX6 is also described as a SoM:
> > "DART-MX6 from Variscite is the smallest System on Module (SoM) / Compu=
ter
> > on Module (CoM) supporting NXP/Freescale=E2=80=99s i.MX6 Quad and Dual-=
core
> > Cortex-A9=E2=84=A2 processor"
>
> It is not confusing. It is a SoM.
>
> >
> > So we have a "DART-MX6" SoM part which corresponds to the "VAR-SOM-MX6"
> > SoM part, with both being SoM's but only one("VAR-SOM-MX6") having SoM =
in
> > the actual part name.
>
> Vendor naming is one thing, but true meaning is second. These are
> System-on-Modules.
>
> >
> > Does the compatible section for imx6qdl-var-dart.dtsi look correct?
> >
> > I'm not sure what exactly a "SoM compatible" should look like here as S=
oM is
> > both a generic term(used to describe by both the "DART-MX6" and
> > "VAR-SOM-MX6" parts) as well as term used within a part(used in the
> > part for "VAR-SOM-MX6" as well as other SoM's in the "VAR-SOM" family
> > but not the "DART-MX6" part or other SoM's in the "DART" family).
>
> Take a look at IMX8 Variscite SoMs.

Oh, I see what you mean now, so it looks like this is missing for the dart-=
mx6
device tree.

imx8mm-var-som.dtsi:    compatible =3D "variscite,var-som-mx8mm", "fsl,imx8=
mm";
imx8mm-var-som-symphony.dts:    compatible =3D
"variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm",
"fsl,imx8mm";

imx6q-var-dt6customboard.dts:    compatible =3D
"variscite,dt6customboard", "fsl,imx6q";

So the DART-MX6 is missing a compatible along the lines of
"variscite,dart-imx6q"
for the dart SoM I guess?

And for VAR-SOM-MX6 I guess I should use something like
"variscite,var-som-imx6q"
for the SoM right?

>
> Best regards,
> Krzysztof
>
