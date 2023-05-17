Return-Path: <SRS0=v0mk=BG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95EFC77B7A
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 14:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66BD5C433A1; Wed, 17 May 2023 14:30:42 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E07DC4339C
	for <soc@kernel.org>; Wed, 17 May 2023 14:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E07DC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-510d8b0169fso761501a12.1
        for <soc@kernel.org>; Wed, 17 May 2023 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684333839; x=1686925839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sw4AmAQYZ1efOtuboC8tuzE6GxP3pTc6qv80qoB6U2M=;
        b=bKyhm0sFnndsJTAa3h1AVM8sIYeseNib/U3ZQYTtU2X+lPjPz4INyyqmDxdGODuRPr
         kbMaQMp/+/5E177ATV6ERiAR0uGhCRsGdwCS65MP3DvOuWQK/7gtGzqJfzkJRpjcinTB
         FOK/6ZVIP4deE6RwjAnzn8joSgBEpRqsaAuGCQ/9zOHNoqh2lAMIAa0jxnlodvadDk2T
         g9SYbtUY8ZFZyubq+qQhkEyOvL5ss2vNhCGV6PW5dMKd/VTY950o8Edw7lpsTAs9Nft1
         5iWYDaeybqGix5BPJgblKr3bEA7Pw9gEU1IC3JQLujELj6Kwr6EXbBxmSZgYmb0WAnlm
         yiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684333839; x=1686925839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sw4AmAQYZ1efOtuboC8tuzE6GxP3pTc6qv80qoB6U2M=;
        b=QoPADErMckSDHNGiD2kYWb0h83QdlJL4G7BaXsAw9va01Q/xMaiZISagpQupB4v4xY
         zpIi+TVy1g6PlW9jMqj7AoeXrOS/ubzetEbv+FV7PXs6liioA1eKv6/5NJMTCe2QcsAw
         2/zy52K5ziSCrGIM2dyAoBqOv+pPD7Dr7ev7gHjEEq6WctFcEEeX509h2SxNRdgsPjMq
         egTiTw5hHcKGCr6haeLyYqTYD/FuRdEJoxMICsxoL2alDuJU9UUQVKWWUFWmeWEbw+0D
         Dm0NCjfNdxgkvwVVrjHulfweymNaLedb48FN4Q2qZ4ZtgXQpD2mdkNlriLCJ2DWbi8YY
         qBkg==
X-Gm-Message-State: AC+VfDyNJ9/+MOHd22wYXBGDzXEHiV3r93cNbr7/ic/s52t6stJqjRf7
	b48AioVwl6S/tS0/XIgOqXcGaA==
X-Google-Smtp-Source: ACHHUZ6yw89KlxZBTvgE/5dOclub660CXUfA34kiArdQvxFvau9bhNBAgQuOCCeb8ird8GLV1AVaHw==
X-Received: by 2002:a17:907:961d:b0:966:6056:a7c1 with SMTP id gb29-20020a170907961d00b009666056a7c1mr35946908ejc.74.1684333839303;
        Wed, 17 May 2023 07:30:39 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id p16-20020a170906499000b0096b55be592asm3649592eju.92.2023.05.17.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 07:30:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	afaerber@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	lars.povlsen@microchip.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable ARCH_SPARX5 and ARCH_REALTEK
Date: Wed, 17 May 2023 16:30:11 +0200
Message-Id: <20230517143011.549319-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Microchip SparX-5 (ARCH_SPARX5) with its MMC controller and
Realtek (ARCH_REALTEK) so their DTS will get built with defconfig and
maybe platforms could be booted from it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a24609e14d50..de1ef135c578 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y
@@ -54,6 +55,7 @@ CONFIG_ARCH_MXC=y
 CONFIG_ARCH_S32=y
 CONFIG_ARCH_NPCM=y
 CONFIG_ARCH_QCOM=y
+CONFIG_ARCH_REALTEK=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
@@ -1003,6 +1005,7 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_OF_ARASAN=y
 CONFIG_MMC_SDHCI_OF_ESDHC=y
 CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_SDHCI_OF_SPARX5=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
-- 
2.34.1

