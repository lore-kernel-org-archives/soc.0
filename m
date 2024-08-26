Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FBCC5321D
	for <soc@archiver.kernel.org>; Mon, 26 Aug 2024 18:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCA7CC4FEF3; Mon, 26 Aug 2024 18:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E01C4FEEF;
	Mon, 26 Aug 2024 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724697583;
	bh=EtvmoEhORylVimadABDmNlILeiwAYChijeKp03j3ZYo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Bx//6jDc2Teb1Os8as5eI0dAfelBMt8usgxPNnBhfRxGlExb+FeZ8My5sT5hKe2Pp
	 430fxAYTsP9KIxXQITlcA+K9i6Y8Xg/vDXx7YZvdK8QfsOQqHrAC60iYABo94NGqIW
	 wPTWHygSxWh34k1TjQnRU9+5sQDah6G1sAshlsOB9tUFaNQz1/IP0ANCHQUmlBCUBF
	 dOiDQOLtIryFq8/DyEMgNvcL0/ChN0b5TGBmAN85gGb+dhDuugOGjPRWy/zzIsfdgO
	 5s5E9ouWfZIdbXZEzhz0np/qCqscQlmGIUEiGwFYFziX1TSXX8E+8bBgupcdskcV57
	 +niF3QbSvSEug==
From: "Rob Herring (Arm)" <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: toshiba: Fix pl011 and pl022 clocks
Date: Mon, 26 Aug 2024 13:38:48 -0500
Message-ID: <20240826183848.1290957-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arm Primecell blocks have a functional clock and a bus clock. The
Toshiba TMPV7708 only defines the bus clock (apb_pclk). Add the
"uartclk" and "sspclk" clocks to the PL011 and PL022 nodes,
respectively.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly unless there are objections. 
6.12 is fine for this.

 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi | 44 +++++++++++------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
index b04829b3175d..39806f0ae513 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -196,8 +196,8 @@ uart0: serial@28200000 {
 			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_pins>;
-			clocks = <&pismu TMPV770X_CLK_PIUART0>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PIUART0>, <&pismu TMPV770X_CLK_PIUART0>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -207,8 +207,8 @@ uart1: serial@28201000 {
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_pins>;
-			clocks = <&pismu TMPV770X_CLK_PIUART1>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PIUART1>, <&pismu TMPV770X_CLK_PIUART1>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -218,8 +218,8 @@ uart2: serial@28202000 {
 			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart2_pins>;
-			clocks = <&pismu TMPV770X_CLK_PIUART2>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PIUART2>, <&pismu TMPV770X_CLK_PIUART2>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -229,8 +229,8 @@ uart3: serial@28203000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart3_pins>;
-			clocks = <&pismu TMPV770X_CLK_PIUART2>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PIUART2>, <&pismu TMPV770X_CLK_PIUART2>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -360,8 +360,8 @@ spi0: spi@28140000 {
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			clocks = <&pismu TMPV770X_CLK_PISPI1>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PISPI1>, <&pismu TMPV770X_CLK_PISPI1>;
+			clock-names = "sspclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -374,8 +374,8 @@ spi1: spi@28141000 {
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			clocks = <&pismu TMPV770X_CLK_PISPI1>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PISPI1>, <&pismu TMPV770X_CLK_PISPI1>;
+			clock-names = "sspclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -388,8 +388,8 @@ spi2: spi@28142000 {
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			clocks = <&pismu TMPV770X_CLK_PISPI2>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PISPI2>, <&pismu TMPV770X_CLK_PISPI2>;
+			clock-names = "sspclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -402,8 +402,8 @@ spi3: spi@28143000 {
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			clocks = <&pismu TMPV770X_CLK_PISPI3>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PISPI3>, <&pismu TMPV770X_CLK_PISPI3>;
+			clock-names = "sspclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -416,8 +416,8 @@ spi4: spi@28144000 {
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			clocks = <&pismu TMPV770X_CLK_PISPI4>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PISPI4>, <&pismu TMPV770X_CLK_PISPI4>;
+			clock-names = "sspclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -430,8 +430,8 @@ spi5: spi@28145000 {
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			clocks = <&pismu TMPV770X_CLK_PISPI5>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PISPI5>, <&pismu TMPV770X_CLK_PISPI5>;
+			clock-names = "sspclk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -444,8 +444,8 @@ spi6: spi@28146000 {
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			clocks = <&pismu TMPV770X_CLK_PISPI6>;
-			clock-names = "apb_pclk";
+			clocks = <&pismu TMPV770X_CLK_PISPI6>, <&pismu TMPV770X_CLK_PISPI6>;
+			clock-names = "sspclk", "apb_pclk";
 			status = "disabled";
 		};
 
-- 
2.43.0

