Return-Path: <SRS0=+q6T=XH=gmail.com=lfdebrux@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7D9C433EF
	for <soc@archiver.kernel.org>; Sat,  2 Jul 2022 07:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C9D6C341C8; Sat,  2 Jul 2022 07:55:12 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C99CC34114
	for <soc@kernel.org>; Sat,  2 Jul 2022 07:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C99CC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id r14so384121wrg.1
        for <soc@kernel.org>; Sat, 02 Jul 2022 00:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3KdgINyjGG0wvl5WxeA9vZiCVG748nEQAgFuKoDw3w8=;
        b=OcVIpb3j1p45s8SPiwOhiKCWfdGJV5G3BF1aUfP78LeFl+pHlB5/u0Fd7nwexj45TN
         cqapvkJwgqnxfySqr0epdhDlPzD8XrM3jmZ4OAGG7tcGBRxRK1x0lj4sZJUlsuSh8TBR
         Fp3azU3VV6rnQ8Hz88uRqewYDwG58ZNlSykQbOl7Cms6ID09L/fS4t3QogQe0pYnurSI
         +8vZZUQ/SgFQ+1ws0kj9JIL99wKXstDMeyL0+cjiyoNkGqsv/YWC7BtAkZDyNDRYMb3/
         xVBiP3/jan7JtYV/JyFOjXWrE/U1acjtEYKp5p+bKSIDLewinJBsBIY3upXxfArmwVfu
         KaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3KdgINyjGG0wvl5WxeA9vZiCVG748nEQAgFuKoDw3w8=;
        b=YeZkjsLP86mrlEfqzkhsXa8HZ3VvwnIMljqc+7KGxOSlb82j4HFAxTB5AdV+Sj4zal
         +YLmJqTUfabwMk0OI815ONOTL/e3Mh6INQxzdHuz4HC09PHBo1wZMigWF5V6O/BqX5lj
         X7rAoddnigI0ygXPNEGE6Z2VuVS6Ee2p4mxN/nw0bomp5CrOYGpJKnem/ZaA25HtIdHk
         6Lhat9ASHEP8hERxFw6amI58O80GKvKeKoe18pEEvE8SakX+fiX8N2AL9rkNKlFU8Oe3
         hzjiMh2Xds+hvQoP3PmCNLkNxtcz6o1wS0IFoxn+7JdLF9QK5Ia52rzX1Jsh8g11sTGX
         U02w==
X-Gm-Message-State: AJIora9G/9jWhFRv4ku0MqRHDeOD81Daf2aATAaaiqVfFo61Ph/ga+oS
	DYUCjkU7v2TZEfydPmXAAoT7csvolqQ=
X-Google-Smtp-Source: AGRyM1uhhT1uQ6KDDoFXAcRZ4Ai8Oc9Fd8a2rN37nigqC6rRZr3SV/iEMYJBULOXl1JZzJXj634LKg==
X-Received: by 2002:a05:6000:2c8:b0:21d:1660:e32 with SMTP id o8-20020a05600002c800b0021d16600e32mr17205570wry.99.1656748508854;
        Sat, 02 Jul 2022 00:55:08 -0700 (PDT)
Received: from voidz-builder.home ([2a00:23c8:180c:3301:82fa:5bff:fe49:bece])
        by smtp.gmail.com with ESMTPSA id g1-20020adffc81000000b00213ba3384aesm25064202wrr.35.2022.07.02.00.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 00:55:08 -0700 (PDT)
From: Laurence de Bruxelles <lfdebrux@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Laurence de Bruxelles <lfdebrux@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: pxa: Fix gpio numbers for backlight controls
Date: Sat,  2 Jul 2022 08:54:54 +0100
Message-Id: <20220702075454.12575-1-lfdebrux@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With recent stable kernels on my Zaurus Akita I am unable to change the
backlight brightness, as the necessary files are not in the sys
filesystem, and at startup I get the following errors:

corgi-lcd spi2.1: requested GPIO 0 (207) is out of range [0..120] for
chip gpio-pxa
corgi-lcd: probe of spi2.1 failed with error -22

