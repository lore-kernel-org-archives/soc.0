Return-Path: <SRS0=bijT=UR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF70C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 14:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A925C385AC; Thu,  7 Apr 2022 14:30:34 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65DB4C385A4
	for <soc@kernel.org>; Thu,  7 Apr 2022 14:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65DB4C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id f18so6636706edc.5
        for <soc@kernel.org>; Thu, 07 Apr 2022 07:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zllbixT8uwwRAVX+QMa2CP3U9HgtcTg/FeMKsXjsUYM=;
        b=u6ATGlIv6X2WFKo3R1hVE/lTaoxaCg9Er9kklI3dOr/U/syEMPq5alKk5jKRLSoMz0
         J1ZJSvSIoN9sc//+nHCBPtYPO85jf7HtKRlDi6/+xycPUBMI2SL70ZUViNmFT21AZ4DJ
         6elP3inT+iiuIKDg3ER0qpTI1oXh3n/JciGaZu3NUGcXsCnP52+Fd0RcqClZkXxEce8l
         Tdrvr95CWJiNNqwFZuZ2zHGss0FyXg1bQbRB5zPrBLHMIYVpx3CnAaHdBCaFhNZD1gsa
         RzcQ7Hr7UKu1k9hwd0AOtLhQp9Q4FOhrST6VoIkOUXBaWI4WMReKUKkXb+V4KdbikNlc
         AE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zllbixT8uwwRAVX+QMa2CP3U9HgtcTg/FeMKsXjsUYM=;
        b=2EZojmSLqFFhh7e8RtjM7mXzjIpeaGFgNzJBDpoRz7qtW2S+Re1qYzZTzlU+gtEoJq
         49bdK4rCzJiANV+dn0gvM0nUypKSUAb5crhIrrrTCfY0Ld4fBZ82bnGNDYJ+8WC9pu5u
         KBlU7FP9E5KkKJJEABhOCxy60Ul/D/sN5eF+A7mKVhm1SOU4hrt4n6lW4KpoCKZBD0dy
         c64UQU8VO8v/HxafoEzQKKCnodfQij9NfklXbfnAm4vEQ1kL82Yb+xgBXEK9wZHiN4CL
         ET1uPKo984BVYPAD4kZ1pSzprXqvzMpMkG7PwuzHUdpr4lTpep9xwCDgvXv+1YrDkbtP
         tf0g==
X-Gm-Message-State: AOAM531+RoCOJf0c6eGD5xbJk0B88diqaRqsILHyZlAAYaibR9x77LZx
	BDygN+lfgbK5mWqhrKpu/OkJ6g==
X-Google-Smtp-Source: ABdhPJylvMQfZo0mmKmPVZrTGayBO1CUslG2f0TvN0gV6Pn8PN9mNCoe3csN+n6Mvj9EGmyt5P+V2g==
X-Received: by 2002:a05:6402:350c:b0:419:3d18:7dd2 with SMTP id b12-20020a056402350c00b004193d187dd2mr14847093edd.148.1649341830705;
        Thu, 07 Apr 2022 07:30:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id x9-20020a05640226c900b0041d015bb8a5sm1133039edd.26.2022.04.07.07.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:30:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Sekhar Nori <nsekhar@ti.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: align SPI NOR node name with dtschema
Date: Thu,  7 Apr 2022 16:30:27 +0200
Message-Id: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/da850-evm.dts                  | 2 +-
 arch/arm/boot/dts/dm8168-evm.dts                 | 2 +-
 arch/arm/boot/dts/spear1310-evb.dts              | 2 +-
 arch/arm/boot/dts/spear1340-evb.dts              | 2 +-
 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 2 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts            | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 87c517d65f62..e9aecac4f5b5 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -278,7 +278,7 @@ &spi1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_pins &spi1_cs0_pin>;
-	flash: m25p80@0 {
+	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm/boot/dts/dm8168-evm.dts b/arch/arm/boot/dts/dm8168-evm.dts
index 5126e2d72ed7..778796c10af8 100644
--- a/arch/arm/boot/dts/dm8168-evm.dts
+++ b/arch/arm/boot/dts/dm8168-evm.dts
@@ -177,7 +177,7 @@ &mcspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcspi1_pins>;
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "w25x32";
 		spi-max-frequency = <48000000>;
 		reg = <0>;
diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index 4cbadcb41084..ddd1cf4d0554 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -379,7 +379,7 @@ stmpe_touchscreen {
 					};
 				};
 
-				m25p80@1 {
+				flash@1 {
 					compatible = "st,m25p80";
 					reg = <1>;
 					spi-max-frequency = <12000000>;
diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
index fd194ebeedc9..3a51a41eb5e4 100644
--- a/arch/arm/boot/dts/spear1340-evb.dts
+++ b/arch/arm/boot/dts/spear1340-evb.dts
@@ -439,7 +439,7 @@ spi0: spi@e0100000 {
 				cs-gpios = <&gpiopinctrl 80 0>, <&gpiopinctrl 24 0>,
 					   <&gpiopinctrl 85 0>;
 
-				m25p80@0 {
+				flash@0 {
 					compatible = "m25p80";
 					reg = <0>;
 					spi-max-frequency = <12000000>;
diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
index 33ae5e0590df..ac53ee3c496b 100644
--- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
@@ -398,7 +398,7 @@ &qspi {
 	#size-cells = <0>;
 	status = "okay";
 
-	flash0: is25lp016d@0 {
+	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <133000000>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index e222d2d2cb44..d142dd30e16b 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -262,7 +262,7 @@ &qspi {
 	#size-cells = <0>;
 	status = "okay";
 
-	flash0: mx66l51235l@0 {
+	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-rx-bus-width = <4>;
@@ -271,7 +271,7 @@ flash0: mx66l51235l@0 {
 		#size-cells = <1>;
 	};
 
-	flash1: mx66l51235l@1 {
+	flash1: flash@1 {
 		compatible = "jedec,spi-nor";
 		reg = <1>;
 		spi-rx-bus-width = <4>;
-- 
2.32.0

