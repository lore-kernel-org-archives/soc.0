Return-Path: <SRS0=ZTeZ=ZP=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAF6C6FA92
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 07:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B81C4C433B5; Mon, 12 Sep 2022 07:16:28 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 6F515C43147;
	Mon, 12 Sep 2022 07:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F515C43147
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 12 Sep 2022 16:15:15 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 5711220584CE;
	Mon, 12 Sep 2022 16:15:15 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 12 Sep 2022 16:15:15 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id A0FDCB62AE;
	Mon, 12 Sep 2022 16:15:14 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 5/8] ARM: dts: uniphier: Add ahci controller and glue layer nodes for Pro4
Date: Mon, 12 Sep 2022 16:15:08 +0900
Message-Id: <20220912071511.1385-6-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912071511.1385-1-hayashi.kunihiko@socionext.com>
References: <20220912071511.1385-1-hayashi.kunihiko@socionext.com>

Add ahci controller, glue layer, and clock nodes for Pro4 SoC. The glue
layer includes reset and phy, and the clock node is used for handling ahci
clocks on SoC-glue.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-pro4-ace.dts |  8 ++
 arch/arm/boot/dts/uniphier-pro4-ref.dts |  8 ++
 arch/arm/boot/dts/uniphier-pro4.dtsi    | 97 +++++++++++++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-pro4-ace.dts b/arch/arm/boot/dts/uniphier-pro4-ace.dts
index 27ff2b7b9d0e..6baee4410d9c 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ace.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ace.dts
@@ -99,3 +99,11 @@ &usb0 {
 &usb1 {
 	status = "okay";
 };
+
+&ahci0 {
+	status = "okay";
+};
+
+&ahci1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/uniphier-pro4-ref.dts b/arch/arm/boot/dts/uniphier-pro4-ref.dts
index 48f7f23bab91..d2ce5c039865 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ref.dts
@@ -108,3 +108,11 @@ nand@0 {
 		reg = <0>;
 	};
 };
+
+&ahci0 {
+	status = "okay";
+};
+
+&ahci1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
index 7102c3de8db2..0991c9d9b4cf 100644
--- a/arch/arm/boot/dts/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
@@ -411,6 +411,11 @@ usb_phy3: phy@3 {
 					vbus-supply = <&usb1_vbus>;
 				};
 			};
+
+			sg_clk: clock {
+				compatible = "socionext,uniphier-pro4-sg-clock";
+				#clock-cells = <1>;
+			};
 		};
 
 		soc-glue@5f900000 {
@@ -513,6 +518,98 @@ mdio: mdio {
 			};
 		};
 
+		ahci0: ahci@65600000 {
+			compatible = "socionext,uniphier-pro4-ahci",
+				     "generic-ahci";
+			status = "disabled";
+			reg = <0x65600000 0x10000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_clk 12>, <&sys_clk 28>;
+			resets = <&sys_rst 12>, <&sys_rst 28>, <&ahci0_rst 3>;
+			ports-implemented = <1>;
+			phys = <&ahci0_phy>;
+			assigned-clocks = <&sg_clk 0>;
+			assigned-clock-rates = <25000000>;
+		};
+
+		ahci-glue@65700000 {
+			compatible = "socionext,uniphier-pxs2-ahci-glue",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x65700000 0x100>;
+
+			ahci0_rst: reset@0 {
+				compatible = "socionext,uniphier-pro4-ahci-reset";
+				reg = <0x0 0x4>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 28>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 28>;
+				#reset-cells = <1>;
+			};
+
+			ahci0_phy: ahci-phy@10 {
+				compatible = "socionext,uniphier-pro4-ahci-phy";
+				reg = <0x10 0x40>;
+				clock-names = "link", "gio";
+				clocks = <&sys_clk 28>, <&sys_clk 12>;
+				reset-names = "link", "gio", "phy",
+					      "pm", "tx", "rx";
+				resets = <&sys_rst 28>, <&sys_rst 12>,
+					 <&sys_rst 30>,
+					 <&ahci0_rst 0>, <&ahci0_rst 1>,
+					 <&ahci0_rst 2>;
+				#phy-cells = <0>;
+			};
+		};
+
+		ahci1: ahci@65800000 {
+			compatible = "socionext,uniphier-pro4-ahci",
+				     "generic-ahci";
+			status = "disabled";
+			reg = <0x65800000 0x10000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_clk 12>, <&sys_clk 29>;
+			resets = <&sys_rst 12>, <&sys_rst 29>, <&ahci1_rst 3>;
+			ports-implemented = <1>;
+			phys = <&ahci1_phy>;
+			assigned-clocks = <&sg_clk 0>;
+			assigned-clock-rates = <25000000>;
+		};
+
+		ahci-glue@65900000 {
+			compatible = "socionext,uniphier-pro4-ahci-glue",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x65900000 0x100>;
+
+			ahci1_rst: reset@0 {
+				compatible = "socionext,uniphier-pro4-ahci-reset";
+				reg = <0x0 0x4>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 29>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 29>;
+				#reset-cells = <1>;
+			};
+
+			ahci1_phy: ahci-phy@10 {
+				compatible = "socionext,uniphier-pro4-ahci-phy";
+				reg = <0x10 0x40>;
+				clock-names = "link", "gio";
+				clocks = <&sys_clk 29>, <&sys_clk 12>;
+				reset-names = "link", "gio", "phy",
+					      "pm", "tx", "rx";
+				resets = <&sys_rst 29>, <&sys_rst 12>,
+					 <&sys_rst 30>,
+					 <&ahci1_rst 0>, <&ahci1_rst 1>,
+					 <&ahci1_rst 2>;
+				#phy-cells = <0>;
+			};
+		};
+
 		usb0: usb@65a00000 {
 			compatible = "socionext,uniphier-dwc3", "snps,dwc3";
 			status = "disabled";
-- 
2.25.1

