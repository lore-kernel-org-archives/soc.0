Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD91C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77FCBC433D2; Tue, 16 May 2023 15:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34720C4339C;
	Tue, 16 May 2023 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251086;
	bh=Vfoj9qLC8uTcqD30uVHhZSsFpMNJyRQxCS1GpENA7tI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=iWTpR9fdns6y48CrdjalwG8iLAI+czsIV9tJIW0R4dZ+QSW2t79xjS22khc6yxeHz
	 3fhOn7CV+YSgmQzd6RW1oCtk7pSyM0hXcB8xAhQP8SHAvVhJAWyErcQX7H+UjbsJ/r
	 CaTbf46h230VEiVnYC12UDmiZtfm9HFfLgm066XHGmG+sQWV4lPh9wxw9sgXZ8/Wh/
	 LhWphsLJ2DP7Wv/fhfpa7EqE8D2ztVswbojcpG9+AmhutBXcatFnGfobV39chdUeui
	 ZRoLS9EUBwxTthyh3eZLT9L/8eLJiM9eD9LRrA8iHCyywrtJkBpmmUZ/fFmA8yIm2F
	 0aa+YBuYJzk5Q==
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
Subject: [PATCH 00/13] ARM: SoC: address -Wmissing-prototype warnings
Date: Tue, 16 May 2023 17:30:56 +0200
Message-Id: <20230516153109.514251-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This is part of a longer series of patches to address all -Wmissing-prototype
warnings. I would like to take these through the soc tree directly, but
if anyone wants to first apply a patch to their platform specific tree,
I'll drop that one. See the Link below for more background.

     Arnd

Link: https://people.kernel.org/arnd/missing-prototype-warnings-in-the-kernel

Arnd Bergmann (13):
  ARM: davinci: fix davinci_cpufreq_init() declaration
  ARM: ep93xx: fix missing-prototype warnings
  ARM: highbank: add missing include
  ARM: imx: add missing include
  ARM: imx: remove unused mx25_revision()
  ARM: lpc32xx: add missing include
  ARM: omap1: add missing include
  ARM: omap2: fix missing tick_broadcast() prototype
  ARM: orion5x: fix d2net gpio initialization
  ARM: pxa: fix missing-prototypes warnings
  ARM: sa1100: address missing prototype warnings
  ARM: spear: include "pl080.h" for pl080_get_signal() prototype
  ARM: versatile: mark mmc_status() static

 arch/arm/common/sa1111.c                      |  2 +-
 arch/arm/mach-davinci/common.c                |  1 +
 arch/arm/mach-davinci/common.h                |  6 ---
 arch/arm/mach-ep93xx/timer-ep93xx.c           |  3 +-
 arch/arm/mach-highbank/pm.c                   |  2 +
 arch/arm/mach-imx/Makefile                    |  2 +-
 arch/arm/mach-imx/cpu-imx25.c                 | 50 -------------------
 arch/arm/mach-imx/pm-imx25.c                  |  1 +
 arch/arm/mach-lpc32xx/serial.c                |  1 +
 arch/arm/mach-omap1/serial.c                  |  1 +
 arch/arm/mach-omap2/board-generic.c           |  1 +
 arch/arm/mach-orion5x/board-dt.c              |  3 ++
 arch/arm/mach-orion5x/common.h                |  6 +++
 arch/arm/mach-pxa/generic.h                   | 15 ------
 arch/arm/mach-pxa/mfp-pxa2xx.c                |  1 +
 arch/arm/mach-pxa/pxa25x.c                    |  1 +
 arch/arm/mach-pxa/pxa27x.c                    |  3 ++
 arch/arm/mach-pxa/reset.c                     |  1 +
 arch/arm/mach-pxa/spitz_pm.c                  |  2 +-
 arch/arm/mach-sa1100/assabet.c                |  2 +-
 arch/arm/mach-sa1100/pm.c                     |  2 +
 arch/arm/mach-spear/pl080.c                   |  1 +
 arch/arm/mach-versatile/versatile.c           |  2 +-
 drivers/clk/pxa/clk-pxa25x.c                  |  2 +
 drivers/clk/pxa/clk-pxa27x.c                  |  3 +-
 drivers/hwmon/max1111.c                       |  1 +
 drivers/usb/gadget/udc/pxa27x_udc.c           |  6 ---
 drivers/usb/host/ohci-pxa27x.c                |  7 +--
 include/linux/platform_data/asoc-pxa.h        |  1 +
 include/linux/platform_data/davinci-cpufreq.h |  6 +++
 include/linux/platform_data/pxa2xx_udc.h      |  6 +++
 include/linux/soc/pxa/smemc.h                 | 16 ++++++
 sound/arm/pxa2xx-ac97-lib.c                   |  2 -
 33 files changed, 67 insertions(+), 92 deletions(-)
 delete mode 100644 arch/arm/mach-imx/cpu-imx25.c

-- 
2.39.2

Cc: Russell King <linux@armlinux.org.uk>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: soc@kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-usb@vger.kernel.org
