Return-Path: <SRS0=n1DI=DQ=kaiser.cx=postmaster@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B8BC00528
	for <soc@archiver.kernel.org>; Sun, 30 Jul 2023 16:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C080C433CD; Sun, 30 Jul 2023 16:26:56 +0000 (UTC)
Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E864EC433C8;
	Sun, 30 Jul 2023 16:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E864EC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kaiser.cx
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kaiser.cx
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1qQ9Fi-0003fq-1p; Sun, 30 Jul 2023 18:26:42 +0200
Date: Sun, 30 Jul 2023 18:26:42 +0200
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
Message-ID: <20230730162642.ib6hfbw5zgeked6h@viti.kaiser.cx>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-6-arnd@kernel.org>
 <CAOMZO5B0stW2X6YqPTTKDpCOAzPDvm=4HT8jfBAgbTy11gnKgg@mail.gmail.com>
 <4e026f08-d733-4b01-ab47-e921d041e74e@app.fastmail.com>
 <20230517154525.ljoamjlfhpejtizm@viti.kaiser.cx>
 <0808604b-a26e-43b8-83da-2c3dc12446d2@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0808604b-a26e-43b8-83da-2c3dc12446d2@app.fastmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Arnd,

Arnd Bergmann (arnd@arndb.de) wrote:

> >> I'll leave it up to you, if you want to merge Martin's patches or
> >> a replacement for the soc-imx driver through the imx tree for 6.5,
> >> I'll drop my patch from this series, otherwise I'll keep it for now
> >> and we can still do it better at later point.

> > I suggest we merge my patches for imx25 first and then clean up all the
> > older imx families to use the common functions.

> > I've just rebased the patches against today's linux-next. My understanding
> > is that they have to go through the clk tree.

> This never happened, right? I see that mx25_revision() is still in the
> tree without any users, so I can't easily turn on the warning by default
> yet. Should I just go ahead and remove it for 5.6, or do you expect to
> have your patch ready in time for the merge window?

sorry for delaying your series.

So far, there's been no response to my patches from the clk maintainers.
Let me resend the patches one final time. If we don't hear anything back
within a week or so, feel free to remove mx25_revision (and probably all
of arch/arm/mach-imx/cpu-imx25.c) for the 6.6 merge window.

Thanks,
Martin
