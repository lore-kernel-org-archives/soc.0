Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B9AC43334
	for <soc@archiver.kernel.org>; Sun, 19 Jun 2022 01:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 183FBC341C4; Sun, 19 Jun 2022 01:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A901C3411A;
	Sun, 19 Jun 2022 01:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655602469;
	bh=S7Y1J52qrHirAek1G02MEtXcsbCO/KTmXjFcp8elp3I=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=I6T7NIFSNkCciX+Wx55GODvrj/jlxvMP2WYpYzT4GtVFKBMeurMp1Bf9W2UJtsVkl
	 +BJ4Lxpk9XR4A5h+uakalgBICh1dnzTyUMky7sF6g2lhW+H5hc+g1mHMM3fNpGxeeA
	 Ta73faWZ/cLORGln8cMjvYKugvhMwXGVD9c97HZlan4XVpDT1/ekmDp9m/Qjo8HlCP
	 FyiCbJf+mfsbXKPfi4wKlXd5AIUGvOgDDZm0K4ccGNp4ZcNbkbGWkScdoC/nZH1tfk
	 Yzq+8dtveEYIMhXXy4N9NTLhVIWNcqiGqvWHzAGEzv7hz+fz9hPewD7oxda5eqfy6v
	 nQY/d2xgSMjug==
Date: Sun, 19 Jun 2022 09:34:20 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Marcel Ziswiler <marcel@ziswiler.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Denys Drozdov <denys.drozdov@toradex.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Li Yang <leoyang.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	NXP Linux Team <linux-imx@nxp.com>, Olof Johansson <olof@lixom.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	SoC Team <soc@kernel.org>
Subject: Re: [PATCH v2 00/24] ARM: dts: imx7-colibri: device tree improvements
Message-ID: <20220619013420.GW254723@dragon>
References: <20220516134734.493065-1-marcel@ziswiler.com>
 <20220611091613.GH254723@dragon>
 <CAL_JsqJ5VhU+_QXejPYRSOpkC8Q=gJ7BzYHwqaTw9Pb1Wa04tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ5VhU+_QXejPYRSOpkC8Q=gJ7BzYHwqaTw9Pb1Wa04tg@mail.gmail.com>

