Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851F4EB64DD
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D360C433CC; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41E43C433C8;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=MeZOlM5m+FDVpib6b93oHb1wn03fQQXM2sgTZN6RhUA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ouIBRCjLW2Jht03G0BgCsPpzd50q286v8Hwk2fJwf2PNCVlGeNC+dEuKLmfBjBC26
	 x91Mu5PYy2ee8dqTgtAkGz8sIb579pVZDPSWdRk5sci0XrDrK2tWs5Kyhlrn7Ct8TX
	 qZ52GkRpAaVHDzuIAm1++xSSsUO7G+dn3Gq6JGSF2mtWA6AHXy/+nBcF+/bg+ayyLD
	 bXLjxxZ3lzZtFckGOAh8zdjNK6/fi61w88NV7ZyoziByx6aTXhajr4pZG4uzOdF2fy
	 Sn5dZGzUuUMdryDx9it8IKXsJQPfajGFx1lRNkCY8nZv1k0CSJLfueiw+oDG1EJoTJ
	 l19dPzRwkd4Vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1FE72C39563;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/45] Add support for sam9x7 SoC family
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972412.10612.3973131215416843243.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Mark Brown <broonie@kernel.org>:

On Sat, 24 Jun 2023 02:00:11 +0530 you wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v2:
> 
> [...]

Here is the summary with links:
  - [v2,01/45] dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x60, sam9x7 compatible
    (no matching commit)
  - [v2,02/45] dt-bindings: usb: ehci: Add atmel at91sam9g45-ehci compatible
    (no matching commit)
  - [v2,03/45] dt-bindings: usb: generic-ehci: Document clock-names property
    (no matching commit)
  - [v2,04/45] dt-bindings: net: cdns,macb: add documentation for sam9x7 ethernet interface
    (no matching commit)
  - [v2,05/45] ARM: at91: pm: add support for sam9x7 SoC family
    (no matching commit)
  - [v2,06/45] ARM: at91: pm: add sam9x7 SoC init config
    (no matching commit)
  - [v2,07/45] ARM: at91: add support in SoC driver for new sam9x7
    (no matching commit)
  - [v2,08/45] clk: at91: clk-sam9x60-pll: re-factor to support individual core freq outputs
    (no matching commit)
  - [v2,09/45] clk: at91: sam9x7: add support for HW PLL freq dividers
    (no matching commit)
  - [v2,10/45] clk: at91: sama7g5: move mux table macros to header file
    (no matching commit)
  - [v2,11/45] dt-bindings: clk: at91: add bindings for SAM9X7's clock controller
    (no matching commit)
  - [v2,12/45] dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7 binding
    (no matching commit)
  - [v2,13/45] dt-bindings: atmel-sysreg: add bindings for sam9x7
    (no matching commit)
  - [v2,14/45] dt-bindings: crypto: add bindings for sam9x7 in Atmel AES
    (no matching commit)
  - [v2,15/45] dt-bindings: crypto: add bindings for sam9x7 in Atmel SHA
    (no matching commit)
  - [v2,16/45] dt-bindings: crypto: add bindings for sam9x7 in Atmel TDES
    (no matching commit)
  - [v2,17/45] dt-bindings: dmaengine: at_xdmac: add compatible with microchip,sam9x7
    (no matching commit)
  - [v2,18/45] dt-bindings: i2c: at91: Add SAM9X7 compatible string
    (no matching commit)
  - [v2,19/45] dt-bindings: mfd: at91: Add SAM9X7 compatible string
    (no matching commit)
  - [v2,20/45] dt-bindings: atmel-gpbr: add microchip,sam9x7-gpbr
    (no matching commit)
  - [v2,21/45] dt-bindings: atmel-matrix: add microchip,sam9x7-matrix
    (no matching commit)
  - [v2,22/45] dt-bindings: atmel-smc: add microchip,sam9x7-smc
    (no matching commit)
  - [v2,23/45] dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
    (no matching commit)
  - [v2,24/45] dt-bindings: sdhci-of-at91: add microchip,sam9x7-sdhci
    (no matching commit)
  - [v2,25/45] dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
    (no matching commit)
  - [v2,26/45] dt-bindings: pinctrl: at91: add bindings for SAM9X7
    (no matching commit)
  - [v2,27/45] dt-bindings: rng: atmel,at91-trng: document sam9x7 TRNG
    (no matching commit)
  - [v2,28/45] dt-bindings: rtc: at91rm9200: add sam9x7 compatible
    (no matching commit)
  - [v2,29/45] dt-bindings: rtt: at91rm9260: add sam9x7 compatible
    (no matching commit)
  - [v2,30/45] dt-bindings: serial: atmel,at91-usart: add compatible for sam9x7
    (no matching commit)
  - [v2,31/45] dt-bindings: atmel-classd: add sam9x7 compatible
    (no matching commit)
  - [v2,32/45] spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible
    https://git.kernel.org/soc/soc/c/a3eb95484f27
  - [v2,33/45] dt-bindings: usb: atmel: Update DT bindings documentation for sam9x7
    (no matching commit)
  - [v2,34/45] dt-bindings: watchdog: sama5d4-wdt: add compatible for sam9x7-wdt
    (no matching commit)
  - [v2,35/45] dt-bindings: irqchip/atmel-aic5: Add support for sam9x7 aic
    (no matching commit)
  - [v2,36/45] clk: at91: sam9x7: add sam9x7 pmc driver
    (no matching commit)
  - [v2,37/45] irqchip/atmel-aic5: Add support for sam9x7 aic
    (no matching commit)
  - [v2,38/45] power: reset: at91-poweroff: lookup for proper pmc dt node for sam9x7
    (no matching commit)
  - [v2,39/45] power: reset: at91-reset: add reset support for sam9x7 SoC
    (no matching commit)
  - [v2,40/45] power: reset: at91-reset: add sdhwc support for sam9x7 SoC
    (no matching commit)
  - [v2,41/45] ARM: at91: Kconfig: add config flag for SAM9X7 SoC
    (no matching commit)
  - [v2,42/45] ARM: configs: at91: enable config flags for sam9x7 SoC family
    (no matching commit)
  - [v2,43/45] ARM: dts: at91: sam9x7: add device tree for SoC
    (no matching commit)
  - [v2,44/45] dt-bindings: arm: add sam9x75 curiosity board
    (no matching commit)
  - [v2,45/45] ARM: dts: at91: sam9x75_curiosity: add device tree for sam9x75 curiosity board
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


