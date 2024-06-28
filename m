Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14E0C2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A29A6C32786; Fri, 28 Jun 2024 18:09:11 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1F20C4AF17
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1F20C4AF17
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d55f198f1eso428551b6e.0
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598150; x=1720202950; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TES+PR3oco/zso5TBiV82fiMxzPeRQiTqnjOENaSm6Y=;
        b=jIi3rc4Jt98HRX5y3uwrsUvN6v+DnMgBAtaKiguAwK8S9jEUtgxRoMIYZlb2ab2ldV
         DvyqUHaUlCOiLvXjIidM4nUjkEfTbOw/ixtftzeu4gTpJUpC2/I08AuUpNODwvmdiJbT
         UreVtUqh57tc6RAkP+MNpcdT84J98ll+zcTwU87xcZH1QryS8tbbNoGR6+Ry870c97HM
         Chd6SqEDqDk8bXEt9xr6MMQ8zPuWJsJ/XluBTmd20KZrA8XSMTr+ytw+F1u09Yj8PkFT
         WooEzBRkkUGzsgbNVV4TO3hHckhPf4sDGrdo4lEh2a9SRNYJhijJYnsctTYXLCZotE3B
         x5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598150; x=1720202950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TES+PR3oco/zso5TBiV82fiMxzPeRQiTqnjOENaSm6Y=;
        b=g/UHbcAOQ4pCOem/66f1GfjXOBf2t5VQeeXT3EaeqdQCfGw10QDLh6oKnuELp7N5sl
         1K21rkiUj8k0phUSBzClkRYAirdAT+a9K3OxEIuVethtZ+BPzqMoCg3xNyPr32seLvdu
         5l2dm8ex8Wpi4gdgxbi61wxbySXCX9Eow84mETiBH6fR4OcDpMXo96n+bH2M1Q+MXSv4
         fmMcLBPW+TU4RNscT7SpAfMO97+sa83WesXukeTcstWPqKF/ZYcEp0lYytZ6Setp6CKg
         3kkRNzJSOfE/BSIp/3YxqUjfCZ6B/82uIdn+wc+Oeq8PIARpp6asEwGH+PiU8yYUceIv
         OjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgaDrtUWVqabD79Lwwb5RjESHxqOYSAd+O9xCv4HycgCSyuHE6xZ4/6YFDZvoLCBfoku6Yiwg04UyM2GBh0w==
X-Gm-Message-State: AOJu0YwqDsiUfqHy1Ik7M8r70FupMgDeXbB8X7xP4bXwd7UxL9kP5qqr
	+OKCEEMorQXuaWFrfWa467IOfWxRs30g/g9uLxuVL8wOvGQLwJ+q8OaJMA==
X-Google-Smtp-Source: AGHT+IFbVQmOnqIXtYzrw7G3AGIcltAq/SwDu0tAxwBmNb/x6ZxkTvrB7B5PQEu7pirK0ugnnATPyg==
X-Received: by 2002:a05:6808:16a6:b0:3d2:22c6:59d3 with SMTP id 5614622812f47-3d541c50f73mr19803715b6e.6.1719598149794;
        Fri, 28 Jun 2024 11:09:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:09 -0700 (PDT)
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
Subject: [PATCH 07/10] ARM: spitz: Use software nodes to describe LCD GPIOs
Date: Fri, 28 Jun 2024 11:08:47 -0700
Message-ID: <20240628180852.1738922-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Spitz to use software nodes for specifying GPIOs for the LCD.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 278d49ed7a9c..c79510185ce3 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -532,22 +532,24 @@ static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
 	},
 };
 
-static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
-	.dev_id = "spi2.1",
-	.table = {
-		GPIO_LOOKUP("sharp-scoop.1", 6, "BL_CONT", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("sharp-scoop.1", 7, "BL_ON", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry spitz_lcdcon_props[] = {
+	PROPERTY_ENTRY_GPIO("BL_CONT-gpios",
+			    &spitz_scoop_2_gpiochip_node, 6, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("BL_ON-gpios",
+			    &spitz_scoop_2_gpiochip_node, 7, GPIO_ACTIVE_HIGH),
+	{ }
 };
 
-static struct gpiod_lookup_table akita_lcdcon_gpio_table = {
-	.dev_id = "spi2.1",
-	.table = {
-		GPIO_LOOKUP("i2c-max7310", 3, "BL_ON", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("i2c-max7310", 4, "BL_CONT", GPIO_ACTIVE_LOW),
-		{ },
-	},
+static const struct property_entry akita_lcdcon_props[] = {
+	PROPERTY_ENTRY_GPIO("BL_ON-gpios",
+			    &akita_max7310_gpiochip_node, 3, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("BL_CONT-gpios",
+			    &akita_max7310_gpiochip_node, 4, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static struct software_node spitz_lcdcon_node = {
+	.name = "spitz-lcdcon",
 };
 
 static struct corgi_lcd_platform_data spitz_lcdcon_info = {
@@ -572,6 +574,7 @@ static struct spi_board_info spitz_spi_devices[] = {
 		.bus_num		= 2,
 		.chip_select		= 1,
 		.platform_data		= &spitz_lcdcon_info,
+		.swnode			= &spitz_lcdcon_node,
 	}, {
 		.modalias		= "max1111",
 		.max_speed_hz		= 450000,
@@ -606,11 +609,6 @@ static void __init spitz_spi_init(void)
 	struct platform_device *pd;
 	int err;
 
-	if (machine_is_akita())
-		gpiod_add_lookup_table(&akita_lcdcon_gpio_table);
-	else
-		gpiod_add_lookup_table(&spitz_lcdcon_gpio_table);
-
 	gpiod_add_lookup_table(&spitz_ads7846_gpio_table);
 
 	pd = platform_device_register_full(&spitz_spi_device_info);
@@ -619,6 +617,8 @@ static void __init spitz_spi_init(void)
 		pr_err("pxa2xx-spi: failed to instantiate SPI controller: %d\n",
 		       err);
 
+	spitz_lcdcon_node.properties = machine_is_akita() ?
+					akita_lcdcon_props : spitz_lcdcon_props;
 	spi_register_board_info(ARRAY_AND_SIZE(spitz_spi_devices));
 }
 #else
-- 
2.45.2.803.g4e1b14247a-goog

