Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF8ECCA47E
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8D67C341C6; Thu, 16 Jun 2022 00:54:31 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3A81C3411C
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3A81C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id a10so102141pju.3
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XMCBqJLXl1yZV+e3LQN80RorsyQqGZTi99dCXoJkMfc=;
        b=I1/UIAxpSASF+5dR7pcT8TdG9BRTLTaSxQqJxvVGU1dJE27/UkBU24DpeEcAFxw1ig
         xGmFRGuxvpdiDXwBWM6AiwaBer3gXZiZdEOJ7k+gvIF948/cBz/LOl4Uh+iG5XJYM0G2
         ZjhXekfG+CXt5wuKTtAEAhqhp9bKSrpZNcSAPAKSz4GYmkYGaMBWWG5N6j/2rLKtkEa3
         Wh/QUjJfwIiSHQYZabM6k+3nXn7qiMv6IAju9YoWQCSbiTuU6uw0yKYazZu2e3KkqjUE
         tr1v+sQvtl3lFfz++plAg8A7U3PexyFYHZaakYzJJY8oCbuWb5gVcq+1DornCwsCsIzN
         DGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XMCBqJLXl1yZV+e3LQN80RorsyQqGZTi99dCXoJkMfc=;
        b=ScPSbAXvGxwwudIji2qmv3k/F2j5sqMSg4nUqs0LMxZExWm6V1h2f05GIUnegSIPVI
         DPOcN8a66pg/HLe6mSeWMdmxJpTz4sDwIpZ6VjltZUeVquUxOnEAGRZMKKxCpGe4uZSO
         l05aauoU+U4/1QIL8mokpFwbXXCZYPgaGipvzpIq/5NLqm4oVnAvDBSlORh+D5Mzdy9K
         XefkI690kV8V5aaC6pLkfFTzQW0TZeHt07EhNHM3+BeTa7PeCzyJ8crbFfqPBGNqp7F9
         Nv4c2Mpf8S3Jr/Jm7i/YrK3ndOI2zuQsYseK3JDv5Jhsx6IhnvVApdmqIFBnyUvH6raO
         zdxQ==
X-Gm-Message-State: AJIora+QGkunYFA6iI39MHKOFFq/f7ONeLRMAX9JelyGdL0sClhkq6Fq
	K7tQQX7dCPlueYhARfRxnkbHqQ==
X-Google-Smtp-Source: AGRyM1v9+8nFUYlx31cfvNeIk/VMLVb9C7s+cyQKHmJwZrryD4Q0rBmT6429A62oDwaOeSqypA7A4w==
X-Received: by 2002:a17:902:b7c3:b0:167:7ca8:7f24 with SMTP id v3-20020a170902b7c300b001677ca87f24mr2240516plz.51.1655340870073;
        Wed, 15 Jun 2022 17:54:30 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 24/40] arm64: dts: qcom: align led node names with dtschema
Date: Wed, 15 Jun 2022 17:53:17 -0700
Message-Id: <20220616005333.18491-24-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
with 'led'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index 6a200f37c035..0a5b4617a8e6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -133,7 +133,7 @@ button-camera-focus {
 	keyboard-leds {
 		compatible = "gpio-leds";
 
-		backlight {
+		led-0 {
 			color = <LED_COLOR_ID_WHITE>;
 			default-state = "off";
 			function = LED_FUNCTION_KBD_BACKLIGHT;
@@ -142,7 +142,7 @@ backlight {
 			retain-state-suspended;
 		};
 
-		caps-lock {
+		led-1 {
 			color = <LED_COLOR_ID_YELLOW>;
 			default-state = "off";
 			function = LED_FUNCTION_CAPSLOCK;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a6986f95a80a..72b234ad9fab 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -60,21 +60,21 @@ key-vol-up {
 	leds {
 		compatible = "gpio-leds";
 
-		user4 {
+		led-0 {
 			label = "green:user4";
 			gpios = <&pm8998_gpio 13 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "panic-indicator";
 			default-state = "off";
 		};
 
-		wlan {
+		led-1 {
 			label = "yellow:wlan";
 			gpios = <&pm8998_gpio 9 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "phy0tx";
 			default-state = "off";
 		};
 
-		bt {
+		led-2 {
 			label = "blue:bt";
 			gpios = <&pm8998_gpio 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "bluetooth-power";
-- 
2.34.1

