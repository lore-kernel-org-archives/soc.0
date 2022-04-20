Return-Path: <SRS0=wXmp=U6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF29BC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6D41C385A9; Wed, 20 Apr 2022 07:03:53 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 587F8C385A1
	for <soc@kernel.org>; Wed, 20 Apr 2022 07:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 587F8C385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id k23so1581575ejd.3
        for <soc@kernel.org>; Wed, 20 Apr 2022 00:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rDRQl2jjmy/FRJ64Y43An48avf5V9MIxaPVcbHT3qd4=;
        b=iFIfmyX/BSPr/tARYIHkRBTwF5z3QopUUt6B8rEMsPppnUpEoT6P0B+nYMsZ/ktR4G
         6c81liHq8iVtA2d7LndbRxfFgTSd8M6dJJxOM2Ujq1LbosmUPTe2O5lTdPThsX36FGJ6
         K7aNL+NFSuPiNvhhINZl1F+zu1fMLwy8X29nkLf++xu2+aEFFoh/jNEo1Lqz5zmJh+AK
         gIpZqMw0Q9qa3fURjwUwKJG47V/F8nS+jH4qzeDvzS75IwGGp/opYyTKLrw+KNFQ9Z/F
         FSNUyaVnFh3p3Ok3e3/II370ERpbmanItwbK7AuFLy/oJA9BRbCivglDHcUAu5PU7WWY
         JzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rDRQl2jjmy/FRJ64Y43An48avf5V9MIxaPVcbHT3qd4=;
        b=SHLepen/6Fc0CMjIsTq8x423z6vtB7JKO5V1TFbNPyipBPlVqHRb6yxXIj1u/2gI2I
         2sV7ad7Ojmb5axKzUJqtHKoosVtQT3MSFX9AcRO0jUwpIRxXpSiH7oEXx49HYO5UQvln
         PLgkiQoyTqxLAa1kYgtIJofTSFD5YSvyZym9pz730mULsZ1s7lYgOPSjfjtB0rqucl1u
         3tflENfVwHAY/D3fRHFPN6V1Va6yn/lrlcUiZCjHXUrowBYW1BM1ybq5uff2u6MVfDKc
         Al9jnRXDCHceuAON086DX9QXQ47mNTgA71h+gk3+I+9cVXAEIOKFEl4gfCxTvTMK7sBu
         oEXQ==
X-Gm-Message-State: AOAM5335ymh8UoGoQniLGJug0K0J/SqljsPK7odouyhjPl5bGJ7u/mHp
	G7AWDW30JDTS6mIHvrtfloWsIA==
X-Google-Smtp-Source: ABdhPJxRuxbxr/i1iSu1tmj3phz0D4o72Zq4/OZB4qrJy8trsHs3nVxcoCTE7ZI7Ifw2ShuuSG9Xqg==
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id e20-20020a1709061e9400b006b96fcc53fdmr16899964ejj.450.1650438230647;
        Wed, 20 Apr 2022 00:03:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d1-20020a50fe81000000b004197f2ecdc2sm9450469edt.89.2022.04.20.00.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:03:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH mach/fixes] ARM: s3c: mark as deprecated and schedule removal
Date: Wed, 20 Apr 2022 09:03:42 +0200
Message-Id: <20220420070342.8786-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
available anymore - out-of-stock on FriendlyArm (one of manufacturers of
boards) and only few specialist stores still offer them for quite a high
price.

The community around these platforms was not very active, so I suspect
no one really uses them anymore. Maintenance takes precious time so
there is little sense in keeping them alive if there are no real users.

Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
possible removal in after 2022 for the first and 2024 for the lattere.
The deprecation message will be as text in Kconfig, build message (not a
warning though) and runtime print error.

If there are any users, they might respond and postpone the removal.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/r/20220407072319.75614-1-krzysztof.kozlowski@linaro.org
---
 arch/arm/Kconfig                  | 7 ++++++-
 arch/arm/mach-s3c/Kconfig.s3c64xx | 7 ++++++-
 arch/arm/mach-s3c/cpu.c           | 1 +
 arch/arm/mach-s3c/init.c          | 2 ++
 arch/arm/mach-s3c/s3c24xx.c       | 7 +++++++
 arch/arm/mach-s3c/s3c64xx.c       | 7 +++++++
 6 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e8091e2d8a8..89df6fa500b2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -467,7 +467,7 @@ config ARCH_SA1100
 	  Support for StrongARM 11x0 based boards.
 
 config ARCH_S3C24XX
