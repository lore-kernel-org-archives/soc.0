Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484D6C77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13921C433EF; Tue, 16 May 2023 15:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0DEC433A4;
	Tue, 16 May 2023 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251094;
	bh=jSt93p6QqRHSfhQI7J2hfgJYmouz2AQLVyfURXXqX8s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AwomvbT8Pm+fhyGJwGnUOYhunar1+rxNklkbAupsLWDpLmLjStG8P95r0LW0TZ7Sn
	 rUt0ea8SiWMVTZAiu4cMYZbbqvqcv2e5DTPOk7p1oIHvJ+Ao0RHe6GVdZ5zJRnAPVd
	 qy/Nqrez73CiiRfbe0msHl+n84nCTm1LvattabEfx9Ed1CbYinH+MqmnQ4vCIsy8bD
	 HpHPXOv+AbSGsNFushKq1hOP4kIPFJLROWGA9jOdBsyH0QKtmHcFeRb2CsRWAEBNXZ
	 gM8iD9hn1D5PUXY3XhTLS9pkXmC1Abn+RFpluaep373/1+vT3WOghrCF2mY9s3EJiv
	 NZdHPN/tuvyTQ==
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
Subject: [PATCH 01/13] ARM: davinci: fix davinci_cpufreq_init() declaration
Date: Tue, 16 May 2023 17:30:57 +0200
Message-Id: <20230516153109.514251-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The davinci_cpufreq_init() declaration is only seen by its caller
but not the definition:

drivers/cpufreq/davinci-cpufreq.c:153:12: error: no previous prototype for 'davinci_cpufreq_init'

Move it into the platform_data header that is already used an
interface between the two places.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-davinci/common.c                | 1 +
 arch/arm/mach-davinci/common.h                | 6 ------
 include/linux/platform_data/davinci-cpufreq.h | 6 ++++++
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-davinci/common.c b/arch/arm/mach-davinci/common.c
index c1ce6b2a8d48..7bc7018688de 100644
--- a/arch/arm/mach-davinci/common.c
+++ b/arch/arm/mach-davinci/common.c
@@ -11,6 +11,7 @@
 #include <linux/etherdevice.h>
 #include <linux/davinci_emac.h>
 #include <linux/dma-mapping.h>
+#include <linux/platform_data/davinci-cpufreq.h>
 
 #include <asm/tlb.h>
 #include <asm/mach/map.h>
diff --git a/arch/arm/mach-davinci/common.h b/arch/arm/mach-davinci/common.h
index b2a96cdf88da..010ba1df27b3 100644
--- a/arch/arm/mach-davinci/common.h
+++ b/arch/arm/mach-davinci/common.h
@@ -55,12 +55,6 @@ extern void davinci_common_init(const struct davinci_soc_info *soc_info);
 extern void davinci_init_ide(void);
 void davinci_init_late(void);
 
-#ifdef CONFIG_CPU_FREQ
-int davinci_cpufreq_init(void);
-#else
-static inline int davinci_cpufreq_init(void) { return 0; }
-#endif
-
 #ifdef CONFIG_SUSPEND
 int davinci_pm_init(void);
 #else
diff --git a/include/linux/platform_data/davinci-cpufreq.h b/include/linux/platform_data/davinci-cpufreq.h
index bc208c64e3d7..1ef91c36f609 100644
--- a/include/linux/platform_data/davinci-cpufreq.h
+++ b/include/linux/platform_data/davinci-cpufreq.h
@@ -16,4 +16,10 @@ struct davinci_cpufreq_config {
 	int (*init)(void);
 };
 
+#ifdef CONFIG_CPU_FREQ
+int davinci_cpufreq_init(void);
+#else
+static inline int davinci_cpufreq_init(void) { return 0; }
+#endif
+
 #endif /* _MACH_DAVINCI_CPUFREQ_H */
-- 
2.39.2

