Return-Path: <SRS0=fNzu=F6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28E1CDB465
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 07:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD5ACC433C9; Mon, 16 Oct 2023 07:29:23 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7149BC433CB
	for <soc@kernel.org>; Mon, 16 Oct 2023 07:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7149BC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9be3b66f254so300050566b.3
        for <soc@kernel.org>; Mon, 16 Oct 2023 00:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697441360; x=1698046160; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqUJPR82M/GrL4dP6m89n4qgbfjI0fh+82Bf+wW3Bm0=;
        b=dVY1Jo9hcmNwjq/nEx2p+ewly46i2oyBU8yLH21l4qJTf3v1/vIgL7UieSyklDM1nj
         MmZZBZ0U4y1r27p/bOasCqq7W9D72MTM8jopKbxsNqKHA3AGHchwhXg7Jy86fPkEaKnA
         Y6n4x/9QFgfOEMMKhQfSOk8W8Ch/07+3HrhzKnYPQtOvNy6WX5pJ1z9wWCvdsL65UEFk
         o11KTyUYiVwhRKEBx7Nnq2EYMIhnPujUePc4lq0IPRXjpsy7ZAgd0kw9CUuL5EPPOgkA
         zg8xIlvFmD+JQkVo3bWOgxdHPMQn+NSN20B2xfduJqmIks1P7lSE/EDAtIabeU70Xopx
         0qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441360; x=1698046160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqUJPR82M/GrL4dP6m89n4qgbfjI0fh+82Bf+wW3Bm0=;
        b=mZUz3EYIGlRd2X6GdqeuB09cGWbHFF/94Wbl3rSsnAXQZGIMLRpYpZpqOcy2+oSCdT
         VbpDoIL2+j1WREVAaQxvxC4ORVz2ByAAzii+B5ukO5FNVfEyOpGrEPSOOuZgqgpnBoxn
         pULPoZOqwBulQ0J97xS4criBgp4GgvdTQUORPdESkFBju6FjF+c9B020rhdSI2Za/59F
         StS8aszuOLT9Dy4AHxVQt7ZaVObTB7x9isgz/D9nYtq2B0SLJUzcoRsEXn28lgdAtOtz
         oQlPjG5Mb6v8Q3ztJlTViWOTXSkgV1rpxVtkzqW6JJbdhzEhDgCQzJGUMLTr0/bcjlI0
         YenA==
X-Gm-Message-State: AOJu0YzhBGBa9qndg7b3EreQwWlOpSMSBsb2EmPQqTIO4DS68l4X4nZp
	DjhqkwWt8odfx0TFTfe9YdCl+Bm+27fmqv6NKzU=
X-Google-Smtp-Source: AGHT+IHKAAmAs/xPLBwNLBR/dxRcRGzHtNIhdw2eBqAu5qPkmdZhT8WwNLowzzN4VCvYh6lJBlAutQ==
X-Received: by 2002:a17:906:ef04:b0:9be:16ba:19ab with SMTP id f4-20020a170906ef0400b009be16ba19abmr6175626ejs.29.1697441360797;
        Mon, 16 Oct 2023 00:29:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090606c300b009b29668fce7sm3480791ejb.113.2023.10.16.00.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:29:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PULL 2/2 PATCH] soc: samsung: exynos-chipid: Convert to platform remove callback returning void
Date: Mon, 16 Oct 2023 09:29:11 +0200
Message-Id: <20231016072911.27148-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016072911.27148-1-krzysztof.kozlowski@linaro.org>
References: <20231016072911.27148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Link: https://lore.kernel.org/r/20230925095532.1984344-32-u.kleine-koenig@pengutronix.de
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 7ba45c4aff97..3fd0f2b84dd3 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -158,13 +158,11 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int exynos_chipid_remove(struct platform_device *pdev)
+static void exynos_chipid_remove(struct platform_device *pdev)
 {
 	struct soc_device *soc_dev = platform_get_drvdata(pdev);
 
 	soc_device_unregister(soc_dev);
-
-	return 0;
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
@@ -197,7 +195,7 @@ static struct platform_driver exynos_chipid_driver = {
 		.of_match_table = exynos_chipid_of_device_ids,
 	},
 	.probe	= exynos_chipid_probe,
-	.remove	= exynos_chipid_remove,
+	.remove_new = exynos_chipid_remove,
 };
 module_platform_driver(exynos_chipid_driver);
 
-- 
2.34.1

