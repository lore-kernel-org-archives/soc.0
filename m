Return-Path: <SRS0=MT2l=Z5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B842C32771
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 10:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C40AC4347C; Mon, 26 Sep 2022 10:44:12 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17A4AC433D7
	for <soc@kernel.org>; Mon, 26 Sep 2022 10:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17A4AC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id a14so6923118ljj.8
        for <soc@kernel.org>; Mon, 26 Sep 2022 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zT9HYnywBLKAnKj+znnUDQxqf7HMsI+nwdK6gxUUKog=;
        b=nnwMFktu6Mzy49U0FD2s+8Z4fRTD91ziKmoRUTM3H8NByk5c+iYEF0H4nly5PKKAJb
         0XtvTB7/iX2VrdGEwfRbKXNtxvUNNjB6xgsiE9VDMW1oBRgxhUHWCq8hM45Foj+QhCBQ
         kSsS991r9ijmdvr9hIQC+sF9wYUtp8jF8Un3uyxpZHaQNGzN46RKUIkM8cElkzXObzsB
         w2kEtScKAqxKrvXJoZcEsSdTgDIgyYlBpS2gZVdM4VXrV1LDTF56yoV0csuBPC5u0z6o
         9kjVOu7hzVAnlG9iXluVY8vuelDtrdIk/3wxbptt5McOENOmIAftdbKRioqC162s1cfE
         SsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zT9HYnywBLKAnKj+znnUDQxqf7HMsI+nwdK6gxUUKog=;
        b=05JBoYCs0Xz/WrLc0ObLSVWl+M8NY9YMrGuPJ8xLs3swWcznnSqG3Y0ihcU1i3KtKg
         BPXy5b1StHJtkSOWzXSKmJWIKQZM7dJ/0lXGNET1ks5wkJFqIq9fkAFUgWxucGH7pC1+
         /2zF48duKzK4Lo4oJQz3I319aPHZ/JJdQzzo3lruYYhdwq5yTFpqc2Drw6lfRef42waN
         O87U/qVCrcsQbT2lLSERd915XLOlHjtjFB38rYKhNTierulVK5lNy3mHSTqtmw8FYd3D
         fgR9n4O435FR9GCW84zB/lFMGJsX2D/HKn6w/cF/rpVdB6Zx2hDf8fwiWA5ZtyAYg3I9
         nTHQ==
X-Gm-Message-State: ACrzQf2SplvkrxqsjxJ2ktL7CR68GKTqtNnr13GH5a54y48MTafiuF8S
	hY9f93QTbZRslylN5vc0CpBbDw==
X-Google-Smtp-Source: AMsMyM4CI56MoPkBYHfKNTWWd82vbJ9ouSxHTzz89N+BnGbFsWbsGBpY753rS4H1VwrtNhHaGqKUAA==
X-Received: by 2002:a2e:a801:0:b0:261:91a3:bc44 with SMTP id l1-20020a2ea801000000b0026191a3bc44mr7213846ljq.497.1664189049185;
        Mon, 26 Sep 2022 03:44:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y1-20020a05651c020100b0026c423959desm2313408ljn.25.2022.09.26.03.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:44:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Gaosheng Cui <cuigaosheng1@huawei.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 2/2] ARM: s3c: remove orphan declarations from arch/arm/mach-s3c/devs.h
Date: Mon, 26 Sep 2022 12:43:54 +0200
Message-Id: <20220926104354.118578-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
References: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gaosheng Cui <cuigaosheng1@huawei.com>

s3c64xx_device_spi1 and s3c64xx_device_spi2 were removed by
commit f1ba938e4f98 ("spi: s3c64xx: Delete unused boardfile
helpers"), so remove the declaration, too.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20220914034615.1240860-3-cuigaosheng1@huawei.com
---
 arch/arm/mach-s3c/devs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-s3c/devs.h b/arch/arm/mach-s3c/devs.h
index 02b0c5750572..991b9b2006a1 100644
--- a/arch/arm/mach-s3c/devs.h
+++ b/arch/arm/mach-s3c/devs.h
@@ -33,8 +33,6 @@ extern struct platform_device s3c64xx_device_onenand1;
 extern struct platform_device s3c64xx_device_pcm0;
 extern struct platform_device s3c64xx_device_pcm1;
 extern struct platform_device s3c64xx_device_spi0;
-extern struct platform_device s3c64xx_device_spi1;
-extern struct platform_device s3c64xx_device_spi2;
 
 extern struct platform_device s3c_device_adc;
 extern struct platform_device s3c_device_cfcon;
-- 
2.34.1

