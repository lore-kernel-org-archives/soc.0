Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8278FC3065A
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70433C32786; Fri, 28 Jun 2024 18:09:11 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80D31C4AF0D
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80D31C4AF0D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70a078edb8aso204227b3a.1
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598149; x=1720202949; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ay9TI8HWK+oR18tT8EQNVS4HczzSY9JpQeS8IURTtMg=;
        b=VL559fyzTmuuclLeTbsiBWEFDYiHiivpBm+ZaY4950HUJ5kNeVmEb7Ry6OW+XF/q8r
         Y155scvuW+rDH5FCD5pE8otGIr34bG0iSEmgf+IZ1g0fjMrLbPXWr+raJQ+vl0Pi/Yu4
         F6IwcSeJENDa/y4jNZpqPpUFtGXpW8gsdvJOWXW+n1LOdwQBv9casziJr+0M8ChjNISS
         iqBIlWA43cRe2Q2rccvMLYuP9cgczEeLhICJJW2VeT2dCP6Q2S5/kAAw8IHBZcqU8yHr
         wnDVB4Tg7UnbPpc91Lg7g+XMmGIS7omuiJU0jKJ0x8nUtcCxYpZgbf0pXxmxBqiA9pDo
         7MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598149; x=1720202949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay9TI8HWK+oR18tT8EQNVS4HczzSY9JpQeS8IURTtMg=;
        b=DUx/4MpdrEVCFxwjoaJ2+YnKorSJVEikyl1uzS7njwNTl9oQ0ezrHSwfZZk3CvFbqj
         nQ0BQjwKKbq+0qE/6iXwyfg/xFq0laB1Kk872nQPyEBRAKnReYM0+OQfdqT/z0wDz50c
         Fova+D5MtfDdIfh6Ojz02Iy53yWzD4tUTVXpQJRAqd1oD/9h+a4pK/EMRFoMpucw4ula
         rcrgKLbtAWoorEBKpXXiKzGXVDsAUksLT06pcDbk/9uf1h43x1OML00khydAQ8HTme3k
         BrAvLnowK+8dQfF9J4Q5hWuHNGYvFH/HTN3npvdQIuO4La0+lVM8dH2iWjQVKq+E7a0E
         KqcA==
X-Forwarded-Encrypted: i=1; AJvYcCWxnkUE71A1ISflcZRoJe5E2ovTzG/kX8yQ9F5/9NscO5FMP04DDfhZ/PfWHBPqefPNsJR5hHVboRvpPaJ00A==
X-Gm-Message-State: AOJu0YzpOIX6UJ3fCrJedO0Zsh8bQ8H+VJgRgszXalLbxuEGtkJNuT6b
	yjHgpa4fA1DMQJQEMAlder32FGQxMtWS3RjzrKv6PtqSNMIeQkNQAJd2lg==
X-Google-Smtp-Source: AGHT+IFUdHHXsh+kQq1MNIc7SmoyKk0Wy8cjfjvnFWozynmhMcEHlK3wZYCzHdSPBhIp8OVcAk/pbA==
X-Received: by 2002:a05:6a20:3947:b0:1bd:208a:3b20 with SMTP id adf61e73a8af0-1bee4926d26mr3662610637.14.1719598148636;
        Fri, 28 Jun 2024 11:09:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:08 -0700 (PDT)
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
Subject: [PATCH 06/10] ARM: spitz: Use software nodes to describe audio GPIOs
Date: Fri, 28 Jun 2024 11:08:46 -0700
Message-ID: <20240628180852.1738922-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Spitz to use software nodes for specifying GPIOs for the audio
chip.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 66 ++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 504d04bb2df7..278d49ed7a9c 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -130,6 +130,20 @@ static unsigned long spitz_pin_config[] __initdata = {
 	GPIO1_GPIO | WAKEUP_ON_EDGE_FALL,	/* SPITZ_GPIO_RESET */
 };
 
+static const struct software_node spitz_scoop_1_gpiochip_node = {
+	.name = "sharp-scoop.0",
+};
+
+/* Only on Spitz */
+static const struct software_node spitz_scoop_2_gpiochip_node = {
+	.name = "sharp-scoop.1",
+};
+
+/* Only on Akita */
+static const struct software_node akita_max7310_gpiochip_node = {
+	.name = "i2c-max7310",
+};
+
 /******************************************************************************
  * Scoop GPIO expander
  ******************************************************************************/
@@ -950,24 +964,24 @@ static void __init spitz_i2c_init(void)
 static inline void spitz_i2c_init(void) {}
 #endif
 
-static struct gpiod_lookup_table spitz_audio_gpio_table = {
-	.dev_id = "spitz-audio",
-	.table = {
-		GPIO_LOOKUP("sharp-scoop.0", 3, "mute-l", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("sharp-scoop.0", 4, "mute-r", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("sharp-scoop.1", 8, "mic", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry spitz_audio_props[] = {
+	PROPERTY_ENTRY_GPIO("mute-l-gpios", &spitz_scoop_1_gpiochip_node, 3,
+			    GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mute-r-gpios", &spitz_scoop_1_gpiochip_node, 4,
+			    GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mic-gpios", &spitz_scoop_2_gpiochip_node, 8,
+			    GPIO_ACTIVE_HIGH),
+	{ }
 };
 
-static struct gpiod_lookup_table akita_audio_gpio_table = {
-	.dev_id = "spitz-audio",
-	.table = {
-		GPIO_LOOKUP("sharp-scoop.0", 3, "mute-l", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("sharp-scoop.0", 4, "mute-r", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("i2c-max7310", 2, "mic", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry akita_audio_props[] = {
+	PROPERTY_ENTRY_GPIO("mute-l-gpios", &spitz_scoop_1_gpiochip_node, 3,
+			    GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mute-r-gpios", &spitz_scoop_1_gpiochip_node, 4,
+			    GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mic-gpios", &akita_max7310_gpiochip_node, 2,
+			    GPIO_ACTIVE_HIGH),
+	{ }
 };
 
 /******************************************************************************
@@ -975,12 +989,14 @@ static struct gpiod_lookup_table akita_audio_gpio_table = {
  ******************************************************************************/
 static inline void spitz_audio_init(void)
 {
-	if (machine_is_akita())
-		gpiod_add_lookup_table(&akita_audio_gpio_table);
-	else
-		gpiod_add_lookup_table(&spitz_audio_gpio_table);
-
-	platform_device_register_simple("spitz-audio", -1, NULL, 0);
+	struct platform_device_info audio_info = {
+		.name = "spitz-audio",
+		.id = PLATFORM_DEVID_NONE,
+		.properties = machine_is_akita() ?
+				akita_audio_props : spitz_audio_props,
+	};
+
+	platform_device_register_full(&audio_info);
 }
 
 /******************************************************************************
@@ -1003,6 +1019,12 @@ static void spitz_restart(enum reboot_mode mode, const char *cmd)
 
 static void __init spitz_init(void)
 {
+	software_node_register(&spitz_scoop_1_gpiochip_node);
+	if (machine_is_akita())
+		software_node_register(&akita_max7310_gpiochip_node);
+	else
+		software_node_register(&spitz_scoop_2_gpiochip_node);
+
 	init_gpio_reset(SPITZ_GPIO_ON_RESET, 1, 0);
 	pm_power_off = spitz_poweroff;
 
-- 
2.45.2.803.g4e1b14247a-goog

