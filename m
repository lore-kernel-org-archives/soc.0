Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB9EC43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63EF5C3411B; Thu,  9 Jun 2022 11:40:53 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9D52C3411D
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9D52C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id m20so46823071ejj.10
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ouHToTpfN91IdC1bQjCsmRZ9s0XMaKvgoUPDfBZdkoE=;
        b=MCGCVjufFqOOIqY2BmXcaAlOQZP/Mb+gEcACSVAlis2Z8u5cPYXb0vv1bolsxVRWIL
         6w8c7VAOzqydEgwsZrxcNAjPTgKFSWbtgFo5K/dU3ikxMhoSakVBi5ZsZVu88h6PZ8vV
         eKJFs1KM9Pric7/nas8TK64Mibp6DgyMO00AQS6rB5QI624a/23Ajww+GB6jBy3Z+464
         m3h1BxP0wtfBG6hxyUXwFl0qgLRXBJZ4O/hZ6axe/6wPj8C8SLqLPdRYU/5qLfc4LnRx
         pKqCTW5/szu1KTxaulfufe8/WxKqGAiDvLzN13ijGS245X3U28yqx5qxu8HiWnb3U8jz
         5YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ouHToTpfN91IdC1bQjCsmRZ9s0XMaKvgoUPDfBZdkoE=;
        b=DaP0GB54JazjCnchDGre/QoUGgmnl36dkrgn3NfWEPv4+KQQRA3R8cee6F1SnCZppu
         WahsqCTQdm6LHYGSzrbx0H97nNU5xm7yKwpBQwHNmHRVPypQnYcU5xeVyMtyaQx6gyBk
         S+SrOie+xVkiyVKzrUpE2ly0eIU2b+5WGPylayAFrkulxIL4g0JRXI5q2oEw97lzejKI
         jN3ztjqgl7ztsbuxhESUOy5UreDrPznbJ6S4EcWcLR+o17LJCfN1/PLYMg155vamnfYy
         pZXhV+bMqo7AxMQxTM1I2STZAj9ontrhIaO5rV6ezA9esK5rh2/uls+6zuUoZZ/9nBx4
         1Krw==
X-Gm-Message-State: AOAM531MxvuI+EpSNRekhgT3nmKlsEeQiFL8rXbhp36pbmpFp5v0yaP+
	i9uvgFWkNLZuepiDu8Xk5+xc3A==
X-Google-Smtp-Source: ABdhPJzz6M1UXqHNUIFcQq/P9/vNHhMGDrGeRXnd7+DWHIroLqIpwMzDeGqSSb7yKePjKhWbv85fhQ==
X-Received: by 2002:a17:907:3f97:b0:711:d61d:df9 with SMTP id hr23-20020a1709073f9700b00711d61d0df9mr16406402ejc.644.1654774852403;
        Thu, 09 Jun 2022 04:40:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170906b0c200b006fef557bb7asm10498662ejb.80.2022.06.09.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 40/48] ARM: dts: animeo: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:40:39 +0200
Message-Id: <20220609114047.380793-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
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

