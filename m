Return-Path: <SRS0=I0Tm=OM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF420C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 07:44:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5BD61178
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 07:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E5BD61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbup0hfdSghwIIl0VUZsR3HoZE0cme1QtHTHTdLRJTQ=; b=IvwksEpPHwhLof
	gMbIFnYNDW5ejkw3OSNGbg20dIUEmFD/cy3uYcTCFLNdvNxIg4TZMqig/5A7MMZR39tawExRFYi+/
	O1KzBzTaziXLFCNwAzmAmrkzhDVNiQHlwAoh46rFRf/E9UpWetmlLmChy4pXUUrMPBrSr4vWys+bE
	pip9rAEvk7o2sFc6rexj97piSyzyz8cyaNs33EWhdnBePWgpfLlPPRWGJiI7okrOtOp5D8G3x/f7o
	K28suM0YLqMczzBj715Ewnm5Sbmh1TbJLbvRpCJ7kxHBWuhfkHBgp3yKiJq2D38rLSjGlZj/Csk1u
	HVX0AyymjSthRMD7wlew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSwtA-007LVH-Am; Wed, 22 Sep 2021 07:41:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSwt6-007LUE-3G
 for linux-arm-kernel@lists.infradead.org; Wed, 22 Sep 2021 07:41:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55E6B61178
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 22 Sep 2021 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632296511;
 bh=xfAJfK3RpZVOx1Cdx75iDvpFNMkfCGNlqlZv6y9rU9s=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=B8g5GbZ/kwSxGNGYU8Lf+HK2ZueHtN5X4tmPrqYRXeXH+B3I+HIctCU4ci8eFGSCD
 kZie/5i8PySwi+OMmnKKCk8jJK8CHdIwnO6HASZkEo6VOrf4aA1171vyof9ST+Lrt7
 VAeitFTHWG5PM6kvZbVFjHC5A6HWLMY/UpMksIXHMRnVD6BDvBOarndIGY/FBJqNv0
 h+FtI5aNTSXCNffFDYkFEoTpLbG/VXKc8E4L1hdb70SUGUHfROqL/i/aW1bd2Mv57U
 68Y/MppeFG5/0ZmE4QGSkD7Ps323CPI1h1tf9HGtX8PYa/IM/pqndjAgVD594E1IL3
 w28u8/EdOm+eA==
Received: by mail-pl1-f176.google.com with SMTP id v2so1181367plp.8
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 22 Sep 2021 00:41:51 -0700 (PDT)
X-Gm-Message-State: AOAM5313qLQImgGCWkOW55V7ZtqmC0qOlp7iz/uqwecck54YJS+7fdqZ
 gQCpXX8pU9KlcWCSf8KTFpdZZrhRvDTF5VqCy7k=
X-Google-Smtp-Source: ABdhPJxckvyy9QLR6UpyAzNRWOJa/aBvvnjc5Hj9xT7NZRCgVBx2gIHztVtHEXGL02re1cA1UMK2Ivk5BB7223O6mYs=
X-Received: by 2002:a17:902:8307:b0:13c:ac55:5e1d with SMTP id
 bd7-20020a170902830700b0013cac555e1dmr25963916plb.56.1632296510922; Wed, 22
 Sep 2021 00:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210918141627.2142457-1-andreas@kemnade.info>
 <20210918141627.2142457-4-andreas@kemnade.info>
