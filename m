Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268F3C77B77
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F7CBC433D2; Sat, 15 Apr 2023 10:43:31 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32CCDC433EF
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32CCDC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-504eac2f0b2so3434812a12.3
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555408; x=1684147408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNpxORV+uoxzQyQgTWsAR7xLsJXttT16I2OZ/0Honq0=;
        b=aW07LZTdTwP7o5RXmg8t7d4WFICyTSv+PXdRSa8Msr4wzY/LXIrZsQbLG5nhA6tdfj
         f0Zo3G6XhksREG0cy9X5oV3y4DDqNOD5bZJY1DNCoWthLRVzJQTfSg3UrKmxxoDzbAs1
         80ADIsMge9hQ47Sktug56lB6XdBnUq1b8X17AUF/zhKHwh5mLKmCglcqZeZdc3y030za
         ZF4PYygVggajmzOA//IRZzzuIfSPDlPft5mwgXSIWQGQ/gzovNNNPVDuXe9rlfSlRa0+
         /AIAQtUAQvjitNZNKCH/ZcjksU1xNZLqocrjcD8OJpHQ8l7s0zyRVvxTv0bQx2mOECKw
         psQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555408; x=1684147408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNpxORV+uoxzQyQgTWsAR7xLsJXttT16I2OZ/0Honq0=;
        b=b6AAMWC2V0gd2WIoxWLWkD6xR/xF9DmbOEQ2whuIAHg9Z4tkhqhQPzq+bEJdIBetKS
         9C2E8IptucuD8fHibRzvAB4N2BEucLhKl1m5+bKKfLm8HslCRuLYAkc4vyRNPeW1TlUp
         UCXdEHpu+j5NUkcV6hn+wIY5qveXB2GYpY6FmyTMtLXPpkvnlv0aXwRahRP3J0W3p0fi
         R6vlOlP0T+PxQ2op7X0gekF8Wov0L6rmX5UNLHGPjtoq84LVjJar87sAG+OMn7Oddz80
         Za8wcskoFPIw2OC19nrG414bayB4+/92YY4UudKK7DwzzhSlEeqkrkFgyTaEQafiiUZK
         cTag==
X-Gm-Message-State: AAQBX9dtCtdV4Tp1AxDGard5w+SvI0cH8ccWgEpxHWX5cm/5QsvZmoZP
	ccwWXH9cpo4F33XvFHFMIgJD4g==
X-Google-Smtp-Source: AKy350Y3GOYqbNMSnzkQCc0JrsAFfLFROPGeR3lT8jjPs5mFkIueWpDuN5QsJOgO7YKSusVnYhKh6Q==
X-Received: by 2002:a50:fe94:0:b0:504:9393:18b1 with SMTP id d20-20020a50fe94000000b00504939318b1mr9209691edt.9.1681555408494;
        Sat, 15 Apr 2023 03:43:28 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:28 -0700 (PDT)
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
Subject: [PATCH 11/15] w1: matrox: remove unnecessary ENOMEM messages
Date: Sat, 15 Apr 2023 12:43:00 +0200
Message-Id: <20230415104304.104134-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core already prints detailed reports on out of memory:

  WARNING: Possible unnecessary 'out of memory' message

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/matrox_w1.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/w1/masters/matrox_w1.c b/drivers/w1/masters/matrox_w1.c
index fb38d92b2f43..2852cd2dc67c 100644
--- a/drivers/w1/masters/matrox_w1.c
+++ b/drivers/w1/masters/matrox_w1.c
@@ -122,13 +122,8 @@ static int matrox_w1_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 
 	dev = kzalloc(sizeof(struct matrox_device) +
 		       sizeof(struct w1_bus_master), GFP_KERNEL);
-	if (!dev) {
-		dev_err(&pdev->dev,
-			"%s: Failed to create new matrox_device object.\n",
-			__func__);
+	if (!dev)
 		return -ENOMEM;
-	}
-
 
 	dev->bus_master = (struct w1_bus_master *)(dev + 1);
 
-- 
2.34.1

