Return-Path: <SRS0=Ubu7=TZ=gmail.com=max.oss.09@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BFAC433EF
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 16:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B2E2C340F5; Mon, 14 Mar 2022 16:30:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D250BC36AE2;
	Mon, 14 Mar 2022 16:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D250BC36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id n33-20020a05600c3ba100b003832caf7f3aso243792wms.0;
        Mon, 14 Mar 2022 09:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sUiuL/SLTL5qZDZc0QyDeYZA2leqxHPH8yxtrmp6gNU=;
        b=mzBDZbPOnbtPVfj2Q8lifvmkN3ZTae9fpCvwJ5+1nGIW1wYJRW1ceOvOaZ+T57mARS
         HLhTxCDRU5tQEWRTLkTqmwWSgzUbNMBCZaQs6YzyhaJdWqf31pIjl2H09Vvs3HHTemoY
         cN9fT1Z1iZG33dKkr77BC4gqfxGuCdGykN+mvwV7L2Byl7WUr9Nur/D8Tq6XC2OH+rvy
         xaB9BkY6CTkEMa7zc04FXYqKyxgh59Un66jJYwoA5zi/4CE1AzYlRVnA4xHIsIS+//GC
         5CxlyiuVOvd8UGS3X3C4KVpAOXLkWA3KgIZk8+z1NCAyhTv2exTGvNa1yLf75NYgmoRf
         uqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sUiuL/SLTL5qZDZc0QyDeYZA2leqxHPH8yxtrmp6gNU=;
        b=huv/KSK08VNmrd/nRJ1FQIYafD6olLmhFHUue5P5xSGiaMQncUSh7IzZe68deOUOKl
         ohbjreL7l1KCOQffbx/rW2NXUEfg/4Y1t/jAfPw9TdYRa7PeltJxmYDfWr7jMdVrgpqQ
         l31ooBLgK1ywZLPu8iA8xPERKSQsDbpZd0K/LkZYdCknQv0EsmLCVnIPc3hcb8+zk5Tm
         TvqJaH3rjFTCRfOpnuOc0cHjG+nN5O+xgAPdSx1D5v5wwzjs5ST/hb194wSVcYiParR1
         C5KROWVSeXAUs0Fbn30HsP39Nw9bq4l32R9WDe6JoKhvFCi+3GT9kpjzuTthWEbksULa
         3wOw==
X-Gm-Message-State: AOAM530t2f9rWNlLkrLzMx6GJxkYE/6zdXssOCP5UEXDBdVgmTARpgIb
	EcSRs4lbpBcC7VhhbH+cRFE=
X-Google-Smtp-Source: ABdhPJx3oNhVBMlq7IA3vdNtCp52Q09BFBnwfbLHCrliBUGCmAQwSQ3NCqEaxXRQAJuVfv93hTUGkQ==
X-Received: by 2002:a1c:7708:0:b0:381:f18b:29ca with SMTP id t8-20020a1c7708000000b00381f18b29camr30405wmi.140.1647275426193;
        Mon, 14 Mar 2022 09:30:26 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d680a000000b001f1dabec837sm13476817wru.113.2022.03.14.09.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 09:30:25 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: max.krummenacher@toradex.com
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Olof Johansson <olof@lixom.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH v1 12/14] ARM: dts: imx6dl-colibri: Add support for Toradex Iris carrier boards
Date: Mon, 14 Mar 2022 17:29:56 +0100
Message-Id: <20220314162958.40361-13-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220314162958.40361-1-max.krummenacher@toradex.com>
References: <20220314162958.40361-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Toradex Iris, small form-factor Pico-ITX Colibri Arm
Computer Module family Carrier Board.

Additional details available at
https://www.toradex.com/products/carrier-board/iris-carrier-board

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm/boot/dts/Makefile                   |   2 +
 arch/arm/boot/dts/imx6dl-colibri-iris-v2.dts |  46 ++++++
 arch/arm/boot/dts/imx6dl-colibri-iris.dts    | 152 +++++++++++++++++++
 3 files changed, 200 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-colibri-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-colibri-iris.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ee27bafa69be..b636bae2b281 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -453,6 +453,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos2_4.dtb \
 	imx6dl-aristainetos2_7.dtb \
 	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-colibri-iris-v2.dts b/arch/arm/boot/dts/imx6dl-colibri-iris-v2.dts
