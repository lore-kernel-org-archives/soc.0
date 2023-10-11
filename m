Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08817CDB481
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9621C433CC; Wed, 11 Oct 2023 18:49:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CFC2C116B0
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8CFC2C116B0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-307d20548adso170702f8f.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050180; x=1697654980; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPOqcX4Ej3m/0HUVtDwdhQHY2aoTOsl6XS4JtvFqWa4=;
        b=bbziI2+Mc7T3CRK84EQfy0UXRwh6FK3svl/JB1N52aMK7q8gKgkEg/HlmiiD6+zRfD
         mhZxwZBLtLaglpJgOZbrN8ZvISplold74+cfmqCEkx6rkofLjzaRdrnArrDBnJzDaN9u
         2Mi6DcmWpbLeVdxGfda8iCybGTVNj4riGVqqxbiFzp3wE2uk6BxpC/M+gNzroXPRhhtM
         kCXZ3YJLOJiKOvbl8GagwIfv8aBAf63JpkcF6xt9MNTN04Xgd3ORUQLVCwSFsuXqt08T
         tuUIiOO3IoKjE2zN6Wrj/tHYYSuW2fcxxvQPfkfV3VEK/93D7/B6gbR0j08SVdXYmygt
         zrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050180; x=1697654980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPOqcX4Ej3m/0HUVtDwdhQHY2aoTOsl6XS4JtvFqWa4=;
        b=Xu2XkRqCfhLzuJV3a3zinRLHvNAlXJzZgBCgZl2Z48Xk3aI5XqGew3IDpIsZfluoUF
         G98KWjsFW/B/8fTlevZl0m6b1Ncu8v/0GP23o11XW/q7HsHjzHEWB4fH194IpM7IpczU
         rcKuVaxSH6X6L1whtPNLITjtypeAZSA4WQwZPKIPZWwUNNps2RIsWjLZZZuEzzgp2GEE
         yGqAyp0+E6OwwVBonk1gy+VxPZVjYswitZm18JWgI6YaqKLABh94t6Bi1t6kgFNg0JhL
         COzPmZwmc9jeMoYi7tO52tCVspJDqMcpSjP6GIyy5JSq/Dho90HY/8/jZxpExg4NMx5t
         J2Ow==
X-Gm-Message-State: AOJu0YwfoVSlm5RIuGYDnlPaI3XygROrMu0pDQZQ7r9x2uALyn3TPlt6
	8B4mnNMIMHxLZFdSU2ibloBEFw==
X-Google-Smtp-Source: AGHT+IHMpRgHoDBgn+LyjOsF0XISdxPj15/7N1fcJz0HY1O6F/N9a70SS/9n712bMEfg3/3wUNNJCg==
X-Received: by 2002:adf:e189:0:b0:32d:87b6:14d2 with SMTP id az9-20020adfe189000000b0032d87b614d2mr2360731wrb.31.1697050180253;
        Wed, 11 Oct 2023 11:49:40 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:39 -0700 (PDT)
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
	gregkh@linuxfoundation.org,
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
Subject: [PATCH v3 19/20] arm64: defconfig: Enable Google Tensor SoC
Date: Wed, 11 Oct 2023 19:48:22 +0100
Message-ID: <20231011184823.443959-20-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
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
2.42.0.655.g421f12c284-goog

