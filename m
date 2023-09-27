Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42333E82CC9
	for <soc@archiver.kernel.org>; Wed, 27 Sep 2023 19:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00B47C433C8; Wed, 27 Sep 2023 19:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B2EC433C7;
	Wed, 27 Sep 2023 19:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695844133;
	bh=yEeqEJ4ISItwEhoQqpD/iKg3SZmBqeuBRctMpDBPxzU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=U5zDYD1ryymK4XKuBXHFQnK/pGxvM3VGJ1JujiitjQ2isFwKHNpH9j/fzSkw3VMDX
	 C/PFWyL7UJsQ+QCU2yzg+E8AR4FSbhpUWak1M4UW/624QL84UowMtfR2evcr8sQAyZ
	 /KagsC5AtcC6U0Y9B/+UGJgZtCvkwQkRxb9xZ2KfFvKDFW0VG6Vh+ErRWqgNZwzg9E
	 q6WtTnq+qZCp9IvQhqzhtavIPryHIH8Uhobyav7C3J+4mJIAyjpL7YP8rsTG0OE4qV
	 Q940zZVefKzlrhXzeb+uV0TxBR4dabxhdZuK7KX72vC786QsfrUoiLUgR+6anG+6Zu
	 M6vWQT7KTRhRg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: locomo: fix locomolcd_power declaration
Date: Wed, 27 Sep 2023 21:38:10 +0200
Message-Id: <20230927194844.680771-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The locomolcd driver has one remaining missing-prototype warning:

drivers/video/backlight/locomolcd.c:83:6: error: no previous prototype for 'locomolcd_power' [-Werror=missing-prototypes]

There is in fact an unused prototype with a similar name in a global
header, so move the actual one there and remove the old one.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/hardware/locomo.h     | 2 +-
 arch/arm/mach-sa1100/include/mach/collie.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/hardware/locomo.h b/arch/arm/include/asm/hardware/locomo.h
index 246a3de25931d..aaaedafef7cce 100644
--- a/arch/arm/include/asm/hardware/locomo.h
+++ b/arch/arm/include/asm/hardware/locomo.h
@@ -195,7 +195,7 @@ struct locomo_driver {
 
 #define LOCOMO_DRIVER_NAME(_ldev) ((_ldev)->dev.driver->name)
 
-void locomo_lcd_power(struct locomo_dev *, int, unsigned int);
+extern void locomolcd_power(int on);
 
 int locomo_driver_register(struct locomo_driver *);
 void locomo_driver_unregister(struct locomo_driver *);
diff --git a/arch/arm/mach-sa1100/include/mach/collie.h b/arch/arm/mach-sa1100/include/mach/collie.h
index b7bc23ffd3c69..c95273c9567bb 100644
--- a/arch/arm/mach-sa1100/include/mach/collie.h
+++ b/arch/arm/mach-sa1100/include/mach/collie.h
@@ -16,8 +16,6 @@
 
 #include "hardware.h" /* Gives GPIO_MAX */
 
-extern void locomolcd_power(int on);
-
 #define COLLIE_SCOOP_GPIO_BASE	(GPIO_MAX + 1)
 #define COLLIE_GPIO_CHARGE_ON	(COLLIE_SCOOP_GPIO_BASE + 0)
 #define COLLIE_SCP_DIAG_BOOT1	SCOOP_GPCR_PA12
-- 
2.39.2

