Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCC8C3065A
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 341B3C4AF0D; Fri, 28 Jun 2024 18:09:05 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 401C4C32786
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 401C4C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7163489149eso674705a12.1
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598143; x=1720202943; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBCvkVyfkbdo7pnt4Aoi2nCfq7+jAcbsmUlNqiZyQyk=;
        b=aca+wloiPth7HnBXRXvWEAFBHQTkTstferEEfYfht0W+ksXMNO4UegEQ+Krt90mTU1
         ZW0nkYdIa1bXOCtTM46+L1FguEUOSHmUkTzNAGre4sSS0O20R4rYEUcsmQ1c3+6LXXdB
         eG/evALuh2quZ2TA8pllkrzBrPh7Gd0+G2BzKLXlVNKJls7rTSx8SmV9q3q2qalEZyyf
         8H+1ePv77K1h+x5antrCwZU3bNSAIkAsMwC7Au876ZuuXi7oAq7u5XQ/ye8v1nHjEB/f
         Er7F6CcA1VzkNCA4lI6ILFNrtic4giKx0XuO8gd1fhT7kypOpS7kxKoHvXOaq1/X2Mwe
         4+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598143; x=1720202943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBCvkVyfkbdo7pnt4Aoi2nCfq7+jAcbsmUlNqiZyQyk=;
        b=tNV6aV4fLy7FneNxRhcdbDCBD2SJWTY0rWT6mBFZ/6M/4S0AUPamSo+YWIq2hVY8L6
         kVjXW26HSpAj3zEMmTx9GdMKA9jXWMH96edfwJJCmXmCHu18L/xEZEf+cdZnTttggiQN
         WUcocPDFd/BoyApdxAaLXE+9cebr00B5UEPAC/8IdYKhLRMLTIhKO9khWZJhGICZX0dm
         gVMlmlY2odPJoa2z/3WsR9J619sfB9fkpqdyBCw0KnO+rZqy9PBdbsrzHWbzzfPYSMKI
         XdFW1T1rwxpynJu5fgnp4MglXZwI6CDJzquIItNY3SMln7xUyn7jCTmxL1H3AbZhumm+
         Ulkg==
X-Forwarded-Encrypted: i=1; AJvYcCWIMnd2PFt+8tho4pfGUfI93bQoInUwxs8vOfkslPWodadmFwbGziIVL9J6NbvJCKTOT7BnAyLHWyYA2MZz0Q==
X-Gm-Message-State: AOJu0Yz+xORz9sacyYmrAGUNKC7t/22aAAKF3vfpDSUI6+BmOJZhTd1S
	A2wkNrZpctQIzt2fGXdnY8CRNbjrlgl8GpjZWAovJT/r4+gowAq9
X-Google-Smtp-Source: AGHT+IGwdjUnAxnrdNhQ33UTdibVtsjtn7lXpV2d4m+C6E3UaoUTdQmOGIj57QB+hbO2gd1xcDLN7w==
X-Received: by 2002:a05:6a20:3ca1:b0:1be:c699:6aea with SMTP id adf61e73a8af0-1bec6996ff2mr9156618637.47.1719598143323;
        Fri, 28 Jun 2024 11:09:03 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:02 -0700 (PDT)
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
Subject: [PATCH 01/10] ARM: spitz: fix GPIO assignment for backlight
Date: Fri, 28 Jun 2024 11:08:41 -0700
Message-ID: <20240628180852.1738922-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIOs controlling backlight on Spitz and Akita are coming from GPIO
expanders, not the pxa27xx-gpio block, correct it.

Additionally GPIO lookup tables operate with pin numbers rather than
legacy GPIO numbers, fix that as well. Use raw numbers instead of legacy
GPIO names to avoid confusion.

Fixes: ee0c8e494cc3 ("backlight: corgi: Convert to use GPIO descriptors")
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 3c5f5a3cb480..10ab16dcd827 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -520,10 +520,8 @@ static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
 static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
 	.dev_id = "spi2.1",
 	.table = {
-		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_CONT,
-			    "BL_CONT", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_ON,
-			    "BL_ON", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.1", 6, "BL_CONT", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("sharp-scoop.1", 7, "BL_ON", GPIO_ACTIVE_HIGH),
 		{ },
 	},
 };
@@ -531,10 +529,8 @@ static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
 static struct gpiod_lookup_table akita_lcdcon_gpio_table = {
 	.dev_id = "spi2.1",
 	.table = {
-		GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_CONT,
-			    "BL_CONT", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_ON,
-			    "BL_ON", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("i2c-max7310", 3, "BL_ON", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("i2c-max7310", 4, "BL_CONT", GPIO_ACTIVE_LOW),
 		{ },
 	},
 };
@@ -964,12 +960,9 @@ static inline void spitz_i2c_init(void) {}
 static struct gpiod_lookup_table spitz_audio_gpio_table = {
 	.dev_id = "spitz-audio",
 	.table = {
-		GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
-			    "mute-l", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
-			    "mute-r", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("sharp-scoop.1", SPITZ_GPIO_MIC_BIAS - SPITZ_SCP2_GPIO_BASE,
-			    "mic", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.0", 3, "mute-l", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.0", 4, "mute-r", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.1", 8, "mic", GPIO_ACTIVE_HIGH),
 		{ },
 	},
 };
@@ -977,12 +970,9 @@ static struct gpiod_lookup_table spitz_audio_gpio_table = {
 static struct gpiod_lookup_table akita_audio_gpio_table = {
 	.dev_id = "spitz-audio",
 	.table = {
-		GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
-			    "mute-l", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
-			    "mute-r", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("i2c-max7310", AKITA_GPIO_MIC_BIAS - AKITA_IOEXP_GPIO_BASE,
-			    "mic", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.0", 3, "mute-l", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.0", 4, "mute-r", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("i2c-max7310", 2, "mic", GPIO_ACTIVE_HIGH),
 		{ },
 	},
 };
-- 
2.45.2.803.g4e1b14247a-goog

