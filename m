Return-Path: <SRS0=jDLw=BF=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A9AC77B75
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B47EC4339C; Tue, 16 May 2023 15:58:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 74124C433D2;
	Tue, 16 May 2023 15:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74124C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D7D01FB;
	Tue, 16 May 2023 08:59:09 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C9CB3F7BD;
	Tue, 16 May 2023 08:58:20 -0700 (PDT)
Date: Tue, 16 May 2023 16:58:17 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Russell King
 <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Hartley
 Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Daniel Mack <daniel@zonque.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
 <shiraz.linux.kernel@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 03/13] ARM: highbank: add missing include
Message-ID: <20230516165817.1c9923d3@donnerap.cambridge.arm.com>
In-Reply-To: <20230516153109.514251-4-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
	<20230516153109.514251-4-arnd@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 May 2023 17:30:59 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> highbank_pm_init() is declared in core.h this is not included in the
> file that defines it.
> 
> arch/arm/mach-highbank/pm.c:43:13: error: no previous prototype for 'highbank_pm_init'
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/mach-highbank/pm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-highbank/pm.c b/arch/arm/mach-highbank/pm.c
> index 561941baeda9..3fdbdb83113b 100644
> --- a/arch/arm/mach-highbank/pm.c
> +++ b/arch/arm/mach-highbank/pm.c
> @@ -12,6 +12,8 @@
>  
>  #include <uapi/linux/psci.h>
>  
> +#include "core.h"
> +
>  #define HIGHBANK_SUSPEND_PARAM \
>  	((0 << PSCI_0_2_POWER_STATE_ID_SHIFT) | \
>  	 (1 << PSCI_0_2_POWER_STATE_AFFL_SHIFT) | \

