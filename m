Return-Path: <SRS0=8r3H=UV=gmail.com=max.oss.09@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB502C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Apr 2022 15:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3873C385AB; Mon, 11 Apr 2022 15:23:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF728C385A3;
	Mon, 11 Apr 2022 15:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF728C385A3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id e8so7156532wra.7;
        Mon, 11 Apr 2022 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ekfMytrXwLVzydWFQD06PuCm7n67RUjTXkiwu4FLXvs=;
        b=aPxWMdR75gd/4D6Lsy6bAdNv0SFjCryWfPLl0w8KOOFtNAf6s1SZSqbCXAVbLWd+pJ
         2tTqjN3kozCFtNuc/PN8hFZqutlTtsh/gHPGftDNhxG4JPtbZST4fWvNiuo+T7gD7RQl
         KzfBE/DA1IKlP/reHOiDpH6HeD4XrFZgxm6ac22fWqoXeEOMZTRosDaETGcLRg3unKWL
         nPJPPc9qkiYLpcE8KqrfdhRDPcvA0xdrlinX/RGxfnIhohqNJhhXaIosDMuDTcIrZmff
         cnE6kGmOQ/AqZcsskhOq8ko0TJ0mREy2BZKs/dkcFGqKYi22PK4Jy2ayKpnUdP+CNRy0
         cSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekfMytrXwLVzydWFQD06PuCm7n67RUjTXkiwu4FLXvs=;
        b=PoQ01TXX/Rrb3AJfb8356wAhiU/JwJUiAkNSQWClqQGfuknyEtdduBlqS6z6WGfPfF
         skztvjtdt/IEyottAAb3i2pQEYIK8v3CQljR1JFwBhU5yZew9QUf/AgOkVB8mnEClbfK
         px3CQUK/APaSqUFmaKZ5WBVSMSCBRUFmUDH1o0meuwyINp0/0GHDqL2RjaWxU5O0zN/s
         km7vndV4M6k/+RbVj6VlTISZ206/LZojve9od0hOavC2JR1FrGtIXtqOTTIlzH1YUtmf
         csOXydGOjSIAoMC81mWpwFleqTz3onAh3/TRQ6aUiS8156zgi0k8c9iyIwVyGSIWKAKf
         ++fQ==
X-Gm-Message-State: AOAM532kagyuHt2R7NPcKX+M/DYlOomsCNoZUkj+fPjcH2i4hqxH5yhQ
	K/BGi9Wp08vbFQmno0kc4rE=
X-Google-Smtp-Source: ABdhPJw5in+mLmhkhW+3PfyFB6K3625bOXc51YWBV1OlklZNsIStdVNwB/LtUZwhDul2D2AeAHJ4vQ==
X-Received: by 2002:a05:6000:18ae:b0:204:62a:20f4 with SMTP id b14-20020a05600018ae00b00204062a20f4mr26767163wri.640.1649690580241;
        Mon, 11 Apr 2022 08:23:00 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id a9-20020a7bc1c9000000b0038eb67e966esm5209374wmj.29.2022.04.11.08.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:22:59 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v2 13/14] ARM: dts: imx6dl-colibri: Add support for Toradex Aster carrier board
Date: Mon, 11 Apr 2022 17:22:33 +0200
Message-Id: <20220411152234.12678-14-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220411152234.12678-1-max.oss.09@gmail.com>
References: <20220411152234.12678-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Add support for Toradex Aster, small form-factor with header compatible
with Arduino Uno and Raspberry Pi (RPi) maker boards.

Additional detail available at
https://www.toradex.com/products/carrier-boards/aster-carrier-board

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

(no changes since v1)

 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/imx6dl-colibri-aster.dts | 113 +++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-colibri-aster.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index cb4cf5453a9f..f0e5fc7e5274 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -458,6 +458,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos_7.dtb \
 	imx6dl-aristainetos2_4.dtb \
 	imx6dl-aristainetos2_7.dtb \
+	imx6dl-colibri-aster.dtb \
 	imx6dl-colibri-eval-v3.dtb \
 	imx6dl-colibri-iris.dtb \
 	imx6dl-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-colibri-aster.dts b/arch/arm/boot/dts/imx6dl-colibri-aster.dts
new file mode 100644
index 000000000000..74e8a6cd8bed
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-colibri-aster.dts
@@ -0,0 +1,113 @@
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
+	model = "Toradex Colibri iMX6DL/S on Colibri Aster Board";
+	compatible = "toradex,colibri_imx6dl-aster", "toradex,colibri_imx6dl",
+		     "fsl,imx6dl";
+
+	aliases {
+		i2c0 = &i2c2;
+		i2c1 = &i2c3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+/* Colibri SSP */
+&ecspi4 {
+	cs-gpios = <
+		&gpio5 2 GPIO_ACTIVE_HIGH
+		&gpio5 4 GPIO_ACTIVE_HIGH
+	>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi4 &pinctrl_csi_gpio_2>;
+	status = "okay";
+};
+
+/* Colibri I2C: I2C3_SDA/SCL on SODIMM 194/196 */
+&i2c3 {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <
+		&pinctrl_csi_gpio_1
+		&pinctrl_gpio_2
+		&pinctrl_gpio_aster
+		&pinctrl_usbh_oc_1
+		&pinctrl_usbc_id_1
+		&pinctrl_weim_gpio_5
+	>;
+
+	pinctrl_gpio_aster: gpioaster {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL2__GPIO4_IO10		0x1b0b0
+			MX6QDL_PAD_KEY_ROW2__GPIO4_IO11		0x1b0b0
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0
+			MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1b0b0
+			MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1b0b0
+			MX6QDL_PAD_NANDF_D6__GPIO2_IO06		0x1b0b0
+			MX6QDL_PAD_SD4_DAT0__GPIO2_IO08		0x1b0b0
+			MX6QDL_PAD_SD4_DAT3__GPIO2_IO11		0x1b0b0
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

