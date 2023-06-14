Return-Path: <SRS0=JY0V=CC=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3863CEB64DA
	for <soc@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF6A9C433C8; Wed, 14 Jun 2023 09:30:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1887C433CA
	for <soc@kernel.org>; Wed, 14 Jun 2023 09:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1887C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f642a24568so8233717e87.2
        for <soc@kernel.org>; Wed, 14 Jun 2023 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686735034; x=1689327034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NnDKiVIldkiJjNFT7PeoXvw1pLaqHuGRdQcXTyZlUI=;
        b=dnlnewlhj1+jt2qUOVrjxboXWltpogQrgI7YSmQH7O0OI9uTMlM7PofkZg6Nsie/F1
         2PKPunv247jvLnsybZipthH1wi7xSVCRLL/wlZ4kv1b9oQCk6TeyA+eT8p+0nRR3f/3R
         J2lJ4JJZsSxC0I0XHZzjKeD6knx9bRTnxuXOGL2hUnz7vt13kltHXkodBRLo8cxTyaZI
         CZomQIsUw+SK6/WKhwg8X0sb16b7ONYCjYCVfIpC0+ISFYDDExQtnEWgMmRooYnAC8Np
         0Dc20e5qTBZR/7JCMNg/ZXc1yBMzxHm67IaNKi+OlN2ze/4VqaNGhVEGwYiWimgbAspA
         hI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686735034; x=1689327034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NnDKiVIldkiJjNFT7PeoXvw1pLaqHuGRdQcXTyZlUI=;
        b=VesYIV+CmQMpKIaA0tsV0G5ustQAQuQAa7cPBQKe5fKTytPqa8FLvR7GE7MzxfHBwM
         gp9CVjx1AMhrlby8RTFjLAkkzizx/zxdcZ2BZ0rDlbWjGQS9VbZqLBeN4FHq/DbMr3IO
         Tx6ndvLsEw7F9MltPdWCSVGN5pTuXVIS3k6O+kufH9qmyEpxgUwyXiQJnQv1l1y1Pw8B
         Yy8m2rPvViW2nScXOBb3xCfi0/bqsia8K+1XnRqMq2wEA5+HHJWOA6vwLEoeMZQuI0NI
         IrpuMuyr1+6wyt00yHrqwdnicJiD1pQZcdzk7Fe9MfVCgqxhQ3CQOw18hjznrBkhCx5v
         jl0w==
X-Gm-Message-State: AC+VfDyzMexgCVLMqkCHaIQuTfJlqVslV5S8M56cNrPK5deyvqHTjtfV
	uuhxBcG+M39YhSfUSOf5go07MgFxyJrAIqJyGPn54Q==
X-Google-Smtp-Source: ACHHUZ6QNNFH5t2Xp5eAVasQd4OWmpm2Yn32BVxETsoWTcqk4DQnmgNU0iZZ0Rx8AMWsXDJBcCGP4Q==
X-Received: by 2002:a19:ca12:0:b0:4f7:61c9:79f with SMTP id a18-20020a19ca12000000b004f761c9079fmr1303242lfg.20.1686735034563;
        Wed, 14 Jun 2023 02:30:34 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b10-20020a056512024a00b004f382f34f05sm2053186lfo.254.2023.06.14.02.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:30:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Peter Vasil <petervasil@gmail.com>
Subject: [PATCH] ARM: omap2: Fix copy/paste bug
Date: Wed, 14 Jun 2023 11:30:32 +0200
Message-Id: <20230614093032.403982-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I mistyped one of the SD/MMC GPIO lines on the Nokia n810 which
was supposed to be "vio" as "vsd".

Fix it up.

Reported-by: Peter Vasil <petervasil@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this directly where the rest of the
OMAP clean-ups are.
---
 arch/arm/mach-omap2/board-n8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index 564bf80a2621..8e3b5068d4ab 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -158,7 +158,7 @@ static struct gpiod_lookup_table nokia810_mmc_gpio_table = {
 				"vsd", 1, GPIO_ACTIVE_HIGH),
 		/* Slot index 1, VIO power, GPIO 9 */
 		GPIO_LOOKUP_IDX("gpio-0-15", 9,
-				"vsd", 1, GPIO_ACTIVE_HIGH),
+				"vio", 1, GPIO_ACTIVE_HIGH),
 		{ }
 	},
 };
-- 
2.34.1

