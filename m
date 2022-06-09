Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CC7CCA47B
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AAE2C341C0; Thu,  9 Jun 2022 11:39:52 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51618C341CB
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51618C341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id v25so30822465eda.6
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aAhmJJMLt+dZsJwSy+3+Zt2MW08hnmRQ8CsVMDcBXk8=;
        b=wOphX0hATInbjEuhOehzkYfJVnR2wUqmiRCKN/AH0JXYY8e/VdR9SgYnsl1ZZXB+1i
         JMdBZgUz5HDY34LT5ZUPpPaEw6aKptfeAkCtg4jx9alB4DTjsGVY6JsGYM1RCgcqPeE5
         5FcyFYTgrDIV12Vp3hE84Yy+pB68Xn4G1GL467uG9IGDUZxxgrybnlsVq8iK4rEExpfo
         WSmuqAy+rodu1kOLj6U7HWmXz4g4ez4iLFKkLEAos0xCuV1+XCe5WXoptEA5jDkRUgo1
         XvGcGTdvvhPKbk+QFc0ErMKZf1YOeA9yZ86UNzMdElizz8Z/HTZn7OvX3RAW2/8qGVFo
         ywww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aAhmJJMLt+dZsJwSy+3+Zt2MW08hnmRQ8CsVMDcBXk8=;
        b=XsKKS1unCll14TJWkps+Yi120nsCVGpds6IyrQC6cmzfyANHbUeAQaERCM8k5usbdb
         Yq67MtRfmq++XKG3RcOqluxKLijT6uyLT60nLG5VjP/qCsS0vONkUsGD9fPqyfZoNsJm
         ttV2tm7rCppoRNpuTzMtBLHByq+rWXdsDELTFYy0nECgJdgVp+IGqfbFTQr4WheO/Dhu
         OVPkPsMiTQRG6TBKu0w+1R+dKV+hq3FMfOCgNKPkYxt4/U/1aZj/wtsjJFI/09BRar5J
         JL48zBln3220qWm2MF/+fRoDVxnysZvVtfQjGjf+B43x79ZlILbCb3npXElZyty6AJAJ
         uqzw==
X-Gm-Message-State: AOAM530cZpXxwn1kJYb4flN1pNUenO8ifcWlSqH8GwrIffcKrASvkgMs
	k9igrpywuBiwi6QTa+rqpBJJQQ==
X-Google-Smtp-Source: ABdhPJyXuzZml/Ae44uC3j9MoTsQwFrnLkBEzS4hrOMongxAnomnNX7dMHgx4zK91+BRghOrPp5oYw==
X-Received: by 2002:aa7:c744:0:b0:42d:f68f:13de with SMTP id c4-20020aa7c744000000b0042df68f13demr44159095eds.294.1654774790650;
        Thu, 09 Jun 2022 04:39:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm9460415ejm.119.2022.06.09.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Wei Xu <xuwei5@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 15/48] arm64: dts: hisilicon: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:34 +0200
Message-Id: <20220609113938.380466-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index f68580dc87d8..0fe0542bf40e 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -74,7 +74,7 @@ keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwr_key_pmx_func &pwr_key_cfg_func>;
 
-		power {
+		key-power {
 			wakeup-source;
 			gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
 			label = "GPIO Power";
diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
index 40f3e00ac832..ad53066ac495 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -27,12 +27,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pwrbutton {
+		pwr-button {
 			label = "Power Button";
 			gpios = <&porta 8 GPIO_ACTIVE_LOW>;
 			linux,code = <116>;
-- 
2.34.1

