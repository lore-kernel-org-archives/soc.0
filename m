Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C33C77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADFB5C433A0; Tue, 16 May 2023 15:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67ED9C433B0;
	Tue, 16 May 2023 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251170;
	bh=Emte/YhcCmT4/MTbj5KVs4cf0HcNeSK1g1qaffydyrs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L9DWu9l1CL+gxEuelOq1x/f8fBM+wQtWWB3qw0yxYDl0cYXk8PgVXTDxZssKBzZHF
	 PDtTgXiWHOlxBkFESe8dxWBGRfUyi0cVitH5F98nUU0r26Zry+AVTKl7vLxEisx5wn
	 jbi6UrOwnVKkkA7S7LmvJukD8+6qJ2tiZr+KQTTgdeSHpTF5wKdAJ1K5JsBzpdNUeb
	 5epYgwtNA4PO4TrqJ7coDAhYCOr/uhNKWoUMmFvocsJfPNiqAB1zIexM3GcYHbynUP
	 WgDjwe7I8Eno1YCGUli9kI3+JNMAYydTc3XlddgK6gTg8XmFtn6ILf9lBZ2pEH20Ln
	 WR4i4CAk+l0rg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 11/13] ARM: sa1100: address missing prototype warnings
Date: Tue, 16 May 2023 17:31:07 +0200
Message-Id: <20230516153109.514251-12-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There are three warnings for mach-sa1100 when building with W=1:

arch/arm/common/sa1111.c:699:1: error: no previous prototype for 'sa1111_configure_smc' [-Werror=missing-prototypes]
  699 | sa1111_configure_smc(struct sa1111 *sachip, int sdram, unsigned int drac,
      | ^~~~~~~~~~~~~~~~~~~~
arch/arm/mach-sa1100/assabet.c:718:13: error: no previous prototype for 'assabet_init_irq' [-Werror=missing-prototypes]
  718 | void __init assabet_init_irq(void)
      |             ^~~~~~~~~~~~~~~~
arch/arm/mach-sa1100/pm.c:126:12: error: no previous prototype for 'sa11x0_pm_init' [-Werror=missing-prototypes]
  126 | int __init sa11x0_pm_init(void)
      |            ^~~~~~~~~~~~~~

The first two are only used locally and can be 'static', while
the last one needs to include the right header.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/common/sa1111.c       | 2 +-
 arch/arm/mach-sa1100/assabet.c | 2 +-
 arch/arm/mach-sa1100/pm.c      | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index aad6ba236f0f..77c83ba81715 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -695,7 +695,7 @@ static u32 sa1111_dma_mask[] = {
 /*
  * Configure the SA1111 shared memory controller.
  */
-void
+static void
 sa1111_configure_smc(struct sa1111 *sachip, int sdram, unsigned int drac,
 		     unsigned int cas_latency)
 {
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 0c32b08a3a9c..08dcdd8ceb6d 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -715,7 +715,7 @@ static void __init assabet_map_io(void)
 	sa1100_register_uart(2, 3);
 }
 
-void __init assabet_init_irq(void)
+static void __init assabet_init_irq(void)
 {
 	u32 def_val;
 
diff --git a/arch/arm/mach-sa1100/pm.c b/arch/arm/mach-sa1100/pm.c
index cd900a7b5248..c94ebe1c9091 100644
--- a/arch/arm/mach-sa1100/pm.c
+++ b/arch/arm/mach-sa1100/pm.c
@@ -37,6 +37,8 @@
 #include <asm/suspend.h>
 #include <asm/mach/time.h>
 
+#include "generic.h"
+
 extern int sa1100_finish_suspend(unsigned long);
 
 #define SAVE(x)		sleep_save[SLEEP_SAVE_##x] = x
-- 
2.39.2

