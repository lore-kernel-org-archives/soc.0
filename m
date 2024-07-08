Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD41C3DA42
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 11:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C841C4AF0B; Mon,  8 Jul 2024 11:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A39C4AF0D;
	Mon,  8 Jul 2024 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720438808;
	bh=jVp+XX9M8zmtpZQJDmyLHxFS17Ue04YYa995Va4JeG0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZRtDViF8HAbWPfqcyxjl1ibl61XWyg+QY5GPt+EqmTy1udkZqTV8OtENTlJ25a7nH
	 /1ErWrD3U3m6Epi7iZrIaYXzvMKMUElEZgpX3xvAF2i0//Uj8UJAEy7Ojh4yOLllgN
	 6D+L460Vh+6XDHSg/6qUhUF68jRWpWAdCS9Dyi629Bg8u4e0Mo9R6SIhdLMCKZ/53Y
	 BpYx4JUrbEncy0ji/yeCWc9rikYJ0JHBmHM7MeoT1XTeNB0bDBLc4H+FO94vXGwPiu
	 kG8XVgo0F5FLksZnmdMwuETurruVGCJeQptpNJanhm3SmFBX3ImyqnGoU80NYZTNOn
	 iST0ijgKX9aFw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] platform: cznic: turris-omnia-mcu: Depend on OF
Date: Mon,  8 Jul 2024 13:40:01 +0200
Message-ID: <20240708114002.4285-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240708114002.4285-1-kabel@kernel.org>
References: <20240708114002.4285-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add depend on OF, otherwise the compilation fails with
  error: no member named 'of_gpio_n_cells' in 'struct gpio_chip'
  error: no member named 'of_xlate' in 'struct gpio_chip'

Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407031646.trNSwajF-lkp@intel.com/
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index 6edac80d5fa3..8992f7b87223 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -16,6 +16,7 @@ config TURRIS_OMNIA_MCU
 	tristate "Turris Omnia MCU driver"
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on I2C
+	depends on OF
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select HW_RANDOM
-- 
2.44.2

