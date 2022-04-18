Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E465C433EF
	for <soc@archiver.kernel.org>; Mon, 18 Apr 2022 08:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3D86C385A1; Mon, 18 Apr 2022 08:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF53C385AB;
	Mon, 18 Apr 2022 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650270629;
	bh=YJNb0yE96ez+n18KE30veh+JQQlxIkfnSjjAxx25cX4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=O/bdi7oL7saSoVHnE2rzDoqdPdcu9WaysDOLgbYrBpx1UdpEXrUgKWrQuM3POmiZa
	 ZAkbIDvKcIx8STq8SVeUc/BhAm0fLMoJ5QG/aB4ciWexXm8sHvKRjqFBS1kybBU94N
	 hygnfEWmrPNRpusxfRuKpan+pB5S4/5KKQMvtvXkjoyorMfnzWHsVehFgHG9yhHFaU
	 IUjFBwBrvNBk4TLRaJ47AbTfhBomRVj8V1XbTg6uXwRtyuq1X08fQGb225tKYN5U6W
	 14RT+Gf+95v4lD+BQoiRgTe7+/xMazkLqorS15KP8wzw2KNvdxZ9LOOnbto9XHUmbp
	 RMSZ1KzEZ8i3Q==
Date: Mon, 18 Apr 2022 16:30:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Max Krummenacher <max.oss.09@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: max.krummenacher@toradex.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Alistair Francis <alistair@alistair23.me>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Douglas Anderson <dianders@chromium.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Li Yang <leoyang.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Olof Johansson <olof@lixom.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Pascal Zimmermann <pzimmermann@dh-electronics.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philippe Schenker <philippe.schenker@toradex.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: [PATCH v2 00/14] ARM: dts: imx6dl-colibri: Misc improvements and
 newly added carriers
Message-ID: <20220418083019.GF391514@dragon>
References: <20220411152234.12678-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411152234.12678-1-max.oss.09@gmail.com>

On Mon, Apr 11, 2022 at 05:22:20PM +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> 
> This is a general update of the Colibri iMX6 device tree files.
> 
> The Toradex Colibri family is composed of a SoM that can be plugged on
> various carrier boards, with carrier boards allowing multiple optional
> accessories (e.g. display, camera, ...).
> 
> The device tree sources are structured into a SoM dtsi and a carrier dts
> which then includes the SoM dtsi. The SoM dtsi defines and enables the
> functionality self contained on the SoM and prepares for functionality
> provided by the carrier HW or accessories, so that the carrier dts then
> can enable or amend nodes provided. Accessories are enabled in overlays
> depending on HW configuration.
> 
> The series improves the existing Colibri Evaluation Board device tree and
> adds new device trees for the Aster, Iris, and Iris V2 carrier boards.
> 
> Additionally it drops the dedicated device tree for SoM V1.1 HW used in a
> Evaluation board. The regular device tree works well in that combination.
> The higher SD card speed possible with SoM V1.1 would require HW
> modification on the carrier board.
> 
> Improvements:
> - Specifies GPIO line names for use with libgpiod.
> - Disables optional accessories. They would be enabled in overlays
>   depending on HW configuration.
> - Lower power consumption after poweroff.
> - Move more functionality into the SoM dtsi file to reduce code
>   duplication.
> - General cleanup to adhere to dtbs bindings and missed alphabetically
>   ordering.
> 
> Fixes:
> - Copy/paste error in i2c2 pinmuxing resulting in i2c2 being
>   nonfunctional.
> 
> Adds:
> - imx6dl-colibri-aster.dtb: used for a Colibri iMX6 mated in an Aster
>   carrier board.
> - imx6dl-colibri-iris.dtb: used for a Colibri iMX6 mated in an
>   Iris V1.x carrier board.
> - imx6dl-colibri-iris-v2.dtb: used for a Colibri iMX6 mated in an
>   Iris V2.x carrier board.
> 
> Drops:
> - imx6dl-colibri-v1_1-eval-v3.dtb, imx6dl-colibri-eval-v3.dtb is good
>   enough.
> 
> Changes in v2:
> - Addressed 'From' address as reported by checkpatch / Shawn's feedback.
> - Added Rob's Ack to the 'dt-bindings' patches.
> 
> Max Krummenacher (13):
>   dt-bindings: arm: fsl: imx6dl-colibri: Drop dedicated v1.1 bindings
>   dt-bindings: arm: fsl: Add carriers for toradex,colibri-imx6dl
>   ARM: dts: imx6dl-colibri: Drop dedicated v1.1 device tree
>   ARM: dts: imx6dl-colibri: Fix I2C pinmuxing
>   ARM: dts: imx6dl-colibri: Disable add-on accessories
>   ARM: dts: imx6dl-colibri: Command pmic to standby for poweroff
>   ARM: dts: imx6dl-colibri: Add additional pingroups
>   ARM: dts: imx6dl-colibri: Move common nodes to SoM dtsi
>   ARM: dts: imx6dl-colibri: Cleanup
>   ARM: dts: imx6dl-colibri: Add usdhc1 sleep pin configuration
>   ARM: dts: imx6dl-colibri: Add support for Toradex Iris carrier boards
>   ARM: dts: imx6dl-colibri: Add support for Toradex Aster carrier board
>   ARM: imx_v6_v7_defconfig: Enable the ADC part of the STMPE MFD
> 
> Oleksandr Suvorov (1):
>   ARM: dts: imx6dl-colibri: Add gpio-line-names

Applied all, thanks!
