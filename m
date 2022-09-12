Return-Path: <SRS0=ZTeZ=ZP=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D468C6FA93
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 07:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 673FCC43142; Mon, 12 Sep 2022 07:16:28 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 411DBC433B5;
	Mon, 12 Sep 2022 07:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 411DBC433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 12 Sep 2022 16:15:14 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id CD4362059027;
	Mon, 12 Sep 2022 16:15:14 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 12 Sep 2022 16:15:14 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 3F283B62AE;
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
Subject: [PATCH v2 3/8] ARM: dts: uniphier: Rename gpio-hog node
Date: Mon, 12 Sep 2022 16:15:06 +0900
Message-Id: <20220912071511.1385-4-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912071511.1385-1-hayashi.kunihiko@socionext.com>
References: <20220912071511.1385-1-hayashi.kunihiko@socionext.com>

According to gpio-hog schema, should add the suffix "-hog" to the node
names including gpio-hog to fix the following warning.

  uniphier-pro4-ref.dtb: gpio@55000000: 'xirq2' does not match any of the regexes: '^.+-hog(-[0-9+)?$', 'pinctrl-[0-9]+'
      From schema: Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml

This applies to the devicetree for LD4, LD6b, Pro4 and sLD8 SoCs.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-ld4-ref.dts  | 2 +-
 arch/arm/boot/dts/uniphier-ld6b-ref.dts | 2 +-
 arch/arm/boot/dts/uniphier-pro4-ref.dts | 2 +-
 arch/arm/boot/dts/uniphier-sld8-ref.dts | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-ld4-ref.dts b/arch/arm/boot/dts/uniphier-ld4-ref.dts
index c46c2e8a10a7..e2d25c9160bd 100644
--- a/arch/arm/boot/dts/uniphier-ld4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ld4-ref.dts
@@ -56,7 +56,7 @@ &serial3 {
 };
 
 &gpio {
-	xirq1 {
+	xirq1-hog {
 		gpio-hog;
 		gpios = <UNIPHIER_GPIO_IRQ(1) 0>;
 		input;
diff --git a/arch/arm/boot/dts/uniphier-ld6b-ref.dts b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
index 5bc7fe11b517..4f5e8848cecf 100644
--- a/arch/arm/boot/dts/uniphier-ld6b-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
@@ -60,7 +60,7 @@ &serial2 {
 };
 
 &gpio {
-	xirq4 {
+	xirq4-hog {
 		gpio-hog;
 		gpios = <UNIPHIER_GPIO_IRQ(4) 0>;
 		input;
diff --git a/arch/arm/boot/dts/uniphier-pro4-ref.dts b/arch/arm/boot/dts/uniphier-pro4-ref.dts
index 3b9b61314d01..cc2cae935b5d 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ref.dts
@@ -59,7 +59,7 @@ &serial2 {
 };
 
 &gpio {
-	xirq2 {
+	xirq2-hog {
 		gpio-hog;
 		gpios = <UNIPHIER_GPIO_IRQ(2) 0>;
 		input;
diff --git a/arch/arm/boot/dts/uniphier-sld8-ref.dts b/arch/arm/boot/dts/uniphier-sld8-ref.dts
index 6db949ec7411..b73647bafc63 100644
--- a/arch/arm/boot/dts/uniphier-sld8-ref.dts
+++ b/arch/arm/boot/dts/uniphier-sld8-ref.dts
@@ -56,7 +56,7 @@ &serial3 {
 };
 
 &gpio {
-	xirq0 {
+	xirq0-hog {
 		gpio-hog;
 		gpios = <UNIPHIER_GPIO_IRQ(0) 0>;
 		input;
-- 
2.25.1

