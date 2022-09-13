Return-Path: <SRS0=xV2k=ZQ=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F214C54EE9
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 04:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35B18C433D6; Tue, 13 Sep 2022 04:23:33 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id AA465C433B5;
	Tue, 13 Sep 2022 04:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA465C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 13 Sep 2022 13:23:29 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id B76212059027;
	Tue, 13 Sep 2022 13:23:29 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 13 Sep 2022 13:23:29 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 55F5FB62A4;
	Tue, 13 Sep 2022 13:23:29 +0900 (JST)
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
Subject: [PATCH v3 06/10] arm64: dts: uniphier: Add ahci controller nodes for PXs3
Date: Tue, 13 Sep 2022 13:23:17 +0900
Message-Id: <20220913042321.4817-7-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913042321.4817-1-hayashi.kunihiko@socionext.com>
References: <20220913042321.4817-1-hayashi.kunihiko@socionext.com>

Add ahci core controller and glue layer nodes including reset-controller
and sata-phy.

This supports for PXs3 and the boards.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 .../boot/dts/socionext/uniphier-pxs3-ref.dts  |  8 ++
 .../boot/dts/socionext/uniphier-pxs3.dtsi     | 80 +++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
index 506c7b9ff50d..1ced6190ab2b 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
@@ -137,6 +137,14 @@ nand@0 {
 	};
 };
 
+&ahci0 {
+	status = "okay";
+};
+
+&ahci1 {
+	status = "okay";
+};
+
 &pinctrl_ether_rgmii {
 	tx {
 		pins = "RGMII0_TXCLK", "RGMII0_TXD0", "RGMII0_TXD1",
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index bd5c1e3b64b0..c93b380fce94 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -596,6 +596,86 @@ mdio1: mdio {
 			};
 		};
 
+		ahci0: sata@65600000 {
+			compatible = "socionext,uniphier-pxs3-ahci",
+				     "generic-ahci";
+			status = "disabled";
+			reg = <0x65600000 0x10000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_clk 28>;
+			resets = <&sys_rst 28>, <&ahci0_rst 0>;
+			ports-implemented = <1>;
+			phys = <&ahci0_phy>;
+		};
+
+		sata-controller@65700000 {
+			compatible = "socionext,uniphier-pxs3-ahci-glue",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x65700000 0x100>;
+
+			ahci0_rst: reset-controller@0 {
+				compatible = "socionext,uniphier-pxs3-ahci-reset";
+				reg = <0x0 0x4>;
+				clock-names = "link";
+				clocks = <&sys_clk 28>;
+				reset-names = "link";
+				resets = <&sys_rst 28>;
+				#reset-cells = <1>;
+			};
+
+			ahci0_phy: sata-phy@10 {
+				compatible = "socionext,uniphier-pxs3-ahci-phy";
+				reg = <0x10 0x10>;
+				clock-names = "link", "phy";
+				clocks = <&sys_clk 28>, <&sys_clk 30>;
+				reset-names = "link", "phy";
+				resets = <&sys_rst 28>, <&sys_rst 30>;
+				#phy-cells = <0>;
+			};
+		};
+
+		ahci1: sata@65800000 {
+			compatible = "socionext,uniphier-pxs3-ahci",
+				     "generic-ahci";
+			status = "disabled";
+			reg = <0x65800000 0x10000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_clk 29>;
+			resets = <&sys_rst 29>, <&ahci1_rst 0>;
+			ports-implemented = <1>;
+			phys = <&ahci1_phy>;
+		};
+
+		sata-controller@65900000 {
+			compatible = "socionext,uniphier-pxs3-ahci-glue",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x65900000 0x100>;
+
+			ahci1_rst: reset-controller@0 {
+				compatible = "socionext,uniphier-pxs3-ahci-reset";
+				reg = <0x0 0x4>;
+				clock-names = "link";
+				clocks = <&sys_clk 29>;
+				reset-names = "link";
+				resets = <&sys_rst 29>;
+				#reset-cells = <1>;
+			};
+
+			ahci1_phy: sata-phy@10 {
+				compatible = "socionext,uniphier-pxs3-ahci-phy";
+				reg = <0x10 0x10>;
+				clock-names = "link", "phy";
+				clocks = <&sys_clk 29>, <&sys_clk 30>;
+				reset-names = "link", "phy";
+				resets = <&sys_rst 29>, <&sys_rst 30>;
+				#phy-cells = <0>;
+			};
+		};
+
 		usb0: usb@65a00000 {
 			compatible = "socionext,uniphier-dwc3", "snps,dwc3";
 			status = "disabled";
-- 
2.25.1

