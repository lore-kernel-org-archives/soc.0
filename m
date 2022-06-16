Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F327C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08F41C341C0; Thu, 16 Jun 2022 00:54:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F209C3411A
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F209C3411A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id x4so94757pfj.10
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=;
        b=ibyymZp5XlJ1TVxW3Q91FpBJuuWKv1KLncQ//0p5ezpE6CTtYNLXK+lHOI/hPkd6Q4
         UGtRStig8foAJzmDcOAQ/uBCWXgSRhDIPaDpjUT6d5gq/W3B71F6AzM4cYw9qD7rEZ0y
         Jq3zXn8Euvjo8+C9vszNyro3xk+nr3E5nMYzdsLkrau/nHe4nge5+2RxMQ16d0roNjdm
         fT3sDXnnh5bfIq9kNqNdFLnoCK4Mds+xIPcZp99Q405bXeDw1cEN1TO9NawGDH5kVYnF
         sTqhxRn6OVw7r9WhqxRg+k8bClq/XoLEbhtrzDeoQwBGJoWD0BJTgbPewLH3+rP3ldSW
         LD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=;
        b=fy9l7gCqLckDVecc5ROJz4hCp8b7pefLdcsGY32ooTsiELgs1uf4o2srZTD8msDqS2
         kzqOviCUUjMJrZ4RStaerMbxcHVETkuWT90finip2FudBzDPCQZoy68EorjResA/3aes
         g5d2uvnBDlo6u0288eQg3nh5SmFtX95ptz7N8mUCjqxQKwZaV3f5kVAm+S2gPxuCIAYB
         R4D8xJ563ZDx80iHde8rHwIIxVUJrKOl636wslayj3ZxPJGlYW9RP/qxsZBGw+BPmBUw
         qbRdb8+dgCjfF7BCrcExvQ0pSGJdU8ac7Fj9288J6ly0R3rgHudlJqnJAmnBv5NZ2CTy
         nevQ==
X-Gm-Message-State: AJIora9yGkwkWKf0ZYcMNxZsnaUfWN93uXinWMUqGS8+fIzIMuLARsMZ
	S2fXIrV3qWXm4g0+EzV3eUb5lw==
X-Google-Smtp-Source: AGRyM1tAEE0u8NJaXgmeTa2NF+QrSpNPiGi/49gozabcDXXUVDUzU+70/JslbQquvEmTpYN9QZnnOw==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id l11-20020a056a00140b00b004e12cbd30bamr2316432pfu.46.1655340858145;
        Wed, 15 Jun 2022 17:54:18 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:17 -0700 (PDT)
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
Subject: [PATCH v3 17/40] arm64: dts: mediatek: mt7622-rfb1: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:10 -0700
Message-Id: <20220616005333.18491-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index c28da9323a9c..1a86857c9027 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -40,7 +40,6 @@ cpu@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		poll-interval = <100>;
 
 		key-factory {
 			label = "factory";
-- 
2.34.1

