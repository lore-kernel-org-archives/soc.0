Return-Path: <SRS0=azLC=A2=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C706AC77B7D
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 22:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77523C433AA; Fri,  5 May 2023 22:48:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1C55C433EF;
	Fri,  5 May 2023 22:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1C55C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 345MlMLk118078;
	Fri, 5 May 2023 17:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683326842;
	bh=41FHwA970saBnfGhfTFXEckY0k4sWo8zzdq3XNPViMI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=o8ua85dXMpnBXio2K+qU9DDSr1cVLC9kMNM+it/lTPCBesOMZOAh5e9n0edQzuuqO
	 cH9f27uQ+yxUSIgPZ7ktHtD1/k3ZLbPixXyMkcjJFlevmdTq+HbbjiXOFSwZwe6rWA
	 nMhvG3suyErm0Evggi/W8bLCsqlYq5NoLfP+spqw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 345MlMon053796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 May 2023 17:47:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 May 2023 17:47:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 May 2023 17:47:22 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 345MlMi1082330;
	Fri, 5 May 2023 17:47:22 -0500
Date: Fri, 5 May 2023 17:47:22 -0500
From: Nishanth Menon <nm@ti.com>
To: Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King
	<linux@armlinux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andreas
 =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam
	<mani@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Antoine Tenart
	<atenart@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin
 Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>, Joel Stanley
	<joel@jms.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea
	<claudiu.beznea@microchip.com>,
        Lars Persson <lars.persson@axis.com>,
        Scott
 Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Baruch Siach <baruch@tkos.co.il>, Wei Xu <xuwei5@hisilicon.com>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick
 Hawkins <nick.hawkins@hpe.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy
	<vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement
	<gregory.clement@bootlin.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Matthias
 Brugger <matthias.bgg@gmail.com>,
        Peter Rosin <peda@axentia.se>, Nancy Yuen
	<yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonathan
 =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>, Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu
	<mhiramat@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim
	<shiraz.linux.kernel@gmail.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Marek Vasut <marex@denx.de>, Qin Jian
	<qinjian@cqplus1.com>,
        Jisheng Zhang <jszhang@kernel.org>, Tony Lindgren
	<tony@atomide.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Enric
 Balletbo i Serra <eballetbo@gmail.com>,
        Javier Martinez Canillas
	<javier@dowhile0.org>,
        Michal Simek <michal.simek@xilinx.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@axis.com>
Subject: Re: [PATCH 0/4] ARM: Move dts files to vendor sub-directories
Message-ID: <20230505224722.r73sbti6ugf76c66@mardi>
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Tony,

On 22:29-20230504, Rob Herring wrote:
> As discussed and attempted several times before[1][2], the flat arm32 
> directory of 1553 platforms has grown unwieldy. Past attempts stalled 
> out due to plans to move .dts files out of the kernel tree. Doing that 
> is no longer planned (any time soon at least), so let's go ahead and 
> group .dts files by vendors. This move aligns arm with arm64 .dts file 
> structure.
[...]

Wondering if it makes to have any sense of grouping per TI SoC arch? at
least will be clear as to what is going on?

ti/omap2 or ti/omap ?

>     'am3' : 'ti',
^^ group  as ti/omap ?
>     'am4' : 'ti',
^^ group  as ti/omap ?
>     'am5' : 'ti',
^^ group  as ti/omap ?
>     'dra' : 'ti',
^^ group  as ti/omap ?
>     'keystone' : 'ti',
^^ group  as ti/keystone ?
>     'omap' : 'ti',
^^ group  as ti/omap ?
>     'compulab' : 'ti',
^^ group  as ti/omap ?
>     'logicpd' : 'ti',
^^ group  as ti/omap ?
>     'elpida' : 'ti',
^^ group  as ti/omap ?
>     'motorola' : 'ti',
^^ group  as ti/omap ?
>     'twl' : 'ti',
^^ group  as ti/omap ?
>     'da' : 'ti',
^^ group  as ti/davinci ?
>     'dm' : 'ti',
^^ group  as ti/davinci ?

For me at least, this cleanly seperates things up.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
