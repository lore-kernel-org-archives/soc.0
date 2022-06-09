Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA678C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4D99C3411F; Thu,  9 Jun 2022 11:39:34 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F8D5C34114
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F8D5C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id h23so35832723ejj.12
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/8m6MhDbOK9+V515hZszn9vJkAN/TqZqKv8XaJa+cRs=;
        b=s+6p/k8PFsLuVeRvC6dVP/btm0EdoP1NDRAqQy0hLA2smZIZgad6TFbrIED57l1kRF
         kwtLdQtlIwYfHNpDAxVukmvqyAabZf0Bq82rMRdXEingdZ+o889S7vKDqqEeGUDCuKG1
         +R4Zpj8x3yWXa1Z4ZG8ujMCER/NnQmG7Hn6FyIdeljA4QRKgGcd6AqcpKdyd7w/XPXfQ
         YqJNvc9WLWGMYD6+JLH7UB6QzZWgjlIyMYOngwrJLT42YiD7CgiybqYFwmwpa3mk0bN1
         WOYjnKWjATWitvCrxcOsgU60Ui0eAylJ6BtidL71fwquPPmT+w934w5GMCs9Q7LIWbfi
         Z0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/8m6MhDbOK9+V515hZszn9vJkAN/TqZqKv8XaJa+cRs=;
        b=r5iu59s/mmFV4xsb4+kQlBlmBF6M9AY48w9LM8NiB7z+SXYU69rNjB+YnyAoL5IuXx
         YdnrGpybEUm04dVfBuy6YbG1bHzN5jEeAgi9lCF9ewh5MZGptVBTDWlbu0W3KKPwupiA
         B7DvBXzEnMAyxG2ntUZmgoT0Es9BypPZ0JI22IxstG9sqia5+tAzfoPcL3iCOvOZxxgi
         P+ZaNzYelpnlBkb3HC/d6F8AjLc1XdUKx8SvHegdsUSfEmXLLhOBk2INbxIPXryty5rE
         W+4FHh0s+HtVAd9i4BwDJYJofV9fmrhTtA11XyCSjKXF6fQEQOz1Qo+OmmCdk+m5u8Xv
         rAtw==
X-Gm-Message-State: AOAM530nkr3M3ZhIPAKwErjIpcMlzajcwSpbAAXDb4V6o6NWCAHVf3bj
	sLlPV3/yeE1ISL9pS21cZuLozQ==
X-Google-Smtp-Source: ABdhPJyvhAkXzz01P+3fO7D/zYL57ofDhMby/qx7m150Ee92x7Njr4PpyP168wjKUhtp3epBDXP9SQ==
X-Received: by 2002:a17:906:5256:b0:711:ee4d:fbe4 with SMTP id y22-20020a170906525600b00711ee4dfbe4mr8777720ejm.312.1654774771623;
        Thu, 09 Jun 2022 04:39:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 09/48] arm64: dts: apm: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:39:11 +0200
Message-Id: <20220609113911.380368-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/apm/apm-merlin.dts  | 2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-merlin.dts b/arch/arm64/boot/dts/apm/apm-merlin.dts
index 217d7728b63a..049e7a5edca7 100644
--- a/arch/arm64/boot/dts/apm/apm-merlin.dts
+++ b/arch/arm64/boot/dts/apm/apm-merlin.dts
@@ -22,7 +22,7 @@ memory {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		button@1 {
+		button {
 			label = "POWER";
 			linux,code = <116>;
 			linux,input-type = <0x1>;
diff --git a/arch/arm64/boot/dts/apm/apm-mustang.dts b/arch/arm64/boot/dts/apm/apm-mustang.dts
index e927811ade28..efac50aeca64 100644
--- a/arch/arm64/boot/dts/apm/apm-mustang.dts
+++ b/arch/arm64/boot/dts/apm/apm-mustang.dts
@@ -22,7 +22,7 @@ memory {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		button@1 {
+		button {
 			label = "POWER";
 			linux,code = <116>;
 			linux,input-type = <0x1>;
-- 
2.34.1

