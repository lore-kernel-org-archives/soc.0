Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4858C3271E
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 11:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D53DC4AF0A; Mon,  8 Jul 2024 11:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D6DC116B1;
	Mon,  8 Jul 2024 11:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720438810;
	bh=PtrFRVd5Dy4ptI630Fkeii0XsntRASbphrFtmeNRSRY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N8QnnjxJDvXjfcR/nGjI3y43JDJgv64R4rPgqOpANtXfvPMVpVxBZIo+xnT1zEw2x
	 k8YuBB2d+WBZb/zJNBlBeKL2+34g77e9jYdvSq74UeCSsv39PiL0BQ/mnlCfpBnlgi
	 h5A+GCy+2cuphowGOKuxY0LuJMihpimGGGFJrU2onKWOSY/zn1ApVkAcu77zatmm0l
	 eAPAVOjBo/ibwJ23cRcRJvqou9L1ZRLa5NfAhKtNxqHjlZwGVQjvYNQ4tWKSw8A0X8
	 mnsUipGcrWyQOH2Q8mYRKomjB5d0SDZCeELLaamsmNaSHp+8nqyJWXIx26pvUaimVR
	 wj7E+SVA/8ymw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] platform: cznic: turris-omnia-mcu: Depend on WATCHDOG
Date: Mon,  8 Jul 2024 13:40:02 +0200
Message-ID: <20240708114002.4285-3-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240708114002.4285-1-kabel@kernel.org>
References: <20240708114002.4285-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add depend on WATCHDOG, otherwise modpost fails with
  ERROR: modpost: "watchdog_init_timeout" [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
  ERROR: modpost: "devm_watchdog_register_device" [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!

Fixes: ab89fb5fb92c ("platform: cznic: turris-omnia-mcu: Add support for MCU watchdog")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407040711.g19y3cWq-lkp@intel.com/
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index 8992f7b87223..2a5235cf6844 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -17,6 +17,7 @@ config TURRIS_OMNIA_MCU
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on I2C
 	depends on OF
+	depends on WATCHDOG
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select HW_RANDOM
-- 
2.44.2

