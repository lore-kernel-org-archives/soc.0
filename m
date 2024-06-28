Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5791FC2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A850C2BD10; Fri, 28 Jun 2024 18:09:07 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C9ADC116B1
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C9ADC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7065e2fe7d9so721858b3a.3
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598145; x=1720202945; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPjL6ORxfcbcSywP6tXKN3XgBVxZ1+LizFBx1kUWvpM=;
        b=IKV17aoF2ZfaPGRK+FNSBhL6pM5f+r0OpzBLISJgQFJ6w1CSr4nUb58FQufeUGDCZ/
         4y7ut2ueh1Ix/a5TsK3uCB0T0cQb8pAZU48BXwcerjDh01dKEbpA2vdZi5PLBBbQvFsx
         e9Te6uZJw/tjLFApGAv0iQwegnvSxIJ7G0rwX6huid1RF3cAC4UIy0Yk9Q9+Wlw5LOSj
         sxx2x2sFV4y39MC+fkXAUWkRampaIxhWxwXPnTzOpugpwz4ifF+kFiqwacyycAsIDpjv
         1zF0NxFNjWfHSXGBlkyDThJNUIEIgsTuTfgOEYHffPaTbzk4IwE76xDc9sahl8yJI9y3
         GBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598145; x=1720202945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPjL6ORxfcbcSywP6tXKN3XgBVxZ1+LizFBx1kUWvpM=;
        b=SaZoHkrIOsD7+COLdOhbCw0NWFFw39+NrNj4nIuWrzKejr7TnOgmj0g7ChdVyZK78y
         r0uTTq+OIB5wamDRZfTaLUxG4eubVE2c//KTK+e3duCzaaFIxUBKmlVakpjSjYfBMEct
         Zn29Qwk6MjhqGHIejJYFRnKnuKR3t8ewTk+cwO2kDT5cynE94xpRzoQBAEhzU4uQQ7d7
         oiqKG1Q+TQVnv/w8/xPISUA5xlKcVHFk5lzu9r1RqzDS4VgHIe5rTJclU1M8Fw+f87Z+
         GkDR1jmX7qO5orOSjqaQdfxmwp7Q3Kppr3plme0QyCmZjvnutEeSG6im0EmcK+vfyZX7
         kQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu8BV6svdLBmU9Vx+uDiyMzrCvPlwvjhP9szO8QHhwgimKByDs2seRVjZkB9REQohml7GDddbWDbopaiiBaA==
X-Gm-Message-State: AOJu0YxufEM1ycj8ZMbDuew6I4e/uukurIxV93g1H21e7inb8SfHeTaU
	sO0adQ0/PrVZm/AnxdH63vY1xcj/PugfcRkw+WYedVjgUCRs/15y
X-Google-Smtp-Source: AGHT+IE+8ChQtulMhadJgbwyhFCNkwINJZRVm5GvacmeQhYE8fDwdcsKKYNUc1CNoqwRvnfviNUoGQ==
X-Received: by 2002:a05:6a00:990:b0:706:750c:8dda with SMTP id d2e1a72fcca58-706750c8efcmr27072902b3a.6.1719598145501;
        Fri, 28 Jun 2024 11:09:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:05 -0700 (PDT)
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
Subject: [PATCH 03/10] ARM: pxa/gumstix: convert vbus gpio to use software nodes
Date: Fri, 28 Jun 2024 11:08:43 -0700
Message-ID: <20240628180852.1738922-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch vbus gpios from using a custom GPIO lookup table to software
properties using PROPERTY_ENTRY_GPIO() constructs which closely mimic
device tree gpio properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/devices.c |  4 ++++
 arch/arm/mach-pxa/devices.h |  4 ++--
 arch/arm/mach-pxa/gumstix.c | 22 +++++++++-------------
 arch/arm/mach-pxa/pxa25x.c  |  1 +
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index 7cc6db2d1615..e2758c94fd77 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -629,6 +629,10 @@ struct platform_device pxa27x_device_pwm1 = {
 };
 #endif /* CONFIG_PXA27x || CONFIG_PXA3xx */
 
+const struct software_node pxa2xx_gpiochip_node = {
+	.name	= "gpio-pxa",
+};
+
 struct resource pxa_resource_gpio[] = {
 	{
 		.start	= 0x40e00000,
diff --git a/arch/arm/mach-pxa/devices.h b/arch/arm/mach-pxa/devices.h
index 82c83939017a..b7c0e138ef61 100644
--- a/arch/arm/mach-pxa/devices.h
+++ b/arch/arm/mach-pxa/devices.h
@@ -53,8 +53,8 @@ extern struct platform_device pxa_device_asoc_ssp4;
 
 extern struct platform_device pxa25x_device_gpio;
 extern struct platform_device pxa27x_device_gpio;
-extern struct platform_device pxa3xx_device_gpio;
-extern struct platform_device pxa93x_device_gpio;
+
+extern const struct software_node pxa2xx_gpiochip_node;
 
 void __init pxa_register_device(struct platform_device *dev, void *data);
 void __init pxa2xx_set_dmac_info(struct mmp_dma_platdata *dma_pdata);
diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
index c9f0f62187bd..b9eddc691097 100644
--- a/arch/arm/mach-pxa/gumstix.c
+++ b/arch/arm/mach-pxa/gumstix.c
@@ -100,26 +100,22 @@ static void __init gumstix_mmc_init(void)
 #endif
 
 #ifdef CONFIG_USB_PXA25X
-static struct gpiod_lookup_table gumstix_gpio_vbus_gpiod_table = {
-	.dev_id = "gpio-vbus",
-	.table = {
-		GPIO_LOOKUP("gpio-pxa", GPIO_GUMSTIX_USB_GPIOn,
-			    "vbus", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-pxa", GPIO_GUMSTIX_USB_GPIOx,
-			    "pullup", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry spitz_mci_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("vbus-gpios", &pxa2xx_gpiochip_node,
+			    GPIO_GUMSTIX_USB_GPIOn, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("pullup-gpios", &pxa2xx_gpiochip_node,
+			    GPIO_GUMSTIX_USB_GPIOx, GPIO_ACTIVE_HIGH),
+	{ }
 };
 
-static struct platform_device gumstix_gpio_vbus = {
+static const struct platform_device_info gumstix_gpio_vbus_info __initconst = {
 	.name	= "gpio-vbus",
-	.id	= -1,
+	.id	= PLATFORM_DEVID_NONE,
 };
 
 static void __init gumstix_udc_init(void)
 {
-	gpiod_add_lookup_table(&gumstix_gpio_vbus_gpiod_table);
-	platform_device_register(&gumstix_gpio_vbus);
+	platform_device_register_full(&gumstix_gpio_vbus_info);
 }
 #else
 static void gumstix_udc_init(void)
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 2ab3d8d66466..03e34841fc00 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -239,6 +239,7 @@ static int __init pxa25x_init(void)
 		register_syscore_ops(&pxa2xx_mfp_syscore_ops);
 
 		if (!of_have_populated_dt()) {
+			software_node_register(&pxa2xx_gpiochip_node);
 			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
 			ret = platform_add_devices(pxa25x_devices,
 						   ARRAY_SIZE(pxa25x_devices));
-- 
2.45.2.803.g4e1b14247a-goog