In-Reply-To: <20210918141627.2142457-4-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 22 Sep 2021 09:41:39 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfQrfOm=LWh97tq6q16v6aGXazksYF+kYxj5ghd0x7LUg@mail.gmail.com>
Message-ID: <CAJKOXPfQrfOm=LWh97tq6q16v6aGXazksYF+kYxj5ghd0x7LUg@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: imx: add devicetree for Kobo Libra H2O
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-imx@nxp.com, leoyang.li@nxp.com, 
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_004152_243671_D35D2E18 
X-CRM114-Status: GOOD (  21.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210922074139.oijGI3bX6_oWVvHdGFfrE4I0L3g-mqQ5xJQN_oZ2Pv8@z>

On Sat, 18 Sept 2021 at 16:55, Andreas Kemnade <andreas@kemnade.info> wrote:
>
> This adds a devicetree for the Kobo Libra H2O Ebook reader. It is based on
> boards called e70k02. It is equipped with an imx6sll SoC.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/Makefile                 |   3 +-
>  arch/arm/boot/dts/imx6sll-kobo-librah2o.dts | 339 +++++++++++++++++++++
>  2 files changed, 341 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/imx6sll-kobo-librah2o.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7e0934180724..78fc26ff2cac 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -638,7 +638,8 @@ dtb-$(CONFIG_SOC_IMX6SL) += \
>         imx6sl-warp.dtb
>  dtb-$(CONFIG_SOC_IMX6SLL) += \
>         imx6sll-evk.dtb \
> -       imx6sll-kobo-clarahd.dtb
> +       imx6sll-kobo-clarahd.dtb \
> +       imx6sll-kobo-librah2o.dtb
>  dtb-$(CONFIG_SOC_IMX6SX) += \
>         imx6sx-nitrogen6sx.dtb \
>         imx6sx-sabreauto.dtb \
> diff --git a/arch/arm/boot/dts/imx6sll-kobo-librah2o.dts b/arch/arm/boot/dts/imx6sll-kobo-librah2o.dts
> new file mode 100644
> index 000000000000..44522f6a54ca
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6sll-kobo-librah2o.dts
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: (GPL-2.0)
> +/*
> + * Device tree for the Kobo Libra H2O ebook reader
> + *
> + * Name on mainboard is: 37NB-E70K0M+6A3
> + * Serials start with: E70K02 (a number also seen in
> + * vendor kernel sources)
> + *
> + * This mainboard seems to be equipped with different SoCs.
> + * In the Kobo Libra H2O ebook reader it is an i.MX6SLL
> + *
> + * Copyright 2021 Andreas Kemnade
> + * based on works
> + * Copyright 2016 Freescale Semiconductor, Inc.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx6sll.dtsi"
> +#include "e70k02.dtsi"
> +
> +/ {
> +       model = "Kobo Libra H2O";
> +       compatible = "kobo,librah2o", "fsl,imx6sll";
> +};
> +
> +&clks {
> +       assigned-clocks = <&clks IMX6SLL_CLK_PLL4_AUDIO_DIV>;
> +       assigned-clock-rates = <393216000>;
> +};
> +
> +&cpu0 {
> +       arm-supply = <&dcdc3_reg>;
> +       soc-supply = <&dcdc1_reg>;
> +};
> +
> +&gpio_keys {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_gpio_keys>;
> +};
> +
> +&i2c1 {
> +       pinctrl-names = "default","sleep";
> +       pinctrl-0 = <&pinctrl_i2c1>;
> +       pinctrl-1 = <&pinctrl_i2c1_sleep>;
> +};
> +
> +&i2c2 {
> +       pinctrl-names = "default","sleep";
> +       pinctrl-0 = <&pinctrl_i2c2>;
> +       pinctrl-1 = <&pinctrl_i2c2_sleep>;
> +};
> +
> +&i2c3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c3>;
> +};
> +
> +&iomuxc {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_hog>;
> +
> +       pinctrl_gpio_keys: gpio-keysgrp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_GPIO4_IO25__GPIO4_IO25       0x17059 /* PWR_SW */
> +                       MX6SLL_PAD_GPIO4_IO23__GPIO4_IO23       0x17059 /* HALL_EN */
> +                       MX6SLL_PAD_KEY_COL4__GPIO4_IO00         0x17059 /* PAGE_UP */
> +                       MX6SLL_PAD_KEY_COL5__GPIO4_IO02         0x17059 /* PAGE_DOWN */
> +               >;
> +       };
> +
> +       pinctrl_hog: hoggrp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_LCD_DATA01__GPIO2_IO21       0x79
> +                       MX6SLL_PAD_LCD_DATA04__GPIO2_IO24       0x79
> +                       MX6SLL_PAD_LCD_DATA05__GPIO2_IO25       0x79
> +                       MX6SLL_PAD_LCD_DATA06__GPIO2_IO26       0x79
> +                       MX6SLL_PAD_LCD_DATA07__GPIO2_IO27       0x79
> +                       MX6SLL_PAD_LCD_DATA08__GPIO2_IO28       0x79
> +                       MX6SLL_PAD_LCD_DATA09__GPIO2_IO29       0x79
> +                       MX6SLL_PAD_LCD_DATA10__GPIO2_IO30       0x79
> +                       MX6SLL_PAD_LCD_DATA11__GPIO2_IO31       0x79
> +                       MX6SLL_PAD_LCD_DATA12__GPIO3_IO00       0x79
> +                       MX6SLL_PAD_LCD_DATA13__GPIO3_IO01       0x79
> +                       MX6SLL_PAD_LCD_DATA14__GPIO3_IO02       0x79
> +                       MX6SLL_PAD_LCD_DATA15__GPIO3_IO03       0x79
> +                       MX6SLL_PAD_LCD_DATA16__GPIO3_IO04       0x79
> +                       MX6SLL_PAD_LCD_DATA17__GPIO3_IO05       0x79
> +                       MX6SLL_PAD_LCD_DATA18__GPIO3_IO06       0x79
> +                       MX6SLL_PAD_LCD_DATA19__GPIO3_IO07       0x79
> +                       MX6SLL_PAD_LCD_DATA20__GPIO3_IO08       0x79
> +                       MX6SLL_PAD_LCD_DATA21__GPIO3_IO09       0x79
> +                       MX6SLL_PAD_LCD_DATA22__GPIO3_IO10       0x79
> +                       MX6SLL_PAD_LCD_DATA23__GPIO3_IO11       0x79
> +                       MX6SLL_PAD_LCD_CLK__GPIO2_IO15          0x79
> +                       MX6SLL_PAD_LCD_ENABLE__GPIO2_IO16       0x79
> +                       MX6SLL_PAD_LCD_HSYNC__GPIO2_IO17        0x79
> +                       MX6SLL_PAD_LCD_VSYNC__GPIO2_IO18        0x79
> +                       MX6SLL_PAD_LCD_RESET__GPIO2_IO19        0x79
> +                       MX6SLL_PAD_GPIO4_IO21__GPIO4_IO21       0x79
> +                       MX6SLL_PAD_GPIO4_IO26__GPIO4_IO26       0x79
> +                       MX6SLL_PAD_KEY_COL3__GPIO3_IO30         0x79
> +                       MX6SLL_PAD_KEY_ROW7__GPIO4_IO07         0x79
> +                       MX6SLL_PAD_ECSPI2_MOSI__GPIO4_IO13      0x79
> +               >;
> +       };
> +
> +       pinctrl_i2c1: i2c1grp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_I2C1_SCL__I2C1_SCL   0x4001f8b1
> +                       MX6SLL_PAD_I2C1_SDA__I2C1_SDA   0x4001f8b1
> +               >;
> +       };
> +
> +       pinctrl_i2c1_sleep: i2c1grp-sleep {
> +               fsl,pins = <
> +                       MX6SLL_PAD_I2C1_SCL__I2C1_SCL   0x400108b1
> +                       MX6SLL_PAD_I2C1_SDA__I2C1_SDA   0x400108b1
> +               >;
> +       };
> +
> +       pinctrl_i2c2: i2c2grp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_I2C2_SCL__I2C2_SCL   0x4001f8b1
> +                       MX6SLL_PAD_I2C2_SDA__I2C2_SDA   0x4001f8b1
> +               >;
> +       };
> +
> +       pinctrl_i2c2_sleep: i2c2grp-sleep {
> +               fsl,pins = <
> +                       MX6SLL_PAD_I2C2_SCL__I2C2_SCL   0x400108b1
> +                       MX6SLL_PAD_I2C2_SDA__I2C2_SDA   0x400108b1
> +               >;
> +       };
> +
> +       pinctrl_i2c3: i2c3grp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_REF_CLK_24M__I2C3_SCL 0x4001f8b1
> +                       MX6SLL_PAD_REF_CLK_32K__I2C3_SDA 0x4001f8b1
> +               >;
> +       };
> +
> +       pinctrl_led: ledgrp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_GPIO4_IO17__GPIO4_IO17       0x10059
> +               >;
> +       };
> +
> +       pinctrl_lm3630a_bl_gpio: lm3630a-bl-gpiogrp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_EPDC_PWR_CTRL3__GPIO2_IO10   0x10059 /* HWEN */
> +               >;
> +       };
> +
> +       pinctrl_ricoh_gpio: ricoh-gpiogrp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_GPIO4_IO20__GPIO4_IO20       0x1b8b1 /* ricoh619 chg */
> +                       MX6SLL_PAD_GPIO4_IO19__GPIO4_IO19       0x1b8b1 /* ricoh619 irq */
> +                       MX6SLL_PAD_KEY_COL2__GPIO3_IO28         0x1b8b1 /* ricoh619 bat_low_int */
> +               >;
> +       };
> +
> +       pinctrl_uart1: uart1grp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_UART1_TXD__UART1_DCE_TX 0x1b0b1
> +                       MX6SLL_PAD_UART1_RXD__UART1_DCE_RX 0x1b0b1
> +               >;
> +       };
> +
> +       pinctrl_usbotg1: usbotg1grp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_EPDC_PWR_COM__USB_OTG1_ID 0x17059
> +               >;
> +       };
> +
> +       pinctrl_usdhc1: usdhc1grp {
> +               fsl,pins = <
> +                       MX6SLL_PAD_SD1_CMD__SD1_CMD     0x17059
> +                       MX6SLL_PAD_SD1_CLK__SD1_CLK     0x17059
> +                       MX6SLL_PAD_SD1_DATA0__SD1_DATA0 0x17059
> +                       MX6SLL_PAD_SD1_DATA1__SD1_DATA1 0x17059
> +                       MX6SLL_PAD_SD1_DATA2__SD1_DATA2 0x17059
> +                       MX6SLL_PAD_SD1_DATA3__SD1_DATA3 0x17059
> +                       MX6SLL_PAD_SD1_DATA4__SD1_DATA4 0x17059
> +                       MX6SLL_PAD_SD1_DATA5__SD1_DATA5 0x17059
> +                       MX6SLL_PAD_SD1_DATA6__SD1_DATA6 0x17059
> +                       MX6SLL_PAD_SD1_DATA7__SD1_DATA7 0x17059
> +               >;
> +       };
> +
> +       pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {

Thanks for the patch.

This does not look like passing the schema validation. Please run
dtbs_check. The node names should use hyphens and end with "grp"
suffix. This remark applies to other cases below.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
