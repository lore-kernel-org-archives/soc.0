Return-Path: <SRS0=i56Z=VR=foss.arm.com=carsten.haitzler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80778C433EF
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 12:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4DC99C385AF; Mon,  9 May 2022 12:55:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 079FFC385A8
	for <soc@kernel.org>; Mon,  9 May 2022 12:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 079FFC385A8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53DDF1480;
	Mon,  9 May 2022 05:55:29 -0700 (PDT)
Received: from e126387.arm.com (unknown [10.57.35.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C40C43F73D;
	Mon,  9 May 2022 05:55:28 -0700 (PDT)
From: carsten.haitzler@foss.arm.com
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: Enable modules for arm displays
Date: Mon,  9 May 2022 13:55:10 +0100
Message-Id: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Key devices that support displays on SoCs like the Komeda DRM driver, the
older HDLCD were not enabled by default and should be so displays can work
out of the box on defconfig. Also Candence I2C support should be enabled so
the PHY and thus displays can work too.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 30516dc0b70e..87edd79dac99 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -469,6 +469,7 @@ CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I2C_CADENCE=m
 CONFIG_SPI=y
 CONFIG_SPI_ARMADA_3700=y
 CONFIG_SPI_BCM2835=m
@@ -678,7 +679,9 @@ CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
+CONFIG_DRM_HDLCD=m
 CONFIG_DRM_MALI_DISPLAY=m
+CONFIG_DRM_KOMEDA=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_EXYNOS=m
 CONFIG_DRM_EXYNOS5433_DECON=y
-- 
2.25.1
