Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA261C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EFD8C3411B; Thu,  9 Jun 2022 11:39:31 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA58DC385A2
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA58DC385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id o10so30787548edi.1
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moyo8KWDYD1Sw7v39IoJtDJxVuleCUkjc8zzaL8h67s=;
        b=aY58Eyp/oD4ErEbOY4zHZiaIvRUCdLzGhe26XILJWGeJ5qA1isPZOhDq5/RqXtUQZf
         XBklI52EapnvH2OPYq9DNGaULO94GxSobSDDq7clP59LhTHITTlvxzMBoYMMs04H3p4C
         HiHcYqoiY6nBx91Zb/DGOhgCNr03qzvP5M0mgdJTQJaG3xSPwOT193YOXoHqmd2d0NLU
         4ZIHD0jukYdjF774IvCk3cwq6giHMxc7EHu+B2DPGoB4H+BoiH9GmflcLkSplsPLMgIY
         t1abRppSqVEzXBJJ6aVnT5Zvy8xf2ZqcMaZVfkM/ssdp8i3XHlvkA6eMbccro8MbW3w0
         vMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moyo8KWDYD1Sw7v39IoJtDJxVuleCUkjc8zzaL8h67s=;
        b=qrm9QhHVxj2RlIgJkaOVyMzsWsWgx5Zdgw4fvgffc8BYv5G4wKgqwOKiQ+JqWxwdlA
         wO5HOYQrkfk7TGWITBxSGH0+Cu0Lp5EctCpFqrRnANRHVrQF24zaidZgo0bMWV8oqkwB
         SOgYMvqcvwiJgUM7cA0Kt5oKtZ05OMN5AT+tNgzXSa5daa7Gu5u+Yl9KSQlgtqAXwIz9
         F7Hvu+Vk+vTDVgoEDvgB0+CoyUPEbv6XknRzb7h5kB6W8mQn84+iwEpvUSfs/VO016Bf
         fCMppa8aHvlOxgL8IIQzuhFBc3QyLuZfW072/LN4xrDQj/nslqnI38xfhUciLMlC+9fR
         ao4w==
X-Gm-Message-State: AOAM531+gTQ/s9SfYmhSq3vUAoZHqvhGOYCb9S86dxQRQxei5Dvju0Qd
	TPsjbrPnnE2vyBaSYUt8LQxT8A==
X-Google-Smtp-Source: ABdhPJxNWpQCygCIS3enUIsR+XqOJyd9NdAUtnRSVKLoNE/vwqCX3MSchbBiqeaPMSb5jXkyLlQBhg==
X-Received: by 2002:a05:6402:5212:b0:42e:2fa:41a7 with SMTP id s18-20020a056402521200b0042e02fa41a7mr44238163edd.22.1654774770535;
        Thu, 09 Jun 2022 04:39:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/48] arm64: dts: amlogic: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:10 +0200
Message-Id: <20220609113911.380368-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index a5d79f2f7c19..603337ca5608 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -48,7 +48,7 @@ emmc_pwrseq: emmc-pwrseq {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		key1 {
+		key-1 {
 			label = "A";
 			linux,code = <BTN_0>;
 			gpios = <&gpio GPIOH_6 GPIO_ACTIVE_LOW>;
@@ -56,7 +56,7 @@ key1 {
 			interrupts = <34 IRQ_TYPE_EDGE_BOTH>;
 		};
 
-		key2 {
+		key-2 {
 			label = "B";
 			linux,code = <BTN_1>;
 			gpios = <&gpio GPIOH_7 GPIO_ACTIVE_LOW>;
@@ -64,7 +64,7 @@ key2 {
 			interrupts = <35 IRQ_TYPE_EDGE_BOTH>;
 		};
 
-		key3 {
+		key-3 {
 			label = "C";
 			linux,code = <BTN_2>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
@@ -72,7 +72,7 @@ key3 {
 			interrupts = <2 IRQ_TYPE_EDGE_BOTH>;
 		};
 
-		mic_mute {
+		key-mic-mute {
 			label = "MicMute";
 			linux,code = <SW_MUTE_DEVICE>;
 			linux,input-type = <EV_SW>;
@@ -81,7 +81,7 @@ mic_mute {
 			interrupts = <99 IRQ_TYPE_EDGE_BOTH>;
 		};
 
-		power_key {
+		key-power {
 			label = "PowerKey";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
-- 
2.34.1

