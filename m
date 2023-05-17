Return-Path: <SRS0=xKzz=BG=kaiser.cx=postmaster@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6A0C77B7A
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 15:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04760C4339E; Wed, 17 May 2023 15:45:35 +0000 (UTC)
Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8BA9C433EF;
	Wed, 17 May 2023 15:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8BA9C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kaiser.cx
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=kaiser.cx
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1pzJLB-00050y-T9; Wed, 17 May 2023 17:45:25 +0200
Date: Wed, 17 May 2023 17:45:25 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@kernel.org>,
	soc@kernel.org, Russell King <linux@armlinux.org.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/13] ARM: imx: remove unused mx25_revision()
Message-ID: <20230517154525.ljoamjlfhpejtizm@viti.kaiser.cx>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-6-arnd@kernel.org>
 <CAOMZO5B0stW2X6YqPTTKDpCOAzPDvm=4HT8jfBAgbTy11gnKgg@mail.gmail.com>
 <4e026f08-d733-4b01-ab47-e921d041e74e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e026f08-d733-4b01-ab47-e921d041e74e@app.fastmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Arnd Bergmann (arnd@arndb.de):

> I think either way is ok to address the warning. If we wanted to do this
> properly, the mx{25,27,31,35,5}_revision functions could all be removed
> and the logic hooked up to imx_set_soc_revision() in the same way that
> they already use mxc_set_cpu_type() for drivers/soc/imx/soc-imx.c.

> I'll leave it up to you, if you want to merge Martin's patches or
> a replacement for the soc-imx driver through the imx tree for 6.5,
> I'll drop my patch from this series, otherwise I'll keep it for now
> and we can still do it better at later point.

I suggest we merge my patches for imx25 first and then clean up all the
older imx families to use the common functions.

I've just rebased the patches against today's linux-next. My understanding
is that they have to go through the clk tree.

Thanks,
Martin
