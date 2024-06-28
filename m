Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D041C30658
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 762EAC2BD10; Fri, 28 Jun 2024 18:09:12 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A7A9C116B1
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A7A9C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6eab07ae82bso646880a12.3
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598151; x=1720202951; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZZQERlIGvlDT2ctdsAJWWSJ3qbII640NDh+Pz14HqU=;
        b=EKqS45Wn2qFeN1Efol7QRj7iBH+JzdHKVr2X16qgNMUlRo5MpCq46nIKBK2KXrHEEB
         bZmq5rZApgZTsgq7E0LwPNXisWt1hdZmJmOrHZ6CC+CRVUdG0IM7/JCKYA0XSXmiuzuo
         U0qUYEjfQ/wrERJb6OyqP0HuA2CPsfBwJFYhYwKpMg20mp8KDK7bM1BON87mepZFKzBc
         bDAhC/UroN7zdvJbaUXm2WKg7C5sfUVd2FGYQWUjlzSrLGSWGsvtyi3iw3xY0AJ1JHxi
         66DMUsXz2yc3Apl7g9mfKG3hY0DTX1YhxQQkNtt99pFeijaH4Ri/YnxuY/sLd9pUrPny
         wZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598151; x=1720202951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZZQERlIGvlDT2ctdsAJWWSJ3qbII640NDh+Pz14HqU=;
        b=c6anScGiQMfuYn5EgM6STPSl+u3on2es7r9Q4kauqa11k5hiJ3YDA8ePRsIlHnq3I7
         aKgDGcHrReyvRDAsjFJkTHLPperYGGWGaayVRC/FNA9ks+OFj2PrrkqvvzxQFW1ttHZ7
         Nv7Mk7KrkZhKNOS7JxMO9TcOfGVSZlin9rDx45yoK/ghGGw0p0ct25w2TBkmnPezDmxv
         C0xJ+/KW67nnONbmqjLMF5gMQ+qJ78z8OgIOy7qZQEuWKV9M9HhmOZ7JrKk1t4cAMYn2
         FxXVXaa+RLMhv/lZNkLtcpZ+uKZfdMHPxiFnfOqih9v4WM2SOp/1A3Dtq1dDQIpvt1I3
         36EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwSHm/uKpLzK0KmeR32S/QHKCpIX8Zzk7lt3W85cOgH0M87q6AHOuk/zxeHw6Moawb8sbkwX5lsSiy9FwbsQ==
X-Gm-Message-State: AOJu0YwEZOPXHxsM93saKnnbxR6Y1MDU0PQRjfQC+Cf5cc53dCNr+TXo
	syqOIiiUsspUS980RY//+QYmW3NgV4lFQ6graY8EkGZ/LLuBvLl8
X-Google-Smtp-Source: AGHT+IHkQkSp58snm0J9lMaUMbDp2cIe5JR1UZf7YHJIVSCoCLZlR/SP/vAyS5cqOgnfslds0UlWUA==
X-Received: by 2002:a05:6a20:1225:b0:1be:c7d9:ecc5 with SMTP id adf61e73a8af0-1bec7d9ef7bmr7626980637.19.1719598150756;
        Fri, 28 Jun 2024 11:09:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:10 -0700 (PDT)
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
Subject: [PATCH 08/10] ARM: spitz: Use software nodes to describe MMC GPIOs
Date: Fri, 28 Jun 2024 11:08:48 -0700
Message-ID: <20240628180852.1738922-9-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Spitz to use software nodes for specifying GPIOs for the MMC.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/devices.c              | 36 +++++++++++++-----------
 arch/arm/mach-pxa/devices.h              |  1 -
 arch/arm/mach-pxa/gumstix.c              |  2 +-
 arch/arm/mach-pxa/spitz.c                | 18 +++++-------
 include/linux/platform_data/mmc-pxamci.h |  4 ++-
 5 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index e2758c94fd77..d050a4c78f97 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -48,7 +48,7 @@ struct platform_device pxa_device_pmu = {
 	.num_resources	= 1,
 };
 
