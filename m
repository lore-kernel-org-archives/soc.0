Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDFBC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 313A360F9C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 313A360F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYFXW/6BF8V4LiK2bkkmUQhgdeZyDL0ExwnowxCs1zk=; b=glC2mQ8m/3BvGZ
	v67uEutcE+7xvw9qV0WvehZBe8q4H1IShYSAGw3tAOD8GfYoMm0CElz2LXgI4o7+BTUg/upSAu3gm
	VkaavNd3DgcjkLXiols2oboE5eXxhj+eGFMLBy5K/aT+TMhvTuxUsQjeIvtrTBbbcMudUZ/yswBx4
	lzdwgHGvXFf5WbzMVzNJYLa+5Kh/Ou7VyZT8i1zOORr4PlPfPyX7EeqGH+0T2piFmLmTO8RrTYiIs
	v7HMa9FxcslCNnMWMKwfSd1yByAvMTpaBilFsn0OQDnUXxGBgeu5uFN477ihTxS6Rml0/DNoihjOK
	A/X/D2X+gVDhC1P0ayOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mefis-00EFVK-1N; Sun, 24 Oct 2021 15:47:46 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefcL-00ECaO-2o
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:41:03 +0000
Received: by mail-qk1-x732.google.com with SMTP id r15so9513696qkp.8
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d7vj3ilWe5QQISMGTOkaAZY2eAF33WoZ7GzqRUnfca8=;
 b=TtJPgW4q4ffYPXeWTMLOfjK4PVXBGkF4uTcuDNcv3lkdOXjUtOlSZA9wugyspKp6Ji
 fmlCAyPQJENOoXaD8bcPaz3BcMthLPKUkHjjg6QlNxxondO/P3uhIe6zbmrrfxacWPh6
 +JFM0cy5eP2Z8KAAa87QktQS3imAgSZY4DCuFvyM/Pr8Koiw6drtvI9efuZXExxcRLa7
 OY7L/rg1hQeVn7SVF0ha/vIuIiBw/jOdqFe26gL098NHieUdJdQ6gj3M4dVSo0Tv7LGv
 BGwOEiyxIPSkyBNSTbm+AhPFSYiidEidEF3NjgAFwyxCYEL+P8bplzuukhTP2aan9Nfh
 Li6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d7vj3ilWe5QQISMGTOkaAZY2eAF33WoZ7GzqRUnfca8=;
 b=e+YeB6Gnhy5t3d85T3SeAaLtrXLm3KFyfvLoa44ESWSz6FjP1YwosbBt12RXkeHAFk
 HQozKyMa72Fcv1viO2A24uLBcq9sGZBbZHZ9t8Yt8FPGo65tWDtfUJzIZXtBFV2TmQww
 FWBMLIix8xjMh3eerFRm46upTTQpufsQSqWXhQjeme7PHCl4c/X3Y/r6/bUKYXOaQiBc
 2USRfM+eXseuoHYrBoJJuupNveIabpr4imLMfb3SDIuypuc+y3IhcAmqonEFtSzryubm
 HTglFQtriGoeKp8uEUE5AZNEN49Du0Fi9qjcA8rlV99I0gRYrso9BYnqEK0PT0UZRQRF
 GxLw==
X-Gm-Message-State: AOAM532RXn/cNu1q2AMM0+gwbDMUpd6IqAmqLce2dTpKLQBRtX+bjatZ
 +X4DPDuqm/9wudOKEC7sTQw=
X-Google-Smtp-Source: ABdhPJyLO5qaZ5FcikymL7m/N/MQ6igLkwoI+zAvXWkrfuaYDwEaO2w5AP0ItrDvFNvX73YYRyAy3g==
X-Received: by 2002:a37:b481:: with SMTP id d123mr9365962qkf.514.1635090059988; 
 Sun, 24 Oct 2021 08:40:59 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:40:59 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, b20788@freescale.com, Mr.Bossman075@gmail.com,
 fugang.duan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
Date: Sun, 24 Oct 2021 11:40:26 -0400
Message-ID: <20211024154027.1479261-13-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084101_192259_CDF3093F 
X-CRM114-Status: GOOD (  18.05  )
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
Message-ID: <20211024154026.Tx-IBeRINGNG6Ta04RZyGAkHC5OJxCK_dlO7vh6EH5A@z>

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

