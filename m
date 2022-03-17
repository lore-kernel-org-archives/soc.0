Return-Path: <SRS0=YD5N=T4=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E73C433F5
	for <soc@archiver.kernel.org>; Thu, 17 Mar 2022 18:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3251AC340F3; Thu, 17 Mar 2022 18:30:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 93D21C340EC
	for <soc@kernel.org>; Thu, 17 Mar 2022 18:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93D21C340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 102F51691;
	Thu, 17 Mar 2022 11:30:57 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83C4F3F7F5;
	Thu, 17 Mar 2022 11:30:55 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/5] ARM: configs: multi_v5_defconfig: re-enable DRM_PANEL and FB_xxx
Date: Thu, 17 Mar 2022 18:30:41 +0000
Message-Id: <20220317183043.948432-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317183043.948432-1-andre.przywara@arm.com>
References: <20220317183043.948432-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 91185d55b32e ("drm: Remove DRM_KMS_FB_HELPER Kconfig option")
led to de-selection of CONFIG_FB, which was a prerequisite for
BACKLIGHT_CLASS_DEVICE, which CONFIG_DRM_PANEL_SIMPLE depended on.
Explicitly set CONFIG_FB, to bring DRM_PANEL_SIMPLE, DRM_PANEL_EDP,
FB_IMX and FB_ATMEL back into the generated .config.
This also adds some new FB related features like fonts and the
framebuffer console.

See also commit 8c1768967e27 ("ARM: config: mutli v7: Reenable FB
dependency"), which solved the same problem for multi_v7_defconfig.

This relies on [1], to fix a broken Kconfig dependency.

[1] https://lore.kernel.org/dri-devel/20220315084559.23510-1-tzimmermann@suse.de/raw

Fixes: 91185d55b32e ("drm: Remove DRM_KMS_FB_HELPER Kconfig option")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/configs/multi_v5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index dfbca8a683e2..9af55d650cf4 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -190,6 +190,7 @@ CONFIG_DRM_ATMEL_HLCDC=m
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_ASPEED_GFX=m
+CONFIG_FB=y
 CONFIG_FB_IMX=y
 CONFIG_FB_ATMEL=y
 CONFIG_BACKLIGHT_ATMEL_LCDC=y
-- 
2.25.1

