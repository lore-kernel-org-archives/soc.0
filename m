Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E57C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58347C3411B; Thu,  9 Jun 2022 11:40:17 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C626C385A2
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C626C385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id g25so402587ejh.9
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jcozBsTgT/YC375ApFyzAWc29eO1kZXhYvLLJcIaQdo=;
        b=CfvdCBVNbMGWtVTdw8pHSTzzwyWFyrbpPI2qYmX2pmsat0d6wQV0PoomT5PheJ3e7T
         AKdsBGS0VJR+2b1QFm3ZluTcdXkrDYUskfb6x407WaY56urH4AzVSW0AmcoV/haYW/Et
         ILNf8e56vPvZ+JE9lArBOPe+vmzn9to9Dm4vEbgWsSpvCepnaG16rt/uR/uQqA2alvXC
         OrBZMiH0yIT/39QmaoMyxdlRB8lbNjlryAW/SQhX+CB01xxmcK431g93BxtolkwsHfM5
         /dfitoFeaOYBB5eYLXiWPoRbzFKda3qNFEk/Tr8c0HM3nIT6nr26NTCkrhIqXRcToKUL
         Gu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jcozBsTgT/YC375ApFyzAWc29eO1kZXhYvLLJcIaQdo=;
        b=iv2ZFK9wPfFxvzODwlQ69mEe00FKCw53YYOOWovg6KaqyVtSO9Erz0EVHa5bTQIDrv
         ZmZkKKHgvVbD4X7L6xDUwTr9Ka4dNhCNVrk+DMCs2TLQDl46TllNN0EXGf21MY2+ZmzP
         pYO+Ttu++0GOw7pM13cOGVMndDST6bo3/HdCDVscbIgoSaRsuLot2hEtkX5FFI/1r9+Z
         l0H49iKfSTLE//MEf6msPWLczZGGwfbGKZA90WCiff8x+tmAKN0Wtn32tR5xZBQLSwvL
         vPNq/1277xYtbeLPNiyoj9MsoorBQgB1y+2bswGPxRGftLk+bFx3HxItRxlQBUPL3Kc7
         pNNA==
X-Gm-Message-State: AOAM532XOrS5mo13xcMrpjBvZUFAWCVzb8qMX+UpGqPxWBeFu+N6Bap4
	UW2wgxarTbqW9MltgYR6OxXaLQ==
X-Google-Smtp-Source: ABdhPJzES6tPulNj5Wy4xrvXk6IgrBILt1ArgrmGgwN31bzfvVX4gweDST+60dXsz6pTQ42tTsROLg==
X-Received: by 2002:a17:907:2cc4:b0:6fe:2100:de21 with SMTP id hg4-20020a1709072cc400b006fe2100de21mr35434866ejc.462.1654774815646;
        Thu, 09 Jun 2022 04:40:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 25/48] arm64: dts: tegra: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:58 +0200
