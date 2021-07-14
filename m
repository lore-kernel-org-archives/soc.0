Return-Path: <SRS0=4hsp=MG=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAC4C07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 08:20:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DC8D3613AF; Wed, 14 Jul 2021 08:20:23 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A6461183
	for <soc@kernel.org>; Wed, 14 Jul 2021 08:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A6461183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f179.google.com with SMTP id e20so2143857ljn.8
        for <soc@kernel.org>; Wed, 14 Jul 2021 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRPiRX2oKTcL3d1pLj17da5E0aRJGr1Bopad8cSB5+Q=;
        b=Ub051rjBzs2+QdF9/sVa6WEyJhQ046LDynRFFv1E6fggKFW0Q0HMhLqAqQi95XIEQO
         b3mgd1TwvHgC4msPrQ54rKGW3zqi90Tj7omWYSecGgSYJl7+q6jbNsjFK/KOnOF/yUSZ
         9a7OUsjB6bKGHVVHSSn7yDuhl7i0+m5QlsOgIc1uudaYZItJFqv2Bu+kaz+w12nJ63fZ
         bx2RmjqkWNQaHsp+8vX753fpkm132Z1moCM67r8bkpGTm2F3BU7w/GC48JZrVXhmVtRk
         LJxgPUubckufv7JDfFSwyP7odqL8QMDmEeYrBzxJdJULkCVcAZ/ocLJUBIZFwi7DnwY7
         Cgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRPiRX2oKTcL3d1pLj17da5E0aRJGr1Bopad8cSB5+Q=;
        b=CMMF3mm0LIl7RXvhp1RyxllVKc3ZIivNaCsLpUeg3qoDSG5UXI6MEffFPiFR+pAOK7
         Ujh2w/g1fznqbuTixa9dGirOqtr7T8hNV3gwN8dR7xlwXihTS+6NqI3MmdltZ3fiHGJy
         z7ly9YPkVEHcLP+I8BhiaK5HSU9uBpFRcFSqFzu4WcDQoJlwj7PUEO/pY0mCoMajhxaF
         wMQDgGQmzahPuuy+TiaVdyrjKau9BEljgG0TbV7gZSnb6IqmW8oRt8qlKBWbfNNc+z/A
         EPwfv2Su2jT+EmZKk3xksgFAPp8BrXOdvc66HIgSQa85hdjEqGFkpKt6n4maicAvft/W
         yTJw==
X-Gm-Message-State: AOAM533GUBGdbbXjy5pG1Cco8/RLYUKryud3Iorymq226gtj3QqxPDqY
	ztnP7eN7ajIg6phDzuwHmgoNFg==
X-Google-Smtp-Source: ABdhPJwWNJDPZNfvvWcse7DmlpiYmGQt0DWmDRx6bGewXX+ernbwA/BSOaqL6/alCofEnbdPiLbJXg==
X-Received: by 2002:a2e:9cc2:: with SMTP id g2mr8405854ljj.184.1626250821741;
        Wed, 14 Jul 2021 01:20:21 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q17sm155210ljp.3.2021.07.14.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 01:20:21 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: configs: Update Versatile defconfig
Date: Wed, 14 Jul 2021 10:18:19 +0200
Message-Id: <20210714081819.139210-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the Versatile defconfig for the changes
in the v5.14-rc1 kernel:

- The Framebuffer CONFIG_FB needs to be explicitly selected
  or we don't get any framebuffer anymore. DRM has stopped to
  select FB because of circular dependency.
- The CONFIG_FB_MODE_HELPERS are not needed when using DRM
  framebuffer emulation as DRM does.
- The Acorn fonts are removed, the default framebuffer font
  works fine. I don't know why this was selected in the first
  place or how the Kconfig was altered so it was removed.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this directly for the v5.14 rc:s.
---
 arch/arm/configs/versatile_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index e7ecfb365e91..b703f4757021 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -60,7 +60,7 @@ CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
@@ -88,8 +88,6 @@ CONFIG_NFSD=y
 CONFIG_NFSD_V3=y
 CONFIG_NLS_CODEPAGE_850=m
 CONFIG_NLS_ISO8859_1=m
-CONFIG_FONTS=y
-CONFIG_FONT_ACORN_8x8=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
-- 
2.31.1

