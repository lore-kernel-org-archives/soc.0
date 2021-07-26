Return-Path: <SRS0=oDMb=MS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4925FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jul 2021 01:22:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 089E06044F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jul 2021 01:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 089E06044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaKR8MPcYjFtUjk6BaJuxAGJE7YKAhQ2/LMACxfVEZo=; b=PYT64YUraMWMYt
	m2MMUod7e7ikCJ0Qx0KomQ6uqGXZcUDvFQYStN5MnHgeRi32JuqnDPHZVYpaeABDCZRd8i/KftnYX
	fofxYbig2j9DamRksZTrldIm4GbZcfKmyJ4p0Bq8PgJaJtjnPgwChlHKNNQZ87hsx/yVNGsfXpmuq
	Q+yj5qoaH1SnxMK+p3ZJpVqiOuA1ita30IpMzG12J+ark1wlvffpf/5pRQLtMp9EGjNrOUT5kJmSj
	F9JgiDLtoDg5bsS8MuqZIe76s6TVsCcv7D8Iu8mDkutCxBxXC4u0BoNamnF2hW7hixwJuRi5of+d1
	VxIvKWYU3TcRWDkHyBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7pIi-009Me9-5I; Mon, 26 Jul 2021 01:21:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7pIb-009MdH-Vz
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Jul 2021 01:20:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 665946044F;
 Mon, 26 Jul 2021 01:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627262452;
 bh=NcIkNXXrA/2KIGuwzAjSPKsKsRKsmhxsbRIswXOmQ6A=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=meP0ez76Q7LVO/amos0HNsWmZd0441db9s8YEZ0G73oRKx1b8TqYRnkVX0AIEkEHX
 YfkkXizzzKJumKXet8d544ZLfDK1ql3LlarYbSxyT4clCF/ojX1jb1FyfFZf6I6r8O
 W2PBJKHHuztLF+qJ4dIUph/BxF/qk+kSNziaSAxNVZV7KNWaKZSg0H3a+XCfLiP/Sr
 U2WaHrYsNdUz/ZWLyYvqMQ3SZyPJD/TAoIY3yOK3jTCqq1EL9Th0mbxeZaz/iPvIK9
 6K2Z7+wOaY91yLn+SQokVRE5nS7aICp82dtVC28L126mdWyX31cN+2wQnLxoEUWMfN
 b33NSScXhd5xw==
Date: Mon, 26 Jul 2021 09:20:44 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
 Juergen Borleis <jbe@pengutronix.de>,
 Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] ARM: dts: add SKOV imx6q and imx6dl based boards