The NXP i.MXRT1050 Evaluation Kit (EVK) provides a platform for rapid
evaluation of the i.MXRT, which features NXP's implementation of the Arm
Cortex-M7 core.

The EVK provides 32 MB SDRAM, 64 MB Quad SPI flash, Micro SD card socket,
USB 2.0 OTG.

This patch aims to support the preliminary booting up features
as follows:
GPIO
LPUART
SD/MMC

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/arm/boot/dts/Makefile          |   2 +
 arch/arm/boot/dts/imxrt1050-evk.dts | 164 +++++++++++++++++++++++++
 arch/arm/boot/dts/imxrt1050.dtsi    | 179 ++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+)
 create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..f32dd34550cb 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -708,6 +708,8 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 dtb-$(CONFIG_SOC_IMX7ULP) += \
 	imx7ulp-com.dtb \
 	imx7ulp-evk.dtb
+dtb-$(CONFIG_SOC_IMXRT) += \
+	imxrt1050-evk.dtb
 dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-moxa-uc-8410a.dtb \
 	ls1021a-qds.dtb \
diff --git a/arch/arm/boot/dts/imxrt1050-evk.dts b/arch/arm/boot/dts/imxrt1050-evk.dts
new file mode 100644
index 000000000000..1653aa4cddc0
--- /dev/null
+++ b/arch/arm/boot/dts/imxrt1050-evk.dts
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2019
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+/dts-v1/;
+#include "imxrt1050.dtsi"
+#include <dt-bindings/pinctrl/pins-imxrt1050.h>
+
+/ {
+	model = "NXP IMXRT1050-evk board";
+	compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
+
+	chosen {
+		bootargs = "root=/dev/ram";
+		stdout-path = &lpuart1;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x80000000 0x2000000>;
+	};
+
+};
+
+&lpuart1 { /* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+
+	imxrt1050-evk {
+		pinctrl_lpuart1: lpuart1grp {
+			fsl,pins = <
+				MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
+					0xf1
+				MXRT1050_IOMUXC_GPIO_AD_B0_13_LPUART1_RXD
+					0xf1
+			>;
+		};
+
+		pinctrl_semc: semcgrp {
+			fsl,pins = <
+				MXRT1050_IOMUXC_GPIO_EMC_00_SEMC_DA00
+					0xf1	/* SEMC_D0 */
+				MXRT1050_IOMUXC_GPIO_EMC_01_SEMC_DA01
+					0xf1	/* SEMC_D1 */
+				MXRT1050_IOMUXC_GPIO_EMC_02_SEMC_DA02
+					0xf1	/* SEMC_D2 */
+				MXRT1050_IOMUXC_GPIO_EMC_03_SEMC_DA03
+					0xf1	/* SEMC_D3 */
+				MXRT1050_IOMUXC_GPIO_EMC_04_SEMC_DA04
+					0xf1	/* SEMC_D4 */
+				MXRT1050_IOMUXC_GPIO_EMC_05_SEMC_DA05
+					0xf1	/* SEMC_D5 */
+				MXRT1050_IOMUXC_GPIO_EMC_06_SEMC_DA06
+					0xf1	/* SEMC_D6 */
+				MXRT1050_IOMUXC_GPIO_EMC_07_SEMC_DA07
+					0xf1	/* SEMC_D7 */
+				MXRT1050_IOMUXC_GPIO_EMC_08_SEMC_DM00
+					0xf1	/* SEMC_DM0 */
+				MXRT1050_IOMUXC_GPIO_EMC_09_SEMC_ADDR00
+					0xf1	/* SEMC_A0 */
+				MXRT1050_IOMUXC_GPIO_EMC_10_SEMC_ADDR01
+					0xf1	/* SEMC_A1 */
+				MXRT1050_IOMUXC_GPIO_EMC_11_SEMC_ADDR02
+					0xf1	/* SEMC_A2 */
+				MXRT1050_IOMUXC_GPIO_EMC_12_SEMC_ADDR03
+					0xf1	/* SEMC_A3 */
+				MXRT1050_IOMUXC_GPIO_EMC_13_SEMC_ADDR04
+					0xf1	/* SEMC_A4 */
+				MXRT1050_IOMUXC_GPIO_EMC_14_SEMC_ADDR05
+					0xf1	/* SEMC_A5 */
+				MXRT1050_IOMUXC_GPIO_EMC_15_SEMC_ADDR06
+					0xf1	/* SEMC_A6 */
+				MXRT1050_IOMUXC_GPIO_EMC_16_SEMC_ADDR07
+					0xf1	/* SEMC_A7 */
+				MXRT1050_IOMUXC_GPIO_EMC_17_SEMC_ADDR08
+					0xf1	/* SEMC_A8 */
+				MXRT1050_IOMUXC_GPIO_EMC_18_SEMC_ADDR09
+					0xf1	/* SEMC_A9 */
+				MXRT1050_IOMUXC_GPIO_EMC_19_SEMC_ADDR11
+					0xf1	/* SEMC_A11 */
+				MXRT1050_IOMUXC_GPIO_EMC_20_SEMC_ADDR12
+					0xf1	/* SEMC_A12 */
+				MXRT1050_IOMUXC_GPIO_EMC_21_SEMC_BA0
+					0xf1	/* SEMC_BA0 */
+				MXRT1050_IOMUXC_GPIO_EMC_22_SEMC_BA1
+					0xf1	/* SEMC_BA1 */
+				MXRT1050_IOMUXC_GPIO_EMC_23_SEMC_ADDR10
+					0xf1	/* SEMC_A10 */
+				MXRT1050_IOMUXC_GPIO_EMC_24_SEMC_CAS
+					0xf1	/* SEMC_CAS */
+				MXRT1050_IOMUXC_GPIO_EMC_25_SEMC_RAS
+					0xf1	/* SEMC_RAS */
+				MXRT1050_IOMUXC_GPIO_EMC_26_SEMC_CLK
+					0xf1	/* SEMC_CLK */
+				MXRT1050_IOMUXC_GPIO_EMC_27_SEMC_CKE
+					0xf1	/* SEMC_CKE */
+				MXRT1050_IOMUXC_GPIO_EMC_28_SEMC_WE
+					0xf1	/* SEMC_WE */
+				MXRT1050_IOMUXC_GPIO_EMC_29_SEMC_CS0
+					0xf1	/* SEMC_CS0 */
+				MXRT1050_IOMUXC_GPIO_EMC_30_SEMC_DA08
+					0xf1	/* SEMC_D8 */
+				MXRT1050_IOMUXC_GPIO_EMC_31_SEMC_DA09
+					0xf1	/* SEMC_D9 */
+				MXRT1050_IOMUXC_GPIO_EMC_32_SEMC_DA10
+					0xf1	/* SEMC_D10 */
+				MXRT1050_IOMUXC_GPIO_EMC_33_SEMC_DA11
+					0xf1	/* SEMC_D11 */
+				MXRT1050_IOMUXC_GPIO_EMC_34_SEMC_DA12
+					0xf1	/* SEMC_D12 */
+				MXRT1050_IOMUXC_GPIO_EMC_35_SEMC_DA13
+					0xf1	/* SEMC_D13 */
+				MXRT1050_IOMUXC_GPIO_EMC_36_SEMC_DA14
+					0xf1	/* SEMC_D14 */
+				MXRT1050_IOMUXC_GPIO_EMC_37_SEMC_DA15
+					0xf1	/* SEMC_D15 */
+				MXRT1050_IOMUXC_GPIO_EMC_38_SEMC_DM01
+					0xf1	/* SEMC_DM1 */
+				MXRT1050_IOMUXC_GPIO_EMC_39_SEMC_DQS
+					(IMX_PAD_SION | 0xf1)	/* SEMC_DQS */
+			>;
+		};
+
+		pinctrl_usdhc0: usdhc0grp {
+			fsl,pins = <
+				MXRT1050_IOMUXC_GPIO_B1_12_USDHC1_CD_B
+					0x1B000
+				MXRT1050_IOMUXC_GPIO_B1_14_USDHC1_VSELECT
+					0xB069
+				MXRT1050_IOMUXC_GPIO_SD_B0_00_USDHC1_CMD
+					0x17061
+				MXRT1050_IOMUXC_GPIO_SD_B0_01_USDHC1_CLK
+					0x17061
+				MXRT1050_IOMUXC_GPIO_SD_B0_05_USDHC1_DATA3
+					0x17061
+				MXRT1050_IOMUXC_GPIO_SD_B0_04_USDHC1_DATA2
+					0x17061
+				MXRT1050_IOMUXC_GPIO_SD_B0_03_USDHC1_DATA1
+					0x17061
+				MXRT1050_IOMUXC_GPIO_SD_B0_02_USDHC1_DATA0
+					0x17061
+			>;
+		};
+
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc0>;
+	pinctrl-1 = <&pinctrl_usdhc0>;
+	pinctrl-2 = <&pinctrl_usdhc0>;
+	pinctrl-3 = <&pinctrl_usdhc0>;
+	status = "okay";
+
+	cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm/boot/dts/imxrt1050.dtsi b/arch/arm/boot/dts/imxrt1050.dtsi
new file mode 100644
index 000000000000..b1c04395bb29
--- /dev/null
+++ b/arch/arm/boot/dts/imxrt1050.dtsi
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2019
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+#include "armv7-m.dtsi"
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/imxrt1050-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		mmc0 = &usdhc1;
+		serial0 = &lpuart1;
+	};
+	clocks {
+		osc: osc {
+			compatible = "fsl,imx-osc", "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+		};
+	};
+
+	cpus {
+		#address-cells = <0x01>;
+		#size-cells = <0x00>;
+
+		cpu@0 {
+			compatible = "arm,cortex-m7";
+			device_type = "cpu";
+			reg = <0x00>;
+		};
+	};
+
+	soc {
+
+		lpuart1: serial@40184000 {
+			compatible = "fsl,imxrt-lpuart","fsl,imx8mm-uart", "fsl,imx6q-uart";
+			reg = <0x40184000 0x4000>;
+			interrupts = <20>;
+			clocks = <&clks IMXRT1050_CLK_LPUART1>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		iomuxc: iomuxc@401f8000 {
+			compatible = "fsl,imxrt1050-iomuxc";
+			reg = <0x401f8000 0x4000>;
+			fsl,mux_mask = <0x7>;
+		};
+
+		clks: ccm@400fc000 {
+			compatible = "fsl,imxrt1050-ccm";
+			reg = <0x400fc000 0x4000>;
+			interrupts = <95>,
+				     <96>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
+		};
+
+		edma1: dma-controller@400E8000 {
+			#dma-cells = <2>;
+			compatible = "fsl,imx7ulp-edma";
+			reg = <0x400E8000 0x4000>,
+				<0x400EC000 0x4000>;
+			dma-channels = <32>;
+			interrupts = <0>,
+				<1>,
+				<2>,
+				<3>,
+				<4>,
+				<5>,
+				<6>,
+				<7>,
+				<8>,
+				<9>,
+				<10>,
+				<11>,
+				<12>,
+				<13>,
+				<14>,
+				<15>,
+				<16>;
+			clock-names = "dma", "dmamux0";
+			clocks = <&clks IMXRT1050_CLK_DMA>,
+				 <&clks IMXRT1050_CLK_DMA_MUX>;
+		};
+
+		usdhc1: mmc@402c0000 {
+			compatible ="fsl,imxrt-usdhc";
+			reg = <0x402c0000 0x4000>;
+			interrupts = <110>;
+			clocks = <&clks IMXRT1050_CLK_IPG_PDOF>,
+				<&clks IMXRT1050_CLK_OSC>,
+				<&clks IMXRT1050_CLK_USDHC1>;
+			clock-names = "ipg", "ahb", "per";
+			bus-width = <4>;
+			fsl,wp-controller;
+			no-1-8-v;
+			max-frequency = <4000000>;
+			fsl,tuning-start-tap = <20>;
+			fsl,tuning-step= <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio@401b8000 {
+			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
+			reg = <0x401b8000 0x4000>;
+			interrupts = <80>,
+				     <81>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@401bc000 {
+			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
+			reg = <0x401bc000 0x4000>;
+			interrupts = <82>,
+				<83>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@401c0000 {
+			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
+			reg = <0x401c0000 0x4000>;
+			interrupts = <84>,
+				<85>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@401c4000 {
+			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
+			reg = <0x401c4000 0x4000>;
+			interrupts = <86>,
+					<87>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio5: gpio@400c0000 {
+			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
+			reg = <0x400c0000 0x4000>;
+			interrupts = <88>,
+				<89>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpt: timer@401ec000 {
+			compatible = "fsl,imx53-gpt", "fsl,imx31-gpt";
+			reg = <0x401ec000 0x4000>;
+			interrupts = <100>;
+			clocks = <&clks IMXRT1050_CLK_OSC>;
+			clock-names = "per";
+		};
+	};
+};
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