new file mode 100644
index 000000000000..3a6d3889760d
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-colibri-iris-v2.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2022 Toradex
+ */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-iris.dts"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S on Colibri Iris V2 Board";
+	compatible = "toradex,colibri_imx6dl-iris-v2", "toradex,colibri_imx6dl",
+		     "fsl,imx6dl";
+
+	reg_3v3_vmmc: regulator-3v3-vmmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_enable_3v3_vmmc>;
+		regulator-name = "3v3_vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <100>;
+		enable-active-high;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_iris	&pinctrl_usbh_oc_1 &pinctrl_usbc_id_1>;
+
+	pinctrl_enable_3v3_vmmc: enable3v3vmmcgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT3__GPIO2_IO11	0x1b0b0
+		>;
+	};
+};
+
+/* Colibri MMC */
+&usdhc1 {
+	cap-power-off-card;
+	/* uncomment the following to enable SD card UHS mode if you have a V1.1 module */
+	/* /delete-property/ no-1-8-v; */
+	vmmc-supply = <&reg_3v3_vmmc>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6dl-colibri-iris.dts b/arch/arm/boot/dts/imx6dl-colibri-iris.dts
new file mode 100644
index 000000000000..cf77d894f6d7
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-colibri-iris.dts
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2022 Toradex
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "imx6dl.dtsi"
+#include "imx6qdl-colibri.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S on Colibri Iris Board";
+	compatible = "toradex,colibri_imx6dl-iris", "toradex,colibri_imx6dl",
+		     "fsl,imx6dl";
+
+	aliases {
+		i2c0 = &i2c2;
+		i2c1 = &i2c3;
+	};
+
+	aliases {
+		rtc0 = &rtc_i2c;
+		rtc1 = &snvs_rtc;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+/* Colibri SSP */
+&ecspi4 {
+	status = "okay";
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1_forceoff &pinctrl_uart23_forceoff>;
+
+	/*
+	 * uart-a-on-x13-enable turns the UART transceiver for UART_A on. If one
+	 * wants to turn the transceiver off, that property has to be deleted
+	 * and the gpio handled in userspace.
+	 * The same applies to uart-b-c-on-x14-enable where the UART_B and
+	 * UART_C transceiver is turned on.
+	 */
+	uart-a-on-x13-enable-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>; /* SODIMM 102 */
+		output-high;
+	};
+
+	uart-b-c-on-x14-enable-hog {
+		gpio-hog;
+		gpios = <8 GPIO_ACTIVE_HIGH>; /* SODIMM 104 */
+		output-high;
+	};
+};
+
+/*
+ * Colibri I2C: I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board)
+ */
+&i2c3 {
+	status = "okay";
+
+	rtc_i2c: rtc@68 {
+		compatible = "st,m41t0";
+		reg = <0x68>;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <
+		&pinctrl_gpio_iris
+		&pinctrl_usbh_oc_1
+		&pinctrl_usbc_id_1
+	>;
+
+	pinctrl_gpio_iris: gpioirisgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A17__GPIO2_IO21	0x1b0b0
+			MX6QDL_PAD_EIM_A18__GPIO2_IO20	0x1b0b0
+			MX6QDL_PAD_EIM_A19__GPIO2_IO19	0x1b0b0
+			MX6QDL_PAD_EIM_A20__GPIO2_IO18	0x1b0b0
+			MX6QDL_PAD_EIM_A23__GPIO6_IO06	0x1b0b0
+			MX6QDL_PAD_EIM_D27__GPIO3_IO27	0x1b0b0
+			MX6QDL_PAD_NANDF_D3__GPIO2_IO03	0x1b0b0
+			MX6QDL_PAD_SD2_DAT0__GPIO1_IO15	0x1b0b0
+		>;
+	};
+
+	pinctrl_uart1_forceoff: uart1forceoffgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_D4__GPIO2_IO04 0x1b0b0
+		>;
+	};
+
+	pinctrl_uart23_forceoff: uart23forceoffgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT0__GPIO2_IO08 0x1b0b0
+		>;
+	};
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&pwm2 {
+	status = "okay";
+};
+
+&pwm3 {
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&reg_usb_host_vbus {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
+
+&usbotg {
+	status = "okay";
+};
+
+/* Colibri MMC */
+&usdhc1 {
+	status = "okay";
+};
-- 
2.20.1