Message-Id: <20220609114002.380563-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts         |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts     |  6 +++---
 .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts |  6 +++---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts     |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi    |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi         |  6 +++---
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi         |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts     |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts          | 10 +++++-----
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts |  6 +++---
 10 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index f16acb4cabaa..62d58221ad3c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -1030,7 +1030,7 @@ clk32k_in: clock-32k {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		lid {
+		switch-lid {
 			label = "Lid";
 			gpios = <&gpio TEGRA_GPIO(R, 4) GPIO_ACTIVE_LOW>;
 			linux,input-type = <5>;
@@ -1039,7 +1039,7 @@ lid {
 			wakeup-source;
 		};
 
-		power {
+		switch-power {
 			label = "Power";
 			gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index bd1897707fcc..47cf2013afcc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -2478,7 +2478,7 @@ sata@3507000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "Power";
 			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 0)
 					   GPIO_ACTIVE_LOW>;
@@ -2489,7 +2489,7 @@ power {
 			wakeup-source;
 		};
 
-		volume-up {
+		key-volume-up {
 			label = "Volume Up";
 			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 1)
 					   GPIO_ACTIVE_LOW>;
@@ -2498,7 +2498,7 @@ volume-up {
 			debounce-interval = <10>;
 		};
 
-		volume-down {
+		key-volume-down {
 			label = "Volume Down";
 			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 2)
 					   GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 7e9aad9ff177..3e83a4d52eb1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -360,7 +360,7 @@ fan: pwm-fan {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "Power";
 			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 0)
 					   GPIO_ACTIVE_LOW>;
@@ -371,7 +371,7 @@ power {
 			wakeup-source;
 		};
 
-		volume-up {
+		key-volume-up {
 			label = "Volume Up";
 			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 1)
 					   GPIO_ACTIVE_LOW>;
@@ -380,7 +380,7 @@ volume-up {
 			debounce-interval = <10>;
 		};
 
-		volume-down {
+		key-volume-down {
 			label = "Volume Down";
 			gpios = <&gpio_aon TEGRA186_AON_GPIO(FF, 2)
 					   GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index fafd7073d18c..bc1041d11f6d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2258,7 +2258,7 @@ fan: pwm-fan {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		force-recovery {
+		key-force-recovery {
 			label = "Force Recovery";
 			gpios = <&gpio TEGRA194_MAIN_GPIO(G, 0)
 				       GPIO_ACTIVE_LOW>;
@@ -2267,7 +2267,7 @@ force-recovery {
 			debounce-interval = <10>;
 		};
 
-		power {
+		key-power {
 			label = "Power";
 			gpios = <&gpio_aon TEGRA194_AON_GPIO(EE, 4)
 					   GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 4cee935e44a5..273a1ef716b6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -2262,7 +2262,7 @@ fan: pwm-fan {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		force-recovery {
+		key-force-recovery {
 			label = "Force Recovery";
 			gpios = <&gpio TEGRA194_MAIN_GPIO(G, 0)
 				       GPIO_ACTIVE_LOW>;
@@ -2271,7 +2271,7 @@ force-recovery {
 			debounce-interval = <10>;
 		};
 
-		power {
+		key-power {
 			label = "Power";
 			gpios = <&gpio_aon TEGRA194_AON_GPIO(EE, 4)
 					   GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 4b43b89a9651..a44c56c1e56e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1530,20 +1530,20 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
 
-		power {
+		key-power {
 			label = "Power";
 			gpios = <&gpio TEGRA_GPIO(X, 5) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			wakeup-source;
 		};
 
-		volume_down {
+		key-volume-down {
 			label = "Volume Down";
 			gpios = <&gpio TEGRA_GPIO(Y, 0) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		volume_up {
+		key-volume-up {
 			label = "Volume Up";
 			gpios = <&gpio TEGRA_GPIO(X, 6) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 10347b6e6e84..8e657b10569d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1596,7 +1596,7 @@ gpio-keys {
 		compatible = "gpio-keys";
 		status = "okay";
 
-		power {
+		key-power {
 			debounce-interval = <30>;
 			gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
 			label = "Power";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 749b44cf3ffa..37678c337a34 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -1802,7 +1802,7 @@ cpu-passive {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "Power";
 			gpios = <&gpio TEGRA_GPIO(X, 5) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
@@ -1812,7 +1812,7 @@ power {
 			wakeup-source;
 		};
 
-		force-recovery {
+		key-force-recovery {
 			label = "Force Recovery";
 			gpios = <&gpio TEGRA_GPIO(X, 6) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index a263d51882ee..8494c7b2961b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1756,7 +1756,7 @@ cpu-sleep {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "Power";
 			gpios = <&gpio TEGRA_GPIO(X, 5) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
@@ -1764,7 +1764,7 @@ power {
 			wakeup-source;
 		};
 
-		lid {
+		switch-lid {
 			label = "Lid";
 			gpios = <&gpio TEGRA_GPIO(B, 4) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
@@ -1772,7 +1772,7 @@ lid {
 			wakeup-source;
 		};
 
-		tablet_mode {
+		key-tablet-mode {
 			label = "Tablet Mode";
 			gpios = <&gpio TEGRA_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
 			linux,input-type = <EV_SW>;
@@ -1780,13 +1780,13 @@ tablet_mode {
 			wakeup-source;
 		};
 
-		volume_down {
+		key-volume-down {
 			label = "Volume Down";
 			gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		volume_up {
+		key-volume-up {
 			label = "Volume Up";
 			gpios = <&gpio TEGRA_GPIO(M, 4) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 3f6c399e3371..02a10bb38562 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2021,14 +2021,14 @@ gpio-keys {
 		compatible = "gpio-keys";
 		status = "okay";
 
-		force-recovery {
+		key-force-recovery {
 			label = "Force Recovery";
 			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
 			linux,code = <BTN_1>;
 		};
 
-		power-key {
+		key-power {
 			label = "Power";
 			gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
@@ -2037,7 +2037,7 @@ power-key {
 			wakeup-source;
 		};
 
-		suspend {
+		key-suspend {
 			label = "Suspend";
 			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
-- 
2.34.1

