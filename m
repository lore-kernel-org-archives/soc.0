Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1128DCDB483
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1C57C116A6; Wed, 11 Oct 2023 18:49:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84285C116AC
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84285C116AC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so140551f8f.3
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050174; x=1697654974; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn/hubDRHoceh4+bRLROPNwFC8WSZYf0eD2X8sEh5eo=;
        b=yR2wE1UaYHVZgwa6Xt2LkT4A/4u0FIlweMiPWzwjDnr2bgubOcO3ZaaOZGm84pBks2
         0B2P3VQsTnS/FQvZe6m72iLhtKXyLLx2gtJaiC5qRUuJkr23HnhUx1PkIeLZb5vWNI6R
         a4Jl2+HPTOp01xJo5pBlaOePWCl6HhbQIgKIvrum3TQv/KMtHoaVB8WElMQG37LE/ECZ
         At3Fu0ZtbQT1fsJVh1pcaUEaer8C++qkFGl66YrgsYvvB/A24IsxaDvei33VHJ6TcDWC
         m3duppDZqfjgUt12Si63p/+B3XIRrPSyeo41S8WvWRwoqZyYhjKN7Z5Xp7Ey9np/dujr
         ngzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050174; x=1697654974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn/hubDRHoceh4+bRLROPNwFC8WSZYf0eD2X8sEh5eo=;
        b=uUX5aoF/WsUeqsqwzFyTAshJbGB70tcPgQfpzn4QCExvSm7fulOThTpvObohBiwhM0
         Q5kZrudibYOANO8x9mrt+se+FQgC1X/ZXKIBnlrLfAXA4vozl7Y2TBpXZtafyutY2W2g
         fjlZkNDscFRphj+lurzSIr9tsnPs11U/DQVcd+c5tEz81rUXx9K4sVBvtoEwaeMHXKJV
         4rzOk1ciZrSgKRlIru5WSPcN4bMrnh4o7TpOw1xZymlQ1u+/Is6A9wuKxqyziFqy0yuH
         aEj6iDmc3F8Vr5nbZsLK9DLw1YW362PgVgt/GHJs63N6mih0M0EIQqbpqvLV4MC2CiZX
         4Ggg==
X-Gm-Message-State: AOJu0YzOewSyUiNXW9jwbKCroAxYWt4jgKfj/e9hQ1WvwtIypwuyDy6n
	wfzPMzWwnTIqCPGTxOAYJMUWRw==
X-Google-Smtp-Source: AGHT+IHW9386VXpmqzDlaPxSkIQn53/ePvUVUCDgQrjJjB/fufpo5Qz6HfgBBh0a6HufjVjZL3AVIw==
X-Received: by 2002:a5d:44cd:0:b0:32d:885f:3f8d with SMTP id z13-20020a5d44cd000000b0032d885f3f8dmr1809992wrr.52.1697050174611;
        Wed, 11 Oct 2023 11:49:34 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:34 -0700 (PDT)
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
Subject: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and SoC data
Date: Wed, 11 Oct 2023 19:48:19 +0100
Message-ID: <20231011184823.443959-17-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add serial driver data for Google Tensor gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 07fb8a9dac63..26bc52e681a4 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 	.fifosize = { 256, 64, 64, 64 },
 };
 
+static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+	/* rely on samsung,uart-fifosize DT property for fifosize */
+	.fifosize = { 0 },
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
@@ -2688,6 +2696,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "artpec8-uart",
 		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
+	}, {
+		.name		= "gs101-uart",
+		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
 	},
 	{ },
 };
@@ -2709,6 +2720,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = EXYNOS850_SERIAL_DRV_DATA },
 	{ .compatible = "axis,artpec8-uart",
 		.data = ARTPEC8_SERIAL_DRV_DATA },
+	{ .compatible = "google,gs101-uart",
+		.data =  GS101_SERIAL_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
-- 
2.42.0.655.g421f12c284-goog

