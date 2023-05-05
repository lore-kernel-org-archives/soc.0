Return-Path: <SRS0=N/B3=A2=axis.com=Jesper.Nilsson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5AAC77B7C
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 14:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4519AC433AA; Fri,  5 May 2023 14:12:00 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B299CC433D2;
	Fri,  5 May 2023 14:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B299CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=axis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683295919;
  x=1714831919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IQhrMEmbkdIeS/c4Mo1VR2kSTS1Kx2MwOx7h09x0ziM=;
  b=fPIPrhJrICaA6JV2G2iWYHuINMWQP3pGf5qsMiEe59lbVmuzeQ8HCPBP
   FSk0q3lEOspOT0G0FLTqgqJ5OwR473mTA2bcR/nla/PAyTaeW3Bn0XqqF
   1lhDM/cLYyr/w4vv8TzaHOrW55owdZ+/pLsjB9UQcJ+5slGIdVsPd6caZ
   zWv6bP9gfy+PRek3ZR7Ybf0LnhOVbTPJj+cHbHSzYxcFh/DkN37Ei/2s9
   UG4+6k5MUC1fOPdge8RiL3fIwwS6Pwg4nx3fT0lWE0gNRI4HryGlx08nf
   jajrr+nkc1E9qBovR3xTI6WtaGYAKcYrDDFkqUVNEqt7yUMUJ6Go6To5A
   A==;
Date: Fri, 5 May 2023 16:11:52 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Russell King
	<linux@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, Andreas
 =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
	<mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Antoine Tenart
	<atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Kevin
 Hilman" <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Linus Walleij
	<linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Joel Stanley
	<joel@jms.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Lars Persson <lars.persson@axis.com>, "Scott
 Branden" <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>,
	Wei Xu <xuwei5@hisilicon.com>, Jean-Marie Verdun <verdun@hpe.com>, "Nick
 Hawkins" <nick.hawkins@hpe.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy
	<vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
	<gregory.clement@bootlin.com>, Lubomir Rintel <lkundrak@v3.sk>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Peter Rosin <peda@axentia.se>, Nancy Yuen
	<yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Jonathan
 =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Thierry Reding
	<thierry.reding@gmail.com>, Bjorn Andersson <andersson@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>,
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
	<mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
	<shiraz.linux.kernel@gmail.com>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>, Qin Jian
	<qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar
	<ssantosh@kernel.org>, Enric Balletbo i Serra <eballetbo@gmail.com>, "Javier
 Martinez Canillas" <javier@dowhile0.org>, Michal Simek
	<michal.simek@xilinx.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-kernel@axis.com>
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
Message-ID: <20230505141152.GK19396@axis.com>
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 04, 2023 at 10:29:29PM -0500, Rob Herring wrote:
> The arm dts directory has grown to 1553 boards which makes it a bit
> unwieldy to maintain and use. Past attempts stalled out due to plans to
> move .dts files out of the kernel tree. Doing that is no longer planned
> (any time soon at least), so let's go ahead and group .dts files by
> vendors. This move aligns arm with arm64 .dts file structure.
> 
> Doing this enables building subsets of dts files by vendor easily
> without changing kernel configs:
> 
> make allyesconfig
> make arch/arm/boot/dts/ti/
> 
> There's no change to dtbs_install as the flat structure is maintained on
> install.
> 
> The naming of vendor directories is roughly in this order of preference:
> - Matching original and current SoC vendor prefix/name (e.g. ti, qcom)
> - Current vendor prefix/name if still actively sold (SoCs which have
>   been aquired) (e.g. nxp/imx)
> - Existing platform name for older platforms not sold/maintained by any
>   company (e.g. gemini, nspire)
> 
> The whole move was scripted with the exception of MAINTAINERS.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  MAINTAINERS                                        |  181 +--
> [...]
>  arch/arm/boot/dts/axis/Makefile                    |    3 +
>  arch/arm/boot/dts/{ => axis}/artpec6-devboard.dts  |    0
>  arch/arm/boot/dts/{ => axis}/artpec6.dtsi          |    0

For the Axis ARTPEC ports,

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
