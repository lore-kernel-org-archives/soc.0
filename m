Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEC8C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E511C433D2; Tue, 16 May 2023 15:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB97C4339B;
	Tue, 16 May 2023 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251117;
	bh=w4lHecQFJ3ZINP3Hc7+YhHQezZE2AOKlOI1bwVTKIBg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQDSyMJnvfCmcikGVq/JcSp3iv74yOgo5tXTfilU+bVA8a2P+ZY9hu6ZzoD6eHEbn
	 ONnZK6g+LjqmQVemTraCdw+lXaaQHL1YcDe8Vm9IVr4ALIXXMdK7y1KYcR68lSsRtx
	 vCZ3emzEsNpJvz6y2V/Vo7j3lq37rOlbqRSuS0sirTuBtycZaO7ssZixsCQqe9MOc3
	 g1cxzYhfbd84IrhpJIYucYcWAzT++8R2Snq/KU6vDUNpkbket/PCkfVhIM7FkAntqd
	 L9yt/v8nAVk8exjrfYckjxLnnNj7e9+uWs7DEHpeoTGSjRvpN3pD+dGmQUf4OMFw6e
	 DZFR9KRdd5PKA==
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
Subject: [PATCH 04/13] ARM: imx: add missing include
Date: Tue, 16 May 2023 17:31:00 +0200
Message-Id: <20230516153109.514251-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

imx25_pm_init() is declared in common.h but this is not included
before its definition:

arch/arm/mach-imx/pm-imx25.c:31:13: error: no previous prototype for 'imx25_pm_init'

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-imx/pm-imx25.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/pm-imx25.c b/arch/arm/mach-imx/pm-imx25.c
index f253e5019465..0c574e8607fd 100644
--- a/arch/arm/mach-imx/pm-imx25.c
+++ b/arch/arm/mach-imx/pm-imx25.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/suspend.h>
 #include <linux/io.h>
+#include "common.h"
 
 static int imx25_suspend_enter(suspend_state_t state)
 {
-- 
2.39.2

