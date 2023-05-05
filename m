Return-Path: <SRS0=n02R=A2=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B342C77B7D
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 07:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C15CEC433A4; Fri,  5 May 2023 07:54:23 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EFB6C433D2;
	Fri,  5 May 2023 07:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3EFB6C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1puqFc-0006HD-Ii; Fri, 05 May 2023 09:53:12 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>,
 Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Joel Stanley <joel@jms.id.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Lars Persson <lars.persson@axis.com>, Scott Branden <sbranden@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Wei Xu <xuwei5@hisilicon.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Nick Hawkins <nick.hawkins@hpe.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Rosin <peda@axentia.se>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>,
 Qin Jian <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
Date: Fri, 05 May 2023 09:53:10 +0200
Message-ID: <4798301.GXAFRqVoOG@diego>
In-Reply-To: <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
References:
 <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

>  arch/arm/boot/dts/rockchip/Makefile                |   42 +
>  arch/arm/boot/dts/{ => rockchip}/rk3036-evb.dts    |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3036-kylin.dts  |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3036.dtsi       |    0
>  .../boot/dts/{ => rockchip}/rk3066a-bqcurie2.dts   |    2 +-
>  .../boot/dts/{ => rockchip}/rk3066a-marsboard.dts  |    2 +-
>  arch/arm/boot/dts/{ => rockchip}/rk3066a-mk808.dts |    0
>  .../boot/dts/{ => rockchip}/rk3066a-rayeager.dts   |    2 +-
>  arch/arm/boot/dts/{ => rockchip}/rk3066a.dtsi      |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3128-evb.dts    |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3128.dtsi       |    0
>  .../boot/dts/{ => rockchip}/rk3188-bqedison2qc.dts |    0
>  .../arm/boot/dts/{ => rockchip}/rk3188-px3-evb.dts |    0
>  .../boot/dts/{ => rockchip}/rk3188-radxarock.dts   |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3188.dtsi       |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3228-evb.dts    |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3229-evb.dts    |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3229-xms6.dts   |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3229.dtsi       |    0
>  arch/arm/boot/dts/{ => rockchip}/rk322x.dtsi       |    0
>  .../boot/dts/{ => rockchip}/rk3288-evb-act8846.dts |    0
>  .../boot/dts/{ => rockchip}/rk3288-evb-rk808.dts   |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3288-evb.dtsi   |    0
>  .../dts/{ => rockchip}/rk3288-firefly-beta.dts     |    0
>  .../{ => rockchip}/rk3288-firefly-reload-core.dtsi |    0
>  .../dts/{ => rockchip}/rk3288-firefly-reload.dts   |    0
>  .../arm/boot/dts/{ => rockchip}/rk3288-firefly.dts |    0
>  .../boot/dts/{ => rockchip}/rk3288-firefly.dtsi    |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3288-miqi.dts   |    0
>  .../boot/dts/{ => rockchip}/rk3288-phycore-rdk.dts |    0
>  .../dts/{ => rockchip}/rk3288-phycore-som.dtsi     |    0
>  .../boot/dts/{ => rockchip}/rk3288-popmetal.dts    |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3288-r89.dts    |    0
>  .../boot/dts/{ => rockchip}/rk3288-rock-pi-n8.dts  |    2 +-
>  .../boot/dts/{ => rockchip}/rk3288-rock2-som.dtsi  |    0
>  .../dts/{ => rockchip}/rk3288-rock2-square.dts     |    0
>  .../boot/dts/{ => rockchip}/rk3288-tinker-s.dts    |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3288-tinker.dts |    0
>  .../arm/boot/dts/{ => rockchip}/rk3288-tinker.dtsi |    0
>  .../{ => rockchip}/rk3288-veyron-analog-audio.dtsi |    0
>  .../dts/{ => rockchip}/rk3288-veyron-brain.dts     |    0
>  .../rk3288-veyron-broadcom-bluetooth.dtsi          |    0
>  .../{ => rockchip}/rk3288-veyron-chromebook.dtsi   |    2 +-
>  .../boot/dts/{ => rockchip}/rk3288-veyron-edp.dtsi |    0
>  .../dts/{ => rockchip}/rk3288-veyron-fievel.dts    |    0
>  .../boot/dts/{ => rockchip}/rk3288-veyron-jaq.dts  |    2 +-
>  .../dts/{ => rockchip}/rk3288-veyron-jerry.dts     |    2 +-
>  .../dts/{ => rockchip}/rk3288-veyron-mickey.dts    |    0
>  .../dts/{ => rockchip}/rk3288-veyron-mighty.dts    |    0
>  .../dts/{ => rockchip}/rk3288-veyron-minnie.dts    |    0
>  .../dts/{ => rockchip}/rk3288-veyron-pinky.dts     |    2 +-
>  .../dts/{ => rockchip}/rk3288-veyron-sdmmc.dtsi    |    0
>  .../dts/{ => rockchip}/rk3288-veyron-speedy.dts    |    2 +-
>  .../dts/{ => rockchip}/rk3288-veyron-tiger.dts     |    0
>  .../arm/boot/dts/{ => rockchip}/rk3288-veyron.dtsi |    0
>  .../boot/dts/{ => rockchip}/rk3288-vmarc-som.dtsi  |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3288-vyasa.dts  |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3288.dtsi       |    0
>  arch/arm/boot/dts/{ => rockchip}/rk3xxx.dtsi       |    0
>  .../rockchip-radxa-dalang-carrier.dtsi             |    0
>  .../boot/dts/{ => rockchip}/rv1108-elgin-r1.dts    |    0
>  arch/arm/boot/dts/{ => rockchip}/rv1108-evb.dts    |    0
>  arch/arm/boot/dts/{ => rockchip}/rv1108.dtsi       |    0
>  .../dts/{ => rockchip}/rv1126-edgeble-neu2-io.dts  |    0
>  .../dts/{ => rockchip}/rv1126-edgeble-neu2.dtsi    |    0
>  .../boot/dts/{ => rockchip}/rv1126-pinctrl.dtsi    |    0
>  arch/arm/boot/dts/{ => rockchip}/rv1126.dtsi       |    0

>  .../boot/dts/rockchip/rk3399pro-rock-pi-n10.dts    |    2 +-

for the Rockchip-parts:
Acked-by: Heiko Stuebner <heiko@sntech.de>


Thanks
Heiko


