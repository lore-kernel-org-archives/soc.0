Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56113CCA473
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40388C3411B; Thu,  9 Jun 2022 11:41:03 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4377C341C0
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A4377C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id s12so39692268ejx.3
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a7AVzyUmsqVPd91IAsbJZXPj8ozhTONPXm6ECNLQgio=;
        b=bzsQQpQMea7pB37AbYmp+iBb7tzYIqsnIH+vEjHsewmVTalQt/P9huDagHIU1AoTzX
         IuAnjSxsWyyjGE/U4REcA9LfcCp5Yv9++0CLm3752tv8d90EK1HXsBRLn58XM9/i4Lht
         b2nw/fa9JlAoV2BL80uH0iM6BOxSJSKR6bdw5DE2PDIGUiWJya6jHOoDONihw/AK4onp
         ECCmAa5j2ewt/2OdlndAjdq0mjXnw+FHVUWq+PYy1OaF/lgsWz858DmZreIkbqTmwQJE
         AM2CEKeqoIoiJg3UleZwjMSiD81bQizM47IhZjeCLLg+D6BXZ62wwTyl4UyIOxHhw1+B
         E0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a7AVzyUmsqVPd91IAsbJZXPj8ozhTONPXm6ECNLQgio=;
        b=BbDwbQUkh3l3bsuFB0O1HMz8AvlyieMepOTYqd92EgF30EIYf6b35SSFaeXsBNBLPJ
         NeW1RauI/KLo3+aLcJamDgQjKMWI5P37qiV2HwNBgu4vAnZkaNOkVDyoUULat16hp2V+
         IZ64ay9jJjOOZqf+xX0kYoKGcPzuYqOBnkOYPcbYVAleCSFn/Hd7kAuIu/S28vaGOm6f
         i7DtfLuqrwjdgY8znOYK8qOr9DLGDs/jT7wyerJctuxiDCijtjq6GHaT2CaNGWbS0s3I
         TIGVajdd9mcOCro5stXdVHatrr6QXBK3UclnoA0H+HCieFGOffignCVv/Jfd97DITL9I
         nIsA==
X-Gm-Message-State: AOAM531wrel9GVpNr3O3xtEzmqUcb1Xox9JzpurKsaGoezgwXPthxcCD
	rajjA88HBPdjz5ZYhgB3hhqL1A==
X-Google-Smtp-Source: ABdhPJyWwogLsE1DiHbVVqhQ4XJnLO8mzMs5f7M6JmVUARXRdLSDMkAYFuzgelKC5xtHU6wFcSHc0Q==
X-Received: by 2002:a17:907:968e:b0:6f4:d80f:f0c3 with SMTP id hd14-20020a170907968e00b006f4d80ff0c3mr33787314ejc.145.1654774862082;
        Thu, 09 Jun 2022 04:41:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170906b0c200b006fef557bb7asm10498662ejb.80.2022.06.09.04.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:41:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 46/48] ARM: dts: at91: drop unneeded status from gpio-keys
Date: Thu,  9 Jun 2022 13:40:45 +0200
Message-Id: <20220609114047.380793-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes do not need explicit status=okay.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts          | 1 -
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts | 1 -
 arch/arm/boot/dts/at91-sama5d2_icp.dts        | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index 7bf99bdbafcf..ade07b9eb101 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -80,7 +80,6 @@ gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
-		status = "okay";
 
 		switch-1 {
 			label = "SW1";
diff --git a/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
index d5652c974748..bd5422495306 100644
--- a/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
@@ -31,7 +31,6 @@ gpio-keys {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
-		status = "okay";
 
 		switch-4 {
 			label = "USER BUTTON";
diff --git a/arch/arm/boot/dts/at91-sama5d2_icp.dts b/arch/arm/boot/dts/at91-sama5d2_icp.dts
index d7b59e16a081..0023b9d74651 100644
--- a/arch/arm/boot/dts/at91-sama5d2_icp.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_icp.dts
@@ -47,7 +47,6 @@ gpio-keys {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
-		status = "okay";
 
 		switch-4 {
 			label = "USER_PB1";
-- 
2.34.1

