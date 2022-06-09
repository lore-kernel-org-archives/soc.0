Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C7ECCA473
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3D8EC341C5; Thu,  9 Jun 2022 11:40:24 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA4E2C341C6
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA4E2C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id v19so30804646edd.4
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KUiL3np2ygfecmy1I7ARIj+Q5w0zv0RhTyVvk3vWH4=;
        b=ZfKVGFlwB0drMUpClH6ongnfbVocJ0aqGHXDS1dsMV50ImoeWbAyRxLd/rHuTeXR/T
         AJwBFWLIJtbVf9dNdY7wpfGDOFdrfspUlyU2+AU7m4YhuhcWezFGQGA4s/SkHBf7xihy
         LHBsvGnEUhPmiLPWiGMVeBGXQSZi1eORQEj9fNDnPskVHaJtQ4aa7Mvt9LUzAJD/UpLg
         vFBwTXazpJwJOWp/63jYbRprEyF9akD8QtIPCgh2PgUF98CksArZKHjoTxyTcSE6CrLH
         hldtJEqSIW+bIYkShF4H5En8f+ReUjh0DAQwEzwigzMtSH/Fkq12OiZ3L0nH/++Yr804
         22KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KUiL3np2ygfecmy1I7ARIj+Q5w0zv0RhTyVvk3vWH4=;
        b=UPTVyY79PIB0xEh1+UQrfZsoucwXNnwbiN66K2X6S4b3B0GSHlx03rsLfJZWxxa0W0
         K8ZzP4pyCFCBPwSb5OCTU91TZ+hOglu4aq1CypxFaLd8GXbV3uUu5ehMRLdD5tWpt6jR
         6p0y+mZ6I9GWUA4z9W37mF1BOTrO1k2T9ycolnxUZdDA65GtQcn2ah7Gcr9q3knvmSY1
         ttWP73ynSa98INSdwimwsYym14A1WVTFM5MjShpxSOQ26KgaSBK4B714Y28zMwOjXjrb
         ov/MVsNKUD1s/9IIkKk+uHmQ6C7MxYrG7X5SoaXI4CS591cJ4qmms4vpxwC5QeNqsWDf
         y+qQ==
X-Gm-Message-State: AOAM530D28vL6M5kpnVQcW+VPnhy9lqPRW3OnM9KKrHBB9SB2vew18eF
	W9Oyev/XhBc+mgm9dLwXuj5c2Q==
X-Google-Smtp-Source: ABdhPJxWyUWnpnMAnMIiVKwloAstsGYLRows2ba9PpTywVn/DLl1wCQGuTV0zQouD8RF+lfJ+Mtqvg==
X-Received: by 2002:a05:6402:17c8:b0:42d:dc6f:f17c with SMTP id s8-20020a05640217c800b0042ddc6ff17cmr45215591edy.17.1654774823223;
        Thu, 09 Jun 2022 04:40:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 29/48] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
Date: Thu,  9 Jun 2022 13:40:02 +0200
Message-Id: <20220609114002.380563-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes do not need explicit status=okay.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 42e89f41eb7d..48720026423d 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -88,7 +88,6 @@ cam_vana_rear_vreg: cam_vana_rear_vreg {
 	};
 
 	gpio-keys {
-		status = "okay";
 		compatible = "gpio-keys";
 
 		key-camera-focus {
-- 
2.34.1

