Return-Path: <SRS0=HZxB=A6=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA12C7EE22
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 06:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CF9AC4339B; Tue,  9 May 2023 06:38:10 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 5D4DFC433EF;
	Tue,  9 May 2023 06:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D4DFC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id BC3DC804D;
	Tue,  9 May 2023 06:38:06 +0000 (UTC)
Date: Tue, 9 May 2023 09:38:05 +0300
From: Tony Lindgren <tony@atomide.com>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, soc@kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Joel Stanley <joel@jms.id.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Lars Persson <lars.persson@axis.com>,
	Scott Branden <sbranden@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>, Wei Xu <xuwei5@hisilicon.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Rosin <peda@axentia.se>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Marek Vasut <marex@denx.de>, Qin Jian <qinjian@cqplus1.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Barker <paul.barker@sancloud.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com
Subject: Re: [PATCH 0/4] ARM: Move dts files to vendor sub-directories
Message-ID: <20230509063805.GY14287@atomide.com>
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230505224722.r73sbti6ugf76c66@mardi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505224722.r73sbti6ugf76c66@mardi>

* Nishanth Menon <nm@ti.com> [230505 22:47]:
> Tony,
> 
> On 22:29-20230504, Rob Herring wrote:
> > As discussed and attempted several times before[1][2], the flat arm32 
> > directory of 1553 platforms has grown unwieldy. Past attempts stalled 
> > out due to plans to move .dts files out of the kernel tree. Doing that 
> > is no longer planned (any time soon at least), so let's go ahead and 
> > group .dts files by vendors. This move aligns arm with arm64 .dts file 
> > structure.
> [...]
> 
> Wondering if it makes to have any sense of grouping per TI SoC arch? at
> least will be clear as to what is going on?
> 
> ti/omap2 or ti/omap ?
> 
> >     'am3' : 'ti',
> ^^ group  as ti/omap ?
> >     'am4' : 'ti',
> ^^ group  as ti/omap ?
> >     'am5' : 'ti',
> ^^ group  as ti/omap ?
> >     'dra' : 'ti',
> ^^ group  as ti/omap ?
> >     'keystone' : 'ti',
> ^^ group  as ti/keystone ?
> >     'omap' : 'ti',
> ^^ group  as ti/omap ?
> >     'compulab' : 'ti',
> ^^ group  as ti/omap ?
> >     'logicpd' : 'ti',
> ^^ group  as ti/omap ?
> >     'elpida' : 'ti',
> ^^ group  as ti/omap ?
> >     'motorola' : 'ti',
> ^^ group  as ti/omap ?
> >     'twl' : 'ti',
> ^^ group  as ti/omap ?
> >     'da' : 'ti',
> ^^ group  as ti/davinci ?
> >     'dm' : 'ti',
> ^^ group  as ti/davinci ?
> 
> For me at least, this cleanly seperates things up.

No objections from me to adding TI subdirectories. Rob, any issues with this?

Regards,

Tony
