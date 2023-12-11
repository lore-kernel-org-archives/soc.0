Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AB2C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 16:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B7E6C433CD; Mon, 11 Dec 2023 16:24:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB30FC116AF
	for <soc@kernel.org>; Mon, 11 Dec 2023 16:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB30FC116AF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3360ae2392eso2955599f8f.2
        for <soc@kernel.org>; Mon, 11 Dec 2023 08:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311873; x=1702916673; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soCDsbziWMjEDTQYnQ64foy2UwOB+R/XTZlhNIOpiP0=;
        b=xCtz4I5+uPwTuqzCjwh0pIAzuqCeUzCd5L/v3TJNPqJlIpMATihkdJz1dXXfNEEEk6
         vSeb6jqm6dYFckJvJaU4svHA8NrubzT4an3lUcywrstKZxBnIF6SXVNLNklbpsXSSxEg
         UkFp9Ixy6XGqPjZ3JdhEDtIQ5uwM2ncVFg8xKPcEdUsznScPEzLOLHvDp1/ur0OePT1T
         +b17gYeDRud5e+4XotHfP621LmSNSySmz2cn9k6EwfLvV4QEOmfTkFJr/mVnF+k2JD5b
         KHFhMlIfFCL5maKv+iquTSFHLApYo6wreeMM1Qb1pGmw+n/2j4XGU5qWUSVyfqrzVNGI
         /ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311873; x=1702916673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soCDsbziWMjEDTQYnQ64foy2UwOB+R/XTZlhNIOpiP0=;
        b=rBjHPc6JhbN/SYXejwFZq41GpnGo8q40EHhT/FOL3lh7WxpPNh3ErM9ldm1C9ERsM9
         domMetYyybRH9rMopn49ka3HSjSR9s1FmkXko0NFsYdozgmt3pnQ2/2XlC/5R3rJjzdS
         MGSlh9ibyebtJPJwbLkPnixZKfl3Iz2RAbiy3Jw/OAC6TO1qIq4TLJFCBOkxcgEJLCNE
         ibveQUyMERjKkh+1+65n5g5/vn5Gqx2fyfHfPtfov8fgi/uCBP4aGfQ0iYh5HT60oN/D
         0IhsJaFucrzj9ODUv/rj2RWHFrXyXRph7SQ3Q9zbsB+ou+LTyfvY5MbLz7/3Th4toKnG
         Kw1g==
X-Gm-Message-State: AOJu0YzBPqb4XL9N47B/wAqGKELYJnkJt46zBjsnCJIQxnyI/+uCtoo/
	Mw0EVwzxr5bjQzYhbKIde5w3qQ==
X-Google-Smtp-Source: AGHT+IG8umBo1u1ZfEfeCl0PvULKc4ZOBWDQmYUZk0RSYEHoF9NTjOzHwGb+4PRIdrH5nk5CfFUEqQ==
X-Received: by 2002:adf:f70f:0:b0:333:3af7:a4ef with SMTP id r15-20020adff70f000000b003333af7a4efmr2016600wrp.8.1702311873314;
        Mon, 11 Dec 2023 08:24:33 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:32 -0800 (PST)
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
Subject: [PATCH v7 13/16] tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data
Date: Mon, 11 Dec 2023 16:23:28 +0000
Message-ID: <20231211162331.435900-14-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
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

