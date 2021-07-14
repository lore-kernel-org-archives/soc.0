Return-Path: <SRS0=4hsp=MG=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD51C07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 09:02:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A3C3661396; Wed, 14 Jul 2021 09:02:44 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE0061363
	for <soc@kernel.org>; Wed, 14 Jul 2021 09:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FE0061363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f171.google.com with SMTP id bn5so1924118ljb.10
        for <soc@kernel.org>; Wed, 14 Jul 2021 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Glr3iLRAWPh3TJw841jqQiLsY6cVS6fOsaPgnbpItW0=;
        b=xLzA715oqAqRjuvl5ZpLt8EntiG+7AFNXkDqdq45X/76w10kH2hlk6Zgz28gbv4hss
         0umHJy68MRJPSuKolrhiphFf8Ts1fBpY+rVx21wIWepNwLJobyqjxsDwt/SX253y4VH1
         /zB94jtGZwyZlZvvcfLkuTjGyUk1+s05LchmJrO8JFULR7xkpIwv5d8+zpCfCsJvqzIX
         Pov83GJG0qtOrmljUk1OG8u284x9KKRkGCN7DiL0lRZ7Ob2WTLFGf9grpFeAwrrmYSFO
         8v/Y42d2Xhk2b7BHpQfsQWS5QG70pUWrw6fkuwIZALux+PCFN4BJqIKHgWt9ECHun7PU
         MS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Glr3iLRAWPh3TJw841jqQiLsY6cVS6fOsaPgnbpItW0=;
        b=FteLu2V/xXDhB2jMxY88HmSzrjZABysTdwUcQnmalraSRKkXYnhrIf/rN0K4LVbwEQ
         Ir/ZIRYXmq1oeJnhC6L1lH2vu0RVXnU6F/HZF3LtPgWKxxT0oDPSRLP7CvXl+kQowLu+
         1caeAxbzx5nfKaKIVxIfRDD8Om40oVnSk4WLVH9dNSrz6YtR+sT1GUf+YFv7S63f/bxG
         DbttwtobMNwNk1B+ZAO2Nxwue87jfFXmw2cY3yRAY9jRCeOPGeCWmDGLKSgU+tvrR3pH
         wQj33pNavwKwr2MAJihO6gMBn+fJkKGWbdsgmkH3ldSTaB3wAQrVkk4GBZa7ThzhxaFk
         umuA==
X-Gm-Message-State: AOAM530yzl0yEEAa1+t6US7a8Yvg/E6tysb6JMt1CyfNVOSrJWulU9Cx
	SKFKxsIwCGm6SLwV5X9Li7w5HQ==
X-Google-Smtp-Source: ABdhPJwa3++aYCczrX4i+LfcKkwRXe1gyCq+wIYz8+NiJ26uVIJsO1qOwZetb5DZgN3sfQa+ijSpZA==
X-Received: by 2002:a2e:a4a6:: with SMTP id g6mr8233830ljm.152.1626253362526;
        Wed, 14 Jul 2021 02:02:42 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id r9sm161429ljc.62.2021.07.14.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 02:02:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: configs: Update RealView defconfig
Date: Wed, 14 Jul 2021 11:00:40 +0200
Message-Id: <20210714090040.182381-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the RealView defconfig for the changes
in the v5.14-rc1 kernel:

- The Framebuffer CONFIG_FB needs to be explicitly selected
  or we don't get any framebuffer anymore. DRM has stopped to
  select FB because of circular dependency.
- The CONFIG_FB_MODE_HELPERS are not needed when using DRM
  framebuffer emulation as DRM does.
- Drop two unused penguin logos.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this directly for the v5.14 rc:s.
---
 arch/arm/configs/realview_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index 483c400dd391..4c01e313099f 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -64,11 +64,9 @@ CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
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
-- 
2.31.1

