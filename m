Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CDFC3065C
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A44C9C32789; Fri, 28 Jun 2024 18:09:13 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAE2CC116B1
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAE2CC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-71884eda768so567198a12.1
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598152; x=1720202952; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG3sk+VOjiapEEqjoqAeer5DFsWVZ6qfMsFkHqGpV/g=;
        b=UdjBvKYcAc4ju/K8bZRNYf0T2tAKavm0rvwn6+GIyzIyOt4pUnVLbif+oFPNTYgVYL
         cMN1GSNj/LkAjlWQNdqIw+n6XOBUGmCXtVu+Mr8I4tUAbiXOcsakUBr5TIObZoD/sttU
         ftq3N6yYT3qst+59HzZB4uMnRj9lFmMePgrgt6KSO4hPDL0BhSWkY7P4jx3ClIYYZ88Y
         8BKdbvvBxF1oBLDb5OBCN1+vl+LwY1DXFMqlSfY3cnOYvT6wNbUdBCfg2ohlJOSebrmq
         oN9UVVpCJmuN8a1zf22eyMis4Oghq5MF1LtzHlmK/+hQHIehv3H7ZhNYL04shO0rN1B3
         dD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598152; x=1720202952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG3sk+VOjiapEEqjoqAeer5DFsWVZ6qfMsFkHqGpV/g=;
        b=xL4mziNLYfl+SHPVTlauJu/iXWb4MxPDP9QxcJo8qBpyySFSkX2On37EH7lzHFV7ZS
         AaWG+L0eWmsjzjaDfcz9GNpa5/8d6nAzDTuDfF7Fjl5qq/JqNjymDrrfcRJgpf2mG0Co
         BNEU6FYV/EWEyOvFgvpAhgQTfxhI/Ts/KClORmxoaL1+tMxDzTvk1kvWX0PijJQ9lN4M
         ULgQX90IiFZawRu3daEHLaS/UUhOzXEmnzZM96yyPSGYx3ze2dXMoGcKb9gTkLdDnewU
         V3yZ9n+tfKzpvY6osP8N+ppXlJ9pOlEHvYKTNbKqJyjDuNhXbxhkD17LrD+szWakvvQu
         eoFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm3eZ7TdIPuFkrqDMFjPdpy6YP28qrGG/EG+PkFmzVAA43Od21M05yzuJJ6iBEM6NUdOoeStsWW84QjqTLJQ==
X-Gm-Message-State: AOJu0YxtkJKXqWyDA/DNE8FN0cpVgHepY+T6ay/TTDAUrfX6Wf+rP4i7
	ySx7qb6zQaU6UCs20fyQG51UOKpT/h2qwJJg52voEjSmVIDQaxHH
X-Google-Smtp-Source: AGHT+IE/uVGbMaIUFaLkhNGkXfqS8xVGatcfBWhmOGBmX0fUaCsObE8LAGJWprKosEFqJ28F7EkCSg==
X-Received: by 2002:a05:6a20:3c86:b0:1be:da68:1f26 with SMTP id adf61e73a8af0-1beda6820b8mr6390563637.59.1719598151928;
        Fri, 28 Jun 2024 11:09:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:11 -0700 (PDT)
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
Subject: [PATCH 09/10] ARM: spitz: Use software nodes to describe LED GPIOs
Date: Fri, 28 Jun 2024 11:08:49 -0700
Message-ID: <20240628180852.1738922-10-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Spitz to use software nodes for specifying GPIOs for the LEDs.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 71 +++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 4720a40587f1..b19d4ed35192 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -467,35 +467,64 @@ static inline void spitz_keys_init(void) {}
  * LEDs
  ******************************************************************************/
 #if defined(CONFIG_LEDS_GPIO) || defined(CONFIG_LEDS_GPIO_MODULE)
-static struct gpio_led spitz_gpio_leds[] = {
-	{
-		.name			= "spitz:amber:charge",
-		.default_trigger	= "sharpsl-charge",
-		.gpio			= SPITZ_GPIO_LED_ORANGE,
-	},
-	{
-		.name			= "spitz:green:hddactivity",
-		.default_trigger	= "disk-activity",
-		.gpio			= SPITZ_GPIO_LED_GREEN,
-	},
+static const struct software_node spitz_gpio_leds_node = {
+	.name = "spitz-leds",
 };
 
-static struct gpio_led_platform_data spitz_gpio_leds_info = {
-	.leds		= spitz_gpio_leds,
-	.num_leds	= ARRAY_SIZE(spitz_gpio_leds),
+static const struct property_entry spitz_orange_led_props[] = {
+	PROPERTY_ENTRY_STRING("linux,default-trigger", "sharpsl-charge"),
+	PROPERTY_ENTRY_GPIO("gpios",
+			    &spitz_scoop_1_gpiochip_node, 6, GPIO_ACTIVE_HIGH),
+	{ }
 };
 
-static struct platform_device spitz_led_device = {
-	.name		= "leds-gpio",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &spitz_gpio_leds_info,
-	},
+static const struct software_node spitz_orange_led_node = {
+	.name = "spitz:amber:charge",
+	.parent = &spitz_gpio_leds_node,
+	.properties = spitz_orange_led_props,
+};
+
+static const struct property_entry spitz_green_led_props[] = {
+	PROPERTY_ENTRY_STRING("linux,default-trigger", "disk-activity"),
+	PROPERTY_ENTRY_GPIO("gpios",
+			    &spitz_scoop_1_gpiochip_node, 0, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node spitz_green_led_node = {
+	.name = "spitz:green:hddactivity",
+	.parent = &spitz_gpio_leds_node,
+	.properties = spitz_green_led_props,
+};
+
+static const struct software_node *spitz_gpio_leds_swnodes[] = {
+	&spitz_gpio_leds_node,
+	&spitz_orange_led_node,
+	&spitz_green_led_node,
+	NULL
 };
 
 static void __init spitz_leds_init(void)
 {
-	platform_device_register(&spitz_led_device);
+	struct platform_device_info led_info = {
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *led_dev;
+	int err;
+
+	err = software_node_register_node_group(spitz_gpio_leds_swnodes);
+	if (err) {
+		pr_err("failed to register LED software nodes: %d\n", err);
+		return;
+	}
+
+	led_info.fwnode = software_node_fwnode(&spitz_gpio_leds_node);
+
+	led_dev = platform_device_register_full(&led_info);
+	err = PTR_ERR_OR_ZERO(led_dev);
+	if (err)
+		pr_err("failed to create LED device: %d\n", err);
 }
 #else
 static inline void spitz_leds_init(void) {}
-- 
2.45.2.803.g4e1b14247a-goog

