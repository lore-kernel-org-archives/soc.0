Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FB0C433F5
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 02:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CED8C385AA; Thu,  5 May 2022 02:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16015C385A5;
	Thu,  5 May 2022 02:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651718863;
	bh=bQzjVMNbHAk2awAPeFMiHZKI0vi40NJe6ifRjOSuIeM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=QJAZbBG3cFqlbJbs4tlpx36WlNIeWHWvNToJ0HM1d7TyefHH0FoUiLYAMwjjNt1n5
	 i0V56+0n3NUb1V1FftCS9uBL7ncBT63JzLBHfqMmxePvVcYWRZ57FlzAbSdi0I1Z9K
	 +Ko/yWndUoU2bLoPAW7/Jhf4SQk8Dt0UI7BImxozCUmccbT9cJnrc6MMoe5WLe/NJD
	 CCB99lll8FFuLe4y0yRWmWAr+jU5ItmjZt7GPHunCdcyEHkJNoFYxV5sA0kjriCDn9
	 WJXblxxTjNHVsKDJuNrHji85pPJBnIegNlh8zcWrbe3LyTN4vPaZ07rmCzMLHgZRdA
	 Yt7b9lYKLliFA==
Date: Thu, 5 May 2022 10:47:32 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marcel Ziswiler <marcel@ziswiler.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Denys Drozdov <denys.drozdov@toradex.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Li Yang <leoyang.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	NXP Linux Team <linux-imx@nxp.com>, Olof Johansson <olof@lixom.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, soc@kernel.org
Subject: Re: [PATCH v2 00/14] ARM: dts: imx6ull-colibri: device tree
 improvements
Message-ID: <20220505024732.GO14615@dragon>
References: <20220425162356.176665-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425162356.176665-1-marcel@ziswiler.com>

On Mon, Apr 25, 2022 at 06:23:42PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> 
> This is a general update of the Colibri iMX6ULL device tree files.
> 
> The Toradex Colibri family is composed of a SoM that can be plugged on
> various carrier boards, with carrier boards allowing multiple optional
> accessories (e.g. display, camera, ...).
> 
> The device tree sources are structured into a SoM dtsi and a carrier dts
> which then includes the SoM dtsi. The SoM dtsi defines and enables the
> functionality self-contained on the SoM and prepares for the
> functionality provided by the carrier HW or accessories so that the
> carrier dts then can enable or amend nodes provided. Accessories are
> enabled in overlays depending on HW configuration.
> 
> Please find the following colibri-imx6ull device trees improvements:
> 
> - MMC/SD
> The original Colibri specification only defined 3.3 volt TTL signaling
> and relied on external on-carrier pull-ups for the SD_DATA[0..3] lines.
> The latest carrier boards like Iris V2 on the other hand are now UHS-I
> compliant by leaving such external on-carrier pull-ups away relying on
> module- or even SoC-level ones which pull up to resp. signaling voltage.
> In such cases, the carrier board-level device tree may explicitly delete
> the no-1-8-v property to enable full UHS-I support.
> Also, fix SD/MMC regulator for the carrier boards using UHS-I modes.
> 
> - FEC
> Provide a proper phy-supply for the FEC, actually switched by the 50 Mhz
> RMII interface clock using a regulator-fixed-clock that is now properly
> stated. The reference commit for such regulator can be found at commit
> 8959e5324485 ("regulator: fixed: add possibility to enable by clock").
> 
> - I2C
> Switched on 22 kOhm pull-ups and lower the I2C frequency to 40 kHz to
> get more reliable communication.
> 
> - Atmel Touchscreen
> The Toradex 7" Capacitive and 10" LVDS touch screens are Atmel MXT
> peripherals available on the I2C bus for touchscreen events. Add
> atmel_mxt_ts node to the module-level device tree. Also, provide pinmux
> configuration for the INT/RST inputs from SODIMM pins 106/107 for most
> carrier boards or an external touchscreen adapter inputs configured to
> SODIMM pins 28/30.
> 
> Changes in v2:
> - Fixed pinctrl node names as suggested by Shawn.
> - Fixed long line as pointed out by Rob's bot.
> - Added V3 to Colibri Evaluation Board as done elsewhere.
> - Fix alphabetical node order as suggested by Shawn.
> - Dropped [PATCH v1 02/14] ARM: dts: imx6ull-colibri: fix vqmmc
>   regulator which already got applied by Shawn. Thanks!
> - New commit with pinctrl node name improvements as suggested by Shawn.
> 
> Denys Drozdov (5):
>   ARM: dts: imx6ull-colibri: add touchscreen device nodes
>   ARM: dts: imx6ull-colibri: update device trees to support overlays
>   dt-bindings: arm: fsl: add toradex,colibri-imx6ull
>   ARM: dts: imx6ull-colibri: add support for toradex iris carrier boards
>   ARM: dts: imx6ull-colibri: add support for toradex aster carrier
>     boards
> 
> Marcel Ziswiler (4):
>   ARM: dts: imx6ull-colibri: fix nand bch geometry
>   ARM: dts: imx6ull-colibri: add/update some comments
>   ARM: dts: imx6ull-colibri: move gpio-keys node to som dtsi
>   ARM: dts: imx6ull-colibri: improve pinctrl node names
> 
> Max Krummenacher (1):
>   ARM: dts: imx6ull-colibri: change touch i2c parameters
> 
> Oleksandr Suvorov (1):
>   ARM: dts: imx6ull-colibri: add gpio-line-names
> 
> Philippe Schenker (3):
>   ARM: dts: imx6ull-colibri: use pull-down for adc pins
>   ARM: dts: imx6ull-colibri: add phy-supply to fec
>   ARM: dts: imx6ull-colibri: update usdhc1 pixmux and signaling

The dts series doesn't apply to my branch.

Applying: ARM: dts: imx6ull-colibri: use pull-down for adc pins
Applying: ARM: dts: imx6ull-colibri: change touch i2c parameters
Applying: ARM: dts: imx6ull-colibri: add phy-supply to fec
Applying: ARM: dts: imx6ull-colibri: add touchscreen device nodes
Applying: ARM: dts: imx6ull-colibri: update usdhc1 pixmux and signaling
error: patch failed: arch/arm/boot/dts/imx6ull-colibri.dtsi:35
error: arch/arm/boot/dts/imx6ull-colibri.dtsi: patch does not apply
Patch failed at 0005 ARM: dts: imx6ull-colibri: update usdhc1 pixmux and signaling
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Applying: ARM: dts: imx6ull-colibri: update device trees to support overlays
Applying: ARM: dts: imx6ull-colibri: add gpio-line-names
Applying: ARM: dts: imx6ull-colibri: add support for toradex iris carrier boards
Applying: ARM: dts: imx6ull-colibri: add support for toradex aster carrier boards
Applying: ARM: dts: imx6ull-colibri: fix nand bch geometry
Applying: ARM: dts: imx6ull-colibri: add/update some comments
error: patch failed: arch/arm/boot/dts/imx6ull-colibri.dtsi:251
error: arch/arm/boot/dts/imx6ull-colibri.dtsi: patch does not apply
Patch failed at 0011 ARM: dts: imx6ull-colibri: add/update some comments
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Applying: ARM: dts: imx6ull-colibri: move gpio-keys node to som dtsi
Applying: ARM: dts: imx6ull-colibri: improve pinctrl node names
error: patch failed: arch/arm/boot/dts/imx6ull-colibri.dtsi:292
error: arch/arm/boot/dts/imx6ull-colibri.dtsi: patch does not apply
Patch failed at 0013 ARM: dts: imx6ull-colibri: improve pinctrl node names
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.

Shawn
