Return-Path: <SRS0=wIPo=BG=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31571C7EE2A
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 05:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB50AC4339B; Wed, 17 May 2023 05:58:44 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 8436BC433D2;
	Wed, 17 May 2023 05:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8436BC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 19262813D;
	Wed, 17 May 2023 05:58:37 +0000 (UTC)
Date: Wed, 17 May 2023 08:58:35 +0300
From: Tony Lindgren <tony@atomide.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
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
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 07/13] ARM: omap1: add missing include
Message-ID: <20230517055835.GK14287@atomide.com>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-8-arnd@kernel.org>
 <20230516231821.GC271152@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516231821.GC271152@darkstar.musicnaut.iki.fi>

* Aaro Koskinen <aaro.koskinen@iki.fi> [230516 23:18]:
> On Tue, May 16, 2023 at 05:31:03PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The omap_serial_wakeup_init() declaration is not visible where it is
> > defined, so make sure "common.h" is included here, avoiding:
> > 
> > arch/arm/mach-omap1/serial.c:221:12: error: no previous prototype for 'omap_serial_wakeup_init' [-Werror=missing-prototypes]
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Acked-by: Tony Lindgren <tony@atomide.com>
