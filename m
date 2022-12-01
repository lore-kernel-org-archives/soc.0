Return-Path: <SRS0=LkdZ=37=alpha.franken.de=tsbogend@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB5CC43217
	for <soc@archiver.kernel.org>; Thu,  1 Dec 2022 10:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47D22C433D7; Thu,  1 Dec 2022 10:58:32 +0000 (UTC)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.kernel.org (Postfix) with ESMTP id 0A02EC433C1;
	Thu,  1 Dec 2022 10:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A02EC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1p0hGS-0007Uq-03; Thu, 01 Dec 2022 11:58:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 045ACC1EF5; Thu,  1 Dec 2022 11:53:20 +0100 (CET)
Date: Thu, 1 Dec 2022 11:53:20 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stefan Agner <stefan@agner.ch>, Heiko Stuebner <heiko@sntech.de>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tim Harvey <tharvey@gateworks.com>, Peng Fan <peng.fan@nxp.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Oleksij Rempel <linux@rempel-privat.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/5] mips: dts: remove label = "cpu" from DSA dt-binding
Message-ID: <20221201105320.GD6569@alpha.franken.de>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130141040.32447-5-arinc.unal@arinc9.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Nov 30, 2022 at 05:10:39PM +0300, Arınç ÜNAL wrote:
> This is not used by the DSA dt-binding, so remove it from all devicetrees.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/qca/ar9331.dtsi    | 1 -
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
> index c4102b280b47..768ac0f869b1 100644
> --- a/arch/mips/boot/dts/qca/ar9331.dtsi
> +++ b/arch/mips/boot/dts/qca/ar9331.dtsi
> @@ -176,7 +176,6 @@ ports {
>  
>  						switch_port0: port@0 {
>  							reg = <0x0>;
> -							label = "cpu";
>  							ethernet = <&eth1>;
>  
>  							phy-mode = "gmii";
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index f3f4c1f26e01..445817cbf376 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -386,7 +386,6 @@ port@4 {
>  
>  					port@6 {
>  						reg = <6>;
> -						label = "cpu";
>  						ethernet = <&gmac0>;
>  						phy-mode = "trgmii";
>  
> -- 
> 2.34.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
