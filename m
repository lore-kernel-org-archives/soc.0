Return-Path: <SRS0=R+Db=HW=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D09C4332F
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 23:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4DC57C433CC; Mon, 11 Dec 2023 23:39:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87CC2C433C7
	for <soc@kernel.org>; Mon, 11 Dec 2023 23:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87CC2C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50c0dbaf2baso4827025e87.3
        for <soc@kernel.org>; Mon, 11 Dec 2023 15:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702337967; x=1702942767; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmTBdiB5i6WxztAJKP1mC1fcft/Tb2SFW1nbXnwAHRI=;
        b=AI7Rv38S3dZqg4B/rUmwKPddWi94wAa42tIAkMvIKM4kqYlTJ9UYp11AQuoZCVsOOF
         k+3r7TBPPYzdLEVxuFVoTAJySDcfQj3W6h2MCsmHdkXLt6C4cqcB33G7sZL3VQya8u29
         ZsO6cMbMUEMTqlpUwLz8c9AQob6BjaXzSOcPr6XSvo+n0ACE/gigEtDG5C1bKfp3uaR7
         deQXpQ9QYgBvd984QodrloI/hXjgClCgU52egWmGv0G+mb37XzobtXOc5boUJxzFr+LH
         /6N0kuq2LL/1z7tzZ2UUahT5aeFqTawdqd0ZrbYMvVI9+ue/jZPFVgBo3UVVPzysSFB9
         Aktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702337967; x=1702942767;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmTBdiB5i6WxztAJKP1mC1fcft/Tb2SFW1nbXnwAHRI=;
        b=CHJcsupYuXlpC4Mk8p3QsVHwGUrsZ9FuiSAjMt2/Xvd9CfcAu8qkqrgn+oDmK0AS/d
         NmwFEpWWJmK1evDCxP6f/nCveWHbizD/+jsCWT79IM6bv1StiH4Yf+tl4liTIrHLzO1e
         89xU/u5XgyVOwuf1BVqTpOfCLh9GjMsqSQ/5q9zYqJC1LDISOc0hCwJ3JeROg5sE9hJA
         IzJL1mDa/sg0q5zH4HI/XGjMznIjbeUK+sRJFgzqfecBk9K0bcyQCGrq+oAbGg69LgE4
         ihOKebu/GwO+qaNnMiJlIX/ZZQarFqEUZ6ZM0Rrf1IEmPgsSJTNXgUIBX6xi8Am2F+w5
         wBPw==
X-Gm-Message-State: AOJu0YwG0r8O+kSU/J/NXQBvFhcHQRHwQ4w629NUwwUWGE+VZviwKpYn
	rjl0X683f3hJ4zde8/uyMwCU1w==
X-Google-Smtp-Source: AGHT+IECAW066Wl/bbDWejk9x4hFvue3qKNiJwX7PHG/SRlJvvzCKvirqhyWWM12t4bHmYISp/I+4A==
X-Received: by 2002:a19:8c1c:0:b0:50b:ef5a:d022 with SMTP id o28-20020a198c1c000000b0050bef5ad022mr1414557lfd.41.1702337967360;
        Mon, 11 Dec 2023 15:39:27 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d22-20020a193856000000b0050bf1c67922sm1225301lfj.79.2023.12.11.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 15:39:26 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Dec 2023 00:39:25 +0100
