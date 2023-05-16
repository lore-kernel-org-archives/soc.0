Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E82C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A480C433EF; Tue, 16 May 2023 15:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224C9C433D2;
	Tue, 16 May 2023 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251109;
	bh=BIagkEY4mLvGqj4tPqjkB1cb/gqev1UThavPZEGdG5M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hGyYeFqlE/uEmWvEwVxHREbGHmJvhAvqdVTAkN1iXDNQRc5fpQRVIFrMHuNw+27Dp
	 vmTVi3Ldc35LGpEStLxFP/6zP8YV+sQdd3NOgRs6j3Mm45+rLnBGdE2CIGpoJoOjRb
	 TuxluRCdiplaJCG1GaKE27GXjJxP+l5nROu+qXP0xFBXP2USW89qRMbk19lJFm24yh
	 BAhAQ/3d2DxsxTtUya+ndT98c62mUeJP5AugjbAWfLoVdMc8sHgmxDnUzF52b855BU
	 qpYgomV0TLXapsX2O9OM4VL6lYzqnw/+3NSb71xu3zhdFtNsLCngDN5FAZT4RuZwAK
	 E+PoHTJXfLsxg==
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
Subject: [PATCH 03/13] ARM: highbank: add missing include
Date: Tue, 16 May 2023 17:30:59 +0200
Message-Id: <20230516153109.514251-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

highbank_pm_init() is declared in core.h this is not included in the
file that defines it.

arch/arm/mach-highbank/pm.c:43:13: error: no previous prototype for 'highbank_pm_init'

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-highbank/pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-highbank/pm.c b/arch/arm/mach-highbank/pm.c
index 561941baeda9..3fdbdb83113b 100644
--- a/arch/arm/mach-highbank/pm.c
+++ b/arch/arm/mach-highbank/pm.c
@@ -12,6 +12,8 @@
 
 #include <uapi/linux/psci.h>
 
+#include "core.h"
+
 #define HIGHBANK_SUSPEND_PARAM \
 	((0 << PSCI_0_2_POWER_STATE_ID_SHIFT) | \
 	 (1 << PSCI_0_2_POWER_STATE_AFFL_SHIFT) | \
-- 
2.39.2

