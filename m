Return-Path: <SRS0=Ubu7=TZ=gmail.com=max.oss.09@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9932EC433FE
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 16:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 806C3C340E9; Mon, 14 Mar 2022 16:30:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3C33C36AE2;
	Mon, 14 Mar 2022 16:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3C33C36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so10012753wmb.3;
        Mon, 14 Mar 2022 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WuVI0nPhGtQzp4CrtyVyV4ed7h4ZcDvX7476/A1+K3w=;
        b=BJM1L64z93lfJaq5ARjBD2zPT+o3YIM2ZT8AWwwuy8IY86hKQeF9Aev0rlGdEnhpH/
         jSh5x5FXVGYtCl3RoUM1UbwSmnWEgZn2AesZhJHG4yw7JiL62m0HQetjRtwaY9NerHCI
         9mzBsMAW+1gp7cl/GY7DxqgAzUY2qRdRe9qwdthKh5RcyboL7nFrFsVXPhCbl8gfqP56
         mn4LyOhQp2hYsmH/2EEaBuDYtlonFD4v+qAOtW7AttiMg/o1Ep1CKIbcFrlxo17fAORM
         KXiZgvyvovxoJ5XylyQlj/BoBp/i4yxC98yf9bj2eCVxd+7QkmwR/VQXX8tk4iZTDH6y
         zO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WuVI0nPhGtQzp4CrtyVyV4ed7h4ZcDvX7476/A1+K3w=;
        b=EPoW1RP4hahq7r0+V4TvJv67q5FgXWSHa0QJLa5n9jUeW2k51/ZLp4R96lrwRkrkPO
         Ko712D1Gthn7tgn5/p2A78/a+OspfA99kQimS26CH+B3QXlwCc3SG4k56Yp9jagKZKs+
         0VSBEBsS34frLysbMr4KfDFy1kEP+qY9m+3+4xpV/ZHtLV2+we8evapQx8Q55zi/vr9X
         7sQjUk+ITRESpY8pQYIbDj2m5nT2oEXdxZjDO/EaVCG6yyackJ9sNCkiDayJnepUumQ7
         3Rp6Qr/kvu9P+L9viHEM6+bxE91ObuDHxNng1FQJRP6lmqTCLpdVHMRiGNoOqVihQW9s
         9/ug==
X-Gm-Message-State: AOAM531vfblLA1ZOb63m24ngieFJzk74s14xDU1yETszoXkJtAnu50FF
	yG9qKkQluLoY5EfNcsco8+c=
X-Google-Smtp-Source: ABdhPJyL/rCC47v7tOuZQq1uNrbhEHitNTUFBF+E9bWYFtmGL+8VEoCbg/ucrkd/XwVNcBFMuPC+0Q==
X-Received: by 2002:a1c:f312:0:b0:387:8bf:bd3 with SMTP id q18-20020a1cf312000000b0038708bf0bd3mr34440wmq.112.1647275427159;
        Mon, 14 Mar 2022 09:30:27 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d680a000000b001f1dabec837sm13476817wru.113.2022.03.14.09.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 09:30:26 -0700 (PDT)
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
Subject: [PATCH v1 13/14] ARM: dts: imx6dl-colibri: Add support for Toradex Aster carrier board
Date: Mon, 14 Mar 2022 17:29:57 +0100
Message-Id: <20220314162958.40361-14-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220314162958.40361-1-max.krummenacher@toradex.com>
References: <20220314162958.40361-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Toradex Aster, small form-factor with header compatible
with Arduino Uno and Raspberry Pi (RPi) maker boards.

Additional detail available at
https://www.toradex.com/products/carrier-boards/aster-carrier-board

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/imx6dl-colibri-aster.dts | 113 +++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-colibri-aster.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b636bae2b281..4802c8b0ee1a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -452,6 +452,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
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

