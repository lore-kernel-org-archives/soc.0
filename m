Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F28BC433F5
	for <soc@archiver.kernel.org>; Mon, 20 Sep 2021 10:06:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21E6460F9B; Mon, 20 Sep 2021 10:06:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50D6F60F5D;
	Mon, 20 Sep 2021 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632132378;
	bh=cWNYxGntqMjtuFTPah0ukt4ZiP3ZlHgC+JMjq3iH+5E=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=P9Yh1cfompD9ktsrZYxFoVUgjbEI2p/Bg/fSwNmz7vsSj8VZV1GMrHmDhE9moHVnG
	 NFPvqwD/odAt4lKq8cifYgxEnm8qmE7sKeSCYyy6NzGFtEyiCsPSUsIGXs21oqTATI
	 xfgcWVIJmFdyGAdWH6/bnvwLbW/7nNsPm0oxgIBtXdSuCVoUegZdNQt46/HX1teFmt
	 82DbyVQGtHajToYyDtBaICap5cJq+ImFZrEYSI2sZHllh5hXfudyepLtUzV7oiRBNc
	 3OTnGErcmgpxmK86zFth4gI+X1mHuBQFVeqJkyDTN1FfLS3XERyj1rERSCKQsWHF9I
	 yqFRnFKLQuyyA==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: samsung: exynos-pmu: select CONFIG_MFD_CORE
Date: Mon, 20 Sep 2021 12:06:08 +0200
Message-Id: <20210920100613.1613919-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Using devm_mfd_add_devices() fails if no driver selects the
MFD core code:

aarch64-linux-ld: drivers/soc/samsung/exynos-pmu.o: in function `exynos_pmu_probe':
exynos-pmu.c:(.text+0xa0): undefined reference to `devm_mfd_add_devices'

Add the missing select statement.

Fixes: 93618e344a5e ("soc: samsung: exynos-pmu: instantiate clkout driver as MFD")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 5745d7e5908e..1f643c0f5c93 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -25,6 +25,7 @@ config EXYNOS_PMU
 	bool "Exynos PMU controller driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
 	select EXYNOS_PMU_ARM_DRIVERS if ARM && ARCH_EXYNOS
+	select MFD_CORE
 
 # There is no need to enable these drivers for ARMv8
 config EXYNOS_PMU_ARM_DRIVERS
-- 
2.29.2

