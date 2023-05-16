Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A22C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FBA8C433D2; Tue, 16 May 2023 15:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A2BC433EF;
	Tue, 16 May 2023 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251155;
	bh=DrqAX+1UhPNTYpc/1d0D3nvDlt1nvYJqyMlOg0NqDNY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tn4bT2n56+ohbh8dxl7/RdZwx7SCsqHB2ZcSWJQXTBOVcKLmRxc9SrHDhHSq/drKi
	 kglo46WZ2JIwmfJZ+JDYZUAcqYYGUU0M8ANaekCIepNN2vwjHPtNu+gPLEJMYriEDR
	 kcJOwZrxUedGV3ZTczsqETUqFu1bTlnXsJfqxlRyonKUJKpWdYKCZmioM81KkZ/9g5
	 esLrBbkZzPkF6KpMFtGdkcup2dvd7XiwGpuQo1YvBBwaxKFzW+E+HxR08wyfmH1Gj9
	 qk3VkeUmHTpr9/isE/FwAePtr2YOI/ghZuGBjJDt9K79f+RWKiZdmWH5lwssqF/jQO
	 r9Uz3T7rDMN4A==
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
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 09/13] ARM: orion5x: fix d2net gpio initialization
Date: Tue, 16 May 2023 17:31:05 +0200
Message-Id: <20230516153109.514251-10-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The DT version of this board has a custom file with the gpio
device. However, it does nothing because the d2net_init()
has no caller or prototype:

arch/arm/mach-orion5x/board-d2net.c:101:13: error: no previous prototype for 'd2net_init'

Call it from the board-dt file as intended.

Fixes: 94b0bd366e36 ("ARM: orion5x: convert d2net to Device Tree")
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-orion5x/board-dt.c | 3 +++
 arch/arm/mach-orion5x/common.h   | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/mach-orion5x/board-dt.c b/arch/arm/mach-orion5x/board-dt.c
index e3736ffc8347..be47492c6640 100644
--- a/arch/arm/mach-orion5x/board-dt.c
+++ b/arch/arm/mach-orion5x/board-dt.c
@@ -60,6 +60,9 @@ static void __init orion5x_dt_init(void)
 	if (of_machine_is_compatible("maxtor,shared-storage-2"))
 		mss2_init();
 
+	if (of_machine_is_compatible("lacie,d2-network"))
+		d2net_init();
+
 	of_platform_default_populate(NULL, orion5x_auxdata_lookup, NULL);
 }
 
diff --git a/arch/arm/mach-orion5x/common.h b/arch/arm/mach-orion5x/common.h
index f2e0577bf50f..8df70e23aa82 100644
--- a/arch/arm/mach-orion5x/common.h
+++ b/arch/arm/mach-orion5x/common.h
@@ -73,6 +73,12 @@ extern void mss2_init(void);
 static inline void mss2_init(void) {}
 #endif
 
+#ifdef CONFIG_MACH_D2NET_DT
+void d2net_init(void);
+#else
+static inline void d2net_init(void) {}
+#endif
+
 /*****************************************************************************
  * Helpers to access Orion registers
  ****************************************************************************/
-- 
2.39.2

