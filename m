Return-Path: <SRS0=0ZpT=GX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EED5C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60512343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60512343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iB2pKl22McRer+cOfVAih+smrt6pjve6HeIi99WcDD4=; b=N2AZkO3rYIrSW69Mk2GzSKU/B
	gpcvLg9D7uD8Y/81uJsbTVvjAkQUYDKPM2kcTK+TldBIwrPzt3rS+1YxiqC9aw81VuNRZNXpWgOG/
	USEmNBZ3/IJKfeLtssg37hPfuRdOjlbZ5MX+FsTCKO5Bbj0wISjaxYZ440JC32XvYZ0TrmttG8Bm9
	QZmHWokIUHMrkGOplgln/ZzHc7MZPUSOaPqs3ly+2rY/63G+DZSJiHX7bOeMd7xlKxCafARMlKp0L
	v4uznCwxlXEglhsMkeUwZzxHm10bKpVzdZmXqMSDFxrVa9qN2o9NaqipZgfAjdnVnkwuBjf6WODXR
	WpE3uHMIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2JLl-0006lv-47; Wed, 20 Jan 2021 19:41:05 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2JLW-0006jU-Dl
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Jan 2021 19:40:52 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0DD9023E65;
 Wed, 20 Jan 2021 20:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611171647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXLo3S0TfmizPSm7JLrjZe+fZFvzccRp4oEIfRO/iAA=;
 b=X1EGncUBFtoakKW1OBe/F5AX59rp/3heLGD55lC9TO6PieqNp8rWCXhES//Jt/n3MP/6uO
 Ww79uFa7HzqvGPWkn1fk6CU3epVPxVfR3zmEVu1hOjf15wrC7x+28YnG7ph3MbZkV4tiYP
 YSmypNI4zQb1pLA4XZB95GQqK11thdI=
From: Michael Walle <michael@walle.cc>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: add Ebang EBAZ4205 device tree
Date: Wed, 20 Jan 2021 20:40:33 +0100
Message-ID: <20210120194033.26970-4-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210120194033.26970-1-michael@walle.cc>
References: <20210120194033.26970-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_144050_659096_7EB3CD23 
X-CRM114-Status: GOOD (  19.85  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>,
 Michal Simek <michal.simek@xilinx.com>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210120194033.umkaXqh664uhvN7Atj_Q7QbA5NfbwteLxyCg3r9dDv0@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
