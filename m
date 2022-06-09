Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A42DCCA473
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 168A7C34114; Thu,  9 Jun 2022 11:40:45 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50D89C385A5
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50D89C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id c2so30782468edf.5
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0gTpvOOXwkw3+IlVKkOUqXd78sazfuzXwnJRU7GhmB0=;
        b=ZjGwgFcfggJ68Sg1t2GjYJ89wg0YwUkh0NwO+FZuFupnzH5UD0obB+pPPZBky0iWBY
         oxlFKg1IgA6EOEjZefkKPljkDW9Qw8v3poDN9bJdmiLmxVTpnSIyzxtj0WX466U9EUBI
         99ZQI6RjX72xwhSkhrUIzQfhnJJvtj5DgZOoNSsTjHUy3zAnAB/Ht2F4QQ+2aLgW7+8p
         BUjS8eJGZqrCRkeslJ7OdZj0RSKWtrtJLsphGaGkTkba2ACW4ZLYcTTGZK8CkUNNTBH0
         birusioWPq5h5lYGHBxFOsMml93Sr0UqXVq2kS8DHye+aDjF2U6u9zeBtdEG5xN66Nqd
         3FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0gTpvOOXwkw3+IlVKkOUqXd78sazfuzXwnJRU7GhmB0=;
        b=qxMXID12lGvANTSHJ0kVeZW5JsNAn5Xo+wYWJhP7kmRQKmjHaj3c1PJtCC8ffk4wLd
         xbPVJ2wri/jP8o3JFQu9KX9i1zao5utSP1axhEmR1YtC02VmY0wY66QlZvZNBIgJ6tK6
         NL+2Z0uYQjUwtZCgH30vIEWfeS39GXdcaaRu52GjGZ8tV8RU1uZGku+uqg4SSeb1D2JD
         GNUGB3IKLGBc0gv1cV17o8oxtH+y2KwKiH/2/RPwXmPPxUf66gZOdmBcnbDZDPiS4wpM
         EMB/L8EyKRY98HBlFPx61r8xNpkJ9/Qfgkiw+6YO+gSHAXniO3UadMmwJBU6pZM2Zup8
         SN+A==
X-Gm-Message-State: AOAM533oo67KkHCpB3sIGDIU5kZFpjTR0m8lujY60qmalM/oRr1JqkhX
	CMOThrvjms95gzy4gcQQfXjSmnP92fw4Ww==
X-Google-Smtp-Source: ABdhPJycuc4i37Snss/bjBdy/3PCNICN8bMUI57TNOrcF9qpY4e4B9UdGLW8q84lY/zpFMKNgmQybA==
X-Received: by 2002:a05:6402:2750:b0:42e:3d52:d270 with SMTP id z16-20020a056402275000b0042e3d52d270mr37523344edd.332.1654774843862;
        Thu, 09 Jun 2022 04:40:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b007101f6f0720sm7760844ejn.120.2022.06.09.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 38/48] ARM: dts: omap: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:40:25 +0200
Message-Id: <20220609114026.380682-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/am335x-evm.dts     |  6 +++---
 arch/arm/boot/dts/am335x-shc.dts     |  6 +++---
 arch/arm/boot/dts/am3517-evm-ui.dtsi | 20 ++++++++++----------
 arch/arm/boot/dts/am3517-evm.dts     | 18 +++++++++---------
 arch/arm/boot/dts/am437x-idk-evm.dts |  2 +-
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index b9745a2f0e4d..730898310641 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -92,20 +92,20 @@ &gpio1 26 GPIO_ACTIVE_HIGH		/* Bank1, pin26 */
 				0x0201006c>;	/* DOWN */
 	};
 
