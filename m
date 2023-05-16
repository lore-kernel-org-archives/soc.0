Return-Path: <SRS0=1FlY=BF=iki.fi=aaro.koskinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57CBC77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 23:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70AE1C4339B; Tue, 16 May 2023 23:21:00 +0000 (UTC)
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C85AC433D2;
	Tue, 16 May 2023 23:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C85AC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi [85.76.146.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QLXKQ3PMZz49QNk;
	Wed, 17 May 2023 02:20:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1684279248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=seOEz2BUuUJDwHDfga6nqBUNG6PNWEy1dGh4SRXgLTQ=;
	b=vubJ+vh+AAqSjg4T3PF2bHeiGx7aqjnyM2rzkh2ewCLkCB1BOHqeLRqJ3Dv7z3zpXo4GXi
	edy/OAIm2DWs0Wv+MrcCM2kBZfQZ6K3x/WEJvlTQm8D7tfgaYljPeirI2ASfM+guSBCcZ2
	eBygnoDXOugUMmuGyYY66XZSF5Ny29fxQ0Dc7w2OeS5zPg05fG7eX+4tcf6vU+kGTQCcZ0
	lss16cnq24vT/N+pGaITw84JBy4a0/kIuvj2A3KxxDhV7j1zvZ651t/U0D545Z63h1CrBb
	OBPcfjz5TeOxrKhjVb91NreyZ5dvTkjyyRnyPJs29+FIRGJnpg7ypjyW37nmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1684279248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=seOEz2BUuUJDwHDfga6nqBUNG6PNWEy1dGh4SRXgLTQ=;
	b=VcTEXgPCls/wG1otMxjZiq+IuzmD2PxI23rQm+6/lPXDJHzUJDFPNiV1a3n6IBHB+R1hpD
	8Dg20tW+b2wcUNrk/B23U/InpLszKeYowgBADlCaIQxM8ZqEoiyCydtrMvH1WkJJi9HlmC
	8qZstW2BGRkdxZrP+MigdThMdi/rcsILeZn++Kg15JSfC3UrE3PWOlHDhHVmlgZH/TR8kT
	cxKFxvKfm2SBxntB/VutoWtYpzPZ/ICz0WfG0x5F5PY6YoprVW50exfz/BKOhh+LP7S2bf
	WcrWSAOWnrnchwsmGpypvjZL9HJGk7W/MQC2YZE0i9mKUwkUCTyhCi2or2T90A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1684279248; a=rsa-sha256;
	cv=none;
	b=bzLjwDhwijixa8zRtXfem87/f+tUyHzAlRhjMD6q+IQnr/0J/+6NaGZJ+Odm1v/reCATCQ
	w7+EndQbujq1P18o/tmu5K/XF5YoY7UNH/e8rqPg9W6m/Xlrzf4sKYHox0QvxzsSh7LCCp
	Lr/TAAEO3rCyr+ihvqMCh5nYFZeWuxuG53jiEe8LALa9Rbk27nDnkvMYTWWIWU6J28xAAd
	8jiSDzJhXgEm7Y0Gd9YFupdvCP8Qb/pWDF4QXIEAKq8oTUBv6wLH8MSQujN2H3ksS5wVqe
	COjsJ9AwMtjd1oHXDjxxarSea3PqYNNnFT2w7d2yCx0fHu45gv5EtrzSsEVw/g==
Date: Wed, 17 May 2023 02:20:40 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 08/13] ARM: omap2: fix missing tick_broadcast() prototype
Message-ID: <20230516232040.GD271152@darkstar.musicnaut.iki.fi>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-9-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516153109.514251-9-arnd@kernel.org>

On Tue, May 16, 2023 at 05:31:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> omap2 contains a hack to define tick_broadcast() on non-SMP
> configurations in place of the normal SMP definition. This one
> causes a warning because of a missing prototype:
> 
> arch/arm/mach-omap2/board-generic.c:44:6: error: no previous prototype for 'tick_broadcast'
> 
> Make sure to always include the header with the declaration.
> 
> Fixes: d86ad463d670 ("ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

> ---
>  arch/arm/mach-omap2/board-generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
> index 853409b341a3..7aa41841edd4 100644
> --- a/arch/arm/mach-omap2/board-generic.c
> +++ b/arch/arm/mach-omap2/board-generic.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/irqdomain.h>
>  #include <linux/clocksource.h>
> +#include <linux/clockchips.h>
>  
>  #include <asm/setup.h>
>  #include <asm/mach/arch.h>
> -- 
> 2.39.2
> 
