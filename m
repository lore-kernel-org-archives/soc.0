Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546BFC433FE
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E0EAC34113; Thu, 26 May 2022 20:45:38 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9354C34116
	for <soc@kernel.org>; Thu, 26 May 2022 20:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9354C34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id q21so5201513ejm.1
        for <soc@kernel.org>; Thu, 26 May 2022 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h+A3qo6BldJs7yB/PUZIl3d+cRoad7gVEXVoqQHqU1I=;
        b=bsgklBTJ5kRGLaDjr1BfSDjF1LVpD2uDeE4Cb6TesbVm7pPQRfsRxCEA3IhYwiCk29
         uPGnS1ku5A8/1gUu1EBhlwaWa4l1MW35jGgmfYB12OYCt14rnwHUI5mdm4ZyGbL7rGTb
         PcIeDNiDsgUlpgkLZUg/70YBUS6aKSK2bMKe26r1SgMtkl25sWih7r/kV0mbctgGmDG0
         LubrrOByyAJe7+gV37x9aH6a5r6oEZysuurR1wjxszu3tiQ9w+KPQESd0lEnYJwvcqQN
         jnjUBv/GlpyQ9oy8zoaP8pj8NBmNvOFMWBkHdcqHVkA1qROpQVMsLoqjZ6rKD0kNPOzX
         hKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h+A3qo6BldJs7yB/PUZIl3d+cRoad7gVEXVoqQHqU1I=;
        b=VCLZoNPkFLvHFNAJ9HufhcN1JYoTUgMTEUlpK/SJZUKBCWMe2O92rfTTO9r/6v6JJB
         B6ysmADV+3V2jnBpG1WLvO4QvKDVkqLjjE+r5KZ4Rc8h6fGgIH1/rZZva+BYd1dTEwdo
         aBQUWSbnlGeqEHYzXzUSqOPj2Q/4DQy1wGIihoVDeoTHf5C2WdFmMet0RZsDQ5UJZHVG
         dW668OsHZETloQdNFsfq9TR0p872LQOJ6W1H2wjStN3RJJd+7Ga9OQKBdprSbXGyt4ym
         8Msly/RLB7OJqPyAWj49S9XqMhk3iDujuyAOiXOEQQ2iEZDxgic7u37GQIeJ7rL4CVfH
         6Q8A==
X-Gm-Message-State: AOAM532Q1lz1tp6M+rErOOQSjuwmAbsklCXLeBKjGRNTriD3YdCV66H5
	yKlhO0iVGNCN74CQRoY+Qi43VA==
X-Google-Smtp-Source: ABdhPJxbfx0ehewyZhx++Y7dMO9l/5GqNy/H+1t0rKskIYQrY9Sk4ZR/QsPiB+GGpu0kCkRrHSGEWA==
X-Received: by 2002:a17:906:99c3:b0:6ff:1254:7227 with SMTP id s3-20020a17090699c300b006ff12547227mr8743993ejn.692.1653597932074;
        Thu, 26 May 2022 13:45:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id rv3-20020a1709068d0300b006fec69a3978sm769550ejc.207.2022.05.26.13.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:45:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: pxa: adjust whitespace around '='
Date: Thu, 26 May 2022 22:45:25 +0200
Message-Id: <20220526204525.832847-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204525.832847-1-krzysztof.kozlowski@linaro.org>
References: <20220526204525.832847-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/pxa300-raumfeld-common.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/pxa300-raumfeld-common.dtsi b/arch/arm/boot/dts/pxa300-raumfeld-common.dtsi
index 8a6721d436bd..147c99191dc2 100644
--- a/arch/arm/boot/dts/pxa300-raumfeld-common.dtsi
+++ b/arch/arm/boot/dts/pxa300-raumfeld-common.dtsi
@@ -189,31 +189,31 @@ max8660: regulator@34 {
 
 		regulators {
 			regulator-v3 {
-				regulator-compatible= "V3(DCDC)";
+				regulator-compatible = "V3(DCDC)";
 				regulator-min-microvolt = <725000>;
 				regulator-max-microvolt = <1800000>;
 			};
 
 			regulator-v4 {
-				regulator-compatible= "V4(DCDC)";
+				regulator-compatible = "V4(DCDC)";
 				regulator-min-microvolt = <725000>;
 				regulator-max-microvolt = <1800000>;
 			};
 
 			regulator-v5 {
-				regulator-compatible= "V5(LDO)";
+				regulator-compatible = "V5(LDO)";
 				regulator-min-microvolt = <1700000>;
 				regulator-max-microvolt = <2000000>;
 			};
 
 			reg_vcc_sdio: regulator-v6 {
-				regulator-compatible= "V6(LDO)";
+				regulator-compatible = "V6(LDO)";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 			};
 
 			regulator-v7 {
-				regulator-compatible= "V7(LDO)";
+				regulator-compatible = "V7(LDO)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
 			};
-- 
2.34.1

