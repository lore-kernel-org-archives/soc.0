Return-Path: <SRS0=zANd=VO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EABAC43217
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5595FC385B3; Fri,  6 May 2022 08:14:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A81D0C385AE
	for <soc@kernel.org>; Fri,  6 May 2022 08:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A81D0C385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id c11so8970451wrn.8
        for <soc@kernel.org>; Fri, 06 May 2022 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IlnEP2sEnpgHaHWLHUGilGQAFmisSdzAhYbMeYmMi38=;
        b=HqSMS5/QlpxxyQty/G7buZbiKC5JZBv493X9X2wC0oEUBsDKonsGh5N+pJWAqUlriL
         4jbbBCHGNWI4fTFip4nCrlLzTFclcrwmUKq426LSzcP9HdAOo4MO6fkoV71h7VM4Y5GJ
         hGGfoINQ/AsPkTBqg/RSyIX4rTNSGNWHkTN2m/sIbeaqJzaFq0fL0s2Ub9lKrMNJObqT
         mINHjAY5qaruojjVCNnYRQsgfwtt129XbEifzC5LiYdNSZdPTv9G3+kIFl/aFpRXx3hf
         y5z7LMANXEbOGvWsayJ+GdBPonvtH+/xgfP6oNBaJhlMKZ0FG0lkAsrWmUXHY44l1Okm
         agvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IlnEP2sEnpgHaHWLHUGilGQAFmisSdzAhYbMeYmMi38=;
        b=nH/gvUhxtE2LdD4m7ZzuhqSZv3pDurPtNUIcmGi5EYQMndBiZ33Yf2kjxHh85EevSz
         Oo3t8nmNs8v8+DxlSdvp7bzbNUUuxqlHPOc4Z9kNizwYjh8pPpzD8Wi4yUeCV7ErOsSC
         rRRnvoe8ZuWPLvMmwydVqr71bo+8Axs6hnKsxm5qwwQXEwkmVYilvHsCycB1/Qsx7Jqq
         5QkJ2Ahk1U4uwj/x4IaUXnbkmzen3a6dLQFY5RVBdpFVzQnJfUNRlk+qiLl4qhmWiz70
         WTMLdjNGOXV7R43NWXiqohCr9RifK3QTtfQLlQ1Y8/8l2tCbVdZ3DmPzH5Iaq+w2j9pI
         tWTw==
X-Gm-Message-State: AOAM530hkHHngbQOOn107CgpGDUYcwQcV/HiFuDDa7oBI3Sx+cF0SPlv
	1g0mb6nLO0zF4v7ryYdwW6rV+Q==
X-Google-Smtp-Source: ABdhPJxXi6eJey+rbbTnYO7gBOA1PeS4alROquDDvhJbrStjJoPV9oexn9EDcYsYdGvcpMk/Lvd0lw==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id r9-20020a5d6949000000b0020ae021f8e0mr1720729wrw.231.1651824889058;
        Fri, 06 May 2022 01:14:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 6/6] ARM: soc: samsung: for v5.19
Date: Fri,  6 May 2022 10:14:38 +0200
Message-Id: <20220506081438.149192-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
References: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.19

for you to fetch changes up to 170a0c56c5ec597fa15447e63272827a80a19be1:

  ARM: s3c: fix typos in comments (2022-04-04 18:57:34 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.19

Cleanup: drop unneeded CONFIG_S3C24XX_PWM and fix some typos.

----------------------------------------------------------------
Julia Lawall (1):
      ARM: s3c: fix typos in comments

Uwe Kleine-König (1):
      ARM: s3c: Drop config symbol S3C24XX_PWM

 arch/arm/configs/mini2440_defconfig  | 3 ++-
 arch/arm/configs/s3c2410_defconfig   | 2 ++
 arch/arm/mach-s3c/Kconfig            | 8 --------
 arch/arm/mach-s3c/Kconfig.s3c24xx    | 2 --
 arch/arm/mach-s3c/iotiming-s3c2410.c | 2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c       | 2 +-
 arch/arm/mach-s3c/s3c24xx.c          | 2 +-
 7 files changed, 7 insertions(+), 14 deletions(-)
