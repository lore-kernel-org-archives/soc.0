Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2011C77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7D18C4339C; Tue, 16 May 2023 15:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8001C433EF;
	Tue, 16 May 2023 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251139;
	bh=dDRQbj/KbMQidLzt89wdLCnqDQHFvR8G70nf6jL+1Jo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q9aWL79Ak+LPTHCFymDaK/bTJEoBzpQ0TDN2miU15QI6phT666vjvqi8ICCUY3oS/
	 NMl7bOlEwi7SJIX8/rOgfjl8cZE/X4pbqIqqsaWNgWT7yMU4MO5rlHIwCKIg7qjLgY
	 5SBUGfW/4uAScd7GyBlrwutWporaGKZsnYZkwuWXU9hrUF3B7sHW0HfMxMKCx/pSTa
	 QlJpi91NxL0Ifip2A0KnQXDLBAlzJyRJQK4+MTfaRPm3mnB0yalBAQ08R6Lj7BenQG
	 vLrGvTlVtznA5Tdi3Rbaw/I8Xk8McclPS3975cBayCcQ6gbjECgH3NwbuydwMtXynP
	 dfoheysl/A6kQ==
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
Subject: [PATCH 07/13] ARM: omap1: add missing include
Date: Tue, 16 May 2023 17:31:03 +0200
Message-Id: <20230516153109.514251-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The omap_serial_wakeup_init() declaration is not visible where it is
defined, so make sure "common.h" is included here, avoiding:

arch/arm/mach-omap1/serial.c:221:12: error: no previous prototype for 'omap_serial_wakeup_init' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/serial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index 96f59110d649..f25b94c86aec 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -19,6 +19,7 @@
 
 #include <asm/mach-types.h>
 
+#include "common.h"
 #include "serial.h"
 #include "mux.h"
 #include "pm.h"
-- 
2.39.2

