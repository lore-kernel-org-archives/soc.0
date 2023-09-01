Return-Path: <SRS0=edI6=ER=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9373CA0FE1
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 11:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72AB6C433C8; Fri,  1 Sep 2023 11:57:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 856C9C433C7
	for <soc@kernel.org>; Fri,  1 Sep 2023 11:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 856C9C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99df431d4bfso227863966b.1
        for <soc@kernel.org>; Fri, 01 Sep 2023 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693569455; x=1694174255; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6aAmuXWpK9R9ONwjhEFCz2euSxwTZnw/oAWjomMKyvU=;
        b=wzOLYHvPH+Ao6yLyKkDcWi3ZmTOqRpf8qATG4MqdF1FKorSGqjHxYy+XT9GhYmpVcX
         8Xwkj/5M3mRBf6yTlBxlg8msPpFukusq59m9n2zGEHhY2DLZnX38sNc0OKcPEyVEcZXG
         L9pjxGi9JaCR8KgeQ/WtUZHc6ZTcd4kydOSJ7oPJboqe+3Grij0btuP3SgG0IofgPSdl
         diBJPBNEw+pQP2WZfzgI0e+maGI7Kf68Y/Gn9zt1K7DKCKd7PSBHwBNt1h/3jFdKCh1A
         BTMUEwTdA1Op6aFBHpqOI5lAfU6nJcC6hFCst+9L3GvaL+mvlt8+iSi9iHzP77A5oVAd
         i7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693569455; x=1694174255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aAmuXWpK9R9ONwjhEFCz2euSxwTZnw/oAWjomMKyvU=;
        b=WmSNVVHyEr8oZqrvbDi64De9gXjHjFgOrLlqzQptViovl+xcw2WV5qL8VbIUtbiP6N
         A6DGlz5A+n27cE26ZW/SmkDA3Mqyt7QKWoMbeGMmROoR/fB8Kya9mYMx8PSthDHaBPZg
         HpaBAp3UJi7MJKhRMVc2E9k1uRC5uDZvdGqtoPd5BwkaCj0FGJjJWtccE9KZr7CVUR4j
         ldZDmZVsc/sTJ2lZOWYy8PKW+EzzjFZqDfk6zb9EQZFmSXXpuh1ZeWLJHMIno1ZaCQiY
         /tbMWUo8YwIcC76UIhc6FZtJMUZvqs4xPeGuJkKdCxMtDD9DVSkvoBSe2qgBxdvkt0NV
         q5AA==
X-Gm-Message-State: AOJu0Yz4bHzyr8DAMf93VtzK9vD4HJMp7EDCii3obeV/W7iKoFxMwt2s
	cBN7tygExiH0Mhsv3pf3SY1wTw==
X-Google-Smtp-Source: AGHT+IE53YnDzQDCbFDcC3Zu5aY62S51MDsbpqPyeKqbHf/Q/JagOF915pEdB+ulrN7nuS6tYG750g==
X-Received: by 2002:a17:907:a068:b0:9a1:cbe5:758c with SMTP id ia8-20020a170907a06800b009a1cbe5758cmr1591640ejc.7.1693569455460;
        Fri, 01 Sep 2023 04:57:35 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id h23-20020a1709063c1700b0099d45ed589csm1881248ejg.125.2023.09.01.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:57:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: enable syscon-poweroff driver
Date: Fri,  1 Sep 2023 13:57:32 +0200
Message-Id: <20230901115732.45854-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the generic syscon-poweroff driver used on all Exynos ARM64 SoCs
(e.g. Exynos5433) and few APM SoCs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..ec59174b14db 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -636,6 +636,7 @@ CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
 CONFIG_SYSCON_REBOOT_MODE=y
 CONFIG_NVMEM_REBOOT_MODE=m
 CONFIG_BATTERY_SBS=m
-- 
2.34.1