On Tue, Jun 14, 2022 at 09:00:26AM -0600, Rob Herring wrote:
> On Sat, Jun 11, 2022 at 3:16 AM Shawn Guo <shawnguo@kernel.org> wrote:
> >
> > On Mon, May 16, 2022 at 03:47:10PM +0200, Marcel Ziswiler wrote:
> > > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > >
> > >
> > > This is a general update of the Colibri iMX7 device tree files.
> > >
> > > The Toradex Colibri family is composed of a SoM that can be plugged on
> > > various carrier boards, with carrier boards allowing multiple optional
> > > accessories (e.g. display, camera, ...).
> > >
> > > The device tree sources are structured into a SoM dtsi and a carrier dts
> > > which then includes the SoM dtsi. The SoM dtsi defines and enables the
> > > functionality self-contained on the SoM and prepares for the
> > > functionality provided by the carrier HW or accessories so that the
> > > carrier dts then can enable or amend nodes provided. Accessories are
> > > enabled in overlays depending on HW configuration.
> > >
> > > Please find the following colibri-imx7 device trees improvements:
> > >
> > > - Display/Touch Functionality Overhaul
> > > Rename display interface to match other modules to make it easier to
> > > use device tree overlays.
> > > The parallel RGB interface (lcdif) and all related stuff turn on in a
> > > device tree overlay. Keep them disabled in the main devicetree.
> > > As these subsystems are provided by module and not a part of boards,
> > > move their definitions into the module-level devicetree.
> > > Disable ad7879 touchscreen which turns on in a devic tree overlay.
> > > Remains it disabled in the main devicetree.
> > > The Toradex 7" Capacitive and 10" LVDS touch screens are Atmel MXT
> > > peripherals available on the I2C bus for touchscreen events. Add
> > > atmel_mxt_ts node to the module-level device tree. Also, provide pinmux
> > > configuration for the INT/RST inputs from SODIMM pins 106/107 for most
> > > carrier boards or an external touchscreen adapter inputs configured to
> > > SODIMM pins 28/30.
> > >
> > > - Ethernet Improvements
> > > Add the MDIO bus with the respective PHY.
> > > Add Ethernet aliases which is required to properly pass MAC address
> > > from bootloader.
> > > Add delay for on-module phy supply.
> > >
> > > - USB Device/Host Switching
> > > Add usb dual-role switching using extcon.
> > >
> > > - MMC/SD
> > > The original Colibri specification only defined 3.3 volt TTL signaling
> > > and relied on external on-carrier pull-ups for the SD_DATA[0..3] lines.
> > > The latest carrier boards like Iris V2 on the other hand are now UHS-I
> > > compliant by leaving such external on-carrier pull-ups away relying on
> > > module- or even SoC-level ones which pull up to resp. signaling voltage.
> > > In such cases, the carrier board-level device tree may explicitly delete
> > > the no-1-8-v property to enable full UHS-I support.
> > > Also, fix SD/MMC regulator for the carrier boards using UHS-I modes.
> > >
> > > - Add Iris and Iris V2 Carrier Board Device Trees
> > > Add support for Toradex Iris carrier boards.
> > >
> > > Changes in v2:
> > > - Add Krzysztof's acked-by. Thanks!
> > > - Revert change on arch/arm/boot/dts/imx6dl-colibri-iris.dts which
> > >   slipped into this patch set by error.
> > > - Re-based on top of Shawn's for-next.
> > >
> > > Marcel Ziswiler (18):
> > >   ARM: dts: imx7-colibri: overhaul display/touch functionality
> > >   ARM: dts: imx7-colibri: add mdio phy node
> > >   ARM: dts: imx7-colibri: move aliases, chosen, extcon and gpio-keys
> > >   ARM: dts: imx7-colibri: move regulators
> > >   ARM: dts: imx7-colibri: clean-up usdhc1 and add sleep config
> > >   ARM: dts: imx7-colibri: move rtc node
> > >   ARM: dts: imx7d-colibri-emmc: add cpu1 supply
> > >   ARM: dts: imx7-colibri-eval-v3: correct can controller comment
> > >   ARM: dts: imx7-colibri: disable adc2
> > >   ARM: dts: imx7-colibri-aster: add ssp aka spi cs aka ss pins
> > >   ARM: dts: imx7-colibri: add clarifying comments
> > >   ARM: dts: imx7-colibri: alphabetical re-order
> > >   ARM: dts: imx7-colibri: clean-up device enabling/disabling
> > >   ARM: dts: imx7-colibri: remove leading zero from reg address
> > >   ARM: dts: imx7-colibri: set regulator-name properties
> > >   ARM: dts: imx7-colibri: clean-up iomuxc pinctrl group naming
> > >   dt-bindings: arm: fsl: add toradex,colibri-imx7s/d/d-emmc-iris/-v2
> > >   ARM: dts: imx7-colibri: add support for Toradex Iris carrier boards
> > >
> > > Max Krummenacher (1):
> > >   ARM: dts: imx7-colibri: add ethernet aliases
> > >
> > > Oleksandr Suvorov (3):
> > >   ARM: dts: imx7-colibri: improve licensing and compatible strings
> > >   ARM: dts: imx7-colibri: improve wake-up with gpio key
> > >   ARM: dts: imx7-colibri: add delay for on-module phy supply
> > >
> > > Philippe Schenker (1):
> > >   ARM: dts: imx7-colibri: add usb dual-role switching using extcon
> > >
> > > Stefan Agner (1):
> > >   ARM: dts: imx7-colibri: set lcdif clock source to video pll
> >
> > Applied all, thanks!
> 
> Not completely sure, but I think this series adds a warning to linux-next:
> 
> ./Documentation/devicetree/bindings/arm/fsl.yaml:684:111: [warning]
> line too long (111 > 110 characters) (line-length)

Thanks for spotting it, Rob!

It seems to be another separate patch [1].  I will fix it.

Shawn

[1] https://lore.kernel.org/linux-arm-kernel/20220506145720.291735-1-marcel@ziswiler.com/
