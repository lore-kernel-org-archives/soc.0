Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867D5C30658
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 785BCC4AF0A; Fri, 28 Jun 2024 18:09:09 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AA83C32789
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8AA83C32789
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d561d685e7so601686b6e.1
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598147; x=1720202947; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVMwheqA5PLjXICrqtVucOfQhWX0Fpnfz1fEEhxd/KA=;
        b=ikLdlblZVGMQEHFrfJEF8frS2h9J0AGkkDGFl7npKhrQbG+qhFchZNX3Ee1BUeXot/
         r3Uurvi30dlml9CJ7ZFctIcxWluRDGfzmaxJycGTEzVyZP/89gh6PO7d8f+XnV5nzbjw
         yojbUNSBZjuCtHeQKzz5fWMqnlNjYDIZaj00S9LyOjgzNVKruQfmxKaY28bNC6Lop2k5
         pHGUEwaaMKQGYMjp5CgDxSyj+0al2c+5/6CDN4NhLtZMsY3XkNVqv1opGMV/KB08OM5t
         A9slFmH6LSxrQwTENBqXpBuovd8rEYKGoWO2MAeMElUnltH+5vTSUHitGZ3gM2NV1toR
         H+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598147; x=1720202947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVMwheqA5PLjXICrqtVucOfQhWX0Fpnfz1fEEhxd/KA=;
        b=ALfXSVe+s4U+E4MqVYvduE/qdhcEQ1uZSlF+ulAgSN/Sef0/PC2PhWc/8Fu5DiI1Yl
         phV0qvohBYxnagZ9uvtFx9UYTkwK9RSh/vMh+nwLK3OMVnLN6bdBIvdf1XrZHacmOQIH
         /s/aaFJ4L4fdeprs/GAeAkW1utPQiR9eZEy+y0SQSEaqWKbdavXhk7s0Sja5VL5hS0yg
         ZltZFv5cKFmV4ec6WkcnbJ4ctERMATVmnomF9JJ2ndelMoKWSSmZ38rTZmalDXW3NLbI
         hb8q3V9aC9BphJi991oXJZIgIsN9IFs5c3xCC7U8mh3nOe1OQJkEkCSjwnUQNwiAxJwY
         Zupw==
X-Forwarded-Encrypted: i=1; AJvYcCX0GYGTKNxsjmAMI5b7B2TtKc80N8XHn68d8okvr9n8bGaDMV52l7sT8Pya1Rn0ELwp+V+3F5PXrov+X77JkA==
X-Gm-Message-State: AOJu0Yzze2RAj1TNJ+k7/z8gqeR6ZCTD1lVZ7m4B5U426m9Z3ZZY5was
	UcMWPwx8UoA/q5pPc96KLLMs+0m/w7GGX66hxxknoZuJSz468y3U
X-Google-Smtp-Source: AGHT+IGNZSGJXSF1ny8x7rMmOSnm4p25k/DcV8pt4n6UZoIc2gM1XH3BV8U4qDA1RrIettcCykcLqQ==
X-Received: by 2002:a05:6808:2219:b0:3d2:212e:71a0 with SMTP id 5614622812f47-3d54594bcd4mr20676903b6e.6.1719598147504;
        Fri, 28 Jun 2024 11:09:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:07 -0700 (PDT)
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
Subject: [PATCH 05/10] ARM: spitz: Use software nodes to describe SPI CS lines
Date: Fri, 28 Jun 2024 11:08:45 -0700
Message-ID: <20240628180852.1738922-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Linus Walleij <linus.walleij@linaro.org>

Convert the Spitz to use software nodes for specifying SPI CS. Because
the SPI core can figure out the number of chipselects from the number
of GPIO handles specified in properties, setting "num-cs" property is
no longer needed.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/pxa27x.c |  1 +
 arch/arm/mach-pxa/spitz.c  | 21 ++++++++++-----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index b135b9ef665c..f8382477d629 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -341,6 +341,7 @@ static int __init pxa27x_init(void)
 		register_syscore_ops(&pxa2xx_mfp_syscore_ops);
 
 		if (!of_have_populated_dt()) {
+			software_node_register(&pxa2xx_gpiochip_node);
 			pxa2xx_set_dmac_info(&pxa27x_dma_pdata);
 			ret = platform_add_devices(devices,
 						   ARRAY_SIZE(devices));
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index b14eb2a54f80..504d04bb2df7 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -14,6 +14,7 @@
 #include <linux/gpio_keys.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/leds.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/i2c-pxa.h>
@@ -28,6 +29,7 @@
 #include <linux/input/matrix_keypad.h>
 #include <linux/regulator/machine.h>
 #include <linux/io.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/memblock.h>
 
@@ -128,7 +130,6 @@ static unsigned long spitz_pin_config[] __initdata = {
 	GPIO1_GPIO | WAKEUP_ON_EDGE_FALL,	/* SPITZ_GPIO_RESET */
 };
 
-
 /******************************************************************************
  * Scoop GPIO expander
  ******************************************************************************/
@@ -565,18 +566,17 @@ static struct spi_board_info spitz_spi_devices[] = {
 	},
 };
 
-static struct gpiod_lookup_table spitz_spi_gpio_table = {
-	.dev_id = "spi2",
-	.table = {
-		GPIO_LOOKUP_IDX("gpio-pxa", SPITZ_GPIO_ADS7846_CS, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("gpio-pxa", SPITZ_GPIO_LCDCON_CS, "cs", 1, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("gpio-pxa", SPITZ_GPIO_MAX1111_CS, "cs", 2, GPIO_ACTIVE_LOW),
-		{ },
-	},
+static const struct software_node_ref_args spitz_spi_gpio_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, SPITZ_GPIO_ADS7846_CS,
+				GPIO_ACTIVE_LOW),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, SPITZ_GPIO_LCDCON_CS,
+				GPIO_ACTIVE_LOW),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, SPITZ_GPIO_MAX1111_CS,
+				GPIO_ACTIVE_LOW),
 };
 
 static const struct property_entry spitz_spi_properties[] = {
-	PROPERTY_ENTRY_U32("num-cs", 3),
+	PROPERTY_ENTRY_REF_ARRAY("gpios", spitz_spi_gpio_refs),
 	{ }
 };
 
@@ -598,7 +598,6 @@ static void __init spitz_spi_init(void)
 		gpiod_add_lookup_table(&spitz_lcdcon_gpio_table);
 
 	gpiod_add_lookup_table(&spitz_ads7846_gpio_table);
-	gpiod_add_lookup_table(&spitz_spi_gpio_table);
 
 	pd = platform_device_register_full(&spitz_spi_device_info);
 	err = PTR_ERR_OR_ZERO(pd);
-- 
2.45.2.803.g4e1b14247a-goog

