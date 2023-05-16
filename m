Return-Path: <SRS0=1FlY=BF=iki.fi=aaro.koskinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6259FC77B75
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 23:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B18EC4339E; Tue, 16 May 2023 23:18:44 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B24C3C433D2;
	Tue, 16 May 2023 23:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B24C3C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi [85.76.146.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4QLXGl0L5SzyTW;
	Wed, 17 May 2023 02:18:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1684279111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vb+A9iOTP02ZCkPAmsVAR/eDZMRXA1HmPW5ybHLeMc8=;
	b=Qa5s19H7fFpuhyAC8+miaNUHlba2D2tpjilO4QmL4HYjVqfUI0okebT3wi0qPuggZNTcW6
	VnAEMLATAwxar7iQCdFuj8kZi01pjmYNoQtPmZdvi/y2bxyYSvFrj9dwBZHekYljCVsTb6
	FoPv1AaGVsdRx/6Ivm4cLEmsNnJBgEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1684279111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vb+A9iOTP02ZCkPAmsVAR/eDZMRXA1HmPW5ybHLeMc8=;
	b=Nn7Fxr7Ro53/rvPYt9zz7x9TFrN5D8hfPm2b5Ft9Rhr31I9DSBEWOxSC2RFbxZJlzsb1Uc
	L1HgrAwOMRMsU1t95rcdSC0ZwEcFEGutRdY89NPXyiq6DqqlEzusRMn8/x14HSQaGzzgqq
	BMZ0rU5UCrfNI7tIqcWYNaP7Np8dGF0=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684279111; a=rsa-sha256; cv=none;
	b=RwleUqzehTz3HbZ6b/VMpIjDVaA4Nsc3fu72IsL4voTcCasHIU6DOx1Zq3B8wMDP8f0eUm
	FMf8D7ammM6DWaYXL7QPxvOBaYxhOV+0KR4TMm2j0WoL/gYYHMsjIqyJ4r2a+GDsqVGsg7
	eHViMsarDjur2uv7AYiYWail8NqVmOU=
Date: Wed, 17 May 2023 02:18:21 +0300
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
Subject: Re: [PATCH 07/13] ARM: omap1: add missing include
Message-ID: <20230516231821.GC271152@darkstar.musicnaut.iki.fi>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516153109.514251-8-arnd@kernel.org>

On Tue, May 16, 2023 at 05:31:03PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The omap_serial_wakeup_init() declaration is not visible where it is
> defined, so make sure "common.h" is included here, avoiding:
> 
> arch/arm/mach-omap1/serial.c:221:12: error: no previous prototype for 'omap_serial_wakeup_init' [-Werror=missing-prototypes]
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
>  arch/arm/mach-omap1/serial.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
> index 96f59110d649..f25b94c86aec 100644
> --- a/arch/arm/mach-omap1/serial.c
> +++ b/arch/arm/mach-omap1/serial.c
> @@ -19,6 +19,7 @@
>  
>  #include <asm/mach-types.h>
>  
> +#include "common.h"
>  #include "serial.h"
>  #include "mux.h"
>  #include "pm.h"
> -- 
> 2.39.2
> 
