Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8FDCD98C0
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D60ECC116B8; Tue, 10 Oct 2023 22:50:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C201C43395
	for <soc@kernel.org>; Tue, 10 Oct 2023 22:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C201C43395
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-325e9cd483eso5904518f8f.2
        for <soc@kernel.org>; Tue, 10 Oct 2023 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978209; x=1697583009; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYprZVFUFFzXb/GEC6qC9cNPUPhkcdvlPZq1XksyVt4=;
        b=C2pmgMjl5H2WmrJafBXt3RZDUcT8Wq8r/V7MOxi3IX8LRlXHa6FvEjZ1iNU2qB8sqX
         VR1tCOk9wEDgwsy0cPRm9QaQbZ/quge5xiFeqf4jWPaomO1ZhQpQj9wAmey8C0TYwIoJ
         W2HAfZhk72w0Xsp8NkmpBKFsj9dPv+6u+EOHysAU3GLEzmrACu9oEWnF/y7VHveszm/F
         2Latn4hIO6V2/X9dst+9PF+xlyWARdpDn+7MaOp4Vjq4MbZzHfVQxpAJTtgmRjtW+RmV
         Nt9pJSsdzSYzAZIx2pr4bpu1uvxea5st+Ujk6ucCS57nnbgT+Q08pDwWaFNa1fsa8THI
         OjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978209; x=1697583009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYprZVFUFFzXb/GEC6qC9cNPUPhkcdvlPZq1XksyVt4=;
        b=D4ggDtWS0pGk9PeJVjDRKV46+YmnAZE+NaZqc6DyIbqgLlRmewzF0fbQH3a4lMD5CG
         mbLg3EhOXAdTnbO4kpxRv519YOIWOVo1CUDOYbO0z6mFeQ5s+0snFngdElt+I8MQDu41
         gWL2ftwWYgRHHUr4PjmFK5URSeZChj3EIwKa4zU9UWk0KtNVPPH4slqU5NbuotIkBViV
         kFBo8VuRZmPHKP0sh02eekYWkyHMPYG9iTYLHPVjxFwd6SQaKwF7JW2fH66ozLcqjPhy
         ktYvVqpM718LBKbpE8tOF1eI/Tsw3oB+FJ3VEBZnhUomLsMkjyDoY96xBtfMuRp7Qe9H
         PZNA==
X-Gm-Message-State: AOJu0Yyj66hOOrIVgtdMRPhuuJ4J9BvPEIgWWkKX7sUObSzzrb7BVZZL
	D0nxcJ0m2BP4n/CAFYqgzCO51w==
X-Google-Smtp-Source: AGHT+IEeJhcbODxR8zPSq9gFQ6GybH3mc0pCQwSXlhSaLpJWvK2exY4QzZL5mkQKp2rXpPf5/YjZIA==
X-Received: by 2002:a05:6000:1c5:b0:32d:83b7:bdb4 with SMTP id t5-20020a05600001c500b0032d83b7bdb4mr244753wrx.9.1696978209476;
        Tue, 10 Oct 2023 15:50:09 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:50:08 -0700 (PDT)
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
Subject: [PATCH v2 16/20] tty: serial: samsung: Add gs101 compatible and SoC data
Date: Tue, 10 Oct 2023 23:49:24 +0100
Message-ID: <20231010224928.2296997-17-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add serial driver data for Google Tensor gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 07fb8a9dac63..79a1a184d5c1 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2597,14 +2597,21 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 	.fifosize = { 256, 64, 64, 64 },
 };
 
+static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+	.fifosize = { 256, 64, 64, 64 },
+};
+
 #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
 #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
+#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
 
 #else
 #define EXYNOS4210_SERIAL_DRV_DATA NULL
 #define EXYNOS5433_SERIAL_DRV_DATA NULL
 #define EXYNOS850_SERIAL_DRV_DATA NULL
+#define GS101_SERIAL_DRV_DATA NULL
 #endif
 
 #ifdef CONFIG_ARCH_APPLE
@@ -2688,6 +2695,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "artpec8-uart",
 		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
+	}, {
+		.name		= "gs101-uart",
+		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
 	},
 	{ },
 };
@@ -2709,6 +2719,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = EXYNOS850_SERIAL_DRV_DATA },
 	{ .compatible = "axis,artpec8-uart",
 		.data = ARTPEC8_SERIAL_DRV_DATA },
+	{ .compatible = "google,gs101-uart",
+		.data =  GS101_SERIAL_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
-- 
2.42.0.609.gbb76f46606-goog

