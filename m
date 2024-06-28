Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF979C3065A
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEA9AC32789; Fri, 28 Jun 2024 18:09:14 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0B59C4AF0A
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0B59C4AF0A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-706a4a04891so714731b3a.3
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598153; x=1720202953; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UaptWOE/d6S6pBZfH91tBCmSGK27RbRnUptUO4PI8g=;
        b=REyw98x3eKOFnyA+CVFMXvrQ56BXmHC6R3tX1X08O8HAogrGOKX0o4/RkHImFsblzE
         eCw0uwfsOFi/nf8U12DB693PnZee15H5H7N5f0CH7f4mGY+OgEnmdqhcaMvP+hEfGSAX
         HlxUk3CcD3516t+kdELzGolqExKV+88wqrcp/9ztIVY/24ZUP++OcByvthOGM85C2wY+
         K8gy8qmc8MQrKrW8ZM6UA45dReIu4wHgxbBQp7OBVuYL8zJx1DgCYaRCl6lRyETEGx0M
         UXEWXmzj1ahdfR/bYXN+TtF9R2IUKOO1sUtAkZCf23EeLGBuH7uIl989Phj/Ue8trPpE
         OKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598153; x=1720202953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UaptWOE/d6S6pBZfH91tBCmSGK27RbRnUptUO4PI8g=;
        b=Ylq6FztMHQWfvkKGeovlDVVVeYCaQY37vDrOT96KQia0bSRVylyodBweueI0R1Di2N
         GiPo3iGc2Hl0vu9rrGZQ4fNQTiDDYtw0wG46sBL1lmPYYesYCJQRrz8EO/+rRWouhBDP
         YeTYI3dLd5SO4BLLD97VJ7rNZ/qzqP+CHWJhDF3+Wa3rj3hW0x15Jw9bTLJiFxK8G7lq
         tr2o9X03wCwirf/E+Xt6I6ngmpzBi/dLA36s/UvZ8OMRVtIhI021oaEN8W1e/9VGeUMX
         oWld9Y9W8ucqkHy+6Zrk++dJx/VqEqvfVSk8HJIuBDz4VzQRyasTfehZX63Xyj4M125j
         aifQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb9Vt1QhhYs/SHCGTjL9idSJVzSJdYq4EOpVf7qllPEsmiaQvODwc2PdK+KNfPh8Tq4lQAg3U04oyK2EMApw==
X-Gm-Message-State: AOJu0YyNUZFtbBrFYc6CztlmdUhHlUL9ofvRcUphq1rtLi4ZhQddqmeN
	UU3pUeJLudXbttcJungp6LhN0FUo9rkMzaGk8XdNffLGXCAXgVfq
X-Google-Smtp-Source: AGHT+IEo27gQsi1ZqtXMWNPG5YGN57sEOTwCgh0eIFUABFtz/d5KvfYYUSc8KC42EYmSwAdXlE8ycw==
X-Received: by 2002:a05:6a00:884:b0:705:940a:c80e with SMTP id d2e1a72fcca58-70670e7a740mr22843851b3a.3.1719598152869;
        Fri, 28 Jun 2024 11:09:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] ARM: spitz: Use software nodes for the ADS7846 touchscreen
Date: Fri, 28 Jun 2024 11:08:50 -0700
Message-ID: <20240628180852.1738922-11-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Linus Walleij <linus.walleij@linaro.org>

Convert the Spitz to use software nodes to describe GPIOs for the
ADS7846 touchscreen. As part of the conversion switch from the custom
wait_for_sync() callback to defining hsync GPIO that can be used by
the ads7846 driver to detect hsync.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 40 +++++++++++++++------------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index b19d4ed35192..452bf7aac1fa 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -534,31 +534,23 @@ static inline void spitz_leds_init(void) {}
  * SSP Devices
  ******************************************************************************/
 #if defined(CONFIG_SPI_PXA2XX) || defined(CONFIG_SPI_PXA2XX_MODULE)
-static void spitz_ads7846_wait_for_hsync(void)
-{
-	while (gpio_get_value(SPITZ_GPIO_HSYNC))
-		cpu_relax();
-
-	while (!gpio_get_value(SPITZ_GPIO_HSYNC))
-		cpu_relax();
-}
 
-static struct ads7846_platform_data spitz_ads7846_info = {
-	.model			= 7846,
-	.vref_delay_usecs	= 100,
-	.x_plate_ohms		= 419,
-	.y_plate_ohms		= 486,
-	.pressure_max		= 1024,
-	.wait_for_sync		= spitz_ads7846_wait_for_hsync,
+static const struct property_entry spitz_ads7846_props[] = {
+	PROPERTY_ENTRY_STRING("compatible", "ti,ads7846"),
+	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 1024),
+	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 419),
+	PROPERTY_ENTRY_U16("ti,y-plate-ohms", 486),
+	PROPERTY_ENTRY_U16("ti,vref-delay-usecs", 100),
+	PROPERTY_ENTRY_GPIO("pendown-gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_TP_INT, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("ti,hsync-gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_HSYNC, GPIO_ACTIVE_LOW),
+	{ }
 };
 
-static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
-	.dev_id = "spi2.0",
-	.table = {
-		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_TP_INT,
-			    "pendown", GPIO_ACTIVE_LOW),
-		{ }
-	},
+static const struct software_node spitz_ads7846_swnode = {
+	.name = "ads7846",
+	.properties = spitz_ads7846_props,
 };
 
 static const struct property_entry spitz_lcdcon_props[] = {
@@ -595,7 +587,7 @@ static struct spi_board_info spitz_spi_devices[] = {
 		.max_speed_hz		= 1200000,
 		.bus_num		= 2,
 		.chip_select		= 0,
-		.platform_data		= &spitz_ads7846_info,
+		.swnode			= &spitz_ads7846_swnode,
 		.irq			= PXA_GPIO_TO_IRQ(SPITZ_GPIO_TP_INT),
 	}, {
 		.modalias		= "corgi-lcd",
@@ -638,8 +630,6 @@ static void __init spitz_spi_init(void)
 	struct platform_device *pd;
 	int err;
 
-	gpiod_add_lookup_table(&spitz_ads7846_gpio_table);
-
 	pd = platform_device_register_full(&spitz_spi_device_info);
 	err = PTR_ERR_OR_ZERO(pd);
 	if (err)
-- 
2.45.2.803.g4e1b14247a-goog

