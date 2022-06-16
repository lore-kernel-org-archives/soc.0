Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2769C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD8B7C3411F; Thu, 16 Jun 2022 00:54:45 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 520D2C36AE2
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 520D2C36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id z14so8768005pgh.0
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kjxoc+L6eqxwMNT3+yJrollfGrhiqYTPiC+5llKZhTw=;
        b=yw7fTFrBXvWvrvsb5WkegfMEW/6IhL1KT9/hAYo8dWOs2GGKYjkucklo/1t1qezcEc
         36/DUzR/HVQ825/6vqnL6eYxLMj9Eql7/LVFx3+V99KJp0liIri67BryhRUZDTnB10N2
         pSrGwGvl1QOmOOV3y67xfjcdFYTEjLb8lGp0k6OtSBxmUtCL6Cj6YPI2f+Co22OPUKmI
         Xe4ZkuZipAQRt655H0W4wuauqWhZGkX0gjVqusAmaOyHnn5U7e1/mzs7L1HcJVv4Nceg
         6pp44m0mzlGuZ46j+eWe3s+J5AdaeJqqTONXHX3A47HjMuA6xrbzLdGxkDkGWq/Wlvq5
         y8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kjxoc+L6eqxwMNT3+yJrollfGrhiqYTPiC+5llKZhTw=;
        b=SQpNlbagsjiGf0ZqYR3bUATSZ2U/xLzgyvt29N2NtBJ8t39U/xkLFTdVYyMylYmTRD
         Tuvs4fsfT0H/0jLm5Srk4wDlyLjWlgl04GSS/Jo0Ed4XZYYNSlpr0bVYB6U+BOMA2f2Y
         7+IqW9xX3HOQeM72hFFidFxT282cnXznzB4nmajr4CnVpjISLGYp1dljljOTe3whQS69
         Lq5w4i70aqfkYMnozXT95Fu9zhFGWluTpYAeD6KDUFnlRIoUbD6u4jFZiEQDI/r6itIb
         A/ptPcXhuuCZFn68Zk3MndemwBV7JRPOrosIjaRQJuP5NxIibsFZZuvWALL6ej6zP5rQ
         BEvQ==
X-Gm-Message-State: AJIora/su10u0+1cK0h4hjz18w5oRaxxECavWw6Kk9JhK10fP4AsKwYe
	T3MP6L1ptmlEAt0We+7gX7WVMopmlfB4lg==
X-Google-Smtp-Source: AGRyM1swqFLCvRDEgjzbq+By9bni7CFAlZXUZ04FXfBNf/bNoRe54RXWN+qNVPTzbe2p1Q8ydbs30Q==
X-Received: by 2002:a63:170b:0:b0:401:a7b6:a9d4 with SMTP id x11-20020a63170b000000b00401a7b6a9d4mr2185789pgl.107.1655340885064;
        Wed, 15 Jun 2022 17:54:45 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:44 -0700 (PDT)
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
Subject: [PATCH v3 35/40] ARM: dts: animeo: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:28 -0700
Message-Id: <20220616005333.18491-35-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/animeo_ip.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/animeo_ip.dts b/arch/arm/boot/dts/animeo_ip.dts
index 3fa3db2d9d02..29936bfbeeb7 100644
--- a/arch/arm/boot/dts/animeo_ip.dts
+++ b/arch/arm/boot/dts/animeo_ip.dts
@@ -170,8 +170,6 @@ tx_red {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		key-switch-in {
 			label = "keyswitch_in";
-- 
2.34.1

