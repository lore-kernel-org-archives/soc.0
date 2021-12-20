Return-Path: <SRS0=ZKO2=RF=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E515C433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 19:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1464BC36AED; Mon, 20 Dec 2021 19:22:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BD26C36AE7;
	Mon, 20 Dec 2021 19:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BD26C36AE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7CA50C0007;
	Mon, 20 Dec 2021 19:22:49 +0000 (UTC)
Date: Mon, 20 Dec 2021 20:22:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, soc@kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Remove "spidev" nodes
Message-ID: <YcDYCSamA31QLHtm@piout.net>
References: <20211217221232.3664417-1-robh@kernel.org>
 <YcB3ZhbCZGmPNk5s@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcB3ZhbCZGmPNk5s@sirena.org.uk>

Hello Mark,

On 20/12/2021 12:30:30+0000, Mark Brown wrote:
> On Fri, Dec 17, 2021 at 04:12:32PM -0600, Rob Herring wrote:
> > "spidev" is not a real device, but a Linux implementation detail. It has
> > never been documented either. The kernel has WARNed on the use of it for
> > over 6 years. Time to remove its usage from the tree.
> 
> Reviwed-by: Mark Brown <broonie@kernel.org>

You have a typo there so I'm not sure b4 will be able to pick that up

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
