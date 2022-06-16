Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3FFCCA473
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87E1AC3411A; Thu, 16 Jun 2022 00:54:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E738EC385A2
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E738EC385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id t2so20412pld.4
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Vomts4VmbqvFQPOL2ceI/hWwepbwm4BG8ZS+YMOGeM=;
        b=RMYupGnPOpuGbxL+j/mOKPQxchJTm9gdAW8O3N7c5LD15PUMEfbScpik3d+ikdvZog
         +T5xSYVsqKagsiKKzU5RiNpinzAbt/IPlHyAFRvibosYAWrR79/XjlsOJyPUGxkNWn66
         39bgeZhuJ0Bt5zp8wfLEmnaRqpewfWpyc+MDggdLnM+8Qy73wABoJqsQ3dqU+oQwtjvb
         +dL18n5Rnlxizrm1Q/JU+bKbdlA1FFDITp9Xh8bJtD/kbjCPAQUMU3irekgyBU0zMXs2
         6nPpKrj6hO5CH613QCfgjUhPJsBSS35GucCsxiTzkO8ds35rPvwjVgl4DBbzDOnsHAGv
         xoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Vomts4VmbqvFQPOL2ceI/hWwepbwm4BG8ZS+YMOGeM=;
        b=l6/YR3lpCIpGcy2wbXGtIH0tU+152xjhFwA7a7szqtxmjckC3/Tgk/k5lh9DZM0Gjz
         5k9AvO9qP43742nQuSRCiy0mM/mxIq7mGMc8eEpYNZPpcRB9rqMX9qXzRKdzr31kNCsy
         HH6HtlREBU4lTT4hCkZJEaifyfch58ZKYnmyhMCUmYUS7F43j0VevYqrcJVGI3yFi9N2
         vEBvPg5pB6T9DsWhw3PBVOToHLB6HYwL+lncjj8c+tQ/FZCHhHWWGiYK80QQ6AkMlbgf
         XsFurLI55bJZZFBlesAPpkRo01ifk3ae/Ma7Ry/M6ePO9hqi+GkcqWZeQA/UhO6XtEah
         FTrg==
X-Gm-Message-State: AJIora9hvVvTqrl4DiH9j0ln3MaVoyBlrXJBWl0x81rDpcAaOxLvb0OC
	nPh1miB/kFABhIod1DGdHW1+SQ==
X-Google-Smtp-Source: AGRyM1t+KymAIQRuqWy/mRILx38eaGMZzrgQK/Zp/YywmnGMoYPs/P8xrZj2uSJ7yaj7neJ4SWiSNg==
X-Received: by 2002:a17:902:b68c:b0:167:95e2:f822 with SMTP id c12-20020a170902b68c00b0016795e2f822mr2108356pls.128.1655340893636;
        Wed, 15 Jun 2022 17:54:53 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 40/40] ARM: dts: at91: drop unneeded status from gpio-keys
Date: Wed, 15 Jun 2022 17:53:33 -0700
Message-Id: <20220616005333.18491-40-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes do not need explicit status=okay.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts          | 1 -
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts | 1 -
 arch/arm/boot/dts/at91-sama5d2_icp.dts        | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index 838353a42097..1432732e163b 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -80,7 +80,6 @@ gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
-		status = "okay";
 
 		button-1 {
 			label = "SW1";
diff --git a/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
index b55e8fb113b1..e1158755008b 100644
--- a/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
@@ -31,7 +31,6 @@ gpio-keys {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
-		status = "okay";
 
 		button-1 {
 			label = "USER BUTTON";
diff --git a/arch/arm/boot/dts/at91-sama5d2_icp.dts b/arch/arm/boot/dts/at91-sama5d2_icp.dts
index 38f0e1ae6ae6..0ba73df5cda7 100644
--- a/arch/arm/boot/dts/at91-sama5d2_icp.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_icp.dts
@@ -47,7 +47,6 @@ gpio-keys {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
-		status = "okay";
 
 		button-1 {
 			label = "USER_PB1";
-- 
2.34.1

