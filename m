Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC03C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 12:18:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD9961263
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 12:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD9961263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Euq8/tSMssvYY0/2CUM0B2b6Sd5jml1NW7gwvC8vtiw=; b=Jl33iyrMNzAiqyT3e/oOdZJzNx
	fMzwx9YLzC8eVTZ8NCN0tgj4GMpi7BSnNqDXmtc2FFpZTSXU5TyFB4MMjgsmzj76+ijeOyn7Jo5pj
	cseTD7KTRdwkW3Oo8WWvrqrj1y6s1Eu9h+sxXYIhOQR+k6U5K8cM3fpEPmHTEa5MRM+HloYHdWVfQ
	NsEutyDsgJuYDPwuT1GbbsKV3DLekc5L7gs1vkjrO1PiE1mFOtAMM0BqqZQUmPD7NFqxOgjTWIZ2K
	YYRSFjJxdPrnCfdjtl4f7V3qoF10Y1dzNZNK+kkmCwqrjZRPYImOE3rLptvIQh6C/0/By5VZhQsd2
	qtx1FZjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb0AH-007Zym-PK; Mon, 26 Apr 2021 12:16:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb0AE-007ZyJ-CQ
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 12:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=i9LbioyM6BhiEXV4uI4ZecM4i47+OWK6b3YI0jDXJj8=; b=aTGXrMY4JP/MRFrATSpcvHGvTy
 O3d9UWh6e9Mdylg8zip35XjqA+z1251GLgmcof98Ta9LQFIglpT9gPQcqH7wiwws2iSY6bOHlLkZW
 BE9KMHuLlZUZmSA2dHbkZHrNjWAS5/TBRHCpoe2JuNfKWL6/KtVJmLZaXASu6A8L9RH72jevrLf/p
 sUsVn8Sf/gLRflFtyoXbx31ejLBNCgEEW1K3WOhwhl70NDwzZuoUdByH1BC8tKhtoSFRRnp5d/bsP
 NUySMVPaFr74a2JJfpf2XQah+80VKROGk2a0Zs2B+aZJ9FU+EPa+6VcV/bmz3PDvLDtEOTvKMzS3Z
 QDZo5ADA==;
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb0AB-00FwsZ-63
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 12:16:33 +0000
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 897A180EC1;
 Mon, 26 Apr 2021 14:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1619439388;
 bh=i9LbioyM6BhiEXV4uI4ZecM4i47+OWK6b3YI0jDXJj8=;
 h=From:To:Cc:Subject:Date:From;
 b=ncHnaruhTYUnGcG8txD3K1x52FLK6qgtnhv5Ys5fz7TX06RZrA/IUB9N11Gwd8+ZZ
 bzz3Ri9/64g7gDh+MWe0KO8vQcxNkrkB3UH0gNogQpowGj6zpwLtJuzL4M6xDD0VKT
 dTTiEamQNm392Np6fE5ZDeth/nXL/+S4UlYVYUaeg5RLqohYVYgnF9+WGggsutwLjP
 BtJoaJCvlnibkH+sJXfsfUozrhFcZqLHCeLh7JgWfeDphTCPNAu5k+TR5N0LRezrAf
 5X6aos0TJuwfTExZne4S38oryqOg7GEDn/ZMSFRWwVBIrkIrHtpv93GelyV+HOmeS/
 6oVNUqE4JIopg==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, l.majewski@majess.pl,
 Lukasz Majewski <lukma@denx.de>
Subject: [PATCH 2/2] ARM: dts: imx28: Add DTS description of imx28 based XEA
 board
Date: Mon, 26 Apr 2021 14:16:05 +0200
Message-ID: <20210426121605.31651-1-lukma@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_051631_551294_CC398F28 
X-CRM114-Status: GOOD (  15.05  )
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
Message-ID: <20210426121605.oS0I-k-N1BrauH3B14M5NtD3wRzvQcyt6XmsAt11AlE@z>

This patch adds DTS definition of the imx278 based XEA board.

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v2:
- Fix 'memory' node and remove regulators subnode
- Rename 'flash0: s25fl256s0@0' to flash@0
- Add proper compatible for XEA board
---
 arch/arm/boot/dts/Makefile       |   3 +-
 arch/arm/boot/dts/imx28-lwe.dtsi | 174 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx28-xea.dts  |  99 ++++++++++++++++++
 3 files changed, 275 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/imx28-lwe.dtsi
 create mode 100644 arch/arm/boot/dts/imx28-xea.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e75e..d2398a090e4d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -721,7 +721,8 @@ dtb-$(CONFIG_ARCH_MXS) += \
 	imx28-m28evk.dtb \
 	imx28-sps1.dtb \
 	imx28-ts4600.dtb \
-	imx28-tx28.dtb
+	imx28-tx28.dtb \
+	imx28-xea.dtb
 dtb-$(CONFIG_ARCH_NOMADIK) += \
 	ste-nomadik-s8815.dtb \
 	ste-nomadik-nhk15.dtb
