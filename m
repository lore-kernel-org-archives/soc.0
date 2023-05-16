Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69716C77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BBC1C433D2; Tue, 16 May 2023 15:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136AAC4339B;
	Tue, 16 May 2023 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251132;
	bh=Lif0fPFnMA+RVd7k+dq/VZD68IuDTY92OD9g1tXQ54A=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ASVc7pRCEvgwvGP60q+d+Xrx1QFUzr9N2Pm9i7uUwMw7hudmAR8i+hVaZF3Jzw1nU
	 rJOg+dT5ocHqbf4B4khzmAlpOEyIMB7EIk63umwG8/A27VTgLvNN0HEocz6MKqvSY6
	 oE300R8yaflSxMPW/1GiTnEve0Y8tKXbsx6GbY3eoeSnv2GUq0YQ+q4D1rcoXr9YhM
	 HDZPAOgWmnRZ1ktr2Bxx3wK5F8Md3HJAFt1MN/ZmVOphPVsHWeIQ77eP/3gSh9ZD/M
	 jcU4v5S45zBUkKu7CkBG0FMOo7zxSes0BcOX6UCEG/WrdoE/VSDKwZjozIVjp8YgKE
	 lghSKYQVriOxw==
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
Subject: [PATCH 06/13] ARM: lpc32xx: add missing include
Date: Tue, 16 May 2023 17:31:02 +0200
Message-Id: <20230516153109.514251-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

lpc32xx_loopback_set() is defined in linux/soc/nxp/lpc32xx-misc.h but
this is not included before the function definition.

arch/arm/mach-lpc32xx/serial.c:63:6: error: no previous prototype for 'lpc32xx_loopback_set'

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-lpc32xx/serial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-lpc32xx/serial.c b/arch/arm/mach-lpc32xx/serial.c
index 3e765c4bf986..3b1203db81b2 100644
--- a/arch/arm/mach-lpc32xx/serial.c
+++ b/arch/arm/mach-lpc32xx/serial.c
@@ -15,6 +15,7 @@
 #include <linux/serial_8250.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/soc/nxp/lpc32xx-misc.h>
 
 #include "lpc32xx.h"
 #include "common.h"
-- 
2.39.2

