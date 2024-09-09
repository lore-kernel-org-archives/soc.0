Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC02ECE579
	for <soc@archiver.kernel.org>; Mon,  9 Sep 2024 09:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEB3FC4CEC6; Mon,  9 Sep 2024 09:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F520C4CEC5;
	Mon,  9 Sep 2024 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725872661;
	bh=21XZgZhhL5UrKCuLusQQvPQ+rZd4NBRQIgirkMHUuQU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=A+HBD4wZpTR/Ado+/zpqSuVbg8SdVRW9jYJ9ZRrKeitPSVMMzQqYN+Euw7OdhPG2B
	 kdZgpgotkeHgfYeJ5E/mJi5HLB6ijqfYbGHc06HN+vWLKNFqfLdnt5OhTXOYkgkpvs
	 t4bw70fZKJnbBAlgcFQWHbRLYXoPV7FcaE2bbciFRjCE5MZc0/D5FWCSq8NDzqaZRO
	 DGOFSZikUaehqkiXQolI1Y2GLybWkpeyqID+iUY2oozgHhdkeOLsWbvNwCjPZgGeWa
	 UBgTZWaPaKesMVteHj79ApfNCxd1LYRhlf0nmHTKq9VyN5WYhJSvXeTtEwx3F0E44v
	 aPllUjdnpytqw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform: cznic: turris-omnia-mcu: fix HW_RANDOM dependency
Date: Mon,  9 Sep 2024 11:04:09 +0000
Message-Id: <20240909110417.247453-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There is still a build failure when the rwrng support is in a loadable
module but the mcu driver is built-in:

arm-linux-gnueabi-ld: drivers/platform/cznic/turris-omnia-mcu-trng.o: in function `omnia_mcu_register_trng':
turris-omnia-mcu-trng.c:(.text.omnia_mcu_register_trng+0x11c): undefined reference to `devm_hwrng_register'

Change the dependency to explicitly disallow the broken
configuration.

Fixes: 41bb142a4028 ("platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/cznic/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index a111eca8ff57..49c383eb6785 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -70,7 +70,7 @@ config TURRIS_OMNIA_MCU_TRNG
 	bool "Turris Omnia MCU true random number generator"
 	default y
 	depends on TURRIS_OMNIA_MCU_GPIO
-	depends on HW_RANDOM
+	depends on HW_RANDOM=y || HW_RANDOM=TURRIS_OMNIA_MCU
 	help
 	  Say Y here to add support for the true random number generator
 	  provided by CZ.NIC's Turris Omnia MCU.
-- 
2.39.2

