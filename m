Return-Path: <SRS0=fIlS=6D=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65945C64ED8
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 02:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47CD6C433A1; Tue,  7 Feb 2023 02:35:25 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id B38D0C433A0;
	Tue,  7 Feb 2023 02:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B38D0C433A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 07 Feb 2023 11:35:21 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 3316F2058B4F;
	Tue,  7 Feb 2023 11:35:21 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 7 Feb 2023 11:35:31 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id B9E627368;
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
Subject: [PATCH 6/8] arm64: dts: uniphier: Add missing reg properties for glue layer nodes
Date: Tue,  7 Feb 2023 11:35:12 +0900
Message-Id: <20230207023514.29783-7-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
References: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nodes for some glue layers don't include necessary reg properties.
Add the properties according to the DT schema.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 ++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 148d9092572a..45004b0ae3eb 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -562,6 +562,7 @@ usb_phy2: phy@2 {
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-ld11-soc-glue-debug",
 				     "simple-mfd";
+			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x5f900000 0x2000>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index c83265c9b520..d70929b26a2a 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -626,6 +626,7 @@ pinctrl: pinctrl {
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-ld20-soc-glue-debug",
 				     "simple-mfd";
+			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x5f900000 0x2000>;
@@ -778,6 +779,7 @@ usb: usb@65a00000 {
 		usb-controller@65b00000 {
 			compatible = "socionext,uniphier-ld20-dwc3-glue",
 				     "simple-mfd";
+			reg = <0x65b00000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x65b00000 0x400>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index dd60cc04d6fb..4d200fec23fe 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -452,6 +452,7 @@ pinctrl: pinctrl {
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-pxs3-soc-glue-debug",
 				     "simple-mfd";
+			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x5f900000 0x2000>;
@@ -619,6 +620,7 @@ ahci0: sata@65600000 {
 		sata-controller@65700000 {
 			compatible = "socionext,uniphier-pxs3-ahci-glue",
 				     "simple-mfd";
+			reg = <0x65700000 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x65700000 0x100>;
@@ -659,6 +661,7 @@ ahci1: sata@65800000 {
 		sata-controller@65900000 {
 			compatible = "socionext,uniphier-pxs3-ahci-glue",
 				     "simple-mfd";
+			reg = <0x65900000 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x65900000 0x100>;
@@ -703,6 +706,7 @@ usb0: usb@65a00000 {
 		usb-controller@65b00000 {
 			compatible = "socionext,uniphier-pxs3-dwc3-glue",
 				     "simple-mfd";
+			reg = <0x65b00000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x65b00000 0x400>;
@@ -805,6 +809,7 @@ usb1: usb@65c00000 {
 		usb-controller@65d00000 {
 			compatible = "socionext,uniphier-pxs3-dwc3-glue",
 				     "simple-mfd";
+			reg = <0x65d00000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x65d00000 0x400>;
-- 
2.25.1

