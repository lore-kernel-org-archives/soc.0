Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB14AC433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95C1EC3411F; Thu, 16 Jun 2022 00:54:15 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4305C3411C
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4305C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id cx11so113772pjb.1
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P9oBYdB3cH6UNLeExvbtuDOVwCrp/TsONqfDaucXFbw=;
        b=fQc9yWGYc4aF3r20S4OLYpi0jtu02XyI+PuIJg9jbHN26FDwSVSsZqrj9DAIsieM/v
         cwrKTb6gdviRm42Me/9e/6Fy9BkUWhtpy2Q4h7hVKi1tEM/4aM7iYNlhrGLGsaYtDo3N
         OZTPHGANBb1zE+nzKDJv3VvHOSLJh6lUhPU+sLL16sjHGIH31USM60BonRnqWYKD5bOv
         kHT2gVB4OPjMOe6Ip4I4Fc4VrpvVeHhdJVK607BrYoTOqwlhf+dtOlBUvR2uAox5q5yv
         o6J1s6YiTXEjzDA9+g6jm1wAFsOv+jXtUTXYz2e8T9IOIAD2lx1WFQvm4T3vJ/AKMMCe
         4ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P9oBYdB3cH6UNLeExvbtuDOVwCrp/TsONqfDaucXFbw=;
        b=tZdLVbLmPDihEaX0P3vepArpbibdwib2YCfv30rWqbs/5qXn1lJ9+nDoebrVofPLyr
         4DakB63wWjkV5FTEc3A4oxsjkgpwVctb6QigoMzqR0PjQe9QdJNPWRPZUMjHESmlv5a8
         NjL3zx7oVa4eWHfqvWyDfUeym1BFxa0fSoJ5O3PQwLiGRmQvpezaXwT6/62uzvTi2hAm
         jIjKSX2t4T6EwikCH5hIlzaAWifaSEF5OghcWZvUfqMNYlSXT0Mb9o/62bPMZsL0HzsU
         8w8UVNQsvAqbUMtGwBycCjAB8xm9SWcklmIhsjE4d7IVSfvzLUWuaOZ5A+tQDNsThl62
         5CYA==
X-Gm-Message-State: AJIora+65xcaCwKbIoP6yEHjZCKpRYn0k7qjhezo6rJRcs5SaA2Lj5GB
	uTGGQ+v+G/WHxoTs1S75CGnGeQ==
X-Google-Smtp-Source: AGRyM1s6OVG6xEuP4DtTT5aZX2ix8Joz5MjrvSJVaXeJFA0xFTzgMaSZOA5oXUPF+pF4DfSjc1KzoQ==
X-Received: by 2002:a17:902:9f96:b0:163:dc33:6b72 with SMTP id g22-20020a1709029f9600b00163dc336b72mr2383036plq.34.1655340854277;
        Wed, 15 Jun 2022 17:54:14 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 14/40] ARM: dts: marvell: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:07 -0700
Message-Id: <20220616005333.18491-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/armada-370-rd.dts                      | 2 --
 arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi       | 2 --
 arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi | 2 --
 arch/arm/boot/dts/armada-xp-axpwifiap.dts                | 2 --
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts            | 2 --
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts         | 2 --
 6 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-rd.dts b/arch/arm/boot/dts/armada-370-rd.dts
index c910d157a686..6ba7699b69ed 100644
--- a/arch/arm/boot/dts/armada-370-rd.dts
+++ b/arch/arm/boot/dts/armada-370-rd.dts
@@ -84,8 +84,6 @@ usb@51000 {
 
 			gpio-keys {
 				compatible = "gpio-keys";
-				#address-cells = <1>;
-				#size-cells = <0>;
 				button {
 					label = "Software Button";
 					linux,code = <KEY_POWER>;
diff --git a/arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi b/arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi
index cf7bffdd1c21..866b8630d407 100644
--- a/arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi
+++ b/arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi
@@ -108,8 +108,6 @@ gpio-fan {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-power {
 			label = "Power button";
diff --git a/arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi b/arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi
index 6c33e3ba4ffb..702a85af2078 100644
--- a/arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi
+++ b/arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi
@@ -83,8 +83,6 @@ regulator@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		button-power {
 			label = "Power button";
diff --git a/arch/arm/boot/dts/armada-xp-axpwifiap.dts b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
index 86a0ad9bd5cc..5a74197be0ad 100644
--- a/arch/arm/boot/dts/armada-xp-axpwifiap.dts
+++ b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
@@ -71,8 +71,6 @@ ethernet@74000 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		pinctrl-0 = <&keys_pin>;
 		pinctrl-names = "default";
 
diff --git a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
index 51b2eb8bb4fd..622ac40dd164 100644
--- a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
+++ b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
@@ -174,8 +174,6 @@ bm-bppi {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		pinctrl-0 = <&keys_pin>;
 		pinctrl-names = "default";
 
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index ff698d6ebb87..1ecf72a61bca 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -99,8 +99,6 @@ green_led {
 
 			gpio-keys {
 				compatible = "gpio-keys";
-				#address-cells = <1>;
-				#size-cells = <0>;
 
 				button-init {
 					label = "Init Button";
-- 
2.34.1

