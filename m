Return-Path: <SRS0=ACqz=M6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC9BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Aug 2021 22:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 836AD61050
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Aug 2021 22:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 836AD61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iukxeqVWbJnoDk4kOBto3VFzh9SumAbvouSaMb06g0A=; b=1GWzjSE9PXZnQ2
	wpzE5F/vJBzDPmcL0WI9cn6j5/LYgC4OMRBDujZhcl+qewcB4aQytjC/5XKEJsVXwK1wu3lWWu1FX
	7eHPe483EGe7p5rY9WPe3LQUcZjHSYbqyYw4ZnuLRSuBPvWIIXGiV2OnSTPppP6cbNjwFp4vAwUa7
	++FInuKBU2trCbxZb4FlKEoRDL5EAnuRFGeARy9kV+JMQ+XJxx0vGi94mSGncqH1h9dMolkJ7b4xI
	Ixw4GxFKqJs+VeGMdn29leSUFN8F8IZ+qtYKsIJNAkJCk1Bg8qDuHdW+ANGldWRhPU6qG32FPrG7H
	rNGi9pZedCCIUqpXQhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCVFv-00FGpR-LV; Sat, 07 Aug 2021 22:57:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCVFs-00FGou-BI
 for linux-arm-kernel@lists.infradead.org; Sat, 07 Aug 2021 22:57:25 +0000
Received: by mail-lf1-x130.google.com with SMTP id c16so25928208lfc.2
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 07 Aug 2021 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=A7mJVcjtt+PyWK2eT5xNlgL7LPOj9FY5s6ZvCYuWZ5rHSEPXGfwSoGDWllY3x5m8I+
 1mhXdUZUlB8r/t2lz+F895wpai/qeaPQXeth1e/emCCOxTrJ2/yKo/uQ4BqCgmTvxcWg
 I94Vs2TvWqLKoRG0xdmVhpYNSvne0vYok73nHuXFo15ouO2G+ha6erHNzdtPBEsE8+AQ
 KGqGRjgXgQ+zzRcSVEZLBhHeoHpQRiPxUOSK4NUmu69MTwz+hz7kyAUxtyFlCRz/NoEx
 vyOUKwf7Iif2h6bgElmfiuq+YB++lAwFDIeiHRVS6PbIiDw8MEpHdwOzuaas5nwAJl7M
 C9KQ==
X-Gm-Message-State: AOAM531sWA2h6blZWGUm7sKdgSOnk/wgeNEvOYe//udeozKnsg5dJ6rk
 uECkuKr1o68FFzp8vwofex+pqg==
X-Google-Smtp-Source: ABdhPJznsI4o9Snlr72kaJsMyD6Sgca6TYvsp0ZtxCwBLZ7doaocqlsNttxhTYLF/m5RO+VeFXQBxQ==
X-Received: by 2002:ac2:50c2:: with SMTP id h2mr12063701lfm.332.1628377042741; 
 Sat, 07 Aug 2021 15:57:22 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id p5sm1261095lfr.84.2021.08.07.15.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 15:57:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: configs: Update the nhk8815_defconfig
Date: Sun,  8 Aug 2021 00:55:18 +0200
Message-ID: <20210807225518.3607126-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_155724_428923_35930F69 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210807225518.CoEr6L8SqiHqso3EpmkqtjBJYtCI9vt_FdXqMaymOr8@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
