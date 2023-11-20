Return-Path: <SRS0=kXw4=HB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ECAC5CFC2
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E772C16ABD; Mon, 20 Nov 2023 21:21:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D45CC433BB
	for <soc@kernel.org>; Mon, 20 Nov 2023 21:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D45CC433BB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso20234755e9.3
        for <soc@kernel.org>; Mon, 20 Nov 2023 13:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515288; x=1701120088; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/mzODFNq007haYnpXxrx2Ui7JbMB+DCZL/XRt/A0kU=;
        b=Z+PC+7jFFzIPWHuJ7O15BkGqxpPtBClyqRSn+Y9ipqIDV1MNa4p4yUKIVCe8JUmxg5
         TQSveTnuvkWjSp0WW1hAZFGNI4h/oB8qIayJvrsvn+qyOaJI3yT5UxlhmK+vddhpOg3Z
         xD7l3YefEbIMfbKmD68PlMx9TeSvo5PimFvWGqmOErclZ0K3XpyYjeNYqPWfA7WwKktF
         z64xm5ju/b1pbU3wIqfEf8keNzpwmqWq3aa6Sr4mvzsPBYuNODo17JfZabB37RvlqlJF
         madWEc9KPdtvUj9OBW0RYMDQc5m0ZcwBqh8kEW11orH+1YZq/X5f0SHK9V1fsjtbTBpb
         io8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515288; x=1701120088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/mzODFNq007haYnpXxrx2Ui7JbMB+DCZL/XRt/A0kU=;
        b=Q+agmA5seVo2JTFbmBdLrhaHx78ZJPLhoTJo7SqZVV7e3bmoeBGvtTKM4YvbJdSeWJ
         rXlRm4IYASq0Dc8p64CeXtraNK6A9Nr45vd24m2LSPo7rwX57kiQJs6KhNh6rClCIlHJ
         A6rgdd7nKdrBLXcqHGv2HJug2Hhl2OYINSqtVgFozb2CeVV4J2qSUt+ms4QmSf8vWA+v
         tLwJ27PCiQyNv7EEpWpCl8E2h2QqobJN3x5Wg/snxopTp5xS1XR0zFOjgEIHPFtLCXik
         RkQYCvB4CA1/2v154fP5iAmx751umuyZhBHD/AI6aQpmmKKBKuBs+Fc8vIhAqz2vf1Hw
         FWtg==
X-Gm-Message-State: AOJu0YypxALmOSxld7ayMkxPWZwB4E0xTP7OwcwsLWfj9TzVPHSjNnNv
	4Of7ixsPoSH8eyU7P2hvtcTAqw==
X-Google-Smtp-Source: AGHT+IEaUMpDeFVph8md8u4hazPSIXB5CfnkNERv80cTAbsRvaZtvo5jkS181KLGKQuyKUgInEXaQQ==
X-Received: by 2002:a05:600c:1547:b0:405:36d7:4579 with SMTP id f7-20020a05600c154700b0040536d74579mr5882578wmg.28.1700515288355;
        Mon, 20 Nov 2023 13:21:28 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:27 -0800 (PST)
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
Subject: [PATCH v4 14/19] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
Date: Mon, 20 Nov 2023 21:20:32 +0000
Message-ID: <20231120212037.911774-15-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the compatibles and drvdata for the Google
gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.

Similar to Exynos850 it has two watchdog instances, one for
each cluster and has some control bits in PMU registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 47 ++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 0b4bd883ff28..08b8c57dd812 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -67,6 +67,13 @@
 #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
 #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
 
+#define GS_CLUSTER0_NONCPU_OUT			0x1220
+#define GS_CLUSTER1_NONCPU_OUT			0x1420
+#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
+#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
+#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
+#define GS_RST_STAT_REG_OFFSET			0x3B44
+
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
  *
@@ -263,6 +270,30 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
 };
 
+static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
+	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 0,
+	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 8,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_WTCLRINT_REG,
+};
+
+static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
+	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 1,
+	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_WTCLRINT_REG,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
@@ -278,6 +309,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos850_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
+	{ .compatible = "google,gs101-wdt",
+	  .data = &drv_data_gs101_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -585,9 +618,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	}
 
 #ifdef CONFIG_OF
-	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
+	/* Choose Exynos850/ExynosAutov9/gs101 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
-	    variant == &drv_data_exynosautov9_cl0) {
+	    variant == &drv_data_exynosautov9_cl0 ||
+	    variant == &drv_data_gs101_cl0) {
 		u32 index;
 		int err;
 
@@ -600,9 +634,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 		case 0:
 			break;
 		case 1:
-			variant = (variant == &drv_data_exynos850_cl0) ?
-				&drv_data_exynos850_cl1 :
-				&drv_data_exynosautov9_cl1;
+			if (variant == &drv_data_exynos850_cl0)
+				variant = &drv_data_exynos850_cl1;
+			else if (variant == &drv_data_exynosautov9_cl0)
+				variant = &drv_data_exynosautov9_cl1;
+			else if (variant == &drv_data_gs101_cl0)
+				variant = &drv_data_gs101_cl1;
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
-- 
2.43.0.rc1.413.gea7ed67945-goog

