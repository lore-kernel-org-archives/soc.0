Return-Path: <SRS0=xV2k=ZQ=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28AFC6FA8A
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 04:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C6AEC433D7; Tue, 13 Sep 2022 04:23:31 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 49AC3C433B5;
	Tue, 13 Sep 2022 04:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49AC3C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Sep 2022 13:23:29 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 12F9B20584CF;
	Tue, 13 Sep 2022 13:23:29 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 13 Sep 2022 13:23:29 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id BACD9B62AE;
	Tue, 13 Sep 2022 13:23:28 +0900 (JST)
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
Subject: [PATCH v3 03/10] arm64: dts: uniphier: Rename usb-glue node for USB3 to usb-controller
Date: Tue, 13 Sep 2022 13:23:14 +0900
Message-Id: <20220913042321.4817-4-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913042321.4817-1-hayashi.kunihiko@socionext.com>
References: <20220913042321.4817-1-hayashi.kunihiko@socionext.com>

This "usb-glue" stands for an external controller associated with USB core,
however, this is not common. So rename to "usb-controller".

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index debab9f0e3e1..6466c9213bb7 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -762,7 +762,7 @@ usb: usb@65a00000 {
 			dr_mode = "host";
 		};
 
-		usb-glue@65b00000 {
+		usb-controller@65b00000 {
 			compatible = "socionext,uniphier-ld20-dwc3-glue",
 				     "simple-mfd";
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index e96e7ed98717..513a2b91dc97 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -611,7 +611,7 @@ usb0: usb@65a00000 {
 			dr_mode = "host";
 		};
 
-		usb-glue@65b00000 {
+		usb-controller@65b00000 {
 			compatible = "socionext,uniphier-pxs3-dwc3-glue",
 				     "simple-mfd";
 			#address-cells = <1>;
@@ -713,7 +713,7 @@ usb1: usb@65c00000 {
 			dr_mode = "host";
 		};
 
-		usb-glue@65d00000 {
+		usb-controller@65d00000 {
 			compatible = "socionext,uniphier-pxs3-dwc3-glue",
 				     "simple-mfd";
 			#address-cells = <1>;
-- 
2.25.1

