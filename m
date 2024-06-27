Return-Path: <SRS0=R/gl=N5=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DAEC2BD09
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 19:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4376C4AF07; Thu, 27 Jun 2024 19:57:48 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A4FAC2BD10
	for <soc@kernel.org>; Thu, 27 Jun 2024 19:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A4FAC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-584ef6c07c2so1582656a12.1
        for <soc@kernel.org>; Thu, 27 Jun 2024 12:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719518264; x=1720123064; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PDeAmfaYzBBSB1Ul28Pp2fOx8LKzViQ32LlBQMV4m98=;
        b=ZR4gpP5OSnRz6YCAJhUzbrQmdiGwXpaWUj1niBfFyLWClearJAo0Nr/sJtAik9SNgh
         hhcfUdmbwr7cXEMcmcFWXB3Eytwjg6krJ10CobjSGiRviS0NPTsCLwDs2Sk10D7kIbJh
         HvqnO27t7qOSXV2opbv6KcZB2b8EnFL0leAzMFH3Qff5AhfJzR/lBzbQZzS8+LUdqdVP
         EgT0iPkfSxgo/cyRZt13W//t5dIr4Kgo330XYAyPB/Ai3K5pf4l3pzxDqHYTKeM83tdB
         09zVKsFoXsNJaZWFVyfaZvzL3lW3tyLkCpitMteBe0BsKeQCxP5cu2GbwosjHOUbV2PY
         grPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719518264; x=1720123064;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDeAmfaYzBBSB1Ul28Pp2fOx8LKzViQ32LlBQMV4m98=;
        b=dmxsiidwHfcwVQoBOS2CFjO0jbTWbx+Lpl8VrcnQUM3nFUvdAzX1KCL6HRst7BC2Xr
         BaUrZceKNKytN2QwzV7CM+oN+LIzGQQuatTtq0q4zJeI6VESq97KqX50fujwFZWYBsYD
         sgJVp4jlrvQEgFVv368W+t4A4QbfiwKF0YNIokUR/rWWF+YT7Vwf11/EyjwTU5uoXfIp
         P9zr6BLK2dU+4uvzXp0SlOiRik74Sqb7Gz9wziIBfInF+wYUL1mKGu8ruqnM5hkZPxXW
         bdhaP0SbdjymuyBHCL9EwfGHVt7ehiq7oQwIc7tEIOou1+cxHm7j1nSjd4Ln5NzyXiGP
         CWqg==
X-Gm-Message-State: AOJu0Yyh6JU+f0NSAs8hLOsAtw5CgwYz1fF7bVt2Xf/C/A5CgCOsgGd9
	7XPcUr0xvjyIkmjefoEC/eXMDPBbXVXWAOhJYPK2Ms5QL62mywc0+nhKvrIKKBSm+e9WGENH6Kt
	0
X-Google-Smtp-Source: AGHT+IFDQV9kcsn5mDWnyRIMe3sNpZ5cXcugalXuKW8H4apEfw5iwEyNy27FeDAwQz+WWatVpiCv9A==
X-Received: by 2002:a05:6402:51d0:b0:57c:6b49:aef with SMTP id 4fb4d7f45d1cf-584bc39dfdfmr2844586a12.11.1719518264480;
        Thu, 27 Jun 2024 12:57:44 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861315914csm93976a12.21.2024.06.27.12.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 12:57:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Jun 2024 21:57:38 +0200
