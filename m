Return-Path: <SRS0=0jij=A2=tkos.co.il=baruch@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C31C77B75
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 09:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4A6EC433AC; Fri,  5 May 2023 09:32:21 +0000 (UTC)
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A599C433EF;
	Fri,  5 May 2023 09:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A599C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Received: from tarshish (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 8B328440F85;
	Fri,  5 May 2023 12:26:25 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1683278786;
	bh=/HMflvUxM2+g4joc8VI/Bqtx5nCZ2tcOLWW0yiXmjhU=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=JMb/p58qy+zzuw6X8pcVc2w2MJL4OM4akuLec8WV4pjLGT5+W1kptkEuiGXImE5Fa
	 fq+UOyH2SuHV3byb0ePFRBiinXx1UeRqcFLeHLrbD+5wAIWSasikE+KqyRc/WkfvVD
	 oRr289ClAv9YSVlIdN61hBXDEN/m4EGfVGph2OdhI4A+Zf6+hL6CdSzQ0PSyt0L2vu
	 R4WJsusIqyH73CcgdXBogdd8ph+3PesT6FQ80slW0dYBRzuRtJ2U53vmFcOOku+7vN
	 BfyaHpv4+ZrHqvHiExVaLIkFpsmgrEQ7FPCa/Ok0zqOdNZRWIQInPxxqZc59FYP5Gb
	 Xd/bjhOq9SFlQ==
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
User-agent: mu4e 1.9.21; emacs 28.2
From: Baruch Siach <baruch@tkos.co.il>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, Andreas
 =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
 <mani@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio
 Estevam <festevam@gmail.com>, Antoine Tenart <atenart@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Joel
 Stanley <joel@jms.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Lars Persson <lars.persson@axis.com>,
 Scott Branden <sbranden@broadcom.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Wei Xu
 <xuwei5@hisilicon.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins
 <nick.hawkins@hpe.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy
 <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Lubomir Rintel <lkundrak@v3.sk>, Matthias
 Brugger <matthias.bgg@gmail.com>, Peter Rosin <peda@axentia.se>, Nancy
 Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Jonathan
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
 <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
Date: Fri, 05 May 2023 12:30:47 +0300
In-reply-to: <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
Message-ID: <87jzxn3yzr.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain

Hi Rob,

On Thu, May 04 2023, Rob Herring wrote:
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

For Conexant Digicolor:

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
