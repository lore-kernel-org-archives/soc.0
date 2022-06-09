Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B781C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5126C341C7; Thu,  9 Jun 2022 11:40:14 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A999C34114
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A999C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id n10so46927026ejk.5
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=;
        b=yVmsRslMEUy7wlHAqgMJFz72yzFAB5LWmuXwc4lfybSFvT3pJvwKfsMXOpG8Puc1dD
         tUDQdzsuJ1GhS5m1t3K1uoPGE09QfML9JqzWT+yOPdMgxllbLb5NByOiPpxregbU5Qcq
         92H0Vw4/mfkcG+kehOeqpgbKYMxUEs1BO4C2Yv3SXqqZKkZut1xVnDwt2k4ZikG+8A+f
         EKHKFcO+T+FVtl8kEVHkS5E3E/9D+4z9TZjw6dgqIDnAb+MELuBv8wgFSZXT10dWWRlr
         7QpOxpDw/5wLtngLULFgEF8ZB+0TZ8rbtn8MJxHDuqrRGMP5fbHQCUFGpbzAFVldeB7B
         1yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=;
        b=DWeo8ZcZEEQs3jLYTBNHJ6RwuDL0LdXwB9+1H5DuyAfFWrcyU+tZOyuaY84rENXKVD
         B90X67FI4dY23h0MasqDVlJmNYs1TUPxMxUiq3LUiet3S1SajxrlJzVgUIov+V+lRPhY
         v04AUhTVKxwlTgF/CG68EJV/cLW81KtGOW4A5x3qXpCVEsar8Owbij3xFzSd45ZhL6xn
         yvarj0DKwUc5rPE1Ju+w9wkd/qgF2ywyu9g/xx2fqJ6akscak+sgwgCsYAcgs1h4E48c
         JxB9PTeRccgBngmK8hCveCsinWqVPiA9tRiYl43E5ncPFtGLor5prLTzgDISCOOypseA
         nLcA==
X-Gm-Message-State: AOAM530W8uT/qe+ibY1/v322JJY6MAKyHA1j7FOffbGdoL4801G5cvbk
	X3sU+BOliTXEX+Qaeda90vwYEg==
X-Google-Smtp-Source: ABdhPJy4nNBXEdz+l/Sj3rWUAf/e1lV1tSllqUAwXDG63YFIeAVjqjH96BstlWGTQkxOJxGYYXiQCA==
X-Received: by 2002:a17:906:acb:b0:709:d274:611b with SMTP id z11-20020a1709060acb00b00709d274611bmr35686861ejf.147.1654774811641;
        Thu, 09 Jun 2022 04:40:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 22/48] arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node names with dtschema
Date: Thu,  9 Jun 2022 13:39:55 +0200
Message-Id: <20220609114002.380563-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
with 'led'.  Use generic color properties instead of the node name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index c2311733d2de..7d1ecf72a6c3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 #include "mt7622.dtsi"
 #include "mt6380.dtsi"
@@ -56,14 +57,16 @@ wps-key {
 	leds {
 		compatible = "gpio-leds";
 
-		green {
+		led-0 {
 			label = "bpi-r64:pio:green";
+			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pio 89 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		red {
+		led-1 {
 			label = "bpi-r64:pio:red";
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&pio 88 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
-- 
2.34.1

