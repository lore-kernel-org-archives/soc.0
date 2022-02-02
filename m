Return-Path: <SRS0=1Svv=SR=ravnborg.org=sam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6F6C433F5
	for <soc@archiver.kernel.org>; Wed,  2 Feb 2022 18:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AEE6C340F2; Wed,  2 Feb 2022 18:14:21 +0000 (UTC)
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com [91.221.196.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB9B3C004E1
	for <soc@kernel.org>; Wed,  2 Feb 2022 18:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB9B3C004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=ravnborg.org
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
	by mx1.smtp.larsendata.com (Halon) with ESMTPS
	id 12f30462-8454-11ec-b20b-0050568c148b;
	Wed, 02 Feb 2022 18:15:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sam@ravnborg.org)
	by mail01.mxhotel.dk (Postfix) with ESMTPSA id 67A6F194BFA;
	Wed,  2 Feb 2022 19:14:11 +0100 (CET)
Date: Wed, 2 Feb 2022 19:14:08 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: nick.hawkins@hpe.com
List-Id: <soc.lore.kernel.org>
Cc: verdun@hpe.com, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Corey Minyard <minyard@acm.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Hao Fang <fanghao11@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Wang Kefeng <wangkefeng.wang@huawei.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Message-ID: <YfrJ8JWjyH9ptV4z@ravnborg.org>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202165315.18282-1-nick.hawkins@hpe.com>

Hi Nick,

good to see all this stuff coming mainline,

On Wed, Feb 02, 2022 at 10:52:50AM -0600, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> GXP is the name of the HPE SoC.
> This SoC is used to implement BMC features of HPE servers
> (all ProLiant, Synergy, and many Apollo, and Superdome machines)
> It does support many features including:
> 	ARMv7 architecture, and it is based on a Cortex A9 core
> 	Use an AXI bus to which
> 		a memory controller is attached, as well as
>                  multiple SPI interfaces to connect boot flash,
>                  and ROM flash, a 10/100/1000 Mac engine which
>                  supports SGMII (2 ports) and RMII
> 		Multiple I2C engines to drive connectivity with a host infrastructure
> 		A video engine which support VGA and DP, as well as
>                  an hardware video encoder
> 		Multiple PCIe ports
> 		A PECI interface, and LPC eSPI
> 		Multiple UART for debug purpose, and Virtual UART for host connectivity
> 		A GPIO engine
> This Patch Includes:
> 	Documentation for device tree bindings
> 	Device Tree Bindings
> 	GXP Timer Support
> 	GXP Architecture Support
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  .../bindings/display/hpe,gxp-thumbnail.txt    |  21 +
>  .../devicetree/bindings/gpio/hpe,gxp-gpio.txt |  16 +
...

All new bindings must be in the DT-schema format (yaml files).
This enables a lot of syntax checks and validation.

We are slowly migrating away from the .txt based bindings.

Also, for new bindings please follow the guide lines listed in
Documentation/devicetree/bindings/submitting-patches.rst

Consider including the bindings with the drivers using the bindings so
things have a more natural split.

	Sam
