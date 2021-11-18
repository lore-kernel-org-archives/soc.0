Return-Path: <SRS0=mfZn=QF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FA9C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Nov 2021 06:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A4D6138B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Nov 2021 06:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1A4D6138B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=exB4vUEqy1UPJTgbJvEeLm2mIeAwpP6tbuKGP+E85Gs=; b=AgFOp3fEeBNQs4
	SwhD/ETifIYJQwHu+zmRAga8DuKw40AWK00BABEqzkJBcuPynmGfPsJ2cqIuSFN2+S9sgycCSvOZX
	HOu6BKa61skffLhkFxEeQrNSRYcoPq+iDuxDDVwNXAM4mjXW/NRDyBpZBCALBtxs7j+i+UcNH6vW8
	nc5RqKNWrjo1ZkLb6X/j7X6rDLSE9qsFh/wUnAalIGAP+brxjT1zitGAnUG2bAqqlBppC/qq1KRXg
	zSCC6H+CJdK68RS+ZzY6EkjClal3fABGMxWmNfcFCXhm8LW5u72HCiW+0Tpho8doEIc5w8skcHsni
	z6+QEnVkF4sv7zs3tkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnasH-006ygo-VL; Thu, 18 Nov 2021 06:26:22 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnasC-006yfh-Pt
 for linux-arm-kernel@lists.infradead.org; Thu, 18 Nov 2021 06:26:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so4702304pjb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 17 Nov 2021 22:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2QXWIaxABbz+0W0HqSmYqhwljZLlr286p2Rc5a+WKLg=;
 b=ixCxdcijxnQQtcmDSNKIoOG0JyWRkvEgIHSxC1JgHlGnBDnxVvVtzD9gZflK8yUwxW
 PLMvIsOPmsSeCErTTkWeCjnZzRYU/+EBHX0fYgcCCFPjOqfU7Jr2nbx+WbL0EEXiH6nu
 5A8h9Erm29ZGlaaYVs+oZChDUzxNwdJ2NPSJfvEG3ahRF30aoreCkZwGR/yS1fRuAAXg
 /DtMvbsjqeSKOGhNYBlktQgboMbQdIU9dMaxohHD3OY4thUJYeCW/sxvm65ZtRfatC2V
 qAAMSn3sRYT2qvyDYGRHzuT88HHsjx4gthmVPFjT94ukU9vFkmDdBQslXdb8BWJxz9EB
 dNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2QXWIaxABbz+0W0HqSmYqhwljZLlr286p2Rc5a+WKLg=;
 b=x+i00sW/jvBLfwhTRNyXPqyoo3vaZjFj/Yc7Xee79PgYiIbqbARKp6RF0lsBdlYQ3x
 ISnIjcdmqmHH2d3KULrhE0XHVg10COs8p/CEBedCOZIcG5UG/bFg+GxJit3uNqvwpIIX
 vTE6ZEJERh78Y5QB5eqZ/R9ByHGHW4dvJOSghKXJtZSQb+1QxOU0+8+qIBdwo3K7GOti
 jzpIMmHD1LGoF3sGCXK4kYwaxYtY1D5+R/j1NeV+3VaeWjyUn9PULHfq/B5xpQPpDcdW
 hsO81BrmLEC14m0PfpFps4Hmr3uO5Sah9dAP6LM5ZyPbsDMGLVVRbVYeTWiXMSLJMq8K
 KjYA==
X-Gm-Message-State: AOAM530SkHdBjyDaX8CyB9HlE8EKZbTAowf2w7R1VfDERSUI/e0LDXDB
 /BmKIc5LXH/nNvJHFcsMZN0=
X-Google-Smtp-Source: ABdhPJymLRF4x7lMoKkEC7bjFt4PDM8YZDkxDCGK8sjR4md41JNSK9L8Icuu2D/pl1EXoi9VZ/hpzQ==
X-Received: by 2002:a17:902:6a8a:b0:143:905f:aec7 with SMTP id
 n10-20020a1709026a8a00b00143905faec7mr64657362plk.8.1637216775641; 
 Wed, 17 Nov 2021 22:26:15 -0800 (PST)