-	gpio_keys: volume_keys0 {
+	gpio_keys: volume-keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
 
-		switch9 {
+		switch-9 {
 			label = "volume-up";
 			linux,code = <115>;
 			gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
 			wakeup-source;
 		};
 
-		switch10 {
+		switch-10 {
 			label = "volume-down";
 			linux,code = <114>;
 			gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/am335x-shc.dts b/arch/arm/boot/dts/am335x-shc.dts
index 6b9877560741..c497200f9cb0 100644
--- a/arch/arm/boot/dts/am335x-shc.dts
+++ b/arch/arm/boot/dts/am335x-shc.dts
@@ -36,10 +36,10 @@ cpu@0 {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		back_button {
+		back-button {
 			label = "Back Button";
 			gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_BACK>;
@@ -47,7 +47,7 @@ back_button {
 			wakeup-source;
 		};
 
-		front_button {
+		front-button {
 			label = "Front Button";
 			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_FRONT>;
diff --git a/arch/arm/boot/dts/am3517-evm-ui.dtsi b/arch/arm/boot/dts/am3517-evm-ui.dtsi
index 7d8f32bf70db..5a1c3eec12db 100644
--- a/arch/arm/boot/dts/am3517-evm-ui.dtsi
+++ b/arch/arm/boot/dts/am3517-evm-ui.dtsi
@@ -70,61 +70,61 @@ expander-keys {
 		compatible = "gpio-keys-polled";
 		poll-interval = <100>;
 
-		record {
+		key-record {
 			label = "Record";
 			/* linux,code = <BTN_0>; */
 			gpios = <&tca6416_2 15 GPIO_ACTIVE_LOW>;
 		};
 
-		play {
+		key-play {
 			label = "Play";
 			linux,code = <KEY_PLAY>;
 			gpios = <&tca6416_2 14 GPIO_ACTIVE_LOW>;
 		};
 
-		Stop {
+		key-stop {
 			label = "Stop";
 			linux,code = <KEY_STOP>;
 			gpios = <&tca6416_2 13 GPIO_ACTIVE_LOW>;
 		};
 
-		fwd {
+		key-fwd {
 			label = "FWD";
 			linux,code = <KEY_FASTFORWARD>;
 			gpios = <&tca6416_2 12 GPIO_ACTIVE_LOW>;
 		};
 
-		rwd {
+		key-rwd {
 			label = "RWD";
 			linux,code = <KEY_REWIND>;
 			gpios = <&tca6416_2 11 GPIO_ACTIVE_LOW>;
 		};
 
-		shift {
+		key-shift {
 			label = "Shift";
 			linux,code = <KEY_LEFTSHIFT>;
 			gpios = <&tca6416_2 10 GPIO_ACTIVE_LOW>;
 		};
 
-		Mode {
+		key-mode {
 			label = "Mode";
 			linux,code = <BTN_MODE>;
 			gpios = <&tca6416_2 9 GPIO_ACTIVE_LOW>;
 		};
 
-		Menu {
+		key-menu {
 			label = "Menu";
 			linux,code = <KEY_MENU>;
 			gpios = <&tca6416_2 8 GPIO_ACTIVE_LOW>;
 		};
 
-		Up {
+		key-up {
 			label = "Up";
 			linux,code = <KEY_UP>;
 			gpios = <&tca6416_2 7 GPIO_ACTIVE_LOW>;
 		};
 
-		Down {
+		key-down {
 			label = "Down";
 			linux,code = <KEY_DOWN>;
 			gpios = <&tca6416_2 6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
index c8b80f156ec9..35b653014f2b 100644
--- a/arch/arm/boot/dts/am3517-evm.dts
+++ b/arch/arm/boot/dts/am3517-evm.dts
@@ -37,55 +37,55 @@ gpio-keys {
 		compatible = "gpio-keys-polled";
 		poll-interval = <100>;
 
-		user_pb {
+		button-user {
 			label = "User Push Button";
 			linux,code = <BTN_0>;
 			gpios = <&tca6416 5 GPIO_ACTIVE_LOW>;
 		};
 
-		user_sw_1 {
+		switch-1 {
 			label = "User Switch 1";
 			linux,code = <BTN_1>;
 			gpios = <&tca6416 8 GPIO_ACTIVE_LOW>;
 		};
 
-		user_sw_2 {
+		switch-2 {
 			label = "User Switch 2";
 			linux,code = <BTN_2>;
 			gpios = <&tca6416 9 GPIO_ACTIVE_LOW>;
 		};
 
-		user_sw_3 {
+		switch-3 {
 			label = "User Switch 3";
 			linux,code = <BTN_3>;
 			gpios = <&tca6416 10 GPIO_ACTIVE_LOW>;
 		};
 
-		user_sw_4 {
+		switch-4 {
 			label = "User Switch 4";
 			linux,code = <BTN_4>;
 			gpios = <&tca6416 11 GPIO_ACTIVE_LOW>;
 		};
 
-		user_sw_5 {
+		switch-5 {
 			label = "User Switch 5";
 			linux,code = <BTN_5>;
 			gpios = <&tca6416 12 GPIO_ACTIVE_LOW>;
 		};
 
-		user_sw_6 {
+		switch-6 {
 			label = "User Switch 6";
 			linux,code = <BTN_6>;
 			gpios = <&tca6416 13 GPIO_ACTIVE_LOW>;
 		};
 
-		user_sw_7 {
+		switch-7 {
 			label = "User Switch 7";
 			linux,code = <BTN_7>;
 			gpios = <&tca6416 14 GPIO_ACTIVE_LOW>;
 		};
 
-		user_sw_8 {
+		switch-8 {
 			label = "User Switch 8";
 			linux,code = <BTN_8>;
 			gpios = <&tca6416 15 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
index 5a74b83145cf..d46cd721f27e 100644
--- a/arch/arm/boot/dts/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
@@ -98,7 +98,7 @@ v1_5d: fixed-regulator-v1_5d{
 		vin-supply = <&v1_5dreg>;
 	};
 
-	gpio_keys: gpio_keys {
+	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pins_default>;
-- 
2.34.1

