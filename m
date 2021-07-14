Return-Path: <SRS0=4hsp=MG=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122D0C07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 12:29:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E82B5613AA; Wed, 14 Jul 2021 12:29:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD97361396
	for <soc@kernel.org>; Wed, 14 Jul 2021 12:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD97361396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 22so3239800lfy.12
        for <soc@kernel.org>; Wed, 14 Jul 2021 05:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SlpXWYOq8PAFMBU6sDvuljQJ5yI9oKIOvoGdtgIJ6pg=;
        b=oV3Oy7gUK14rxwxyvu3/u6mG3xJsEyTdaWwi+sPUjx9llbKqOPudHplyiWQm0gq+HO
         +99QcFCjKvx58cU3d1H7DQx9df/l4qXHgNreihcn8sXZ0190ErtYWGAEevFsRbajfFMv
         f0md381ng+Omb6GlQPU2M6Ngv5IDBWZ43sKK6FgHHMuCFM7zeKfDZwzTXbIehyDkDI07
         SB2RIxTj3DM+Z6wr3jqa/FM6aioC9K4ERf+sL/HWUvbYxLjpbgWZ2qeN0bqtyREq+bkx
         to+Etc9W2LROlhOb/KKo5elwSN2qqAkzwpoVi2dRvFZR0kD2MkiHT9anxwUaDMgmXpM8
         L32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SlpXWYOq8PAFMBU6sDvuljQJ5yI9oKIOvoGdtgIJ6pg=;
        b=czY3yj8XGSTRwpoSn3mJTxur8e+eDmUVCMc98wU7VHE+aehaeGR3407+yfI7TvNAFF
         DJktm++iWiytsU0FxXS3bt/WCLlW4uOAbUUMeoCwADuR0hRzfzNM6zMS1r4JH6ZPVBby
         GoCWuBqm1NejhhX5kRtcNjQRrlaRHIQJak2ns/D3tP6j/Cckcdl1oQj7J5tceQmrWgty
         MHeR7UkwnsTP95PSgoHzIZMztf5kRIrComoOlm8cjf2y+lqgQFpOyOMC1SWWtovAqJnU
         mA3d+SrA+u60OTo69F7ubKwDDCrFmebHteIWL6g29EvJglbS7WDEdQUUqRRyC4LmWVbB
         ckCQ==
X-Gm-Message-State: AOAM532lX+G9lWpFYOKBosTJxM2aAfT57fMaQnhrQK9XfxKogWxE4JUS
	tf7+093qhhug4dmshdWsFZySAg==
X-Google-Smtp-Source: ABdhPJxZPQBdu0qq0eeqX53V8P70cI6tQSAtXJR8KGBKufnfTgpsldHl4JeG3/Xk1+JG24YCKfOrjw==
X-Received: by 2002:a19:2d0f:: with SMTP id k15mr7966853lfj.237.1626265747095;
        Wed, 14 Jul 2021 05:29:07 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s21sm220960lji.57.2021.07.14.05.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:29:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: configs: Update Integrator defconfig
Date: Wed, 14 Jul 2021 14:27:03 +0200
Message-Id: <20210714122703.212609-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the Integrator defconfig for the changes
in the v5.14-rc1 kernel:

- The Framebuffer CONFIG_FB needs to be explicitly selected
  or we don't get any framebuffer anymore. DRM has stopped to
  select FB because of circular dependency.
- Drop the unused Matrox FB drivers that are only used with
  specific PCI cards.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this directly for the v5.14 rc:s.
---
 arch/arm/configs/integrator_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/configs/integrator_defconfig b/arch/arm/configs/integrator_defconfig
index b06e537d5149..4dfe321a79f6 100644
--- a/arch/arm/configs/integrator_defconfig
+++ b/arch/arm/configs/integrator_defconfig
@@ -57,10 +57,7 @@ CONFIG_DRM=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_FB_MATROX=y
-CONFIG_FB_MATROX_MILLENIUM=y
-CONFIG_FB_MATROX_MYSTIQUE=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_LOGO=y
-- 
2.31.1