Received: from howard-System-Product-Name.dhcpserver.bu9bmc.local
 (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
 by smtp.gmail.com with ESMTPSA id f22sm1821583pfj.49.2021.11.17.22.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 22:26:14 -0800 (PST)
From: Howard Chiu <howard10703049@gmail.com>
X-Google-Original-From: Howard Chiu <howard.chiu@quantatw.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 joel@jms.id.au, andrew@aj.id.au, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, patrick@stwcx.xyz
Cc: Howard Chiu <howard.chiu@quantatw.com>
Subject: [PATCH v5] ARM: dts: aspeed: Adding Facebook Bletchley BMC
Date: Thu, 18 Nov 2021 14:24:09 +0800
Message-ID: <20211118062409.3519367-1-howard.chiu@quantatw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_222616_878064_C5E77508 
X-CRM114-Status: GOOD (  15.81  )
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
Message-ID: <20211118062409.vLs5ELcPtjZvrUtkhcersB4NFVJcyW6OFlMc6Mj9DB0@z>

Initial introduction of Facebook Bletchley equipped with
Aspeed 2600 BMC SoC.

Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>

Change since v4:
- Change address of TMP421 on i2c-12 to 0x4d

Change since v3:
- Add a TMP421 on i2c-10

Change since v2:
- Remove uart5 workaround
- Remove gpio nodes of pca9552/pca9539
- Modify gpio-line-name of led/power/presence pins with openbmc pattern
- Add MP5023 devices

Change since v1:
- Keep sorted in Makefile
- Change baudrate to 57600 from 115200
- Rename node *-ember to *-amber
- Use openbmc-flash-layout-128.dtsi
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 736 ++++++++++++++++++
 2 files changed, 737 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0de64f237cd8..b804b577010a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1482,6 +1482,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
+	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-cloudripper.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
new file mode 100644
index 000000000000..1603b0b30d9f
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -0,0 +1,736 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/usb/pd.h>
+
+/ {
+	model = "Facebook Bletchley BMC";
+	compatible = "facebook,bletchley-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		bootargs = "console=ttyS4,57600n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	spi_gpio: spi-gpio {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+
+	switchphy: ethernet-phy@0 {
+		// Fixed-link
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		sys_log_id {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&front_leds 0 GPIO_ACTIVE_HIGH>;
+		};
+		fan0_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_ioexp 8 GPIO_ACTIVE_HIGH>;
+		};
+		fan1_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_ioexp 9 GPIO_ACTIVE_HIGH>;
+		};
+		fan2_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_ioexp 10 GPIO_ACTIVE_HIGH>;
+		};
+		fan3_blue {
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_ioexp 11 GPIO_ACTIVE_HIGH>;
+		};
+		fan0_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_ioexp 12 GPIO_ACTIVE_HIGH>;
+		};
+		fan1_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_ioexp 13 GPIO_ACTIVE_HIGH>;
+		};
+		fan2_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_ioexp 14 GPIO_ACTIVE_HIGH>;
+		};
+		fan3_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_ioexp 15 GPIO_ACTIVE_HIGH>;
+		};
+		sled0_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled0_leds 0 GPIO_ACTIVE_LOW>;
+		};
+		sled0_blue {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled0_leds 1 GPIO_ACTIVE_LOW>;
+		};
+		sled1_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled1_leds 0 GPIO_ACTIVE_LOW>;
+		};
+		sled1_blue {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled1_leds 1 GPIO_ACTIVE_LOW>;
+		};
+		sled2_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled2_leds 0 GPIO_ACTIVE_LOW>;
+		};
+		sled2_blue {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled2_leds 1 GPIO_ACTIVE_LOW>;
+		};
+		sled3_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled3_leds 0 GPIO_ACTIVE_LOW>;
+		};
+		sled3_blue {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled3_leds 1 GPIO_ACTIVE_LOW>;
+		};
+		sled4_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled4_leds 0 GPIO_ACTIVE_LOW>;
+		};
+		sled4_blue {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled4_leds 1 GPIO_ACTIVE_LOW>;
+		};
+		sled5_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled5_leds 0 GPIO_ACTIVE_LOW>;
+		};
+		sled5_blue {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled5_leds 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&mac2 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&switchphy>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&rtc {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+};
+
+&spi2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <100000000>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	/* TODO: Add ADC INA230 */
+
+	mp5023@40 {
+		compatible = "pmbus";
+		reg = <0x40>;
+	};
+
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+
+	sled0_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","SLED0_BMC_CCG5_INT","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
+		"SLED0_SSD_ALERT","SLED0_MS_DETECT","SLED0_MD_REF_PWM","",
+		"SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
+		"SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-sled0";
+	};
+
+	sled0_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled0-amber","led-sled0-blue","SLED0_RST_IOEXP","",
+		"","","","",
+		"","","","",
+		"","","","";
+	};
+
+	sled0_fusb302: typec-portc@54 {
+		compatible = "fcs,fusb302";
+		reg = <0x54>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+					PDO_VAR(3000, 12000, 3000)
+					PDO_PPS_APDO(3000, 11000, 3000)>;
+			op-sink-microwatt = <10000000>;
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	/* TODO: Add ADC INA230 */
+
+	mp5023@40 {
+		compatible = "pmbus";
+		reg = <0x40>;
+	};
+
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+
+	sled1_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","SLED1_BMC_CCG5_INT","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
+		"SLED1_SSD_ALERT","SLED1_MS_DETECT","SLED1_MD_REF_PWM","",
+		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
+		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-sled1";
+	};
+
+	sled1_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","",
+		"","","","",
+		"","","","",
+		"","","","";
+	};
+
+	sled1_fusb302: typec-portc@54 {
+		compatible = "fcs,fusb302";
+		reg = <0x54>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+					PDO_VAR(3000, 12000, 3000)
+					PDO_PPS_APDO(3000, 11000, 3000)>;
+			op-sink-microwatt = <10000000>;
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+	/* TODO: Add ADC INA230 */
+
+	mp5023@40 {
+		compatible = "pmbus";
+		reg = <0x40>;
+	};
+
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+
+	sled2_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","SLED2_BMC_CCG5_INT","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
+		"SLED2_SSD_ALERT","SLED2_MS_DETECT","SLED2_MD_REF_PWM","",
+		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
+		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-sled2";
+	};
+
+	sled2_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","",
+		"","","","",
+		"","","","",
+		"","","","";
+	};
+
+	sled2_fusb302: typec-portc@54 {
+		compatible = "fcs,fusb302";
+		reg = <0x54>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+					PDO_VAR(3000, 12000, 3000)
+					PDO_PPS_APDO(3000, 11000, 3000)>;
+			op-sink-microwatt = <10000000>;
+		};
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	/* TODO: Add ADC INA230 */
+
+	mp5023@40 {
+		compatible = "pmbus";
+		reg = <0x40>;
+	};
+
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+
+	sled3_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","SLED3_BMC_CCG5_INT","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
+		"SLED3_SSD_ALERT","SLED3_MS_DETECT","SLED3_MD_REF_PWM","",
+		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
+		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-sled3";
+	};
+
+	sled3_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","",
+		"","","","",
+		"","","","",
+		"","","","";
+	};
+
+	sled3_fusb302: typec-portc@54 {
+		compatible = "fcs,fusb302";
+		reg = <0x54>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+					PDO_VAR(3000, 12000, 3000)
+					PDO_PPS_APDO(3000, 11000, 3000)>;
+			op-sink-microwatt = <10000000>;
+		};
+	};
+};
+
+&i2c4 {
+	status = "okay";
+	/* TODO: Add ADC INA230 */
+
+	mp5023@40 {
+		compatible = "pmbus";
+		reg = <0x40>;
+	};
+
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+
+	sled4_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","SLED4_BMC_CCG5_INT","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
+		"SLED4_SSD_ALERT","SLED4_MS_DETECT","SLED4_MD_REF_PWM","",
+		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
+		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-sled4";
+	};
+
+	sled4_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","",
+		"","","","",
+		"","","","",
+		"","","","";
+	};
+
+	sled4_fusb302: typec-portc@54 {
+		compatible = "fcs,fusb302";
+		reg = <0x54>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+					PDO_VAR(3000, 12000, 3000)
+					PDO_PPS_APDO(3000, 11000, 3000)>;
+			op-sink-microwatt = <10000000>;
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	/* TODO: Add ADC INA230 */
+
+	mp5023@40 {
+		compatible = "pmbus";
+		reg = <0x40>;
+	};
+
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+
+	sled5_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","SLED5_BMC_CCG5_INT","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
+		"SLED5_SSD_ALERT","SLED5_MS_DETECT","SLED5_MD_REF_PWM","",
+		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
+		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-sled5";
+	};
+
+	sled5_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","",
+		"","","","",
+		"","","","",
+		"","","","";
+	};
+
+	sled5_fusb302: typec-portc@54 {
+		compatible = "fcs,fusb302";
+		reg = <0x54>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+					PDO_VAR(3000, 12000, 3000)
+					PDO_PPS_APDO(3000, 11000, 3000)>;
+			op-sink-microwatt = <10000000>;
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
+
+	rtc@51 {
+		compatible = "nxp,pcf85263";
+		reg = <0x51>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+
+	hdc1080@40 {
+		compatible = "ti,hdc1080";
+		reg = <0x40>;
+	};
+
+	front_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-fault-identify","power-p5v-stby-good",
+		"power-p1v0-dvdd-good","power-p1v0-avdd-good",
+		"","","","",
+		"","","","",
+		"","","","";
+	};
+};
+
+&i2c12 {
+	status = "okay";
+
+	adm1278@11 {
+		compatible = "adi,adm1278";
+		reg = <0x11>;
+	};
+
+	tmp421@4c {
+		compatible = "ti,tmp421";
+		reg = <0x4c>;
+	};
+
+	tmp421@4d {
+		compatible = "ti,tmp421";
+		reg = <0x4d>;
+	};
+
+	fan_ioexp: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"presence-fan0","presence-fan1",
+		"presence-fan2","presence-fan3",
+		"power-fan0-good","power-fan1-good",
+		"power-fan2-good","power-fan3-good",
+		"","","","",
+		"","","","";
+	};
+};
+
+&i2c13 {
+	multi-master;
+	aspeed,hw-timeout-ms = <1000>;
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"presence-riser1","presence-riser2",
+			"presence-sled0","presence-sled1",
+			"presence-sled2","presence-sled3",
+			"presence-sled4","presence-sled5",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"alert_sled0","alert_sled1",
+			"alert_sled2","alert_sled3",
+			"alert_sled4","alert_sled5",
+			"p12v_aux_alert1","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
+&adc0 {
+	vref = <1800>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	vref = <2500>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
+};
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
