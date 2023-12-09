Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F30AC4167B
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F898C43391; Sat,  9 Dec 2023 23:31:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CDC3C433BD
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8CDC3C433BD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c19467a63so37509575e9.3
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164700; x=1702769500; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soCDsbziWMjEDTQYnQ64foy2UwOB+R/XTZlhNIOpiP0=;
        b=a+7oZwJ2k/VUDfhBJM29IIr6suk6BHdZrOk/3sYH+LDra2InF7akEqAE5DUJ61j5n1
         0apu5qBGgCzICGHcspdkyv8EzO90To/gdvfNqLZDHngcnAQYidCxIxXDl05I6o8wCfnW
         h/GxjgmhpPavshAZoQiaO6rSRINGImFX22oWuh9vor1IwqK1gaIggCv/aUwhynvuTzTI
         lnvNDlvB8H3DBIGHgbdS9X4TZ2jyhg8Z/JrdJl4M197GnagN3D3o96gKvWKjq/QYfelz
         r+jX67QI6xSjeixJ5qnBoMc9U0mIU+6zTMUkkI7UkdMuU+ezn7KXBFhDA4hA4NJN1k9r
         Z7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164700; x=1702769500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soCDsbziWMjEDTQYnQ64foy2UwOB+R/XTZlhNIOpiP0=;
        b=e0hQA3GcUVhzpH5EfYnYUIHHLeOIBp/ol55btt8Kxd/xu4O6Rrak/mVqGjA+FI2OMH
         YG7dGX5u9EhmspbUrT0GfPH2USnFpOK6hSvu06s+vDqe8HYtBgb8mA3JpN1dsRIABDwO
         9MX4eytnR8FPDEN6pRMbqwHhYmWhcIEmxULL4WxNsoC4/Ebmt15BiplcALOxdig3DTP5
         CnBf2o3Bhojp5nmsov8GEDJZOp0k1G6nfbl/w4AIFxTzf1zL43EDQIxyziGkUB9cnPJ/
         xAXdHZUbig9I+lVUuQkORqs9kN6j7Dh/imv1uNp78AVUbEPMIoat/nlijIbVmjX4MYgT
         UfUw==
X-Gm-Message-State: AOJu0Yz7r6vII2cTJSYLNeyaaHQs2B+e6NGZTiGiO2Gn5ULwHnL6agEn
	mAXEnDDo4RzVX64wqTk+SB8Dmg==
X-Google-Smtp-Source: AGHT+IEUBVq8sgwqtHRsSS/nPjrEPO98vrFoc53nL2VVao5ksAohOugyOhmdyjcNcE4eUD0JRw61+Q==
X-Received: by 2002:a05:600c:4591:b0:40c:2b77:1342 with SMTP id r17-20020a05600c459100b0040c2b771342mr1021684wmo.42.1702164700664;
        Sat, 09 Dec 2023 15:31:40 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:40 -0800 (PST)
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
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
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
Subject: [PATCH v6 17/20] tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data
Date: Sat,  9 Dec 2023 23:31:03 +0000
Message-ID: <20231209233106.147416-18-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add serial driver data for Google Tensor gs101 SoC and a common
fifoszdt_serial_drv_data that can be used by platforms that specify the
samsung,uart-fifosize DT property.

A corresponding dt-bindings patch updates the yaml to ensure
samsung,uart-fifosize is a required property.

Tested-by: Will McVicker <willmcvicker@google.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 1b0c2b467a30..71d17d804fda 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 	.fifosize = { 256, 64, 64, 64 },
 };
 
+/*
+ * Common drv_data struct for platforms that specify samsung,uart-fifosize in
+ * device tree.
+ */
+static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_data = {
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+	.fifosize = { 0 },
+};
+
 #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
 #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
+#define EXYNOS_FIFOSZDT_DRV_DATA (&exynos_fifoszdt_serial_drv_data)
 
 #else
 #define EXYNOS4210_SERIAL_DRV_DATA NULL
 #define EXYNOS5433_SERIAL_DRV_DATA NULL
 #define EXYNOS850_SERIAL_DRV_DATA NULL
+#define EXYNOS_FIFOSZDT_DRV_DATA NULL
 #endif
 
 #ifdef CONFIG_ARCH_APPLE
@@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "artpec8-uart",
 		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
+	}, {
+		.name		= "gs101-uart",
+		.driver_data	= (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_DATA,
 	},
 	{ },
 };
@@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = EXYNOS850_SERIAL_DRV_DATA },
 	{ .compatible = "axis,artpec8-uart",
 		.data = ARTPEC8_SERIAL_DRV_DATA },
+	{ .compatible = "google,gs101-uart",
+		.data = EXYNOS_FIFOSZDT_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
-- 
2.43.0.472.g3155946c3a-goog

