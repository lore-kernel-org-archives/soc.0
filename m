Return-Path: <SRS0=xV2k=ZQ=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50066C54EE9
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 04:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38CEBC433D6; Tue, 13 Sep 2022 04:22:58 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id D0245C433B5;
	Tue, 13 Sep 2022 04:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0245C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Sep 2022 13:22:54 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id E9B0C20584CE;
	Tue, 13 Sep 2022 13:22:53 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 13 Sep 2022 13:22:53 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 7AFF2B62AE;
	Tue, 13 Sep 2022 13:22:53 +0900 (JST)
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
Subject: [PATCH v3 7/9] ARM: dts: uniphier: Add ahci controller nodes for PXs2
Date: Tue, 13 Sep 2022 13:22:47 +0900
Message-Id: <20220913042249.4708-8-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>
References: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>

Add ahci core controller and glue layer nodes including reset-controller
and sata-phy.

This supports for PXs2 and the boards without PXs2 vodka board that
doesn't implement any SATA connectors.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts |  4 +++
 arch/arm/boot/dts/uniphier-pxs2.dtsi       | 40 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
index 759384b60663..5f18b926c50a 100644
--- a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
+++ b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
@@ -99,3 +99,7 @@ &usb0 {
 &usb1 {
 	status = "okay";
 };
+
+&ahci {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index d2a2468d4ea0..ca4dccf56a67 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -599,6 +599,46 @@ mdio: mdio {
 			};
 		};
 
+		ahci: sata@65600000 {
+			compatible = "socionext,uniphier-pxs2-ahci",
+				     "generic-ahci";
+			status = "disabled";
+			reg = <0x65600000 0x10000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_clk 28>;
+			resets = <&sys_rst 28>, <&ahci_rst 0>;
+			ports-implemented = <1>;
+			phys = <&ahci_phy>;
+		};
+
+		sata-controller@65700000 {
+			compatible = "socionext,uniphier-pxs2-ahci-glue",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x65700000 0x100>;
+
+			ahci_rst: reset-controller@0 {
+				compatible = "socionext,uniphier-pxs2-ahci-reset";
+				reg = <0x0 0x4>;
+				clock-names = "link";
+				clocks = <&sys_clk 28>;
+				reset-names = "link";
+				resets = <&sys_rst 28>;
+				#reset-cells = <1>;
+			};
+
+			ahci_phy: sata-phy@10 {
+				compatible = "socionext,uniphier-pxs2-ahci-phy";
+				reg = <0x10 0x10>;
+				clock-names = "link";
+				clocks = <&sys_clk 28>;
+				reset-names = "link", "phy";
+				resets = <&sys_rst 28>, <&sys_rst 30>;
+				#phy-cells = <0>;
+			};
+		};
+
 		usb0: usb@65a00000 {
 			compatible = "socionext,uniphier-dwc3", "snps,dwc3";
 			status = "disabled";
-- 
2.25.1

