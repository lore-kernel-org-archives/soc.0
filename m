Return-Path: <SRS0=YywJ=A2=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05A2C77B75
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 07:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64EC5C433A0; Fri,  5 May 2023 07:26:25 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A82C5C4339B;
	Fri,  5 May 2023 07:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A82C5C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3F71B20009;
	Fri,  5 May 2023 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683271573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nKqu0uvToIWcuKG8ai2tfDDYgKh4MlcTv0fykb78cVI=;
	b=X/JrkdvOflNvt9CC8cOLeS4CI8eF84nRpVr3wyJG8mNi7KqDIqttNlCgeqZ4jsuaPCEfw2
	g/Gfl7b4GjhJadaWceOWwayOo6fPnfL3lFbBTzj67SHgCz20sFkdQeNRFAInQeb2y7hkLu
	Susg+1XWuCwsHlBV9dUAzd3i8536QAZFzyrS1SoUq3KEaqaVQiudw8GyE8nndIq/g50P9B
	hMuMJagyvVnk4Ifkvo8V3MpOZstKm88eGKBWZaRlPxqDr7M1oRFBws3jQ0Nj1Li5TwgaNB
	ssNUtV9wu/kHygXrQZOebyo9hCHN0FWsYOkRiAxJJVwtnMg9VFWDxfrGSxGnrw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh@kernel.org>, soc@kernel.org, Christian Marangi
 <ansuelsmth@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Masahiro Yamada <masahiroy@kernel.org>, Andreas =?utf-8?Q?F=C3=A4rber?=
 <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Joel
 Stanley <joel@jms.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Lars Persson <lars.persson@axis.com>,
 Scott Branden <sbranden@broadcom.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Baruch
 Siach <baruch@tkos.co.il>, Wei Xu <xuwei5@hisilicon.com>, Jean-Marie
 Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vz@mleia.com>, Andrew
 Lunn <andrew@lunn.ch>, Lubomir Rintel <lkundrak@v3.sk>, Matthias Brugger
 <matthias.bgg@gmail.com>, Peter Rosin <peda@axentia.se>, Nancy Yuen
 <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Jonathan
 =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Thierry Reding
 <thierry.reding@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>,
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
 <shiraz.linux.kernel@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>, Qin Jian
 <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar
 <ssantosh@kernel.org>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 Javier Martinez Canillas <javier@dowhile0.org>, Michal Simek
 <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com
Subject: Re: [PATCH 2/4] ARM: dts: Add .dts files missing from the build
In-Reply-To: <20230504-arm-dts-mv-v1-2-2c8e51a2b6c4@kernel.org>
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-2-2c8e51a2b6c4@kernel.org>
Date: Fri, 05 May 2023 09:26:01 +0200
Message-ID: <87zg6jz1bq.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Rob Herring <robh@kernel.org> writes:

> Comparing .dts files to built .dtb files yielded a few .dts files which
> are never built. Add them to the build.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 59829fc90315..3cf1bf724e8e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -335,6 +335,7 @@ dtb-$(CONFIG_MACH_KIRKWOOD) += \
>  	kirkwood-iconnect.dtb \
>  	kirkwood-iomega_ix2_200.dtb \
>  	kirkwood-is2.dtb \
> +	kirkwood-km_fixedeth.dtb \
>  	kirkwood-km_kirkwood.dtb \
>  	kirkwood-l-50.dtb \
>  	kirkwood-laplug.dtb \

[...]

> @@ -1561,6 +1565,8 @@ dtb-$(CONFIG_MACH_ARMADA_38X) += \
>  	armada-388-helios4.dtb \
>  	armada-388-rd.dtb
>  dtb-$(CONFIG_MACH_ARMADA_39X) += \
> +	armada-390-db.dtb \
> +	armada-395-gp.dtb \
>  	armada-398-db.dtb
>  dtb-$(CONFIG_MACH_ARMADA_XP) += \
>  	armada-xp-axpwifiap.dtb \

[...]


Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


> -- 
> 2.39.2
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
