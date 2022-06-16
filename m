Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EDAC43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E143C341C8; Thu, 16 Jun 2022 00:54:04 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57016C3411E
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57016C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id mh16-20020a17090b4ad000b001e8313301f1so4302187pjb.1
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5cSlP87HZIroMFQjz/vmfO1yXb2dVVbYI7ALNnjKsu4=;
        b=j2v/OHNCeMaCuM3Z6TS0vO+Y15ypfjzf3Yic+AQ9NC8CXymLIse1JfBNJ3wm6MxOPc
         9tJW9CzFoJa11L+y1tF1NJ+WHcxB8XWnXyf/T1afCco2sLMPg5E3um5oThiSgVbqh53b
         +yPJOLKCoeVcy/ZHcd3km23RWoN3tlJZtYCvdZm3L4V9aBus7qzS6DYVt7EpEVZ+2iog
         q3lsz4Ee7gYzw8vHi7HXC5cJgaB9CG2VRzWoS0MbR37n4mJrrIbGE3tiOGhNF1/obvAc
         RyOrRnwal/bicTHRydW25PDLHx42VBzKqKuXmHx7qEy1RefsAYZyt7qK+m86klBB1k9I
         hMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5cSlP87HZIroMFQjz/vmfO1yXb2dVVbYI7ALNnjKsu4=;
        b=vNkZTVm0flr0YuHVoKM+1ElnjatvwpU/ah8b5OOJ9SDrI/GqDPrqUBS4DvWfopjnwK
         q8+sRw2fJ+hwDNj/76ABapC3SU139CKRvjL/8r1f3TqMP517BvTmLN6KPIRULTMS8NCb
         I4LDT0EaWWzU7nTwIwFQbNWsPOvxOV5ON/Rwvctz3tH7s5hgqWA5mo3fAOTqAQ/9dmAJ
         3CWcs+O+RP5hIacwxnqJ+ZvHwB1efSAIQSgiGLCruTbIbFEtWNs2V+nHA6cLonbXvnV8
         aBs54ZVL/DU5SJW4Kr01uqOhYzj0Kb8ddEdUJS5kmxa9yGdqLkarcve6Kw3GC74s3H3D
         ob2w==
X-Gm-Message-State: AJIora/xI9D5JrbnaqWsRYZR/UVs2x09LUHubqy/66Fp2fTXwEErqzcM
	QUcUw/GJRoB+C3J3fli8ru8oWA==
X-Google-Smtp-Source: AGRyM1uFb5RnzDIdY3RB2VGlMJ0Tc18lyHj2Yzjra33pWjOdILaCiCY4mALTtc08arePdmn3U/rfQg==
X-Received: by 2002:a17:902:e80b:b0:168:b645:849e with SMTP id u11-20020a170902e80b00b00168b645849emr2018732plg.26.1655340842807;
        Wed, 15 Jun 2022 17:54:02 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 06/40] arm64: dts: broadcom: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:52:59 -0700
Message-Id: <20220616005333.18491-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../broadcom/bcm4908/bcm4906-tplink-archer-c2300-v1.dts   | 8 ++++----
 .../boot/dts/broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts  | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-tplink-archer-c2300-v1.dts b/arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-tplink-archer-c2300-v1.dts
index b63eefab48bd..064f7f549665 100644
--- a/arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-tplink-archer-c2300-v1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-tplink-archer-c2300-v1.dts
@@ -83,25 +83,25 @@ gpio-keys-polled {
 		compatible = "gpio-keys-polled";
 		poll-interval = <100>;
 
-		brightness {
+		key-brightness {
 			label = "LEDs";
 			linux,code = <KEY_BRIGHTNESS_ZERO>;
 			gpios = <&gpio0 18 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		key-wps {
 			label = "WPS";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
 		};
 
-		wifi {
+		key-wifi {
 			label = "WiFi";
 			linux,code = <KEY_RFKILL>;
 			gpios = <&gpio0 22 GPIO_ACTIVE_LOW>;
 		};
 
-		restart {
+		key-restart {
 			label = "Reset";
 			linux,code = <KEY_RESTART>;
 			gpios = <&gpio0 23 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts b/arch/arm64/boot/dts/broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts
index 169fbb7cfd34..04f8524b5335 100644
--- a/arch/arm64/boot/dts/broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts
@@ -18,25 +18,25 @@ gpio-keys-polled {
 		compatible = "gpio-keys-polled";
 		poll-interval = <100>;
 
-		wifi {
+		key-wifi {
 			label = "WiFi";
 			linux,code = <KEY_RFKILL>;
 			gpios = <&gpio0 28 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		key-wps {
 			label = "WPS";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
 		};
 
-		restart {
+		key-restart {
 			label = "Reset";
 			linux,code = <KEY_RESTART>;
 			gpios = <&gpio0 30 GPIO_ACTIVE_LOW>;
 		};
 
-		brightness {
+		key-brightness {
 			label = "LEDs";
 			linux,code = <KEY_BRIGHTNESS_ZERO>;
 			gpios = <&gpio0 31 GPIO_ACTIVE_LOW>;
-- 
2.34.1

