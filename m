Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C47C43334
	for <soc@archiver.kernel.org>; Mon, 20 Jun 2022 01:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7320DC3411C; Mon, 20 Jun 2022 01:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A57C34114;
	Mon, 20 Jun 2022 01:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655687682;
	bh=h5ydW1ja+54JvVtYYSIHgD1ntTDQ+CtXhmd3HlqmcOM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Q5m9kaIOlaFzZrdCnNkgs/hMOSytRGVlNZ7ufGR01hRtl4xOHCc65Fh7971R4NWFV
	 kSoMAUJ6XH9HbGD1icc4JQveljYLwGOftg2uxD/lLDXlVGiFLM/DDz5rvxWfZzw3Sq
	 5+C7ZISoKceY6qOcbT7Ij7TCyAKeLma9c90pMBzkLJzTyeSNrMmAfd1Rk7a9yC4dR2
	 ZUxs+wvMinDPQzQ+fUBamzfCCS6rvsHtm9bbMSSPnelDAG37cjhM7U1umaIkSjL1l8
	 FOhUPpB469Z95XeAnHZmlMN/RhD2j2D052ErNoImGNln7kCHX2FmJrZEe0lO2MN1R/
	 HIM7IShw17dag==
Date: Mon, 20 Jun 2022 09:14:33 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Max Krummenacher <max.oss.09@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: max.krummenacher@toradex.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Denys Drozdov <denys.drozdov@toradex.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Li Yang <leoyang.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Marek Vasut <marex@denx.de>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	NXP Linux Team <linux-imx@nxp.com>, Olof Johansson <olof@lixom.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: [PATCH v2 00/18] ARM: dts: imx6q-apalis: Misc improvements and
 newly added carrier
Message-ID: <20220620011433.GR254723@dragon>
References: <20220615115006.45672-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615115006.45672-1-max.oss.09@gmail.com>

On Wed, Jun 15, 2022 at 01:49:48PM +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> 
> This is a general update of the Apalis iMX6 device tree files.
> 
> The Toradex Apalis family is composed of a SoM that can be plugged on
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
> The series improves the existing Apalis carrier board device trees and
> adds a new device trees for the Ixora V1.2 carrier board.
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
> - PWM backlight for backlights with inverted logic on its PWM input.
> 
> Fixes:
> - STMPE ADC not functional due to wrong node name in dts.
> 
> Adds:
> - imx6q-apalis-ixora-v1.2.dtb: used for a Apalis iMX6 mated in an Ixora
>   V1.2 carrier board.
> - Adds disable support for a OV5640 MIPI-CSI2 Camera and a ADV7280
>   Video ADC on a parallel video input.
> 
> 
> Changes in v2:
> - Moved cleanup for things added in earlier commits of the series to
>   the those commit rather than cleaning up later.
> - Added reviewed-by tags
> - Fixed '-' vs. '_' in node name as pointed out by Fabio
> - Added "adv,force-bt656-4" property as suggested by Fabio.
> - Added commit "ARM: dts: imx6q-apalis: move gpio-keys to SoM dtsi"
>   and followed that in the commit adding the Ixora V1.2.
> - Rebased on top of imx/dt, 5.19-rc1
> 
> Denys Drozdov (1):
>   ARM: dts: imx6q-apalis: Clean-up sd card support
> 
> Max Krummenacher (11):
>   dt-bindings: arm: fsl: Add carrier for toradex,apalis-imx6q
>   Revert "ARM: dts: imx6qdl-apalis: Avoid underscore in node name"
>   ARM: dts: imx6q-apalis: Add gpio-line-names
>   ARM: dts: imx6q-apalis: Command pmic to standby for poweroff
>   ARM: dts: imx6q-apalis: Move Atmel MXT touch ctrl to SoM dtsi
>   ARM: dts: imx6q-apalis: move gpio-keys to SoM dtsi
>   ARM: dts: imx6q-apalis: Disable HDMI
>   ARM: dts: imx6q-apalis: Add support for Toradex Ixora V1.2 carrier
>     boards
>   ARM: dts: imx6q-apalis: backlight pwm: Simplify inverted backlight
>   ARM: dts: imx6q-apalis: backlight pwm: Adapt brightness steps
>   ARM: dts: imx6q-apalis: Cleanup
> 
> Oleksandr Suvorov (6):
>   ARM: dts: imx6q-apalis: Move parallel rgb interface to SoM dtsi
>   ARM: dts: imx6q-apalis: Move pinmux groups to SoM dtsi
>   ARM: dts: imx6q-apalis: Add LVDS panel support
>   ARM: dts: imx6q-apalis: Disable stmpe touchscreen
>   ARM: dts: imx6q-apalis: Add ov5640 mipi csi camera
>   ARM: dts: imx6q-apalis: Add adv7280 video input

Applied all, thanks!
