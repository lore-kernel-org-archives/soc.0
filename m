Return-Path: <SRS0=HjUL=GX=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7F6C433DB
	for <soc@archiver.kernel.org>; Wed, 20 Jan 2021 19:40:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 561432343B; Wed, 20 Jan 2021 19:40:51 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06B0A233FC;
	Wed, 20 Jan 2021 19:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06B0A233FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=michael@walle.cc
Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 0DD9023E65;
	Wed, 20 Jan 2021 20:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1611171647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rXLo3S0TfmizPSm7JLrjZe+fZFvzccRp4oEIfRO/iAA=;
	b=X1EGncUBFtoakKW1OBe/F5AX59rp/3heLGD55lC9TO6PieqNp8rWCXhES//Jt/n3MP/6uO
	Ww79uFa7HzqvGPWkn1fk6CU3epVPxVfR3zmEVu1hOjf15wrC7x+28YnG7ph3MbZkV4tiYP
	YSmypNI4zQb1pLA4XZB95GQqK11thdI=
From: Michael Walle <michael@walle.cc>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH 3/3] ARM: dts: add Ebang EBAZ4205 device tree
Date: Wed, 20 Jan 2021 20:40:33 +0100
Message-Id: <20210120194033.26970-4-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210120194033.26970-1-michael@walle.cc>
References: <20210120194033.26970-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ebang EBAZ4205 is a simple board based on the Xilinx Zynq-7000 SoC.
Its features are:
 - one serial port
 - 256 MB RAM
 - 128 MB NAND flash
 - SDcard slot
 - IP101GA 10/100 Mbit Ethernet PHY (connected to PL IOs)
 - two LEDs (connected to PL IOs)
 - one Push Button (connect to PL IOs)
 - (optional) RTC
 - (optional) Input voltage supervisor

The NAND flash is not supported in mainline linux yet. Unfortunately,
the PHY is connected via the PL, thus for working ethernet the FPGA has
to be configured. Also, depending on the board variant, the PHY has no
external crystal and its clock needs to be driven by the PL. FCLK3 is
used for this and is kept enabled.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/Makefile          |   1 +
 arch/arm/boot/dts/zynq-ebaz4205.dts | 109 ++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index bf80fd901f61..03ac2e665241 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1312,6 +1312,7 @@ dtb-$(CONFIG_ARCH_VT8500) += \
 	wm8850-w70v2.dtb
 dtb-$(CONFIG_ARCH_ZYNQ) += \
 	zynq-cc108.dtb \
+	zynq-ebaz4205.dtb \
 	zynq-microzed.dtb \
 	zynq-parallella.dtb \
 	zynq-zc702.dtb \
diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
new file mode 100644
index 000000000000..e802d4ae8804
--- /dev/null
+++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Michael Walle <michael@walle.cc>
+ */
+/dts-v1/;
+/include/ "zynq-7000.dtsi"
+
+/ {
+	model = "Ebang EBAZ4205";
+	compatible = "ebang,ebaz4205", "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x10000000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+	fclk-enable = <8>;
+};
+
+&gem0 {
+	status = "okay";
+	phy-mode = "mii";
+	phy-handle = <&phy>;
+
+	/* PHY clock */
+	assigned-clocks = <&clkc 18>;
+	assigned-clock-rates = <25000000>;
+
+	phy: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&pinctrl0 {
+	pinctrl_sdhci0_default: sdhci0-default {
+		mux {
+			groups = "sdio0_2_grp";
+			function = "sdio0";
+		};
+
+		conf {
+			groups = "sdio0_2_grp";
+			io-standard = <3>;
+			slew-rate = <0>;
+			bias-disable;
+		};
+
+		mux-cd {
+			groups = "gpio0_34_grp";
+			function = "sdio0_cd";
+		};
+
+		conf-cd {
+			groups = "gpio0_34_grp";
+			io-standard = <3>;
+			slew-rate = <0>;
+			bias-high-impedance;
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_uart1_default: uart1-default {
+		mux {
+			groups = "uart1_4_grp";
+			function = "uart1";
+		};
+
+		conf {
+			groups = "uart1_4_grp";
+			io-standard = <3>;
+			slew-rate = <0>;
+		};
+
+		conf-rx {
+			pins = "MIO25";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins = "MIO24";
+			bias-disable;
+		};
+	};
+};
+
+&sdhci0 {
+	status = "okay";
+	disable-wp;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sdhci0_default>;
+};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1_default>;
+};
-- 
2.20.1

