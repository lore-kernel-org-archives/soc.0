Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82911CCA479
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CDF5C3411E; Thu, 16 Jun 2022 00:54:53 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B607CC341C5
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B607CC341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so349372pjl.4
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+riFNmdMk75rZ1ustGEPNsT3m7X79ndXoLSyN8tVDBM=;
        b=ScjWl0N66G6RKiXyjRWzpNRqTnKnDwP7F/mMUJAxqrLZ6LaCpkTHGce9jUUXYKypyt
         /XJXvBVZsUi62/hD0y/TAuD2JR2vjukOWtny4kY5Uz02gjM0n9JFgtgWbqdmXOnQfDvN
         b4RmISvGUiNhYDry5V3rqh+fmiOh3ECot1IcL7prcRZbjBaCXHHmmEOT//r9+JfEFyd6
         P/d9XChA5ejwHJ0DEe+RbwWhs9kwT0pW7bdNXoI/22xjmaG+RBM75fhhMAcVv4upKg3w
         YMvV0c39LobM7tKumjolQmS/8ZAmxuDGxWXFCcJ1YmAayEMf2Gq61XsEGlB6iJDW9kyL
         5aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+riFNmdMk75rZ1ustGEPNsT3m7X79ndXoLSyN8tVDBM=;
        b=JRJjMiTVr8j6LlHsUAsF4CIsb6omW5BPO3fazt1Zdo0PKABXJBOt5VOlPVnoKL44qo
         zqrx4dQyzB51FDrdZhhI41I5oHdz6cim5pX6u2rqdJ5LgLgINZNauzB/HIJ68Muk4yVf
         EHTory6NOEPOkJT5xBneQOfAFFeUlBKvlZw7O3o+3o/zF/x06I/g6AWJ6nhGkWv3KrNf
         9xfn4kCXkNOW7y/5Fyq19w60EfKXSobeo+7/Z+ujAmQsTgl+NtleodPdJ5HMPwOgKefp
         lxjOP7qQCC95YWBwGIj/oVxWCL8X/AwcPP29orpq09MOgERg++9cn+z/vz4aNF5lvNly
         Ty2A==
X-Gm-Message-State: AJIora/7PpETDCl6oWLrNh1Oz5SxjINo18SABgSwujLFs5IOfQXdIaS+
	xcMFGnVtbluKFiOPV2cS3vlUEQ==
X-Google-Smtp-Source: AGRyM1udExT3zMkQlP3PaI7iLyHDBxVwTO5oaMrwCBi2I0/yO3+AXvsXBWcx2dQpO2ZBcZPYWF9fzQ==
X-Received: by 2002:a17:903:485:b0:163:e1be:52b3 with SMTP id jj5-20020a170903048500b00163e1be52b3mr1914270plb.134.1655340892346;
        Wed, 15 Jun 2022 17:54:52 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 39/40] ARM: dts: at91: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:32 -0700
Message-Id: <20220616005333.18491-39-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-kizbox.dts             | 2 --
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    | 2 --
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi | 2 --
 arch/arm/boot/dts/at91-qil_a9260.dts          | 2 --
 arch/arm/boot/dts/at91-wb45n.dts              | 5 +----
 arch/arm/boot/dts/at91-wb50n.dts              | 8 ++------
 6 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/at91-kizbox.dts b/arch/arm/boot/dts/at91-kizbox.dts
index 87e972eb2ba6..307663b4eec2 100644
--- a/arch/arm/boot/dts/at91-kizbox.dts
+++ b/arch/arm/boot/dts/at91-kizbox.dts
@@ -30,8 +30,6 @@ main_xtal {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-reset {
 			label = "PB_RST";
diff --git a/arch/arm/boot/dts/at91-kizbox2-common.dtsi b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
index ed7146e23147..e5e21dff882f 100644
--- a/arch/arm/boot/dts/at91-kizbox2-common.dtsi
+++ b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
@@ -33,8 +33,6 @@ main_xtal {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-prog {
 			label = "PB_PROG";
diff --git a/arch/arm/boot/dts/at91-kizboxmini-common.dtsi b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
index 8fb08e6fad7a..42640fe6b6d0 100644
--- a/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
+++ b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
@@ -36,8 +36,6 @@ adc_op_clk {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		key-prog {
 			label = "PB_PROG";
diff --git a/arch/arm/boot/dts/at91-qil_a9260.dts b/arch/arm/boot/dts/at91-qil_a9260.dts
index d09b3d15a828..9d26f9996348 100644
--- a/arch/arm/boot/dts/at91-qil_a9260.dts
+++ b/arch/arm/boot/dts/at91-qil_a9260.dts
@@ -198,8 +198,6 @@ user_led {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-user {
 			label = "user_pb";
diff --git a/arch/arm/boot/dts/at91-wb45n.dts b/arch/arm/boot/dts/at91-wb45n.dts
index 3e46b29412d1..ef73f727f7bd 100644
--- a/arch/arm/boot/dts/at91-wb45n.dts
+++ b/arch/arm/boot/dts/at91-wb45n.dts
@@ -14,11 +14,8 @@ / {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		irqbtn@18 {
-			reg = <18>;
+		button {
 			label = "IRQBTN";
 			linux,code = <99>;
 			gpios = <&pioB 18 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/at91-wb50n.dts b/arch/arm/boot/dts/at91-wb50n.dts
index e2195bd3e4b4..ec2becf6133b 100644
--- a/arch/arm/boot/dts/at91-wb50n.dts
+++ b/arch/arm/boot/dts/at91-wb50n.dts
@@ -15,19 +15,15 @@ / {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		btn0@10 {
-			reg = <10>;
+		button-0 {
 			label = "BTNESC";
 			linux,code = <1>; /* ESC button */
 			gpios = <&pioA 10 GPIO_ACTIVE_LOW>;
 			wakeup-source;
 		};
 
-		irqbtn@31 {
-			reg = <31>;
+		button-1 {
 			label = "IRQBTN";
 			linux,code = <99>; /* SysReq button */
 			gpios = <&pioE 31 GPIO_ACTIVE_LOW>;
-- 
2.34.1

