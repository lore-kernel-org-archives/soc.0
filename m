Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E644BCD98D6
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCE4CC433C8; Tue, 10 Oct 2023 22:50:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95179C4AF1E
	for <soc@kernel.org>; Tue, 10 Oct 2023 22:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95179C4AF1E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40684f53d11so63507655e9.1
        for <soc@kernel.org>; Tue, 10 Oct 2023 15:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978214; x=1697583014; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8meY4ujs++mlEMDCBMyLTigrPdJt2G7ihVPbm8apfRA=;
        b=KYGWa4AXrE1tH6BTWRRmQW4Ccz15ueCuU/W6FG27MPFxKOIu3k4EYtW9r4W/ZoIW/A
         CwQKzioojFJa+GgP5nMW0/4sNoXqbIqmLMiq9Jf0G77CyWXGo9FXXPy3uWpemSHnPeUT
         q5xAOXMM2XqwhwNGex4i4OEODegdotOkOCuSZsFAFdUYqWSsh9CdrQjGx6oaqXERW1Tf
         tDhaTQZpPOY/rYcj/cF+b8jKtJGfMkugMKDFSQdcPemYLn8/q5oRKak4N++A/qw84iRT
         Re9F7841ykd/IjxWwKB7bBQbmfz/4nFgWDdSPGPWplsMisfwQ52IXoPgSC3YEHNM5vzL
         1qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978214; x=1697583014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8meY4ujs++mlEMDCBMyLTigrPdJt2G7ihVPbm8apfRA=;
        b=EkwOA09FG9ECmztGPdegO+GLiRSPgBPxlOoke0pjP51BHQJQtn0dteXW0f9xDtQMib
         J8MRMSS4cEEIbGvYPxhicY1ebJUAFiZk30KSDMU1SdhalFsS5Qn+c5P9n6aQPg+OihCD
         TjtOn0oIr8Md/YzK6pZ7wSKV3WwcIagS8mKQNyBylKZHiSno+0PIIQQj146pwsHTxrUf
         3Qb5U640GYUdHJ0+gI2/pIQrTW7szmZpWe9I2zRfpl/LcfZNn6hP/824adQTt4ZrAHDV
         1uGlneTzxBQ7qq6YY4JELQW+lnJCqmPw/HF5fZVSz1QRmNV5Mds7F7N2IAiZsYK8gdQO
         10Hg==
X-Gm-Message-State: AOJu0Yzutujnoc5BfgAjR7DfWLXqywq3jq07ashd7JPhaQ3LvZ+pCFue
	VMI3yd6eu2E2VB87/O5T6O98Sg==
X-Google-Smtp-Source: AGHT+IHVgNRfg9MJFj2fa8ZrT5Dql+nbZeDpWThiGHWgaXBzyVYZ59F732rF5W+8jo4YKOodKbt5oQ==
X-Received: by 2002:a5d:680d:0:b0:319:83e4:bbbf with SMTP id w13-20020a5d680d000000b0031983e4bbbfmr18331182wru.20.1696978214311;
        Tue, 10 Oct 2023 15:50:14 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:50:13 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 19/20] arm64: defconfig: Enable Google Tensor SoC
Date: Tue, 10 Oct 2023 23:49:27 +0100
Message-ID: <20231010224928.2296997-20-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Google Tensor SoC to the arm64 defconfig

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..8a34603b1822 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE_TENSOR=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
-- 
2.42.0.609.gbb76f46606-goog

