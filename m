Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E080BC77B7E
	for <soc@archiver.kernel.org>; Sun, 28 May 2023 13:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85B0EC433A0; Sun, 28 May 2023 13:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD66EC433D2;
	Sun, 28 May 2023 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685282165;
	bh=OoZPC1V1hYUWEPl5vfYB+Zu55Xna3a+gVyr1lVOG01E=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=wgWVmXL9JVkXhkERB8AHu7gZIz4/SC6Cd9GvHnQBtdwTxTo8laghhoiL5iVFDHY3g
	 YIWmU8jbia/wnIJN4Z5vSid1X9Z8prPA2B14S35Q3BhJAdTylyAx9hLp4qyOlWKQj6
	 quA1BrNAkOX95gV/9QGf0zwSJkxxV8GXrEQsQLEo=
Date: Sun, 28 May 2023 12:46:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
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
	Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>,
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
	Alan Stern <stern@rowland.harvard.edu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 10/13] ARM: pxa: fix missing-prototypes warnings
Message-ID: <2023052815-skinning-mantis-2cee@gregkh>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-11-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516153109.514251-11-arnd@kernel.org>

On Tue, May 16, 2023 at 05:31:06PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The PXA platform has a number of configurations that end up with
> a warning like these when building with W=1:
> 
> drivers/hwmon/max1111.c:83:5: error: no previous prototype for 'max1111_read_channel' [-Werror=missing-prototypes]
> arch/arm/mach-pxa/reset.c:86:6: error: no previous prototype for 'pxa_restart' [-Werror=missing-prototypes]
> arch/arm/mach-pxa/mfp-pxa2xx.c:254:5: error: no previous prototype for 'keypad_set_wake' [-Werror=missing-prototypes]
> drivers/clk/pxa/clk-pxa25x.c:70:14: error: no previous prototype for 'pxa25x_get_clk_frequency_khz' [-Werror=missing-prototypes]
> drivers/clk/pxa/clk-pxa25x.c:325:12: error: no previous prototype for 'pxa25x_clocks_init' [-Werror=missing-prototypes]
> drivers/clk/pxa/clk-pxa27x.c:74:14: error: no previous prototype for 'pxa27x_get_clk_frequency_khz' [-Werror=missing-prototypes]
> drivers/clk/pxa/clk-pxa27x.c:102:6: error: no previous prototype for 'pxa27x_is_ppll_disabled' [-Werror=missing-prototypes]
> drivers/clk/pxa/clk-pxa27x.c:470:12: error: no previous prototype for 'pxa27x_clocks_init' [-Werror=missing-prototypes]
> arch/arm/mach-pxa/pxa27x.c:44:6: error: no previous prototype for 'pxa27x_clear_otgph' [-Werror=missing-prototypes]
> arch/arm/mach-pxa/pxa27x.c:58:6: error: no previous prototype for 'pxa27x_configure_ac97reset' [-Werror=missing-prototypes]
> arch/arm/mach-pxa/spitz_pm.c:170:15: error: no previous prototype for 'spitzpm_read_devdata' [-Werror=missing-prototypes]
> 
> The problem is that there is a declaration for each of these, but
> it's only seen by the caller and not the callee. Moving these
> into appropriate header files ensures that both use the same
> calling conventions and it avoids the warnings.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