Subject: [PATCH] ARM: dts: ste: minor whitespace cleanup around '='
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-ux500-dts-v1-1-5a31b6742d85@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKydd2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDI0Mj3dIKUwMD3ZSSYt1k05REs+REE6NEsxQloPqCotS0zAqwWdGxtbU
 ATpuFxlsAAAA=
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: this single patch is all changes I have for v6.8,
please apply it directly for DTS changes.
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi                  | 18 +++++++++---------
 arch/arm/boot/dts/st/ste-hrefprev60.dtsi              |  2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus.dtsi             |  2 +-
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi         |  8 ++++----
 arch/arm/boot/dts/st/ste-snowball.dts                 |  2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts |  2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts     |  2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts     |  2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts     |  2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts       |  2 +-
 10 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index d5d88771ef97..0f87abeddc33 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -425,7 +425,7 @@ rtc@80154000 {
 		gpio0: gpio@8012e000 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0x8012e000 0x80>;
+			reg = <0x8012e000 0x80>;
 			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -440,7 +440,7 @@ gpio0: gpio@8012e000 {
 		gpio1: gpio@8012e080 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0x8012e080 0x80>;
+			reg = <0x8012e080 0x80>;
 			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -455,7 +455,7 @@ gpio1: gpio@8012e080 {
 		gpio2: gpio@8000e000 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0x8000e000 0x80>;
+			reg = <0x8000e000 0x80>;
 			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -470,7 +470,7 @@ gpio2: gpio@8000e000 {
 		gpio3: gpio@8000e080 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0x8000e080 0x80>;
+			reg = <0x8000e080 0x80>;
 			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -485,7 +485,7 @@ gpio3: gpio@8000e080 {
 		gpio4: gpio@8000e100 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0x8000e100 0x80>;
+			reg = <0x8000e100 0x80>;
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -500,7 +500,7 @@ gpio4: gpio@8000e100 {
 		gpio5: gpio@8000e180 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0x8000e180 0x80>;
+			reg = <0x8000e180 0x80>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -515,7 +515,7 @@ gpio5: gpio@8000e180 {
 		gpio6: gpio@8011e000 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0x8011e000 0x80>;
+			reg = <0x8011e000 0x80>;
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -530,7 +530,7 @@ gpio6: gpio@8011e000 {
 		gpio7: gpio@8011e080 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0x8011e080 0x80>;
+			reg = <0x8011e080 0x80>;
 			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -545,7 +545,7 @@ gpio7: gpio@8011e080 {
 		gpio8: gpio@a03fe000 {
 			compatible = "stericsson,db8500-gpio",
 				"st,nomadik-gpio";
-			reg =  <0xa03fe000 0x80>;
+			reg = <0xa03fe000 0x80>;
 			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
index 9859ee91a15e..c87fd27b4434 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
+++ b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
@@ -62,7 +62,7 @@ spi@80002000 {
 
 		// External Micro SD slot
 		mmc@80126000 {
-			cd-gpios  = <&tc3589x_gpio 3 GPIO_ACTIVE_HIGH>;
+			cd-gpios = <&tc3589x_gpio 3 GPIO_ACTIVE_HIGH>;
 		};
 
 		pinctrl {
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi b/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
index e66fa59c2de6..f87f4150ea68 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
@@ -191,7 +191,7 @@ gpio@8011e080 {
 
 		// External Micro SD slot
 		mmc@80126000 {
-			cd-gpios  = <&gpio2 31 GPIO_ACTIVE_HIGH>; // 95
+			cd-gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>; // 95
 		};
 
 		pinctrl {
diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
index 6816eef39d45..4d37c5fb553c 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
@@ -52,7 +52,7 @@ mtu1: mtu@101e3000 {
 
 	gpio0: gpio@101e4000 {
 		compatible = "st,nomadik-gpio";
-		reg =  <0x101e4000 0x80>;
+		reg = <0x101e4000 0x80>;
 		interrupt-parent = <&vica>;
 		interrupts = <6>;
 		interrupt-controller;
@@ -66,7 +66,7 @@ gpio0: gpio@101e4000 {
 
 	gpio1: gpio@101e5000 {
 		compatible = "st,nomadik-gpio";
-		reg =  <0x101e5000 0x80>;
+		reg = <0x101e5000 0x80>;
 		interrupt-parent = <&vica>;
 		interrupts = <7>;
 		interrupt-controller;
@@ -80,7 +80,7 @@ gpio1: gpio@101e5000 {
 
 	gpio2: gpio@101e6000 {
 		compatible = "st,nomadik-gpio";
-		reg =  <0x101e6000 0x80>;
+		reg = <0x101e6000 0x80>;
 		interrupt-parent = <&vica>;
 		interrupts = <8>;
 		interrupt-controller;
@@ -94,7 +94,7 @@ gpio2: gpio@101e6000 {
 
 	gpio3: gpio@101e7000 {
 		compatible = "st,nomadik-gpio";
-		reg =  <0x101e7000 0x80>;
+		reg = <0x101e7000 0x80>;
 		ngpio = <28>;
 		interrupt-parent = <&vica>;
 		interrupts = <9>;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 27c2ec51e732..1322abfc7acf 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -266,7 +266,7 @@ mmc@80126000 {
 			pinctrl-1 = <&mc0_a_1_sleep>;
 
 			/* GPIO218 MMC_CD */
-			cd-gpios  = <&gpio6 26 GPIO_ACTIVE_LOW>;
+			cd-gpios = <&gpio6 26 GPIO_ACTIVE_LOW>;
 
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index 463942ae755e..c623cc35c5ea 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -310,7 +310,7 @@ mmc@80126000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc0_a_2_default>;
 			pinctrl-1 = <&mc0_a_2_sleep>;
-			cd-gpios  = <&gpio6 25 GPIO_ACTIVE_LOW>; // GPIO217
+			cd-gpios = <&gpio6 25 GPIO_ACTIVE_LOW>; // GPIO217
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index c1ae0e23fe45..2355ca6e9ad6 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -402,7 +402,7 @@ mmc@80126000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc0_a_2_default>;
 			pinctrl-1 = <&mc0_a_2_sleep>;
-			cd-gpios  = <&gpio6 25 GPIO_ACTIVE_LOW>; // GPIO217
+			cd-gpios = <&gpio6 25 GPIO_ACTIVE_LOW>; // GPIO217
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index b21e40da3dfd..ad9a20ccaaeb 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -362,7 +362,7 @@ mmc@80126000 {
 			pinctrl-0 = <&mc0_a_2_default>;
 			pinctrl-1 = <&mc0_a_2_sleep>;
 			/* "flash detect" actually card detect */
-			cd-gpios  = <&gpio6 25 GPIO_ACTIVE_LOW>;
+			cd-gpios = <&gpio6 25 GPIO_ACTIVE_LOW>;
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 6e586e875565..229f7c32103c 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -412,7 +412,7 @@ mmc@80126000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc0_a_2_default>;
 			pinctrl-1 = <&mc0_a_2_sleep>;
-			cd-gpios  = <&gpio6 25 GPIO_ACTIVE_LOW>; // GPIO217
+			cd-gpios = <&gpio6 25 GPIO_ACTIVE_LOW>; // GPIO217
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index ba4421080b2a..cdb147dcc1db 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -238,7 +238,7 @@ mmc@80126000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc0_a_1_default>;
 			pinctrl-1 = <&mc0_a_1_sleep>;
-			cd-gpios  = <&gpio6 25 GPIO_ACTIVE_LOW>; // GPIO217
+			cd-gpios = <&gpio6 25 GPIO_ACTIVE_LOW>; // GPIO217
 			status = "okay";
 		};
 

---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231212-ux500-dts-c5da6ca42a6d

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