-	bool "Samsung S3C24XX SoCs"
+	bool "Samsung S3C24XX SoCs (deprecated, see help)"
 	select ATAGS
 	select CLKSRC_SAMSUNG_PWM
 	select GPIO_SAMSUNG
@@ -483,6 +483,11 @@ config ARCH_S3C24XX
 	  (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940 or the
 	  Samsung SMDK2410 development board (and derivatives).
 
+	  The platform is deprecated and scheduled for removal. Please reach to
+	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
+	  you still use it.
+	  Without such feedback, the platform will be removed after 2022.
+
 config ARCH_OMAP1
 	bool "TI OMAP1"
 	select ARCH_OMAP
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index af01675d8769..2b27bff4d928 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -4,7 +4,7 @@
 #	Simtec Electronics, Ben Dooks <ben@simtec.co.uk>
 
 menuconfig ARCH_S3C64XX
-	bool "Samsung S3C64XX"
+	bool "Samsung S3C64XX (deprecated, see help)"
 	depends on ARCH_MULTI_V6
 	select ARM_AMBA
 	select ARM_VIC
@@ -24,6 +24,11 @@ menuconfig ARCH_S3C64XX
 	help
 	  Samsung S3C64XX series based systems
 
+	  The platform is deprecated and scheduled for removal. Please reach to
+	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
+	  you still use it.
+	  Without such feedback, the platform will be removed after 2024.
+
 if ARCH_S3C64XX
 
 # Configuration options for the S3C6410 CPU
diff --git a/arch/arm/mach-s3c/cpu.c b/arch/arm/mach-s3c/cpu.c
index 6e9772555f0d..0df428f01855 100644
--- a/arch/arm/mach-s3c/cpu.c
+++ b/arch/arm/mach-s3c/cpu.c
@@ -28,4 +28,5 @@ void __init s3c64xx_init_cpu(void)
 	}
 
 	pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
+	pr_err("The platform is deprecated and scheduled for removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.  Without such feedback, the platform will be removed after 2022.\n");
 }
diff --git a/arch/arm/mach-s3c/init.c b/arch/arm/mach-s3c/init.c
index 9d92f03e9bc1..bf513616f55d 100644
--- a/arch/arm/mach-s3c/init.c
+++ b/arch/arm/mach-s3c/init.c
@@ -59,6 +59,8 @@ void __init s3c_init_cpu(unsigned long idcode,
 
 	if (cpu->map_io)
 		cpu->map_io();
+
+	pr_err("The platform is deprecated and scheduled for removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.  Without such feedback, the platform will be removed after 2022.\n");
 }
 
 /* s3c24xx_init_clocks
diff --git a/arch/arm/mach-s3c/s3c24xx.c b/arch/arm/mach-s3c/s3c24xx.c
index ccfed48c98aa..515f81fdf628 100644
--- a/arch/arm/mach-s3c/s3c24xx.c
+++ b/arch/arm/mach-s3c/s3c24xx.c
@@ -678,3 +678,10 @@ struct platform_device s3c2410_device_dclk = {
 	},
 };
 #endif
+
+#ifndef CONFIG_COMPILE_TEST
+#pragma message "The platform is deprecated and scheduled for removal. " \
+		"Please reach to the maintainers of the platform " \
+		"and linux-samsung-soc@vger.kernel.org if you still use it." \
+		"Without such feedback, the platform will be removed after 2022."
+#endif
diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
index 4dfb648142f2..178085df6d9d 100644
--- a/arch/arm/mach-s3c/s3c64xx.c
+++ b/arch/arm/mach-s3c/s3c64xx.c
@@ -425,3 +425,10 @@ static int __init s3c64xx_init_irq_eint(void)
 	return 0;
 }
 arch_initcall(s3c64xx_init_irq_eint);
+
+#ifndef CONFIG_COMPILE_TEST
+#pragma message "The platform is deprecated and scheduled for removal. " \
+		"Please reach to the maintainers of the platform " \
+		"and linux-samsung-soc@vger.kernel.org if you still use it." \
+		"Without such feedback, the platform will be removed after 2024."
+#endif
-- 
2.32.0

