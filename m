Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22871C77B79
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C256C433EF; Sat, 15 Apr 2023 10:43:34 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 372E1C433D2
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 372E1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-94f1d0d2e03so16391766b.0
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555412; x=1684147412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GpG6BrvNSByzEWolZqrrfdu9R1OUjer6DD5hZw47Yw=;
        b=SR8ucM9B6N4/Wvn8RZz18nK/iv9LqIsfQMhAigP33Ivuy1+kbRYO27mZnKqAw9y32Q
         AtP7SHwTbB1Ta86j0WTR90Vr5Sv4sRTCESymR2jgG6C0T68joTKZMiC6q5TmJOYPhei+
         9RN7yF2WD6pzC4WY+6xBu7fetubohElOypwB8YtBL5mSoNSHZTJGg3P88X89GyGSsmF9
         o5I1QUHoJPRXy9MT2CQO0/15Bs4YSxLucV2pTlosuR444CvBnflp89KFthAvBD0t9ebD
         0X5W4zvgfcyREyr2E8jXdWxHCcJTVZfI5WvBMTEQNupFKwwkUInT1jOV7ZJt71X5S/Ah
         bpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555412; x=1684147412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GpG6BrvNSByzEWolZqrrfdu9R1OUjer6DD5hZw47Yw=;
        b=Uojabmu8hepIVU4Ko6sWj7TvEmlDbVUJs0p07VHNhXE39laOFWfRcbjzaxtNc/HCed
         ksnJWtQQ21rvBthAGyMQu3xy3vjoJbxfxSUu6n8N7YJbg17aIpEds3WooyCZDTckcTxy
         ncvC6wT1Ho21VzifhRPD+OEqghPTxuRLzVnPZEJUJbvnc69Iwi+p5X+7UqQvXtS6Fmfs
         bKDrAQPf57Vht3O06h6YE1IcZ313EgbvPds9AU/Crpvbg65MUT0vqJRy0D0bDmfIEF6H
         T85RRm8Hi19EtoMnNEG6WGTfz9b8oevvI5j1skzTgeKKI/K9EiQ3Aes8SGZpSOGwKc/M
         Q0gA==
X-Gm-Message-State: AAQBX9cZ+q7QFduzBkmhgbUtcoK/Km2/FLu6oSrlScqEK8wb1F0Mgje5
	Qwn4V7mVUo7iTptYhxOVgCo5Ng==
X-Google-Smtp-Source: AKy350bNSPXliC1HMcFk7yScGBMVjoz+38R0GHGZie0X0VdcqMt5F+DiXUR3dOCZbJKlmXnJFmQmCw==
X-Received: by 2002:aa7:dd59:0:b0:4fc:9c79:86bc with SMTP id o25-20020aa7dd59000000b004fc9c7986bcmr9142694edw.42.1681555412732;
        Sat, 15 Apr 2023 03:43:32 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 15/15] w1: gpio: remove unnecessary ENOMEM messages
Date: Sat, 15 Apr 2023 12:43:04 +0200
Message-Id: <20230415104304.104134-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core already prints detailed reports on out of memory:

  WARNING: Possible unnecessary 'out of memory' message

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/w1-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/w1/masters/w1-gpio.c b/drivers/w1/masters/w1-gpio.c
index d4632aace402..ac7ad63f8f8d 100644
--- a/drivers/w1/masters/w1-gpio.c
+++ b/drivers/w1/masters/w1-gpio.c
@@ -101,10 +101,8 @@ static int w1_gpio_probe(struct platform_device *pdev)
 
 	master = devm_kzalloc(dev, sizeof(struct w1_bus_master),
 			GFP_KERNEL);
-	if (!master) {
-		dev_err(dev, "Out of memory\n");
+	if (!master)
 		return -ENOMEM;
-	}
 
 	pdata->gpiod = devm_gpiod_get_index(dev, NULL, 0, gflags);
 	if (IS_ERR(pdata->gpiod)) {
-- 
2.34.1

