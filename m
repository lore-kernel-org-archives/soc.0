Return-Path: <SRS0=qsmM=MF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C0EC07E95
	for <soc@archiver.kernel.org>; Tue, 13 Jul 2021 13:39:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 458776120A; Tue, 13 Jul 2021 13:39:17 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1175361166
	for <soc@kernel.org>; Tue, 13 Jul 2021 13:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1175361166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f47.google.com with SMTP id q16so14083282lfa.5
        for <soc@kernel.org>; Tue, 13 Jul 2021 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m1L1P03apuxbxHANuK71pE0bOd+7UHICDo55L4pBuMM=;
        b=VdSN2mzmfMLxkfg4yhldr7SGkYwkzR1ZTFVVCWs20f/smV/6I9k+QaoRD4R8X5WGo/
         EUEuSJUidq6HKaA074NHD5wG33d80rOLIBgC6P4nBNHYdDIG9QCg1NIQ7S0mOA2gU1fW
         lt+1olKCDcbvbQO/xgs+gkGfajTqhILAMkIVTIDBkpxfAZ26wRJf0slRDpeYQAd1rg9X
         7IK31kf24iy0KIqVIzV5U3gx69Ud1fD7UK65zoESPyFEf8VaebIwmTP+1vL7riRUEUBV
         ugcCTbqXMQ2hY0PHu1Obi5LTENAjvCfjM344auLYenYHNubsJUczVFM8t5Ma/Ofu/126
         NlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m1L1P03apuxbxHANuK71pE0bOd+7UHICDo55L4pBuMM=;
        b=S1KrzPVCpi4l+btzIz1tqf0uaD5oo9+dG0DMfZaFEgDalPMagHcxArdNwtEQKoZbll
         v4Uo2FtQZJOT/l8f/u8hf8oo7R2w/UEJYvXrsn8qNRwi41ziqtKJe9NeMifvbIm8Gj/z
         eLqX8YoIBibxJEQU9KAMaHQUvjk+lE3kl4GYOpHUHAF5AgX5OkgqnrvjJuObYO3Gpgfk
         BX3zvbk6TuK20zuBdT7/PPc0umG8/LlYGdHofaCOP9mrmDNxBTsqhLUkUCR2ckA1cLv7
         bDI2eA1nNG4TMJqiocIZslhJ5V9mZQMZSQhJe6c6rD640YDzowfOocXsQ1bWGBa81OOG
         IZiw==
X-Gm-Message-State: AOAM5319jY5LnlR3cZijud2RQrFtAGyu8EbEIWy+e2hwb7Q7G5KFbD9Z
	McPhHDGBVNpKb9QK4Ts2RjkrtQ==
X-Google-Smtp-Source: ABdhPJwpQtrzQUw085pQpGCvEWBKcCNRgspiugoHDYp/xnWmkQG6vAKtLkA8a+eKHsqQhNUh3tX35Q==
X-Received: by 2002:ac2:58e8:: with SMTP id v8mr3550223lfo.14.1626183555274;
        Tue, 13 Jul 2021 06:39:15 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y12sm1925068ljh.19.2021.07.13.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 06:39:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] ARM: configs: Update Vexpress defconfig
Date: Tue, 13 Jul 2021 15:37:08 +0200
Message-Id: <20210713133708.94397-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the Versatile Express defconfig for the changes
in the v5.14-rc1 kernel:

- The Framebuffer CONFIG_FB needs to be explicitly selected
  or we don't get any framebuffer anymore. DRM has stopped to
  select FB because of circular dependency.
- CONFIG_CMA options were moved around.
- CONFIG_MODULES options were moved around.
- CONFIG_CRYPTO_HW was moved around.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for v5.14 if Sudeep is
OK with the patch.
---
 arch/arm/configs/vexpress_defconfig | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index 4479369540f2..b5e246dd23f4 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -11,9 +11,6 @@ CONFIG_CPUSETS=y
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_VEXPRESS_DCSCB=y
 CONFIG_ARCH_VEXPRESS_TC2_PM=y
@@ -23,14 +20,17 @@ CONFIG_MCPM=y
 CONFIG_VMSPLIT_2G=y
 CONFIG_NR_CPUS=8
 CONFIG_ARM_PSCI=y
-CONFIG_CMA=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_CMDLINE="console=ttyAMA0"
 CONFIG_CPU_IDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -43,7 +43,6 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_DEVTMPFS=y
-CONFIG_DMA_CMA=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
@@ -59,7 +58,6 @@ CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_VIRTIO=y
 CONFIG_ATA=y
-# CONFIG_SATA_PMP is not set
 CONFIG_NETDEVICES=y
 CONFIG_VIRTIO_NET=y
 CONFIG_SMC91X=y
@@ -81,11 +79,9 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_DRIVERS is not set
@@ -136,10 +132,11 @@ CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
+# CONFIG_CRYPTO_HW is not set
+CONFIG_DMA_CMA=y
 CONFIG_DEBUG_INFO=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DETECT_HUNG_TASK=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_DEBUG_USER=y
-# CONFIG_CRYPTO_HW is not set
-- 
2.31.1