Message-ID: <20210726012043.GC5901@dragon>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-5-o.rempel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_182054_162832_F6C931AF 
X-CRM114-Status: GOOD (  18.25  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210726012044.8IgAYmkNEOXvQI6FBcadQORilUiiw3F_N9Q9GzMLNjM@z>

On Wed, Jul 14, 2021 at 06:53:49AM +0200, Oleksij Rempel wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> =

> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> =

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: S=F8ren Andersen <san@skov.dk>
> Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
> Signed-off-by: Ulrich =D6lmann <u.oelmann@pengutronix.de>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/Makefile                    |   5 +
>  arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts    |  13 +
>  arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts    | 108 ++++
>  arch/arm/boot/dts/imx6q-skov-revc-lt2.dts     |  36 ++
>  arch/arm/boot/dts/imx6q-skov-revc-lt6.dts     | 128 +++++
>  .../dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
>  arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi  |  54 ++
>  arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       | 475 ++++++++++++++++++
>  8 files changed, 946 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
> =

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a2389b17026a..66aef5c6526d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -473,6 +473,8 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
>  	imx6dl-sabrelite.dtb \
>  	imx6dl-sabresd.dtb \
>  	imx6dl-savageboard.dtb \
> +	imx6dl-skov-revc-lt2.dtb \
> +	imx6dl-skov-revc-lt6.dtb \
>  	imx6dl-ts4900.dtb \
>  	imx6dl-ts7970.dtb \
>  	imx6dl-tx6dl-comtft.dtb \
> @@ -573,6 +575,9 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
>  	imx6q-sabresd.dtb \
>  	imx6q-savageboard.dtb \
>  	imx6q-sbc6x.dtb \
> +	imx6q-skov-revc-lt2.dtb \
> +	imx6q-skov-revc-lt6.dtb \
> +	imx6q-skov-reve-mi1010ait-1cp1.dtb \
>  	imx6q-tbs2910.dtb \
>  	imx6q-ts4900.dtb \
>  	imx6q-ts7970.dtb \
> diff --git a/arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts b/arch/arm/boot/d=
ts/imx6dl-skov-revc-lt2.dts
> new file mode 100644
> index 000000000000..667b8faa1807
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6dl.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +#include "imx6qdl-skov-cpu-revc.dtsi"
> +
> +/ {
> +	model =3D "SKOV IMX6 CPU SoloCore";
> +	compatible =3D "skov,imx6dl-skov-revc-lt2", "fsl,imx6dl";
> +};
> diff --git a/arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts b/arch/arm/boot/d=
ts/imx6dl-skov-revc-lt6.dts
> new file mode 100644
> index 000000000000..25071c7c4e29
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6dl.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +#include "imx6qdl-skov-cpu-revc.dtsi"
> +
> +/ {
> +	model =3D "SKOV IMX6 CPU SoloCore";
> +	compatible =3D "skov,imx6dl-skov-revc-lt6", "fsl,imx6dl";
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_backlight>;
> +		enable-gpios =3D <&gpio6 23 GPIO_ACTIVE_LOW>;
> +		pwms =3D <&pwm2 0 20000 0>;
> +		brightness-levels =3D <0 255>;
> +		num-interpolated-steps =3D <17>;
> +		default-brightness-level =3D <8>;
> +		power-supply =3D <&reg_24v0>;
> +	};
> +
> +	display {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		compatible =3D "fsl,imx-parallel-display";

Drop the newline and start with compatible.

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ipu1>;
> +
> +		port@0 {
> +			reg =3D <0>;
> +
> +			display0_in: endpoint {
> +				remote-endpoint =3D <&ipu1_di0_disp0>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg =3D <1>;
> +
> +			display0_out: endpoint {
> +				remote-endpoint =3D <&panel_in>;
> +			};
> +		};
> +	};
> +
> +

One newline is good enough.

> +	panel {
> +		compatible =3D "logictechno,lttd800480070-l6wh-rt";
> +		backlight =3D <&backlight>;
> +		power-supply =3D <&reg_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint =3D <&display0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&ipu1_di0_disp0 {
> +	remote-endpoint =3D <&display0_in>;
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight: backlightgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_RGMII_TD3__GPIO6_IO23		0x58
> +		>;
> +	};
> +
> +	pinctrl_ipu1: ipu1grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK	0x10
> +			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15		0x10
> +			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02		0x10
> +			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03		0x10
> +			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00	0x10
> +			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01	0x10
> +			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02	0x10
> +			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03	0x10
> +			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04	0x10
> +			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05	0x10
> +			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06	0x10
> +			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07	0x10
> +			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08	0x10
> +			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09	0x10
> +			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10	0x10
> +			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11	0x10
> +			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12	0x10
> +			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13	0x10
> +			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14	0x10
> +			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15	0x10
> +			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16	0x10
> +			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17	0x10
> +			MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18	0x10
> +			MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19	0x10
> +			MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20	0x10
> +			MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21	0x10
> +			MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22	0x10
> +			MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23	0x10
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6q-skov-revc-lt2.dts b/arch/arm/boot/dt=
s/imx6q-skov-revc-lt2.dts
> new file mode 100644
> index 000000000000..25332e57ba7b
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6q.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +#include "imx6qdl-skov-cpu-revc.dtsi"
> +
> +/ {
> +	model =3D "SKOV IMX6 CPU QuadCore";
> +	compatible =3D "skov,imx6q-skov-revc-lt2", "fsl,imx6q";
> +};
> +
> +&hdmi {
> +	ddc-i2c-bus =3D <&i2c2>;
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	clock-frequency =3D <100000>;
> +	status =3D "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins =3D <
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001F878

Lowercase for hex value.

> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001F878
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6q-skov-revc-lt6.dts b/arch/arm/boot/dt=
s/imx6q-skov-revc-lt6.dts
> new file mode 100644
> index 000000000000..3e3b36ad362a
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6q.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +#include "imx6qdl-skov-cpu-revc.dtsi"
> +
> +/ {
> +	model =3D "SKOV IMX6 CPU QuadCore";
> +	compatible =3D "skov,imx6q-skov-revc-lt6", "fsl,imx6q";
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_backlight>;
> +		enable-gpios =3D <&gpio6 23 GPIO_ACTIVE_LOW>;
> +		pwms =3D <&pwm2 0 20000 0>;
> +		brightness-levels =3D <0 255>;
> +		num-interpolated-steps =3D <17>;
> +		default-brightness-level =3D <8>;
> +		power-supply =3D <&reg_24v0>;
> +	};
> +
> +	display {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		compatible =3D "fsl,imx-parallel-display";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ipu1>;
> +
> +		port@0 {
> +			reg =3D <0>;
> +
> +			display0_in: endpoint {
> +				remote-endpoint =3D <&ipu1_di0_disp0>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg =3D <1>;
> +
> +			display0_out: endpoint {
> +				remote-endpoint =3D <&panel_in>;
> +			};
> +		};
> +	};
> +
> +	panel {
> +		compatible =3D "logictechno,lttd800480070-l6wh-rt";
> +		backlight =3D <&backlight>;
> +		power-supply =3D <&reg_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint =3D <&display0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi {
> +	ddc-i2c-bus =3D <&i2c2>;
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	clock-frequency =3D <100000>;
> +	status =3D "okay";
> +};
> +
> +&ipu1_di0_disp0 {
> +	remote-endpoint =3D <&display0_in>;
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight: backlightgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_RGMII_TD3__GPIO6_IO23		0x58
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins =3D <
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001F878
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001F878
> +		>;
> +	};
> +
> +	pinctrl_ipu1: ipu1grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK	0x10
> +			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15		0x10
> +			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02		0x10
> +			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03		0x10
> +			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00	0x10
> +			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01	0x10
> +			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02	0x10
> +			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03	0x10
> +			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04	0x10
> +			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05	0x10
> +			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06	0x10
> +			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07	0x10
> +			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08	0x10
> +			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09	0x10
> +			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10	0x10
> +			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11	0x10
> +			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12	0x10
> +			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13	0x10
> +			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14	0x10
> +			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15	0x10
> +			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16	0x10
> +			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17	0x10
> +			MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18	0x10
> +			MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19	0x10
> +			MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20	0x10
> +			MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21	0x10
> +			MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22	0x10
> +			MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23	0x10
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts b/arch/=
arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
> new file mode 100644
> index 000000000000..7f1f19b74bfa
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6q.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +
> +/ {
> +	model =3D "SKOV IMX6 CPU QuadCore";
> +	compatible =3D "skov,imx6q-skov-reve-mi1010ait-1cp1", "fsl,imx6q";
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_backlight>;
> +		enable-gpios =3D <&gpio6 23 GPIO_ACTIVE_LOW>;
> +		pwms =3D <&pwm2 0 20000 0>;
> +		brightness-levels =3D <0 255>;
> +		num-interpolated-steps =3D <17>;
> +		default-brightness-level =3D <8>;
> +		power-supply =3D <&reg_24v0>;
> +	};
> +
> +	panel {
> +		compatible =3D "multi-inno,mi1010ait-1cp";
> +		backlight =3D <&backlight>;
> +		power-supply =3D <&reg_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint =3D <&lvds0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&clks {
> +	assigned-clocks =3D <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
> +			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
> +	assigned-clock-parents =3D <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>,
> +				 <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>;
> +};
> +
> +&hdmi {
> +	ddc-i2c-bus =3D <&i2c2>;
> +	status =3D "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c1>;
> +	clock-frequency =3D <100000>;
> +	status =3D "okay";
> +
> +	touchscreen@38 {
> +		compatible =3D "edt,edt-ft5406";
> +		reg =3D <0x38>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_touchscreen>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <19 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios =3D <&gpio3 23 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x =3D <1280>;
> +		touchscreen-size-y =3D <800>;
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	clock-frequency =3D <100000>;
> +	status =3D "okay";
> +};
> +
> +&ldb {
> +	status =3D "okay";
> +
> +	lvds-channel@0 {
> +		status =3D "okay";
> +
> +		port@4 {
> +			reg =3D <4>;
> +
> +			lvds0_out: endpoint {
> +				remote-endpoint =3D <&panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight: backlightgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_RGMII_TD3__GPIO6_IO23		0x58
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins =3D <
> +			/* external 1 k pull up */
> +			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x40010878
> +			/* external 1 k pull up */
> +			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x40010878
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins =3D <
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001F878
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001F878
> +		>;
> +	};
> +
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins =3D <
> +			/* external 10 k pull up */
> +			/* CTP_INT */
> +			MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x1b0b0
> +			/* CTP_RST */
> +			MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x1b0b0
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi b/arch/arm/boot=
/dts/imx6qdl-skov-cpu-revc.dtsi
> new file mode 100644
> index 000000000000..69ae430a53bd
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +&ecspi4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_ecspi4>;
> +	cs-gpios =3D <&gpio3 20 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +
> +	touchscreen@0 {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_touch>;
> +		compatible =3D "ti,tsc2046";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <1000000>;
> +		interrupts-extended =3D <&gpio3 19 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply  =3D <&reg_3v3>;
> +		pendown-gpio =3D <&gpio3 19 GPIO_ACTIVE_LOW>;
> +		ti,x-plate-ohms =3D /bits/ 16 <850>;
> +		ti,y-plate-ohms =3D /bits/ 16 <295>;
> +		ti,pressure-min =3D /bits/ 16 <2>;
> +		ti,pressure-max =3D /bits/ 16 <1500>;
> +		ti,vref-mv	=3D /bits/ 16 <3300>;
> +		ti,settle-delay-usec =3D /bits/ 16 <15>;
> +		ti,vref-delay-usecs =3D /bits/ 16 <0>;
> +		ti,penirq-recheck-delay-usecs =3D /bits/ 16 <100>;
> +		ti,debounce-max =3D /bits/ 16 <100>;
> +		ti,debounce-tol =3D /bits/ 16 <(~0)>;
> +		ti,debounce-rep =3D /bits/ 16 <4>;
> +		touchscreen-swapped-x-y;
> +		touchscreen-inverted-y;
> +		wakeup-source;
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_ecspi4: ecspi4grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D28__ECSPI4_MOSI			0x100b1
> +			MX6QDL_PAD_EIM_D22__ECSPI4_MISO			0x000b1
> +			MX6QDL_PAD_EIM_D21__ECSPI4_SCLK			0x000b1
> +			/* *no* external pull up */
> +			MX6QDL_PAD_EIM_D20__GPIO3_IO20		0x40000058
> +		>;
> +	};
> +
> +	pinctrl_touch: touchgrp {
> +		fsl,pins =3D <
> +			/* external pull up */
> +			MX6QDL_PAD_EIM_D19__GPIO3_IO19			0x10040
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/=
imx6qdl-skov-cpu.dtsi
> new file mode 100644
> index 000000000000..16ff49465f5f
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
> @@ -0,0 +1,475 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	chosen {
> +		stdout-path =3D &uart2;
> +	};
> +
> +	aliases {
> +		can0 =3D &can1;
> +		can1 =3D &can2;
> +		mdio-gpio0 =3D &mdio;
> +		nand =3D &gpmi;
> +		rtc0 =3D &i2c_rtc;
> +		rtc1 =3D &snvs;
> +		usb0 =3D &usbh1;
> +		usb1 =3D &usbotg;
> +	};
> +
> +	iio-hwmon {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc 0>, /* 24V */
> +		              <&adc 1>; /* temperature */
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			label =3D "D1";
> +			gpios =3D <&gpio1 2 GPIO_ACTIVE_HIGH>;
> +			function =3D LED_FUNCTION_STATUS;
> +			default-state =3D "on";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		led-1 {
> +			label =3D "D2";
> +			gpios =3D <&gpio1 0 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +		};
> +
> +		led-2 {
> +			label =3D "D3";
> +			gpios =3D <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +	};
> +
> +	mdio: mdio {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_mdio>;
> +		compatible =3D "microchip,mdio-smi0";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		gpios =3D <&gpio1 31 GPIO_ACTIVE_HIGH
> +			 &gpio1 22 GPIO_ACTIVE_HIGH>;
> +
> +		switch@0 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_switch>;
> +			compatible =3D "microchip,ksz8873";
> +			interrupt-parent =3D <&gpio3>;
> +			interrupt =3D <30 IRQ_TYPE_LEVEL_HIGH>;
> +			reset-gpios =3D <&gpio1 5 GPIO_ACTIVE_LOW>;
> +			reg =3D <0>;
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				ports@0 {
> +					reg =3D <0>;
> +					phy-mode =3D "internal";
> +					label =3D "lan1";
> +				};
> +
> +				ports@1 {
> +					reg =3D <1>;
> +					phy-mode =3D "internal";
> +					label =3D "lan2";
> +				};
> +
> +				ports@2 {
> +					reg =3D <2>;
> +					label =3D "cpu";
> +					ethernet =3D <&fec>;
> +					phy-mode =3D "rmii";
> +
> +					fixed-link {
> +						speed =3D <100>;
> +						full-duplex;
> +					};
> +				};
> +			};
> +		};
> +
> +	};
> +
> +	clk50m_phy: phy-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <50000000>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible =3D "regulator-fixed";
> +		vin-supply =3D <&reg_5v0>;
> +		regulator-name =3D "3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "5v0";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
> +	reg_24v0: regulator-24v0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "24v0";
> +		regulator-min-microvolt =3D <24000000>;
> +		regulator-max-microvolt =3D <24000000>;
> +	};
> +
> +	reg_can1_stby: regulator-can1-stby {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_can1_stby>;
> +		regulator-name =3D "can1-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio3 31 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_can2_stby: regulator-can2-stby {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_can2_stby>;
> +		regulator-name =3D "can2-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio4 11 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_vcc_mmc: regulator-vcc-mmc {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_vcc_mmc>;
> +		compatible =3D "regulator-fixed";

Start property list with compatible.

> +		vin-supply =3D <&reg_3v3>;
> +		regulator-name =3D "mmc_vcc_supply";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		gpio =3D <&gpio7 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us =3D <100>;
> +	};
> +
> +	reg_vcc_mmc_io: regulator-vcc-mmc-io {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_vcc_mmc_io>;
> +		compatible =3D "regulator-gpio";
> +		vin-supply =3D <&reg_5v0>;
> +		regulator-name =3D "mmc_io_supply";
> +		regulator-type =3D "voltage";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpios =3D <&gpio7 13 GPIO_ACTIVE_HIGH>;

enable-active-high?

> +		states =3D <1800000 0x1>, <3300000 0x0>;

Hmm, I do not see this 'states' in fixed-regulator.yaml.

Shawn

> +		startup-delay-us =3D <100>;
> +	};
> +};
> +
> +&can1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_can1>;
> +	xceiver-supply =3D <&reg_can1_stby>;
> +	status =3D "okay";
> +};
> +
> +&can2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_can2>;
> +	xceiver-supply =3D <&reg_can2_stby>;
> +	status =3D "okay";
> +};
> +
> +&ecspi1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_ecspi1>;
> +	cs-gpios =3D <&gpio3 24 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		spi-max-frequency =3D <54000000>;
> +		reg =3D <0>;
> +	};
> +};
> +
> +&ecspi2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_ecspi2>;
> +	cs-gpios =3D <&gpio2 26 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +
> +	adc: adc@0 {
> +		compatible =3D "microchip,mcp3002";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <1000000>;
> +		#io-channel-cells =3D <1>;
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_enet>;
> +	clocks =3D <&clks IMX6QDL_CLK_ENET>,
> +		 <&clks IMX6QDL_CLK_ENET>,
> +		 <&clk50m_phy>;
> +	clock-names =3D "ipg", "ahb", "ptp";
> +	phy-mode =3D "rmii";
> +	phy-supply =3D <&reg_3v3>;
> +	status =3D "okay";
> +
> +	fixed-link {
> +		speed =3D <100>;
> +		full-duplex;
> +	};
> +};
> +
> +&gpmi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	i2c_rtc: rtc@51 {
> +		compatible =3D "nxp,pcf85063";
> +		reg =3D <0x51>;
> +		quartz-load-femtofarads =3D <12500>;
> +	};
> +};
> +
> +&pwm2 {
> +	#pwm-cells =3D <2>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm2>;
> +	status =3D "okay";
> +};
> +
> +&pwm3 {
> +	/* used for LCD contrast control */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm3>;
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart2>;
> +	status =3D "okay";
> +};
> +
> +&usbh1 {
> +	vbus-supply =3D <&reg_5v0>;
> +	disable-over-current;
> +	status =3D "okay";
> +};
> +
> +/* no usbh2 */
> +&usbphynop1 {
> +	status =3D "disabled";
> +};
> +
> +/* no usbh3 */
> +&usbphynop2 {
> +	status =3D "disabled";
> +};
> +
> +&usbotg {
> +	vbus-supply =3D <&reg_5v0>;
> +	disable-over-current;
> +	status =3D "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc3>;
> +	wp-gpios =3D <&gpio7 1 GPIO_ACTIVE_HIGH>;
> +	cd-gpios =3D <&gpio7 0 GPIO_ACTIVE_LOW>;
> +	cap-power-off-card;
> +	full-pwr-cycle;
> +	bus-width =3D <4>;
> +	max-frequency =3D <50000000>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-ddr50;
> +	mmc-ddr-1_8v;
> +	vmmc-supply =3D <&reg_vcc_mmc>;
> +	vqmmc-supply =3D <&reg_vcc_mmc_io>;
> +	status =3D "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_can1: can1grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_7__FLEXCAN1_TX			0x3008
> +			MX6QDL_PAD_GPIO_8__FLEXCAN1_RX			0x1b000
> +		>;
> +	};
> +
> +	pinctrl_can1_stby: can1stbygrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D31__GPIO3_IO31			0x13008
> +		>;
> +	};
> +
> +	pinctrl_can2: can2grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX		0x3008
> +			MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX		0x1b000
> +		>;
> +	};
> +
> +	pinctrl_can2_stby: can2stbygrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_KEY_ROW2__GPIO4_IO11			0x13008
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D17__ECSPI1_MISO			0x100b1
> +			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI			0xb1
> +			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK			0xb1
> +			/* *no* external pull up */
> +			MX6QDL_PAD_EIM_D24__GPIO3_IO24			0x58
> +		>;
> +	};
> +
> +	pinctrl_ecspi2: ecspi2grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_OE__ECSPI2_MISO			0x100b1
> +			MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI			0xb1
> +			MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK			0xb1
> +			/* external pull up */
> +			MX6QDL_PAD_EIM_RW__GPIO2_IO26			0x58
> +		>;
> +	};
> +
> +	pinctrl_enet: enetgrp {
> +		fsl,pins =3D <
> +			/* RMII 50 MHz */
> +			MX6QDL_PAD_ENET_CRS_DV__ENET_RX_EN		0x100f5
> +			MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN		0x100f5
> +			MX6QDL_PAD_ENET_RXD0__ENET_RX_DATA0		0x100c0
> +			MX6QDL_PAD_ENET_RXD1__ENET_RX_DATA1		0x100c0
> +			MX6QDL_PAD_ENET_TXD0__ENET_TX_DATA0		0x100f5
> +			MX6QDL_PAD_ENET_TXD1__ENET_TX_DATA1		0x100f5
> +			MX6QDL_PAD_GPIO_16__ENET_REF_CLK		0x1b0b0
> +			MX6QDL_PAD_GPIO_5__GPIO1_IO05			0x58
> +			/* GPIO for "link active" */
> +			MX6QDL_PAD_ENET_RX_ER__GPIO1_IO24		0x3038
> +		>;
> +	};
> +
> +	pinctrl_gpmi_nand: gpminandgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_NANDF_CLE__NAND_CLE			0xb0b1
> +			MX6QDL_PAD_NANDF_ALE__NAND_ALE			0xb0b1
> +			MX6QDL_PAD_NANDF_RB0__NAND_READY_B		0xb000
> +			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B		0xb0b1
> +			MX6QDL_PAD_NANDF_CS1__NAND_CE1_B		0xb0b1
> +			MX6QDL_PAD_SD4_CMD__NAND_RE_B			0xb0b1
> +			MX6QDL_PAD_SD4_CLK__NAND_WE_B			0xb0b1
> +			MX6QDL_PAD_NANDF_D0__NAND_DATA00		0xb0b1
> +			MX6QDL_PAD_NANDF_D1__NAND_DATA01		0xb0b1
> +			MX6QDL_PAD_NANDF_D2__NAND_DATA02		0xb0b1
> +			MX6QDL_PAD_NANDF_D3__NAND_DATA03		0xb0b1
> +			MX6QDL_PAD_NANDF_D4__NAND_DATA04		0xb0b1
> +			MX6QDL_PAD_NANDF_D5__NAND_DATA05		0xb0b1
> +			MX6QDL_PAD_NANDF_D6__NAND_DATA06		0xb0b1
> +			MX6QDL_PAD_NANDF_D7__NAND_DATA07		0xb0b1
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins =3D <
> +			/* external 10 k pull up */
> +			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x40010878
> +			/* external 10 k pull up */
> +			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x40010878
> +		>;
> +	};
> +
> +	pinctrl_mdio: mdiogrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_ENET_MDIO__GPIO1_IO22		0x100b1
> +			MX6QDL_PAD_ENET_MDC__GPIO1_IO31			0xb1
> +		>;
> +	};
> +
> +	pinctrl_pwm2: pwm2grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_1__PWM2_OUT			0x58
> +		>;
> +	};
> +
> +	pinctrl_pwm3: pwm3grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_SD1_DAT1__PWM3_OUT			0x58
> +		>;
> +	};
> +
> +	pinctrl_switch: switchgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D30__GPIO3_IO30			0xb0
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D26__UART2_TX_DATA		0x1b0b1
> +			MX6QDL_PAD_EIM_D27__UART2_RX_DATA		0x1b0b1
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins =3D <
> +			/* SoC internal pull up required */
> +			MX6QDL_PAD_SD3_CMD__SD3_CMD			0x17059
> +			MX6QDL_PAD_SD3_CLK__SD3_CLK			0x10059
> +			MX6QDL_PAD_SD3_DAT0__SD3_DATA0			0x17059
> +			MX6QDL_PAD_SD3_DAT1__SD3_DATA1			0x17059
> +			MX6QDL_PAD_SD3_DAT2__SD3_DATA2			0x17059
> +			MX6QDL_PAD_SD3_DAT3__SD3_DATA3			0x17059
> +			/* SoC internal pull up required */
> +			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01			0x1b040
> +			/* SoC internal pull up required */
> +			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00			0x1b040
> +		>;
> +	};
> +
> +	pinctrl_vcc_mmc: vccmmcgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_SD3_RST__GPIO7_IO08			0x58
> +		>;
> +	};
> +
> +	pinctrl_vcc_mmc_io: vccmmciogrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_18__GPIO7_IO13			0x58
> +		>;
> +	};
> +};
> -- =

> 2.30.2
> =


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
