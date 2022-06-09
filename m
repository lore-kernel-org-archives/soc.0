Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0901FCCA47B
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7F44C3411B; Thu,  9 Jun 2022 11:39:43 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5921DC3411D
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5921DC3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id s12so39687153ejx.3
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5cSlP87HZIroMFQjz/vmfO1yXb2dVVbYI7ALNnjKsu4=;
        b=enklcfx+xRNsl71eeOzYaL6+EZ4YcYjvBL9JTEliFZViBCfEgXZk05NA+a3vnLCm/T
         x90kLtSv9ZwZszLDXq+O5y6nFvhB5OsAyaOZNZ29HyWSWodl6V9hEOI1PF5//chAON8C
         bNaB3S+cHf+gKBAH4jZ/PCpJuEWSqEyxJI6MnJPgpHlgI2XoouOpbdg5Ln0Vwwg3Ug7T
         qWDtoE6to+8XjOpO3/yITnuWd6awIgNFPFWbZyIwlt3VQcD3lz85kfAs28Ykdd2uqTjM
         x/ZbWZHXBjE5ksyQELNP9KDO2JWqJkWK0uOZoFzyqmpN80Bw5VLjlPg1VPNyfeqWkFyH
         HrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5cSlP87HZIroMFQjz/vmfO1yXb2dVVbYI7ALNnjKsu4=;
        b=Oe21kz5Ewu5G69HoGt5VdtnxHjJwH/RyFVWwSoNdu3OWW7DW2XzmPWMTWVU/9LqUjc
         QMedySDRqNgjKIE7MGf8uM6t3dtPX6JzJe8O0Rbzi7fxECBZBLdikpbva1USpS0+lffn
         4UVx0jJyBiMM7BL6tmlSt3jY5gkjylJatgw8RvH9orkB/jiWzf9zZVMu9giagDWm0kxE
         yfNZmRFgN3ooThDECnomMcrqSfq/U9jle5n90m/mTUMHV2tFLZMIvKnlQ5iPUgogmhok
         oPCh0W1dX/NacdoYKRa97jFhwCFRtiH9e1vAw9WNzleJt6XBlTptV0/r7sqZ7z2kpKZP
         Gmyg==
X-Gm-Message-State: AOAM532jdSVe9gqFL2It9eIftmObx4sX9LjU25Nss/VP48g/6gnP7pGZ
	HS5ICpq0wOsigE2sUpL4J7zF6g==
X-Google-Smtp-Source: ABdhPJzbtDmMYGs5XyaYrA/HvXC2c45Gr8YCbQa6XbqGLvXtb8Jyb8dukWQr6y1esYHzmAPKuvPYGg==
X-Received: by 2002:a17:906:51cd:b0:711:f4ee:6582 with SMTP id v13-20020a17090651cd00b00711f4ee6582mr7625174ejk.591.1654774781573;
        Thu, 09 Jun 2022 04:39:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm9460415ejm.119.2022.06.09.04.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 10/48] arm64: dts: broadcom: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:29 +0200
Message-Id: <20220609113938.380466-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
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

