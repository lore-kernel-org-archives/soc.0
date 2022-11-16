Return-Path: <SRS0=a1DX=3Q=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41352C4332F
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 09:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 061B4C433C1; Wed, 16 Nov 2022 09:30:16 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B24FC433D6
	for <soc@kernel.org>; Wed, 16 Nov 2022 09:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B24FC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id b3so28580345lfv.2
        for <soc@kernel.org>; Wed, 16 Nov 2022 01:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3e80kgnaxg4MXziHxJJsTgEBFyzGcylgIj1o/AgplM=;
        b=CGlYruraG4OiCZHNYNSlvKAT/Q8/ez0SB+Ky/Au694M3zNr7RgytxAa8tP+AEXNy39
         e2LSg1tabY2x0k84Ag/lwt7M+B86zhIA1d+FmdnHHyaw5Urx5YU+VohX+wObEEbFI2Nz
         spGxVLaeyX+TcRVVXZy84R7rf+Cx7KNoxyk8AN4Mf6p0L3kQ4qQEL/XwYhjXaUWq5zPX
         eO/AEn1HMy7Jxl4tdjqCB6gKFuRYufOOTSxAPpKhyy2eDPfbremyIYfC8s7oOwZ2iJTF
         4gtfAqRJ0NkjgtlnOpuSkUxCu03IfJMClgqgnHFe+0zLgD8bwDM0MKyMwCv5983/EDe7
         UzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3e80kgnaxg4MXziHxJJsTgEBFyzGcylgIj1o/AgplM=;
        b=ODh1VPFsKcuOHfzh3zzZUtaCxsH7CkdoXKvenpCm+uQLUFYhuNnvLrqbjAiPftM4cM
         KbAKfDn0t3BAUe5AR23a+kgXRp3RUiMQvIUQ/xjYU+cmLVkLdmMUFlEz3euSfJjduOaI
         367qQmKgPV/g889VrhXM7WdsoIKu1DNxaN9ZpLoJZZq2aUBduZfJC0TJBeo4Iq/hFy+b
         +ioqyLv9JKP/xc+opGHEPCORH+Hwsqb3ygl7PyId5KR50VY1dVefrCQgFIlAqrR0j/VP
         PX5RejeF4+Msp+IiTVFzirUgiqFsuSqPimG9swX7XtdRuWEszgfLFjBQ059wWHbMriFu
         3f2g==
X-Gm-Message-State: ANoB5pnwjq6+e1BritsJG+6dp1Hj2o7iHFGW1qB8JVILtYPjni2FCeAe
	qw6ulVxb7TxDA2lF6wcLR8s2BGbqX5cvkrcD
X-Google-Smtp-Source: AA0mqf6iHX/VzyUoSVJzK6NdVQwfR8ipXYy1UjpF4TQDlP45yV4k9FYmvZ7FZ5i/aF1fueyvD1nvbA==
X-Received: by 2002:a05:6512:261f:b0:4b4:dd9:1880 with SMTP id bt31-20020a056512261f00b004b40dd91880mr6425311lfb.289.1668591012202;
        Wed, 16 Nov 2022 01:30:12 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s18-20020a197712000000b004b18830af7asm2517325lfc.54.2022.11.16.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 01:30:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [GIT PULL 1/2 - PATCH] ARM: dts: exynos: Add new SoC specific compatible string for Exynos3250 SoC
Date: Wed, 16 Nov 2022 10:30:09 +0100
Message-Id: <20221116093010.18515-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aakarsh Jain <aakarsh.jain@samsung.com>

Exynos3250 and Exynos5420 are using same compatible string for MFC codec
device but they have different clock hierarchy and complexity.  Add new
compatible string followed by mfc-v7 fallback for Exynos3250 SoC.

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
Link: https://lore.kernel.org/r/20221114115024.69591-4-aakarsh.jain@samsung.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 326b9e0ed8d3..a2d6ee7fff08 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -485,7 +485,7 @@ gpu: gpu@13000000 {
 		};
 
 		mfc: codec@13400000 {
-			compatible = "samsung,mfc-v7";
+			compatible = "samsung,exynos3250-mfc", "samsung,mfc-v7";
 			reg = <0x13400000 0x10000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "mfc", "sclk_mfc";
-- 
2.34.1

