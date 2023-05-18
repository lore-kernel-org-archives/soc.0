Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3481C77B73
	for <soc@archiver.kernel.org>; Thu, 18 May 2023 20:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89FCAC4339B; Thu, 18 May 2023 20:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62062C433EF;
	Thu, 18 May 2023 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684440654;
	bh=8ADVUlv2ISWPlpxPmf/ySUg5Jb+Bc1bMYOm2326rqxY=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=O7MAkrBessqkZ7/t1VwHglElnZ/75v2/qwNN/Q2RYwXAvBv32J/MVlhEQhKHg3YXe
	 WvVkBvySbmDqoFI0OiuMI8cWqVKCapy/Wz6LtMeBR7s13Sj0RrgMOjY0GGKwv/Kyr6
	 IWd+yYP4Ip7bNorNaGpFrprAR9itldhPNfWaLwzqBaCdtEUE8GZnxqICgdAV5yF+BD
	 fch/9qkiBEXJFR8yrI7fPx4QH/kLoyLYzaRcpmUP2OASsEckcPdzOLHD/mfEk1hZIY
	 mm6KBC/FR+klYbeqGLe98JlB96Lrc9TkpGmX4C0X9YMBfAV0vk8e9Zoj0r/yJnV7Jm
	 yg6XU/j1UKMMQ==
Message-ID: <568f74a4667711a8b7c852d88f6f5669.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230516153109.514251-11-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org> <20230516153109.514251-11-arnd@kernel.org>
Subject: Re: [PATCH 10/13] ARM: pxa: fix missing-prototypes warnings
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel
 .org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, soc@kernel.org
Date: Thu, 18 May 2023 13:10:52 -0700
User-Agent: alot/0.10

Quoting Arnd Bergmann (2023-05-16 08:31:06)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The PXA platform has a number of configurations that end up with
> a warning like these when building with W=3D1:
>=20
> drivers/hwmon/max1111.c:83:5: error: no previous prototype for 'max1111_r=
ead_channel' [-Werror=3Dmissing-prototypes]
> arch/arm/mach-pxa/reset.c:86:6: error: no previous prototype for 'pxa_res=
tart' [-Werror=3Dmissing-prototypes]
> arch/arm/mach-pxa/mfp-pxa2xx.c:254:5: error: no previous prototype for 'k=
eypad_set_wake' [-Werror=3Dmissing-prototypes]
> drivers/clk/pxa/clk-pxa25x.c:70:14: error: no previous prototype for 'pxa=
25x_get_clk_frequency_khz' [-Werror=3Dmissing-prototypes]
> drivers/clk/pxa/clk-pxa25x.c:325:12: error: no previous prototype for 'px=
a25x_clocks_init' [-Werror=3Dmissing-prototypes]
> drivers/clk/pxa/clk-pxa27x.c:74:14: error: no previous prototype for 'pxa=
27x_get_clk_frequency_khz' [-Werror=3Dmissing-prototypes]
> drivers/clk/pxa/clk-pxa27x.c:102:6: error: no previous prototype for 'pxa=
27x_is_ppll_disabled' [-Werror=3Dmissing-prototypes]
> drivers/clk/pxa/clk-pxa27x.c:470:12: error: no previous prototype for 'px=
a27x_clocks_init' [-Werror=3Dmissing-prototypes]
> arch/arm/mach-pxa/pxa27x.c:44:6: error: no previous prototype for 'pxa27x=
_clear_otgph' [-Werror=3Dmissing-prototypes]
> arch/arm/mach-pxa/pxa27x.c:58:6: error: no previous prototype for 'pxa27x=
_configure_ac97reset' [-Werror=3Dmissing-prototypes]
> arch/arm/mach-pxa/spitz_pm.c:170:15: error: no previous prototype for 'sp=
itzpm_read_devdata' [-Werror=3Dmissing-prototypes]
>=20
> The problem is that there is a declaration for each of these, but
> it's only seen by the caller and not the callee. Moving these
> into appropriate header files ensures that both use the same
> calling conventions and it avoids the warnings.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
