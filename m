Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB76CCA479
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7AB1C36AF7; Thu, 16 Jun 2022 00:54:49 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9482EC3411F
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9482EC3411F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id z14so8768005pgh.0
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QPYY8cZvI30w8ER/fK+cOf14ZzGBA9BCHkD+gscMWkQ=;
        b=fAHr1q19jOvEfXjfJCwZZ4/weAqlt59BmiKJ21gmjZpttPLpDWSBub46saR0/kU8p2
         mordBF/8pL175BqG1XfItzcvqQK8qJhrtftqdrawzBwS4vfrhkHozzDKgXpFaF6kRmKQ
         OISl6nq60X09yYuuHrNOBKsysg16jauFtiXRhmVNJNu96t+Pj2MHbQT++qUeIPfB0DPD
         7ZG8jIcQ/hdJBLKqE/3QentP50DVxY6KmGTbr8KEQ6DHspUra4SwuMi/efIglpbIvUem
         DWgrMzn2e+JnFsCnvL/KqO5oQ9g77F4tHIj//uueN8PPALYxV5D1aKPzfLey0pWS43ny
         7o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QPYY8cZvI30w8ER/fK+cOf14ZzGBA9BCHkD+gscMWkQ=;
        b=V2GwNwf3w3iHnoSmNNsIMoVk6tOZ5XNx5revZCHuO9VAlwTgQTXGMyC6E66cmNi8YS
         ULxlnNAhEmekgySAJMiW1p0P22b5Vnu936awGLDrAxc+c5UtYQspUzJNH0xmbsrkbM9x
         yTiUUYgyDTvuY63hkuFLiXrIcY8hTgWFRlRPpNuqSzOVVR2xD43wOn3qhdQvmi9dJf7m
         cXzh3EIWJTCcHpe+if905weSQGYQJjtUlRKnZxS2WEEC8JGR+RyLN2rGNcH4aVFGomF1
         STnOu/iCXgO1AUlOtf+I7Rpnol2neTNjACD+r7a3JviPZEAegwI36pvzd5KHNsl7qa5O
         18Pg==
X-Gm-Message-State: AJIora8xVDXFAUNxAIxTI8e5UcksTK1yJMQ6Nm+wdVbIpWbAv1GG1p7l
	1brG1u0wLOOSWwE3yfvYqYzI3Q==
X-Google-Smtp-Source: AGRyM1uvnLQUsVDSNQItG0K+yTguO+3RwCf4ArljnhzBEJnGMwmVLMrD7RgOmrRUPYMg1g+HCG89zw==
X-Received: by 2002:a05:6a00:4515:b0:522:cc82:79d2 with SMTP id cw21-20020a056a00451500b00522cc8279d2mr2118618pfb.61.1655340888304;
        Wed, 15 Jun 2022 17:54:48 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 37/40] ARM: dts: aspeed: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:30 -0700
Message-Id: <20220616005333.18491-37-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 --
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 --
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index afad8d732cc3..a6a2bc3b855c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -189,8 +189,6 @@ vga_memory: region@bf000000 {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		event-fan0-presence {
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index fc8222ea2dd0..bf59a9962379 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -179,8 +179,6 @@ pcieslot-power {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		event-fan0-presence {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 6f6a35fe2caf..3f6010ef2b86 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -65,8 +65,6 @@ event-ps1-presence {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		event-fan0-presence {
-- 
2.34.1

