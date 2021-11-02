Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5F7C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:04:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9447F61053
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9447F61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUKSIkC6nYmSRBX6hojRDtOtD+8r1njL5DFEfcX+h9o=; b=EmmQAAnTMdRTBW
	r71iHuKpVKHmZ84aWpoR2DknE2UTTig77LTjNZHdF8qfz/s8eII9Fqa7Nuv8zy3Ue6Hs5iumSYZ29
	1mQFskkYPTOQItPQoVbJCPwwc3kwW8K11QfHR9fdi7t9NHz3+ftU8EA1pCPDMS4P6zVbM/WXe9KSr
	Y2db5UEdhPVYAZpTyMeO1OC1YslY1FrW4UvQEJleloHa5FsrIRGicJvbktONIK8IFNmMSScPQR2y1
	zAbhMxrBBZ3NOeb3ujjqVYXYQgGUOFGyUSI+4930SNqp8qalFywS9ph6KwZiVgbC8tMZU1KqFDc/S
	PqtYU9RZ7HLa8xyaHOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2nw-003HMW-1O; Tue, 02 Nov 2021 23:02:56 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2ic-003Er2-79
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 22:57:28 +0000
Received: by mail-qv1-xf30.google.com with SMTP id u16so610493qvk.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 15:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/HhPEFfQuAcSb7ueR0sFxgljwTlrYiciDVqHmQVlaA=;
 b=HA4FRfJni3TacgB0+WUl8r+DV9yWrGiUEDLlbR4+Ogf5UXmKFAdqn6LJjzNG/I8gue
 RgF8zj1tdi91KbaHIKJRLfDMs+Bf+X6Ej87maHvt2li++/HEUmDhxTV7oL7N+Rt1Vit8
 2SIvZjCiLo3DmFy0DWvcOZnnj1gVKGvWz8lny5UtGdJA6woR2tQBImmNpdokgtcdhllu
 3HjJGa0WfMpcZBTvCBQVkAk7PbAFufAhNcFUGO4stHNd3ns7efBvga4XhOUY8UFT91cn
 4YFQwgl+kGIBPfcQO369MRclrPeLBIuDwgeFj9KkAc7Ypx9kj7k2vmqQWp+IIyX1WLvj
 I6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/HhPEFfQuAcSb7ueR0sFxgljwTlrYiciDVqHmQVlaA=;
 b=iw0k3mlTeMucT7sen47uZqn+1Vt1rA/Yv80hC/oJcUFCZUWGnte/iBHW0enS6A46P6
 RDSiJu+QqmSgUW31seKI03wupQ9Z7x0nrRAGbUfWxe+eFn/CyRg1TaX27ck51IEu7e9B
 I/qrbypgf+T6DSTN+XpEvqYc/7JtozLwQvarwuT7iPYwHCzmpZ8A76Jo32wkjjk6WlZv
 nLYQPXqVgUKkaVI7/6BPpwchs+ukfM9TZ0b0q4emperpBdaZKJyduSc1kV+wnlxHiLrw
 460CHPP7AYr+VcY3O1kYz3eaApWxlUS2T7lGIUacvx9Qn/rog+O8jSdJ5bfDVIjMOQpw
 KNLw==
X-Gm-Message-State: AOAM5308vUYG6yVjwqV4hEr8Xoah1vp6bAnnLrC1rdCCmw3dtSps1BRC
 fW85QETdIwSPJNhB+fOAqGM=
X-Google-Smtp-Source: ABdhPJwnzrAKdfBTM2DePQ+xymvjCQ4xQ++4nbCTpkttZyQoPuWNjnkSBk73r+ojb2LQ7pM/jaQDDg==
X-Received: by 2002:a05:6214:1c8a:: with SMTP id
 ib10mr39426278qvb.46.1635893844848; 
 Tue, 02 Nov 2021 15:57:24 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:57:22 -0700 (PDT)
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
 Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v2 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
Date: Tue,  2 Nov 2021 18:57:00 -0400
Message-ID: <20211102225701.98944-13-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155726_305657_90F91D50 
X-CRM114-Status: GOOD (  19.09  )
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
Message-ID: <20211102225700.dkcwdbOzLoNdXfzOFrGEB-11jvhiyGdr6lzsSXofmos@z>

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
[Jesse: Add clock-parents, edma, usdhc, anatop, remove old pinctl]
---
V1->V2:
* dtsi: Add clock parent definitions
* dtsi: Change hex values to lowercase
* dtsi: Move anatop definition from driver
* dts: Remove unused pin controll (semc)
* dts: Use moved pin controll header
* Move aliases from dtsi to dts
* Change commit description
* Change licence to "GPL-2.0+ OR MIT"
---
 arch/arm/boot/dts/Makefile          |   2 +
 arch/arm/boot/dts/imxrt1050-evk.dts |  89 +++++++++++++
 arch/arm/boot/dts/imxrt1050.dtsi    | 187 ++++++++++++++++++++++++++++
 3 files changed, 278 insertions(+)
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
index 000000000000..e414284a1544
--- /dev/null
+++ b/arch/arm/boot/dts/imxrt1050-evk.dts
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+/dts-v1/;
+#include "imxrt1050.dtsi"
+#include "imxrt1050-pinfunc.h"
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
+	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		mmc0 = &usdhc1;
+		serial0 = &lpuart1;
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
index 000000000000..cad5d0249fea
--- /dev/null
+++ b/arch/arm/boot/dts/imxrt1050.dtsi
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
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
+		anatop: anatop@400d8000 {
+			compatible = "fsl,imxrt-anatop";
+			reg = <0x400d8000 0x4000>;
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
+			assigned-clocks = <&clks IMXRT1050_CLK_PLL1_BYPASS>,
+				<&clks IMXRT1050_CLK_PLL1_BYPASS>,
+				<&clks IMXRT1050_CLK_PLL2_BYPASS>,
+				<&clks IMXRT1050_CLK_PLL3_BYPASS>,
+				<&clks IMXRT1050_CLK_PLL3_PFD1_664_62M>,
+				<&clks IMXRT1050_CLK_PLL2_PFD2_396M>;
+			assigned-clock-parents = <&clks IMXRT1050_CLK_PLL1_REF_SEL>,
+				<&clks IMXRT1050_CLK_PLL1_ARM>,
+				<&clks IMXRT1050_CLK_PLL2_SYS>,
+				<&clks IMXRT1050_CLK_PLL3_USB_OTG>,
+				<&clks IMXRT1050_CLK_PLL3_USB_OTG>,
+				<&clks IMXRT1050_CLK_PLL2_SYS>;
+		};
+
+		edma1: dma-controller@400e8000 {
+			#dma-cells = <2>;
+			compatible = "fsl,imx7ulp-edma";
+			reg = <0x400e8000 0x4000>,
+				<0x400ec000 0x4000>;
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
2.33.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
