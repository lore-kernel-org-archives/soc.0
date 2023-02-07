Return-Path: <SRS0=fIlS=6D=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E0C677F1
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 02:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B38B8C433D2; Tue,  7 Feb 2023 02:35:27 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 42E9FC4339B;
	Tue,  7 Feb 2023 02:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42E9FC4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 07 Feb 2023 11:35:21 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 386FE2006E5A;
	Tue,  7 Feb 2023 11:35:21 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 7 Feb 2023 11:35:31 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id E9B6FA8556;
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
Subject: [PATCH 7/8] arm64: dts: uniphier: Add syscon compatible string to soc-glue-debug
Date: Tue,  7 Feb 2023 11:35:13 +0900
Message-Id: <20230207023514.29783-8-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
References: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "syscon" compatible string to the nodes for soc-glue-debug
according to the DT schema.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 45004b0ae3eb..7bb36b071475 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -561,7 +561,7 @@ usb_phy2: phy@2 {
 
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-ld11-soc-glue-debug",
-				     "simple-mfd";
+				     "simple-mfd", "syscon";
 			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index d70929b26a2a..5dace1137cd1 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -625,7 +625,7 @@ pinctrl: pinctrl {
 
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-ld20-soc-glue-debug",
-				     "simple-mfd";
+				     "simple-mfd", "syscon";
 			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 4d200fec23fe..f62e3048d4dc 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -451,7 +451,7 @@ pinctrl: pinctrl {
 
 		syscon@5f900000 {
 			compatible = "socionext,uniphier-pxs3-soc-glue-debug",
-				     "simple-mfd";
+				     "simple-mfd", "syscon";
 			reg = <0x5f900000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.25.1

