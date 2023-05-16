Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC375C7EE25
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D4DFC4339B; Tue, 16 May 2023 15:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195B7C433EF;
	Tue, 16 May 2023 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251178;
	bh=MGpebGFHpc0L0zdL2phujQLcz6KDg8DvNfOSVA71ez0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzTKyvbDHAlfcLnPPaRMDeJ1hnPyGJz8z1y3Gpyjl65t0vC1nlvdBnhxOXYF6fYDU
	 PjuJMTzXldiYVj/uRaBM9Y0DUCTZYqnFQsVOPvMlHKTmncVBpCHyCJNspeS9L7jliO
	 bF6kEpzE3EpNr0Qs6XPI4CeAFlRn7ccL84622jT4SgrRkDfJvhE3cuyd1j/y8EPSuZ
	 jfJ62SJK4gWwCtg/RGzS4GsVBBybpK+F0r3PwnHhumCDqzuy0Lpi9umqPcaNZIwAp/
	 rXk2HpVteoZePx2HWX3hNEtHwBhR3K/2jAIYze7Mi6D/lRW4swaCprb+DoU5D4284p
	 paJw0hRnIBfLw==
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
Subject: [PATCH 12/13] ARM: spear: include "pl080.h" for pl080_get_signal() prototype
Date: Tue, 16 May 2023 17:31:08 +0200
Message-Id: <20230516153109.514251-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

pl080_get_signal() and pl080_put_signal() are declared in pl080.h
and defined in pl080.c, but this file is missing an include
of the header:

arch/arm/mach-spear/pl080.c:27:5: error: no previous prototype for 'pl080_get_signal'
arch/arm/mach-spear/pl080.c:62:6: error: no previous prototype for 'pl080_put_signal'

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-spear/pl080.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-spear/pl080.c b/arch/arm/mach-spear/pl080.c
index d6b8627d2544..47243a8153d0 100644
--- a/arch/arm/mach-spear/pl080.c
+++ b/arch/arm/mach-spear/pl080.c
@@ -16,6 +16,7 @@
 #include <linux/spinlock_types.h>
 #include "spear.h"
 #include "misc_regs.h"
+#include "pl080.h"
 
 static spinlock_t lock = __SPIN_LOCK_UNLOCKED(x);
 
-- 
2.39.2

