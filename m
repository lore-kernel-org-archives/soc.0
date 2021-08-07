Return-Path: <SRS0=9c91=M6=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB97CC4338F
	for <soc@archiver.kernel.org>; Sat,  7 Aug 2021 22:57:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78D5A61057; Sat,  7 Aug 2021 22:57:24 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568F06103B
	for <soc@kernel.org>; Sat,  7 Aug 2021 22:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 568F06103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id x8so25927953lfe.3
        for <soc@kernel.org>; Sat, 07 Aug 2021 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G31FyspqRozVohOAp5zPj3ZyxdIwDTnIwiOK0X3i6qc=;
        b=oCpoU3+DYlHyYQhFUnqYOFfjHU74I0L890VVRZf7Nt0OBVA+X8iLomSadxkQ73kM93
         yKujzSlhpIkK/6Qooab4QKM/RLMFo1aC/X4dW87SocrL/DPXe/U+/lJiN0YDAOh9ShC/
         VROUaXRXmTG1WXGU6tPw6EWNrw1CGDwK91ZH3ttebVgTz333YW7HHTE7WQIqPUxQU9c7
         gI6TJH1z0dU26/kBf2+/YYLPcJmYRQUvIKfHgZHYvDUxF8LvBVdd8nA7q8iZbZkD2kQP
         b2oG0vvGLxRM3wXyGsNKVTG4t1B0B9/A4iWyGJpKrYjfTCPmGLGT54tidZHnNwlrhFPn
         g6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G31FyspqRozVohOAp5zPj3ZyxdIwDTnIwiOK0X3i6qc=;
        b=icIiYkTZS5b1rqN6n4mPflYvueyf5gfA1g7m45CiFtdbCf/T8AlYJnedulWOWC7bGO
         PE1+X7THEN7qydfwZ23IyF/W8JZub3PgW197MQP2avuuiWUbgSzHi/8d4ynGe5KS4CMI
         0oNqY28VHn9uABXnnxy3PmZa3tg27hto7uysbqdRSawazzQiGLpF6s7fEbkNv7g2bWV6
         h3vUxtFulP/21J+N5jGcNDqSEswIcOAGCF+terwFLuxSAqszDu9WqUf776+CfAkcAy7z
         IO3yXiu0wN32qNIoyIXHlIyS+73jCxgNIkcET93VyNSOTOJMtF0tT4Snt9V7Myfsdhh8
         v+4A==
X-Gm-Message-State: AOAM531RMRekP1WHf9q3vg/9A+F7OVy0Zn7kgYNY9ZETWfo7qE5BpCNz
	nyAA264Gf993pQRoX0PnARqVvg==
X-Google-Smtp-Source: ABdhPJznsI4o9Snlr72kaJsMyD6Sgca6TYvsp0ZtxCwBLZ7doaocqlsNttxhTYLF/m5RO+VeFXQBxQ==
X-Received: by 2002:ac2:50c2:: with SMTP id h2mr12063701lfm.332.1628377042741;
        Sat, 07 Aug 2021 15:57:22 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p5sm1261095lfr.84.2021.08.07.15.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 15:57:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: configs: Update the nhk8815_defconfig
Date: Sun,  8 Aug 2021 00:55:18 +0200
Message-Id: <20210807225518.3607126-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform lost the framebuffer due to a commit solving a
circular dependency in v5.14-rc1, so add it back in by explicitly
selecting the framebuffer.

Also fix up some Kconfig options that got dropped or moved around
while we're at it.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this directly for fixes.
---
 arch/arm/configs/nhk8815_defconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk8815_defconfig
index 3f35761dc9ff..23595fc5a29a 100644
--- a/arch/arm/configs/nhk8815_defconfig
+++ b/arch/arm/configs/nhk8815_defconfig
@@ -15,8 +15,6 @@ CONFIG_SLAB=y
 CONFIG_ARCH_NOMADIK=y
 CONFIG_MACH_NOMADIK_8815NHK=y
 CONFIG_AEABI=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
@@ -52,9 +50,9 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_ONENAND=y
 CONFIG_MTD_ONENAND_VERIFY_WRITE=y
 CONFIG_MTD_ONENAND_GENERIC=y
-CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_FSMC=y
+CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
@@ -97,6 +95,7 @@ CONFIG_REGULATOR=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_TPO_TPG110=y
 CONFIG_DRM_PL111=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
@@ -136,9 +135,8 @@ CONFIG_NLS_ISO8859_15=y
 CONFIG_CRYPTO_MD5=y
 CONFIG_CRYPTO_SHA1=y
 CONFIG_CRYPTO_DES=y
+# CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_DEBUG_INFO=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
-# CONFIG_DEBUG_BUGVERBOSE is not set
-- 
2.31.1