diff --git a/arch/arm/boot/dts/imx28-lwe.dtsi b/arch/arm/boot/dts/imx28-lwe.dtsi
new file mode 100644
index 000000000000..2d14a8ae91f8
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-lwe.dtsi
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2021
+ * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
+ */
+
+/dts-v1/;
+#include "imx28.dtsi"
+
+/ {
+	aliases {
+		spi2 = &ssp3;
+	};
+
+	chosen {
+		bootargs = "root=/dev/mmcblk0p2 rootfstype=ext4 ro rootwait console=ttyAMA0,115200 panic=1";
+	};
+
+	memory@0x40000000 {
+		reg = <0x40000000 0x08000000>;
+	};
+
+	reg_3v3: regulator-reg-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_usb_5v: regulator-reg-usb-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
+	reg_fec_3v3: regulator-reg-fec-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+};
+
+&duart {
+	pinctrl-names = "default";
+	pinctrl-0 = <&duart_pins_a>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_a>;
+	status = "okay";
+};
+
+&saif0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&saif0_pins_a>;
+	#sound-dai-cells = <0>;
+	assigned-clocks = <&clks 53>;
+	assigned-clock-rates = <12000000>;
+	status = "okay";
+};
+
+&saif1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&saif1_pins_a>;
+	fsl,saif-master = <&saif0>;
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+&spi3_pins_a {
+	fsl,pinmux-ids = <
+		MX28_PAD_AUART2_RX__SSP3_D4
+		MX28_PAD_AUART2_TX__SSP3_D5
+		MX28_PAD_SSP3_SCK__SSP3_SCK
+		MX28_PAD_SSP3_MOSI__SSP3_CMD
+		MX28_PAD_SSP3_MISO__SSP3_D0
+		MX28_PAD_SSP3_SS0__SSP3_D3
+		MX28_PAD_AUART2_TX__GPIO_3_9
+	>;
+};
+
+&ssp3 {
+	compatible = "fsl,imx28-spi";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi3_pins_a>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <40000000>;
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0 0x80000>;
+				read-only;
+			};
+
+			partition@80000 {
+				label = "env0";
+				reg = <0x80000 0x10000>;
+			};
+
+			partition@90000 {
+				label = "env1";
+				reg = <0x90000 0x10000>;
+			};
+
+			partition@100000 {
+				label = "kernel";
+				reg = <0x100000 0x400000>;
+			};
+
+			partition@500000 {
+				label = "swupdate";
+				reg = <0x500000 0x800000>;
+			};
+		};
+	};
+};
+
+&ssp2 {
+	compatible = "fsl,imx28-spi";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi2_pins_a>;
+	status = "okay";
+};
+
+&ssp0 {
+	compatible = "fsl,imx28-mmc";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_8bit_pins_a>;
+	bus-width = <8>;
+	vmmc-supply = <&reg_3v3>;
+	non-removable;
+	status = "okay";
+};
+
+&usb0 {
+	vbus-supply = <&reg_usb_5v>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins_b>, <&usb0_id_pins_a>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbphy0 {
+	status = "okay";
+};
+
+&usb1 {
+	vbus-supply = <&reg_usb_5v>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins_b>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx28-xea.dts b/arch/arm/boot/dts/imx28-xea.dts
new file mode 100644
index 000000000000..a400c108f66a
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-xea.dts
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2021
+ * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
+ */
+
+/dts-v1/;
+#include "imx28-lwe.dtsi"
+
+/ {
+	compatible = "lwn,imx28-xea", "fsl,imx28";
+};
+
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1_pins_a>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_b>;
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hog_pins_a &hog_pins_tiva>;
+
+	hog_pins_a: hog@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_D00__GPIO_0_0
+			MX28_PAD_GPMI_D02__GPIO_0_2
+			MX28_PAD_GPMI_D05__GPIO_0_5
+			MX28_PAD_GPMI_CE1N__GPIO_0_17
+			MX28_PAD_GPMI_RDY0__GPIO_0_20
+			MX28_PAD_GPMI_RDY1__GPIO_0_21
+			MX28_PAD_GPMI_RDY2__GPIO_0_22
+			MX28_PAD_GPMI_RDN__GPIO_0_24
+			MX28_PAD_GPMI_CLE__GPIO_0_27
+			MX28_PAD_LCD_VSYNC__GPIO_1_28
+			MX28_PAD_SSP1_SCK__GPIO_2_12
+			MX28_PAD_SSP1_CMD__GPIO_2_13
+			MX28_PAD_SSP2_SS1__GPIO_2_20
+			MX28_PAD_SSP2_SS2__GPIO_2_21
+			MX28_PAD_LCD_D00__GPIO_1_0
+			MX28_PAD_LCD_D01__GPIO_1_1
+			MX28_PAD_LCD_D02__GPIO_1_2
+			MX28_PAD_LCD_D03__GPIO_1_3
+			MX28_PAD_LCD_D04__GPIO_1_4
+			MX28_PAD_LCD_D05__GPIO_1_5
+			MX28_PAD_LCD_D06__GPIO_1_6
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	hog_pins_tiva: hog@1 {
+		reg = <1>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_RDY3__GPIO_0_23
+			MX28_PAD_GPMI_WRN__GPIO_0_25
+		>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	hog_pins_coding: hog@2 {
+		reg = <2>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_D01__GPIO_0_1
+			MX28_PAD_GPMI_D03__GPIO_0_3
+			MX28_PAD_GPMI_D04__GPIO_0_4
+			MX28_PAD_GPMI_D06__GPIO_0_6
+			MX28_PAD_GPMI_D07__GPIO_0_7
+		>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+};
+
+&reg_fec_3v3 {
+	gpio = <&gpio0 0 0>;
+};
+
+&reg_usb_5v {
+	gpio = <&gpio0 2 0>;
+};
+
+&spi2_pins_a {
+	fsl,pinmux-ids = <
+		MX28_PAD_SSP2_SCK__SSP2_SCK
+		MX28_PAD_SSP2_MOSI__SSP2_CMD
+		MX28_PAD_SSP2_MISO__SSP2_D0
+		MX28_PAD_SSP2_SS0__GPIO_2_19
+	>;
+};
-- 
2.20.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
