Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F5AC77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F014C4339C; Tue, 16 May 2023 15:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E920C4339B;
	Tue, 16 May 2023 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251147;
	bh=dvQdqL3zWm7vO4AUHY3E39PwDsm+dTszcVCJpk1xl0g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LLy1+d+/ZCw6Wb4qr5DYAXio7HcbcAKuFJxjrWjq7tmqqOy9SdHdHp0evNa02cqjd
	 WGOgkub2eKH9G8sWfcYvsLCLqejYnItvRYzgP0jpk+D1QijzHW1X7cJHNJF43tRq0V
	 QZ1MdGAE4ryPpIKvCe57NOmzILA9xzp6R5NA8ROPOfASOKgmZRBHBXHbYnngDmV6MZ
	 ub/526cr9ReXuNlkxkjh8EUaV/zL60LKlbQjiN30juWlUtlO65+PII73MHoC8c1SbK
	 XykoHq4KxQdKkw1bENapWueD8wdcB+oNVBX8Hv/EN0vOLG9ceY3BH5ZCefmu5J/Ryn
	 i3xnd7ykEn6kA==
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
Subject: [PATCH 08/13] ARM: omap2: fix missing tick_broadcast() prototype
Date: Tue, 16 May 2023 17:31:04 +0200
Message-Id: <20230516153109.514251-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

omap2 contains a hack to define tick_broadcast() on non-SMP
configurations in place of the normal SMP definition. This one
causes a warning because of a missing prototype:

arch/arm/mach-omap2/board-generic.c:44:6: error: no previous prototype for 'tick_broadcast'

Make sure to always include the header with the declaration.

Fixes: d86ad463d670 ("ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap2/board-generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
index 853409b341a3..7aa41841edd4 100644
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -13,6 +13,7 @@
 #include <linux/of_platform.h>
 #include <linux/irqdomain.h>
 #include <linux/clocksource.h>
+#include <linux/clockchips.h>
 
 #include <asm/setup.h>
 #include <asm/mach/arch.h>
-- 
2.39.2

