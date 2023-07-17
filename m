Return-Path: <SRS0=afgr=DD=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3AEB64DC
	for <soc@archiver.kernel.org>; Mon, 17 Jul 2023 13:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BFF0C433C9; Mon, 17 Jul 2023 13:32:25 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8416CC433C7
	for <soc@kernel.org>; Mon, 17 Jul 2023 13:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8416CC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
	by michel.telenet-ops.be with bizsmtp
	id NDYF2A0080ucMBo06DYFFx; Mon, 17 Jul 2023 15:32:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qLOKc-001fyn-3K;
	Mon, 17 Jul 2023 15:32:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qLOKl-007R6q-0J;
	Mon, 17 Jul 2023 15:32:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 resend] ARM: dts: nuvoton: Fix pca954x i2c-mux node names
Date: Mon, 17 Jul 2023 15:32:13 +0200
Message-Id: <0e5625985cecd70e0f766da8eace6c6f7ae3192e.1689600667.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"make dtbs_check":

    arch/arm/boot/dts/nuvoton-npcm730-gbs.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    ...

Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
multiplexer/switch DT bindings and the Generic Names Recommendation in
the Devicetree Specification.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v2:
  - Add Reviewed-by.
---
 .../arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts | 16 ++++++++--------
 .../arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts |  2 +-
 .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts    |  8 ++++----
 .../nuvoton/nuvoton-npcm750-runbmc-olympus.dts   |  4 ++--
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
index 9e9eba8bad5e424a..9f64c85e1c206494 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
@@ -525,7 +525,7 @@ &i2c0 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -666,7 +666,7 @@ mb_fru@50 {
 		reg = <0x50>;
 	};
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -727,7 +727,7 @@ &i2c6 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@73 {
+	i2c-mux@73 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -763,7 +763,7 @@ &i2c7 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@72 {
+	i2c-mux@72 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -812,7 +812,7 @@ &i2c9 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -866,7 +866,7 @@ &i2c10 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -902,7 +902,7 @@ &i2c11 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@76 {
+	i2c-mux@76 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -961,7 +961,7 @@ &i2c14 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts
index 2a394cc15284c55d..9b1cc7f4adf0909d 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts
@@ -303,7 +303,7 @@ ucd90160@6b {
 &i2c15 {
 	status = "okay";
 
-	i2c-switch@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
index f7b38bee039bcab5..58329adbd9186fd7 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
@@ -494,7 +494,7 @@ &adc {
 
 &i2c1 {
 	status = "okay";
-	i2c-switch@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -573,7 +573,7 @@ lm75@5c {
 			};
 		};
 	};
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -613,7 +613,7 @@ &i2c3 {
 
 &i2c4 {
 	status = "okay";
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -684,7 +684,7 @@ ssif-bmc@10 {
 
 &i2c13 {
 	status = "okay";
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
index 87359ab05db3ebab..209fa3400317bf19 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
@@ -208,7 +208,7 @@ &gmac0 {
 &i2c1 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -258,7 +258,7 @@ i2c_slot5: i2c-bus@6 {
 		};
 	};
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
-- 
2.34.1

