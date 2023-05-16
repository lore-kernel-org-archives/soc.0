Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2E2C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B031BC4339E; Tue, 16 May 2023 15:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0F7C433A1;
	Tue, 16 May 2023 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251101;
	bh=5Ob/x9sOKHvBpaTIVr8ONLXcGD9gziQ+4a3wROsf1bo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHuGfAQPh5Mp3dhNT5Mx+S1PqR+LqyyBSG/XwwaAU1dg7uPcXFP4wrgEgfb7+3tRD
	 Al1R8pbUX8n0AIA49EifWICbGjD4TVnacdED78FsO21z07NX7lplDIex3HpB7DoEIG
	 nzs5RpgzCNbDrY8qXkqgExO47LYddcAEG4uMK7z4yeiPvpjU7bnm/VidZMuDjb8tR4
	 GE/AwNA6Yg/k8Qhx9L+/904Q7sbtnmXCYiJ3UVtetXOiStDf9fwVsBgKP3Z4lW5UOI
	 VEsps2PwUSvko3ALHGI5qUe/VZ8TuR1rtWWwwGzFg+fOBYsdZK6cyIpeHhRTuHJ4tp
	 R2E6+v/AzUnHw==
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
Subject: [PATCH 02/13] ARM: ep93xx: fix missing-prototype warnings
Date: Tue, 16 May 2023 17:30:58 +0200
Message-Id: <20230516153109.514251-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

ep93xx_clocksource_read() is only called from the file it is declared in,
while ep93xx_timer_init() is declared in a header that is not included here.

arch/arm/mach-ep93xx/timer-ep93xx.c:120:13: error: no previous prototype for 'ep93xx_timer_init'
arch/arm/mach-ep93xx/timer-ep93xx.c:63:5: error: no previous prototype for 'ep93xx_clocksource_read'

Fixes: 000bc17817bf ("ARM: ep93xx: switch to GENERIC_CLOCKEVENTS")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-ep93xx/timer-ep93xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-ep93xx/timer-ep93xx.c b/arch/arm/mach-ep93xx/timer-ep93xx.c
index dd4b164d1831..a9efa7bc2fa1 100644
--- a/arch/arm/mach-ep93xx/timer-ep93xx.c
+++ b/arch/arm/mach-ep93xx/timer-ep93xx.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <asm/mach/time.h>
 #include "soc.h"
+#include "platform.h"
 
 /*************************************************************************
  * Timer handling for EP93xx
@@ -60,7 +61,7 @@ static u64 notrace ep93xx_read_sched_clock(void)
 	return ret;
 }
 
-u64 ep93xx_clocksource_read(struct clocksource *c)
+static u64 ep93xx_clocksource_read(struct clocksource *c)
 {
 	u64 ret;
 
-- 
2.39.2

