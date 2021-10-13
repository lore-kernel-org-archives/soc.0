Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E198C433F5
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 14:38:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 281E3610C9; Wed, 13 Oct 2021 14:38:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CAF2610E5;
	Wed, 13 Oct 2021 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634135896;
	bh=NWL/E1GcqlkSMY8GhpglNvpzAedHBgAiJmEimBL9Xe8=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=jvDiFIQZM6/oTOEVNnsxQZYdyUW1NmeuVo4hNWNNXzq5GVuR8Tm30JQkqHIN/q6vO
	 snU3qeM+3oWG5dIhRbR9ifTAwncCH3tq8s2wxYPRumLUND40gycnKfEtGq4HHORiQr
	 gRzPzmkYFZ6kK8USWGYBgXFvGeHGLMbcGSioEVhPZ/16YKoAI4wF4gJ2W9gK9iE3x+
	 TTFRVyRudpYklSrRBgDLJZ6igkgbxwDyQoCn2JBeV6CHIIDMYr3fQZfwuBExpWqYVw
	 rxfGGDpeYYHGN6coSrpo66S04361tOlwjh6hFo96B0M1Xuw4DaZ+xsEd++XQuwVYkz
	 LCqYO6/WrvccQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Liviu Dudau <liviu.dudau@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
Date: Wed, 13 Oct 2021 16:37:43 +0200
Message-Id: <20211013143810.2101838-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

dtc now warns for the LED nodes on the versatile-ab board:

versatile-ab.dts:126.12-132.5: Warning (unit_address_format): /core-module@10000000/led@08.7: unit name should not have leading 0s
versatile-ab-ib2.dts:17.12-24.5: Warning (unit_address_format): /syscon@27000000/led@00.4: unit name should not have leading 0s

Remove the extra zeroes.

Fixes: 07ebfa59b9db ("ARM: versatile: add the syscon LEDs to the DT")
Fixes: 7fbe5f7ff267 ("ARM: dts: Add Versatile IB2 device tree")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/arm-realview-eb.dtsi    | 18 +++++++++---------
 arch/arm/boot/dts/arm-realview-pb1176.dts | 18 +++++++++---------
 arch/arm/boot/dts/arm-realview-pb11mp.dts | 18 +++++++++---------
 arch/arm/boot/dts/arm-realview-pbx.dtsi   | 18 +++++++++---------
 arch/arm/boot/dts/versatile-ab-ib2.dts    |  2 +-
 arch/arm/boot/dts/versatile-ab.dts        | 16 ++++++++--------
 6 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index 04e8a27ba1eb..48b8994db0af 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -199,7 +199,7 @@ syscon: syscon@10000000 {
 			compatible = "arm,realview-eb-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -207,7 +207,7 @@ led@08.0 {
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -215,7 +215,7 @@ led@08.1 {
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -223,42 +223,42 @@ led@08.2 {
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index 366687fb1ee3..753c8439ab42 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -217,7 +217,7 @@ syscon: syscon@10000000 {
 			compatible = "arm,realview-pb1176-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -225,7 +225,7 @@ led@08.0 {
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -233,7 +233,7 @@ led@08.1 {
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -241,42 +241,42 @@ led@08.2 {
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 228a51a38f95..2974daeac5db 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -304,7 +304,7 @@ pb11mp_syscon: syscon@10000000 {
 			compatible = "arm,realview-pb11mp-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -312,7 +312,7 @@ led@08.0 {
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -320,7 +320,7 @@ led@08.1 {
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -328,7 +328,7 @@ led@08.2 {
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
@@ -336,7 +336,7 @@ led@08.3 {
 				linux,default-trigger = "cpu1";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
@@ -344,7 +344,7 @@ led@08.4 {
 				linux,default-trigger = "cpu2";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
@@ -352,14 +352,14 @@ led@08.5 {
 				linux,default-trigger = "cpu3";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
@@ -367,7 +367,7 @@ led@08.7 {
 				default-state = "off";
 			};
 
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index ccf6f756b6ed..535fe91d78a4 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -221,7 +221,7 @@ syscon: syscon@10000000 {
 			compatible = "arm,realview-pbx-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -229,7 +229,7 @@ led@08.0 {
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -237,7 +237,7 @@ led@08.1 {
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -245,42 +245,42 @@ led@08.2 {
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/versatile-ab-ib2.dts b/arch/arm/boot/dts/versatile-ab-ib2.dts
index c577ff4bb4be..74b851fdf11c 100644
--- a/arch/arm/boot/dts/versatile-ab-ib2.dts
+++ b/arch/arm/boot/dts/versatile-ab-ib2.dts
@@ -14,7 +14,7 @@ syscon@27000000 {
 		compatible = "arm,versatile-ib2-syscon", "syscon", "simple-mfd";
 		reg = <0x27000000 0x4>;
 
-		led@00.4 {
+		led@0.4 {
 			compatible = "register-bit-led";
 			offset = <0x00>;
 			mask = <0x10>;
diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index 151c0220047d..c12c4a3d4ff5 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -71,7 +71,7 @@ core-module@10000000 {
 		compatible = "arm,core-module-versatile", "syscon", "simple-mfd";
 		reg = <0x10000000 0x200>;
 
-		led@08.0 {
+		led@8.0 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x01>;
@@ -79,7 +79,7 @@ led@08.0 {
 			linux,default-trigger = "heartbeat";
 			default-state = "on";
 		};
-		led@08.1 {
+		led@8.1 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x02>;
@@ -87,7 +87,7 @@ led@08.1 {
 			linux,default-trigger = "mmc0";
 			default-state = "off";
 		};
-		led@08.2 {
+		led@8.2 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x04>;
@@ -95,35 +95,35 @@ led@08.2 {
 			linux,default-trigger = "cpu0";
 			default-state = "off";
 		};
-		led@08.3 {
+		led@8.3 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x08>;
 			label = "versatile:3";
 			default-state = "off";
 		};
-		led@08.4 {
+		led@8.4 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x10>;
 			label = "versatile:4";
 			default-state = "off";
 		};
-		led@08.5 {
+		led@8.5 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x20>;
 			label = "versatile:5";
 			default-state = "off";
 		};
-		led@08.6 {
+		led@8.6 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x40>;
 			label = "versatile:6";
 			default-state = "off";
 		};
-		led@08.7 {
+		led@8.7 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x80>;
-- 
2.29.2

