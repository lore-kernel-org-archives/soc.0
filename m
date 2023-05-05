Return-Path: <SRS0=iGe/=A2=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074ABC77B7C
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 12:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFF77C433A4; Fri,  5 May 2023 12:40:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id DB119C433EF;
	Fri,  5 May 2023 12:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB119C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B92C1FB;
	Fri,  5 May 2023 05:41:18 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F8C93F64C;
	Fri,  5 May 2023 05:40:26 -0700 (PDT)
Date: Fri, 5 May 2023 13:40:22 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, Andreas
 =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>, Manivannan Sadhasivam
 <mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Antoine
 Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Joel
 Stanley <joel@jms.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Lars Persson <lars.persson@axis.com>, Scott
 Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Baruch Siach <baruch@tkos.co.il>, Wei Xu <xuwei5@hisilicon.com>, Jean-Marie
 Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vz@mleia.com>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Rosin <peda@axentia.se>, Nancy Yuen <yuenn@google.com>, Benjamin Fair
 <benjaminfair@google.com>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?=
 <j.neuschaefer@gmx.net>, Thierry Reding <thierry.reding@gmail.com>, Bjorn
 Andersson <andersson@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Daniel Palmer
 <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
 <shiraz.linux.kernel@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>, Qin Jian
 <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar
 <ssantosh@kernel.org>, Enric Balletbo i Serra <eballetbo@gmail.com>, Javier
 Martinez Canillas <javier@dowhile0.org>, Michal Simek
 <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com
Subject: Re: [PATCH 1/4] ARM: dts: allwinner: Use quoted #include
Message-ID: <20230505134022.77c565e7@donnerap.cambridge.arm.com>
In-Reply-To: <20230504-arm-dts-mv-v1-1-2c8e51a2b6c4@kernel.org>
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
	<20230504-arm-dts-mv-v1-1-2c8e51a2b6c4@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 04 May 2023 22:29:26 -0500
Rob Herring <robh@kernel.org> wrote:

> In preparation to move .dts files into subdirectories, include
> sunxi-h3-h5-emlid-neutis.dtsi from the current directory rather than the
> symlinked include path.

Looks alright, I guess originally we thought we'd need this from
the arm64 directory, but we don't, so this is fine:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
> index eedd5da5dc2f..35e71f46c197 100644
> --- a/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
> @@ -8,4 +8,4 @@
>  /dts-v1/;
>  
>  #include "sun8i-h3.dtsi"
> -#include <arm/sunxi-h3-h5-emlid-neutis.dtsi>
> +#include "sunxi-h3-h5-emlid-neutis.dtsi"
> 

