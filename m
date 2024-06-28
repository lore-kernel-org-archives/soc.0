Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D59C3065B
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1028EC116B1; Fri, 28 Jun 2024 18:09:06 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D297C4AF0A
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D297C4AF0A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7163489149eso674720a12.1
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598144; x=1720202944; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up/qg8WDCqy4xhIoMEE6lkWQO4HcB5nnKXIU51pcsyE=;
        b=mRPX9yHg2W/Gdol0/Q/HvLc3GaGOip9W86uqJ1av85rvWUgsVQfZY9AxhTmxrQBjYo
         xUawkFqTJjuK74+RnFCojIh4w8+3tt3uUw8gWe73WFagdbJoz1h8c2mhK+HX/fowVxjR
         Qngdq1hHVqHLBf4a4eI4z1ZkqdO0CEqhOJ/kfxwDvFnlB7GHyA3wt6kSAviTgsnnBKCu
         UAAtL3kffM1BTMpwrsSZ7WVWOXKnn4A43Dm5ZSzl5IsXPImFTirxt98QVzA7wyXdYaZQ
         78FtofjhoTcrfo8mILVLyU4kZtXG2xR2/30U+sRxlW1KcrbqlGmN/zYl2WTLs5t78ZEN
         S5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598144; x=1720202944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=up/qg8WDCqy4xhIoMEE6lkWQO4HcB5nnKXIU51pcsyE=;
        b=nY4p1n1jZszzPQtpbTAzWYalDpw8qnE+KIdIp2yQPinB4izvhPveb+LZa74qolYrrg
         IoDtZFha7b8xr+nhT9N2LTqu/2599dxYZKqxTK0ObPYmLh6ikG5s2ghKyomcnHTQ5PhA
         kBEAKjxHPM3JxIpBY6vAXdKq5+5/tdfxfhj06N47CE9PZUqLt6Ze4whGhktEB1gUSvA3
         QUhVIMRvbF96530+DgjTVV3adAh0c7CIFyKq/m++GVd45k90Fo6veEf6nGo6UdUIG6R3
         xx2Z7tTSNpqVxve416xKx0BI2ZZL/qX0VohcaspezOINEDhw58hruWyY1xeoIGQIKeAr
         lF/A==
X-Forwarded-Encrypted: i=1; AJvYcCWQmF12degtv46NF9scrBG4zqmpiCRGL9v2ayxzVlHdTmpdT7OuGj+5K75z1v6OTQGXikfERi3fOokU2R8DEg==
X-Gm-Message-State: AOJu0YzbjnmH/ut+kRnPW1fJo7HSjtyxo2sfRvmax4cHPTeJTYco0JJG
	KBPFhTceMnUzlZDBvZR683PgH1n5m+NDKTX6MYx6aewIPaBe+dTs
X-Google-Smtp-Source: AGHT+IHl5Hkg3zTbLOFzM8iN/UjEZ0JCZYz7drxxPW4g1Ndh3zPD3L4duozHiDSYrQjf9NwirFH/xA==
X-Received: by 2002:a05:6a20:6a90:b0:1bd:91aa:79a0 with SMTP id adf61e73a8af0-1bd91aa7a7dmr8588298637.12.1719598144351;
        Fri, 28 Jun 2024 11:09:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:04 -0700 (PDT)
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
Subject: [PATCH 02/10] ARM: pxa: consolidate GPIO chip platform data
Date: Fri, 28 Jun 2024 11:08:42 -0700
Message-ID: <20240628180852.1738922-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform data for the GPIO controllers for the boards using non-DT
setup is the same between PXA25x (gumstix) and PXA27x (Spitz) devices.
Move it into devices.c to consolidate code. It will help with conversion
to software nodes/properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/devices.c | 13 +++++++++++++
 arch/arm/mach-pxa/pxa25x.c  |  7 +------
 arch/arm/mach-pxa/pxa27x.c  |  8 +-------
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index 1e4cd502340e..7cc6db2d1615 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/gpio-pxa.h>
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/soc/pxa/cpu.h>
 
@@ -17,6 +18,7 @@
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/mmp_dma.h>
 
+#include "mfp-pxa2xx.h"
 #include "regs-ost.h"
 #include "reset.h"
 #include "devices.h"
@@ -650,11 +652,19 @@ struct resource pxa_resource_gpio[] = {
 	},
 };
 
+static struct pxa_gpio_platform_data pxa2xx_gpio_info = {
+	.irq_base	= PXA_GPIO_TO_IRQ(0),
+	.gpio_set_wake	= gpio_set_wake,
+};
+
 struct platform_device pxa25x_device_gpio = {
 	.name		= "pxa25x-gpio",
 	.id		= -1,
 	.num_resources	= ARRAY_SIZE(pxa_resource_gpio),
 	.resource	= pxa_resource_gpio,
+	.dev		= {
+		.platform_data	= &pxa2xx_gpio_info,
+	},
 };
 
 struct platform_device pxa27x_device_gpio = {
@@ -662,6 +672,9 @@ struct platform_device pxa27x_device_gpio = {
 	.id		= -1,
 	.num_resources	= ARRAY_SIZE(pxa_resource_gpio),
 	.resource	= pxa_resource_gpio,
+	.dev		= {
+		.platform_data	= &pxa2xx_gpio_info,
+	},
 };
 
 static struct resource pxa_dma_resource[] = {
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 02712d24be82..2ab3d8d66466 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -178,12 +178,8 @@ void __init pxa25x_map_io(void)
 	pxa25x_get_clk_frequency_khz(1);
 }
 
-static struct pxa_gpio_platform_data pxa25x_gpio_info __initdata = {
-	.irq_base	= PXA_GPIO_TO_IRQ(0),
-	.gpio_set_wake	= gpio_set_wake,
-};
-
 static struct platform_device *pxa25x_devices[] __initdata = {
+	&pxa25x_device_gpio,
 	&pxa25x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -244,7 +240,6 @@ static int __init pxa25x_init(void)
 
 		if (!of_have_populated_dt()) {
 			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
-			pxa_register_device(&pxa25x_device_gpio, &pxa25x_gpio_info);
 			ret = platform_add_devices(pxa25x_devices,
 						   ARRAY_SIZE(pxa25x_devices));
 		}
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index d71491e2e1d6..b135b9ef665c 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -276,12 +276,8 @@ void __init pxa27x_set_i2c_power_info(struct i2c_pxa_platform_data *info)
 	pxa_register_device(&pxa27x_device_i2c_power, info);
 }
 
-static struct pxa_gpio_platform_data pxa27x_gpio_info __initdata = {
-	.irq_base	= PXA_GPIO_TO_IRQ(0),
-	.gpio_set_wake	= gpio_set_wake,
-};
-
 static struct platform_device *devices[] __initdata = {
+	&pxa27x_device_gpio,
 	&pxa27x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -345,8 +341,6 @@ static int __init pxa27x_init(void)
 		register_syscore_ops(&pxa2xx_mfp_syscore_ops);
 
 		if (!of_have_populated_dt()) {
-			pxa_register_device(&pxa27x_device_gpio,
-					    &pxa27x_gpio_info);
 			pxa2xx_set_dmac_info(&pxa27x_dma_pdata);
 			ret = platform_add_devices(devices,
 						   ARRAY_SIZE(devices));
-- 
2.45.2.803.g4e1b14247a-goog