-static struct resource pxamci_resources[] = {
+static const struct resource pxamci_resources[] = {
 	[0] = {
 		.start	= 0x41100000,
 		.end	= 0x41100fff,
@@ -61,22 +61,26 @@ static struct resource pxamci_resources[] = {
 	},
 };
 
-static u64 pxamci_dmamask = 0xffffffffUL;
-
-struct platform_device pxa_device_mci = {
-	.name		= "pxa2xx-mci",
-	.id		= 0,
-	.dev		= {
-		.dma_mask = &pxamci_dmamask,
-		.coherent_dma_mask = 0xffffffff,
-	},
-	.num_resources	= ARRAY_SIZE(pxamci_resources),
-	.resource	= pxamci_resources,
-};
-
-void __init pxa_set_mci_info(struct pxamci_platform_data *info)
+void __init pxa_set_mci_info(const struct pxamci_platform_data *info,
+			     const struct property_entry *props)
 {
-	pxa_register_device(&pxa_device_mci, info);
+	const struct platform_device_info mci_info = {
+		.name		= "pxa2xx-mci",
+		.id		= 0,
+		.res		= pxamci_resources,
+		.num_res	= ARRAY_SIZE(pxamci_resources),
+		.data		= info,
+		.size_data	= sizeof(*info),
+		.dma_mask	= 0xffffffffUL,
+		.properties	= props,
+	};
+	struct platform_device *mci_dev;
+	int err;
+
+	mci_dev = platform_device_register_full(&mci_info);
+	err = PTR_ERR_OR_ZERO(mci_dev);
+	if (err)
+		pr_err("Unable to create mci device: %d\n", err);
 }
 
 static struct pxa2xx_udc_mach_info pxa_udc_info = {
diff --git a/arch/arm/mach-pxa/devices.h b/arch/arm/mach-pxa/devices.h
index b7c0e138ef61..72c556ff67db 100644
--- a/arch/arm/mach-pxa/devices.h
+++ b/arch/arm/mach-pxa/devices.h
@@ -4,7 +4,6 @@
 struct mmp_dma_platdata;
 
 extern struct platform_device pxa_device_pmu;
-extern struct platform_device pxa_device_mci;
 extern struct platform_device pxa3xx_device_mci2;
 extern struct platform_device pxa3xx_device_mci3;
 extern struct platform_device pxa25x_device_udc;
diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
index b9eddc691097..efa6faa62a2c 100644
--- a/arch/arm/mach-pxa/gumstix.c
+++ b/arch/arm/mach-pxa/gumstix.c
@@ -90,7 +90,7 @@ static struct pxamci_platform_data gumstix_mci_platform_data = {
 
 static void __init gumstix_mmc_init(void)
 {
-	pxa_set_mci_info(&gumstix_mci_platform_data);
+	pxa_set_mci_info(&gumstix_mci_platform_data, NULL);
 }
 #else
 static void __init gumstix_mmc_init(void)
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index c79510185ce3..4720a40587f1 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -651,21 +651,17 @@ static struct pxamci_platform_data spitz_mci_platform_data = {
 	.setpower		= spitz_mci_setpower,
 };
 
-static struct gpiod_lookup_table spitz_mci_gpio_table = {
-	.dev_id = "pxa2xx-mci.0",
-	.table = {
-		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_nSD_DETECT,
-			    "cd", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_nSD_WP,
-			    "wp", GPIO_ACTIVE_LOW),
-		{ },
-	},
+static const struct property_entry spitz_mci_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("cd-gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_nSD_DETECT, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("wp-gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_nSD_WP, GPIO_ACTIVE_LOW),
+	{ }
 };
 
 static void __init spitz_mmc_init(void)
 {
-	gpiod_add_lookup_table(&spitz_mci_gpio_table);
-	pxa_set_mci_info(&spitz_mci_platform_data);
+	pxa_set_mci_info(&spitz_mci_platform_data, spitz_mci_props);
 }
 #else
 static inline void spitz_mmc_init(void) {}
diff --git a/include/linux/platform_data/mmc-pxamci.h b/include/linux/platform_data/mmc-pxamci.h
index 7e44e84e7150..652f323b5ecc 100644
--- a/include/linux/platform_data/mmc-pxamci.h
+++ b/include/linux/platform_data/mmc-pxamci.h
@@ -7,6 +7,7 @@
 
 struct device;
 struct mmc_host;
+struct property_entry;
 
 struct pxamci_platform_data {
 	unsigned int ocr_mask;			/* available voltages */
@@ -18,7 +19,8 @@ struct pxamci_platform_data {
 	bool gpio_card_ro_invert;		/* gpio ro is inverted */
 };
 
-extern void pxa_set_mci_info(struct pxamci_platform_data *info);
+extern void pxa_set_mci_info(const struct pxamci_platform_data *info,
+			     const struct property_entry *props);
 extern void pxa3xx_set_mci2_info(struct pxamci_platform_data *info);
 extern void pxa3xx_set_mci3_info(struct pxamci_platform_data *info);
 
-- 
2.45.2.803.g4e1b14247a-goog

