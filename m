Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B0CCA473
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FD93C341C0; Thu, 16 Jun 2022 00:54:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49905C3411E
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49905C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id e9so95964pju.5
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=;
        b=AmdVaSSwEogVe/9M1TOoUc2KNBC85KjowawNQ5OditenjCVKoATZy1xzGH0AWvY0PW
         +ruwOoIknYWN8oXkuND6gyo6SGV5QaVTkJmugDPEVIs9O/36GFB4YgbPqSFa/qlDyuuh
         oqY3gLkQ5my1bmTcQyGQquh7GIbxTRrpnmrUELsBEBSIMlKBR3fuUfSh+T8lrAc1WG90
         S3GSsuFxXJFDfFfg07AMTh+KhT3iOT9/WNT/6sHImC8K1kjtTJGbmYTpcO/k09QK3LZ/
         G4bF72u/oRkqYE5xDdIrzDbkDndwVAqfb9CK5GsZKWhUE337//+lRz6fuyGIx+HZmBgD
         qGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=;
        b=k2aHy8ovKWy2g3PmsVRMFNbV6xHHuxXtil3QUIyFgfQkwQ8xiuAsX6Iu3VHFjjc6FP
         5MKIZncgaHwbp7PDw+z7oTb3kZmA6uWCqtXKBQJY8OZ3YTDy39UzDm8qfQ934n2anMql
         S0AOBraFGZkvu8SPLWkXmfN5b0aoL+c5nhirVmJy/kxEVdVeZOVAjClo9fvVqakthLmw
         00pVCMLNs9J+QW7nlKlQEGdBfK+PO94ppGRd3xFn49lTr3ZwBXrQ6OtOayZaqxKFru8C
         slvITE3AHM388XpnNsRU4FaJB+j3rYbx06W+U8T6/HJikHAXOUKYLU/ZHKVLI0oAkG2N
         Y4RQ==
X-Gm-Message-State: AJIora/xQYgNhB73Ws77FNr0wFqC1m72uHGZZ/aM5hLfY+cCD9moLLA6
	cYe+ffN7FNcdZ7koSyF7lMp8cYZGQRPYdw==
X-Google-Smtp-Source: AGRyM1sNObqkH52c07IQavirEDgcKWdNXNYQtVpTlkyBYahg7ZgiY+wBXJWdOuZmeBkQ5uH7e65xHw==
X-Received: by 2002:a17:902:cec2:b0:166:4e45:e1b2 with SMTP id d2-20020a170902cec200b001664e45e1b2mr2353533plg.73.1655340856999;
        Wed, 15 Jun 2022 17:54:16 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 16/40] arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node names with dtschema
Date: Wed, 15 Jun 2022 17:53:09 -0700
Message-Id: <20220616005333.18491-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
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

