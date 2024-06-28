Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE9AC3065C
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29FF5C2BD10; Fri, 28 Jun 2024 18:09:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42437C116B1
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42437C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7066c9741fbso772940b3a.2
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598146; x=1720202946; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmoY9MC+b9hOZcGZXOQJ0Uh4Gl8qIWXCfwHUYEIgVNk=;
        b=TfwCCdy17l/H+qhR/PSLcwesTyVayTaxeomRw6vT9H4QE/6GHuKYDfm9UAA2VLTBM9
         QzfZWCHJuW4QKJIJrrjE6F/rs6M0Zra02kagIOHGAHb9/TgVJNBZ7zD9VeUkhSaUUgko
         8STCsmVsUHRC/TfV1n1igN+dF7zEIQ0X1VjNXnodgXvej9xsN4N7vqCBTeGEYMUcwa26
         F2lcpzD+z5IeahsYgdnNXQ8oBH15lsRAEGGokdiuiJ8f1OLlpLF+WYamsPCXRndq3JdF
         Uuoshc3tIvKRrCmbD9JfuFBp7kkLPuJrGwVhcZDGH9HPSg+9MPUKVPzMZ2dodPCndnT/
         bjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598146; x=1720202946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmoY9MC+b9hOZcGZXOQJ0Uh4Gl8qIWXCfwHUYEIgVNk=;
        b=VXkFl24n6ZcWZo0Z2A1IINFtrDOt6WCtD6qGED1POs/gvJE1tnYBqMVi/+KIsS7tjR
         DmjtN4Mon7IH21hFYBqMbFebGz/x2mjCrDPKzv1MzDdQBJPFKfCnzfcsC4yfMEkedM8Q
         kWDPj5fC3gscG3qmXItPA5q7Ml6hAEVJGsZnp9MiWuS3A5DddEiJk3gSShOfAc8Km/tE
         7WJsZrpW64uY5k/WruoHctNH69Sg0gz6lBXGSl57V3ehe/O6GvO+h8Ub0cZJYjnhqEZf
         zzaODtB62ChqydvXMJfKN2fzxbkod9Pe2RkB1B7go2InzmeH4GuDkF8lMq/J25NiSJtW
         r6ig==
X-Forwarded-Encrypted: i=1; AJvYcCWxC4UUMf+1FX8LMXmc82MG1pJqtNcg+Dz/zMYClIj+CS+1TA4yufKOTMdX2/LxKLufpqfoOdkBPncnaXrH+g==
X-Gm-Message-State: AOJu0YyOI1Xy9Rt9pq/MeqZ0KMHGgW+YornEYOf5+9LVntWsmkvdGuce
	Poth86viYpxHOTu2iSWXS02dt9mNgmlpRkDGlADxfV1c65T+VDxw
X-Google-Smtp-Source: AGHT+IFym5PAI16Os9Hfp7AYeddl0ojmEh3aJykbFJxWnw9ufaFP8zsIAOZN9UfNjvXStDqZSy006Q==
X-Received: by 2002:a05:6a00:b91:b0:705:b81b:6ee2 with SMTP id d2e1a72fcca58-706745e809bmr23126817b3a.19.1719598146472;
        Fri, 28 Jun 2024 11:09:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:06 -0700 (PDT)
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
Subject: [PATCH 04/10] ARM: spitz: Simplify instantiating SPI controller
Date: Fri, 28 Jun 2024 11:08:44 -0700
Message-ID: <20240628180852.1738922-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_device_register_full() to instantiate SPI controller in one go
instead of allocating it, creating a software node, and registering the
platform device as separate steps.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 10ab16dcd827..b14eb2a54f80 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -580,14 +580,16 @@ static const struct property_entry spitz_spi_properties[] = {
 	{ }
 };
 
-static const struct software_node spitz_spi_node = {
+static const struct platform_device_info spitz_spi_device_info = {
+	.name = "pxa2xx-spi",
+	/* pxa2xx-spi platform-device ID equals respective SSP platform-device ID + 1 */
+	.id = 2,
 	.properties = spitz_spi_properties,
 };
 
 static void __init spitz_spi_init(void)
 {
 	struct platform_device *pd;
-	int id = 2;
 	int err;
 
 	if (machine_is_akita())
@@ -598,19 +600,11 @@ static void __init spitz_spi_init(void)
 	gpiod_add_lookup_table(&spitz_ads7846_gpio_table);
 	gpiod_add_lookup_table(&spitz_spi_gpio_table);
 
-	/* pxa2xx-spi platform-device ID equals respective SSP platform-device ID + 1 */
-	pd = platform_device_alloc("pxa2xx-spi", id);
-	if (pd == NULL) {
-		pr_err("pxa2xx-spi: failed to allocate device id %d\n", id);
-	} else {
-		err = device_add_software_node(&pd->dev, &spitz_spi_node);
-		if (err) {
-			platform_device_put(pd);
-			pr_err("pxa2xx-spi: failed to add software node\n");
-		} else {
-			platform_device_add(pd);
-		}
-	}
+	pd = platform_device_register_full(&spitz_spi_device_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("pxa2xx-spi: failed to instantiate SPI controller: %d\n",
+		       err);
 
 	spi_register_board_info(ARRAY_AND_SIZE(spitz_spi_devices));
 }
-- 
2.45.2.803.g4e1b14247a-goog