Looking at recent changes to the Corgi backlight driver, I found that
commit ee0c8e494cc3 ("backlight: corgi: Convert to use GPIO
descriptors") replaced the use of the deprecated integer-based GPIO
interface, but didn't convert the GPIO numbers in the platform header
to match this. I think this is what causes the error, as the GPIOs for
the backlight are part of an expander chip with a GPIO base number
larger than the number of GPIOs for the gpio-pxa device.

This patch fixes things by updating the GPIO numbers for the backlight,
simply by dropping the GPIO base. It also updates the GPIO lookups to
look in the table for the appropriate expander. For the Akita platform
the expander with i2c address 0-0018 is used, for Spitz and Borzoi
the second Sharp SCOOP expander is used.

I've tested this patch with real Akita and Spitz handhelds, as well as
with QEMU.

Signed-off-by: Laurence de Bruxelles <lfdebrux@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Fixes: ee0c8e494cc3 ("backlight: corgi: Convert to use GPIO descriptors")
---
 arch/arm/mach-pxa/spitz.c |  8 ++++----
 arch/arm/mach-pxa/spitz.h | 34 +++++++++++++++++-----------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index dd88953adc9d..ede3727fc91d 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -524,9 +524,9 @@ static void spitz_bl_kick_battery(void)
 static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
 	.dev_id = "spi2.1",
 	.table = {
-		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_CONT,
+		GPIO_LOOKUP("sharp-scoop.1", SPITZ_GPIO_BACKLIGHT_CONT,
 			    "BL_CONT", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_ON,
+		GPIO_LOOKUP("sharp-scoop.1", SPITZ_GPIO_BACKLIGHT_ON,
 			    "BL_ON", GPIO_ACTIVE_HIGH),
 		{ },
 	},
@@ -535,9 +535,9 @@ static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
 static struct gpiod_lookup_table akita_lcdcon_gpio_table = {
 	.dev_id = "spi2.1",
 	.table = {
-		GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_CONT,
+		GPIO_LOOKUP("0-0018", AKITA_GPIO_BACKLIGHT_CONT,
 			    "BL_CONT", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_ON,
+		GPIO_LOOKUP("0-0018", AKITA_GPIO_BACKLIGHT_ON,
 			    "BL_ON", GPIO_ACTIVE_HIGH),
 		{ },
 	},
diff --git a/arch/arm/mach-pxa/spitz.h b/arch/arm/mach-pxa/spitz.h
index 04828d8918aa..4def79ee6df0 100644
--- a/arch/arm/mach-pxa/spitz.h
+++ b/arch/arm/mach-pxa/spitz.h
@@ -137,26 +137,26 @@
 #define SPITZ_SCP2_SUS_SET  (SPITZ_SCP2_IR_ON | SPITZ_SCP2_RESERVED_1)
 
 #define SPITZ_SCP2_GPIO_BASE		(PXA_NR_BUILTIN_GPIO + 12)
-#define SPITZ_GPIO_IR_ON		(SPITZ_SCP2_GPIO_BASE + 0)
-#define SPITZ_GPIO_AKIN_PULLUP		(SPITZ_SCP2_GPIO_BASE + 1)
-#define SPITZ_GPIO_RESERVED_1		(SPITZ_SCP2_GPIO_BASE + 2)
-#define SPITZ_GPIO_RESERVED_2		(SPITZ_SCP2_GPIO_BASE + 3)
-#define SPITZ_GPIO_RESERVED_3		(SPITZ_SCP2_GPIO_BASE + 4)
-#define SPITZ_GPIO_RESERVED_4		(SPITZ_SCP2_GPIO_BASE + 5)
-#define SPITZ_GPIO_BACKLIGHT_CONT	(SPITZ_SCP2_GPIO_BASE + 6)
-#define SPITZ_GPIO_BACKLIGHT_ON		(SPITZ_SCP2_GPIO_BASE + 7)
-#define SPITZ_GPIO_MIC_BIAS		(SPITZ_SCP2_GPIO_BASE + 8)
+#define SPITZ_GPIO_IR_ON		0
+#define SPITZ_GPIO_AKIN_PULLUP		1
+#define SPITZ_GPIO_RESERVED_1		2
+#define SPITZ_GPIO_RESERVED_2		3
+#define SPITZ_GPIO_RESERVED_3		4
+#define SPITZ_GPIO_RESERVED_4		5
+#define SPITZ_GPIO_BACKLIGHT_CONT	6
+#define SPITZ_GPIO_BACKLIGHT_ON		7
+#define SPITZ_GPIO_MIC_BIAS		8
 
 /* Akita IO Expander GPIOs */
 #define AKITA_IOEXP_GPIO_BASE		(PXA_NR_BUILTIN_GPIO + 12)
-#define AKITA_GPIO_RESERVED_0		(AKITA_IOEXP_GPIO_BASE + 0)
-#define AKITA_GPIO_RESERVED_1		(AKITA_IOEXP_GPIO_BASE + 1)
-#define AKITA_GPIO_MIC_BIAS		(AKITA_IOEXP_GPIO_BASE + 2)
-#define AKITA_GPIO_BACKLIGHT_ON		(AKITA_IOEXP_GPIO_BASE + 3)
-#define AKITA_GPIO_BACKLIGHT_CONT	(AKITA_IOEXP_GPIO_BASE + 4)
-#define AKITA_GPIO_AKIN_PULLUP		(AKITA_IOEXP_GPIO_BASE + 5)
-#define AKITA_GPIO_IR_ON		(AKITA_IOEXP_GPIO_BASE + 6)
-#define AKITA_GPIO_RESERVED_7		(AKITA_IOEXP_GPIO_BASE + 7)
+#define AKITA_GPIO_RESERVED_0		0
+#define AKITA_GPIO_RESERVED_1		1
+#define AKITA_GPIO_MIC_BIAS		2
+#define AKITA_GPIO_BACKLIGHT_ON		3
+#define AKITA_GPIO_BACKLIGHT_CONT	4
+#define AKITA_GPIO_AKIN_PULLUP		5
+#define AKITA_GPIO_IR_ON		6
+#define AKITA_GPIO_RESERVED_7		7
 
 /* Spitz IRQ Definitions */
 
-- 
2.36.1

