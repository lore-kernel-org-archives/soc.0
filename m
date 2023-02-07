Return-Path: <SRS0=fIlS=6D=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D197C64EC5
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 02:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EF98C433A4; Tue,  7 Feb 2023 02:35:24 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 004B1C4339C;
	Tue,  7 Feb 2023 02:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 004B1C4339C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 07 Feb 2023 11:35:20 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id D78512058B4F;
	Tue,  7 Feb 2023 11:35:20 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 7 Feb 2023 11:35:14 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 279CCA8556;
	Tue,  7 Feb 2023 11:35:20 +0900 (JST)
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
Subject: [PATCH 3/8] ARM: dts: uniphier: Add syscon compatible string to soc-glue-debug
Date: Tue,  7 Feb 2023 11:35:09 +0900
Message-Id: <20230207023514.29783-4-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
References: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "syscon" compatible string to the nodes for soc-glue-debug
according to the DT schema.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-ld4.dtsi  | 2 +-
 arch/arm/boot/dts/uniphier-pro4.dtsi | 2 +-
 arch/arm/boot/dts/uniphier-pro5.dtsi | 2 +-
 arch/arm/boot/dts/uniphier-pxs2.dtsi | 2 +-
 arch/arm/boot/dts/uniphier-sld8.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-ld4.dtsi b/arch/arm/boot/dts/uniphier-ld4.dtsi
index da2e3e0ffafd..df2de7a40211 100644
--- a/arch/arm/boot/dts/uniphier-ld4.dtsi
+++ b/arch/arm/boot/dts/uniphier-ld4.dtsi
@@ -346,7 +346,7 @@ pinctrl: pinctrl {
 
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-ld4-soc-glue-debug",
-				     "simple-mfd";
+				     "simple-mfd", "syscon";
 			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
index 048f4606fbae..c28071a08e3a 100644
--- a/arch/arm/boot/dts/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
@@ -420,7 +420,7 @@ sg_clk: clock-controller {
 
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-pro4-soc-glue-debug",
-				     "simple-mfd";
+				     "simple-mfd", "syscon";
 			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
index f4c87a100095..a2000cfe9272 100644
--- a/arch/arm/boot/dts/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
@@ -385,7 +385,7 @@ pinctrl: pinctrl {
 
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-pro5-soc-glue-debug",
-				     "simple-mfd";
+				     "simple-mfd", "syscon";
 			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index 1442320747ec..55a298552bec 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -500,7 +500,7 @@ pinctrl: pinctrl {
 
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-pxs2-soc-glue-debug",
-				     "simple-mfd";
+				     "simple-mfd", "syscon";
 			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/uniphier-sld8.dtsi b/arch/arm/boot/dts/uniphier-sld8.dtsi
index c79c9bfef3ec..27aa55bb7f32 100644
--- a/arch/arm/boot/dts/uniphier-sld8.dtsi
+++ b/arch/arm/boot/dts/uniphier-sld8.dtsi
@@ -350,7 +350,7 @@ pinctrl: pinctrl {
 
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-sld8-soc-glue-debug",
-				     "simple-mfd";
+				     "simple-mfd", "syscon";
 			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.25.1

