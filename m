Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234D9CCA473
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E441C341C0; Thu, 16 Jun 2022 00:54:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DF26C3411E
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DF26C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id y6so85950pfr.13
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ouHToTpfN91IdC1bQjCsmRZ9s0XMaKvgoUPDfBZdkoE=;
        b=eTXdnaUwhzo9kXPhguu9D3DUUGikVbQltlkxpd3bNBqjlbVPE9rDJuWopEEQFOIKQQ
         FAJ/nG7vLIJX0i/BzyWGtp4988gGMYzs760xhCChCb7FZZrfmfdZFSmW4UhBm68uucQd
         kgCuGxThR/vdsfYnV9vbUTQO38EooKHKBHhLGS1M0XujGGlRqPEwJ6kgZtBEzRdxGEXp
         1Lb//lM9H4gukp8g0JO7H/NvBlHzU6Iu31u36d7+/hXQdWEO0wZHTiEL+oM9OZaSYSYm
         Di9RAg90nYEQhrRP/ilX8lp85wYUHKClYZYxwttPQw4X7txhbrfC9rBWpw/ZMjWtAQxw
         yweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ouHToTpfN91IdC1bQjCsmRZ9s0XMaKvgoUPDfBZdkoE=;
        b=V1deBhdcriMgom6ivabyGxj44gJJRWs/Pqxj2OyMO0A4K5qBnxiQGlGIU+wKYzSsFV
         FoYRTyMSraLBNOqfsI6upKi8kJv0BTYArF0ialwF6kBRXy5djttv5XViZAc6ya3DxZIm
         24eT4VU0WuZXrQSCcEbA+Owq1qPrelbOfM/6nVuoSkQRvsp/gm80igHn48Mf5SXhRzIi
         4wzEhGRLATsa1z1pZrwXdpD4txN28zw3qerxBj0F5CvjavUstLhQaPoVFDJldTEke6Ou
         a5hheX+DWaJQKuQ/21qY7EfVZW0i8XW1m7ovR3j90Kd4DbcZ0/8Qkg3IRr04YJOaA7/x
         +WAA==
X-Gm-Message-State: AJIora9u2C2/VUcgmG8JP8I8y0UUFp0amzVcnHWZqULMJGOoLb1JCNKc
	IUbWVRx5X45/55LIHZPKR78BRQ==
X-Google-Smtp-Source: AGRyM1shJqjBNqPwm8ZmASifevUrtaqHedZ6chas4eh4BAG7FBncurDDJ/aqtyLhutQ4EiRtLcE3tQ==
X-Received: by 2002:a65:668b:0:b0:3f6:4026:97cd with SMTP id b11-20020a65668b000000b003f6402697cdmr2146963pgw.420.1655340884020;
        Wed, 15 Jun 2022 17:54:44 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 34/40] ARM: dts: animeo: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:27 -0700
Message-Id: <20220616005333.18491-34-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/animeo_ip.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/animeo_ip.dts b/arch/arm/boot/dts/animeo_ip.dts
index 7da718abbd85..3fa3db2d9d02 100644
--- a/arch/arm/boot/dts/animeo_ip.dts
+++ b/arch/arm/boot/dts/animeo_ip.dts
@@ -168,26 +168,26 @@ tx_red {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		keyswitch_in {
+		key-switch-in {
 			label = "keyswitch_in";
 			gpios = <&pioB 1 GPIO_ACTIVE_HIGH>;
 			linux,code = <28>;
 			wakeup-source;
 		};
 
-		error_in {
+		key-error-in {
 			label = "error_in";
 			gpios = <&pioB 2 GPIO_ACTIVE_HIGH>;
 			linux,code = <29>;
 			wakeup-source;
 		};
 
-		btn {
+		key-s {
 			label = "btn";
 			gpios = <&pioC 23 GPIO_ACTIVE_HIGH>;
 			linux,code = <31>;
-- 
2.34.1