Subject: [PATCH] arm: dts: arm: Drop redundant fixed-factor clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org>
X-B4-Tracking: v=1; b=H4sIADHEfWYC/x3LSwqAMAwA0auUrA3UKBa8irgoTdQs/NCICOLdL
 S4fwzxgklUMevdAlktN962grhykJW6zoHIxkKfWdxQw5hX5NJz0FkMOXdMQS/KBoTxHlj+UZRj
 f9wOfgugTXwAAAA==
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, uartclk@14.74M{
X-Mailer: b4 0.14.0

From: "Rob Herring (Arm)" <robh@kernel.org>

There's not much reason to have multiple fixed-factor-clock instances
which are all the same factor and clock input. Drop the nodes, but keep
the labels to minimize the changes and keep some distinction of the
different clocks.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/20240528191536.1444649-1-robh@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this directly for v6.11.
---
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi    | 42 +--------------------------
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts | 34 +---------------------
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts | 42 +--------------------------
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi   | 42 +--------------------------
 arch/arm/boot/dts/arm/integratorap.dts        | 10 +------
 arch/arm/boot/dts/arm/mps2.dtsi               | 34 +---------------------
 6 files changed, 6 insertions(+), 198 deletions(-)

diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
index fbb2258b451f..ed3ed5a4f0f7 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
@@ -53,7 +53,7 @@ vmmc: fixedregulator@0 {
 		regulator-boot-on;
         };
 
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: mclk: kmiclk: sspclk: uartclk: wdogclk: clock-24000000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -67,46 +67,6 @@ timclk: timclk@1M {
 		clocks = <&xtal24mhz>;
 	};
 
-	mclk: mclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	kmiclk: kmiclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	sspclk: sspclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	uartclk: uartclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	wdogclk: wdogclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
 	/* FIXME: this actually hangs off the PLL clocks */
 	pclk: pclk@0 {
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
index d99bac02232b..ab2c9b71da69 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
@@ -63,7 +63,7 @@ veth: regulator-veth {
 		regulator-boot-on;
 	};
 
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: mclk: kmiclk: sspclk: uartclk: clock-24000000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -77,38 +77,6 @@ timclk: timclk@1M {
 		clocks = <&xtal24mhz>;
 	};
 
-	mclk: mclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	kmiclk: kmiclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	sspclk: sspclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	uartclk: uartclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
 	/* FIXME: this actually hangs off the PLL clocks */
 	pclk: pclk@0 {
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
index 89103d54ecc1..a4c2d96aa5c8 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
@@ -163,7 +163,7 @@ veth: regulator-veth {
 		regulator-boot-on;
 	};
 
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: mclk: kmiclk: sspclk: uartclk: wdogclk: clock-24000000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -183,46 +183,6 @@ timclk: timclk@1M {
 		clocks = <&xtal24mhz>;
 	};
 
-	mclk: mclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	kmiclk: kmiclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	sspclk: sspclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	uartclk: uartclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	wdogclk: wdogclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
 	/* FIXME: this actually hangs off the PLL clocks */
 	pclk: pclk@0 {
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
index ec1507c5147c..61dbe041c69b 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
@@ -62,7 +62,7 @@ veth: regulator-veth {
 		regulator-boot-on;
 	};
 
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: mclk: kmiclk: sspclk: uartclk: wdogclk: clock-24000000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -82,46 +82,6 @@ timclk: timclk@1M {
 		clocks = <&xtal24mhz>;
 	};
 
-	mclk: mclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	kmiclk: kmiclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	sspclk: sspclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	uartclk: uartclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
-	wdogclk: wdogclk@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
 	/* FIXME: this actually hangs off the PLL clocks */
 	pclk: pclk@0 {
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/arm/integratorap.dts b/arch/arm/boot/dts/arm/integratorap.dts
index d9927d3181dc..27498e0f93f6 100644
--- a/arch/arm/boot/dts/arm/integratorap.dts
+++ b/arch/arm/boot/dts/arm/integratorap.dts
@@ -57,20 +57,12 @@ chosen {
 	};
 
 	/* 24 MHz chrystal on the Integrator/AP development board */
-	xtal24mhz: xtal24mhz@24M {
+	xtal24mhz: pclk: clock-24000000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
 	};
 
-	pclk: pclk@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clock-div = <1>;
-		clock-mult = <1>;
-		clocks = <&xtal24mhz>;
-	};
-
 	/* The UART clock is 14.74 MHz divided by an ICS525 */
 	uartclk: uartclk@14.74M {
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/arm/mps2.dtsi b/arch/arm/boot/dts/arm/mps2.dtsi
index ce308820765b..d930168fbd91 100644
--- a/arch/arm/boot/dts/arm/mps2.dtsi
+++ b/arch/arm/boot/dts/arm/mps2.dtsi
@@ -78,7 +78,7 @@ spicfgclk: clk-spicfg {
 		clock-frequency = <75000000>;
 	};
 
-	sysclk: clk-sys {
+	sysclk: spiclcd: spicon: i2cclcd: i2caud: clock-sys {
 		compatible = "fixed-factor-clock";
 		clocks = <&oscclk0>;
 		#clock-cells = <0>;
@@ -102,38 +102,6 @@ audsclk: clk-auds {
 		clock-mult = <1>;
 	};
 
-	spiclcd: clk-cpiclcd {
-		compatible = "fixed-factor-clock";
-		clocks = <&oscclk0>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-	};
-
-	spicon: clk-spicon {
-		compatible = "fixed-factor-clock";
-		clocks = <&oscclk0>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-	};
-
-	i2cclcd: clk-i2cclcd {
-		compatible = "fixed-factor-clock";
-		clocks = <&oscclk0>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-	};
-
-	i2caud: clk-i2caud {
-		compatible = "fixed-factor-clock";
-		clocks = <&oscclk0>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		ranges;

---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240627-arm-dts-fixes-d76332dec07d

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

