Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0903148D3;
	Wed,  1 Jul 2026 21:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941056; cv=none; b=a38ay3hNMp4uR/wgcwJWICCbe+jO2esEgnxr+QYCax6FEqEaWVFf7vB0PvZLxTCAQ616Nn2v7ittQhOkWcLvUsoRFz6R2BX54AqPSiohwV5Paa5+YxeFkPJM4bcOdcEFrZ9Pv3kRXQ26i8kYfHmH1RQdDKjrBfV4beMY7+MiHg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941056; c=relaxed/simple;
	bh=Fwk5n9CMCODTSLDjM3MpbBMEDiM9G8X/32HUrh3Ia7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=On39PKy1W8UaZFtnY3bhMZTboQkXrVlfyz+AZwlPyznULEvlRpF8u6HU4SHTvU43iVqTC4rSQ9HP+tfb8dtcMDEnyCfD6wgNV18OVXhxFycUob19adQEU+Am1lHVUPkiDNDcR9N0SMl+ZLOp+pPkqLWA7U6BGRnAcvzdJjixpas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8tuvdzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8tuvdzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8A81F000E9;
	Wed,  1 Jul 2026 21:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941054;
	bh=gTkyVTtRcMZcPdurXsovV6wnw2YiFl8CfGd3WXFslWg=;
	h=From:To:Cc:Subject:Date;
	b=l8tuvdzS6vqSGYe7YseaFCuQoFtR3O8BvY+Xzyz/rFyCEsAAcZOWTealhoulFa5xT
	 5WJTsD+SM1bjE6wDODWiZlD4mvZjsb6BDqWqckTZbPliWJTmliIkQCH9JGWa/Kwxzd
	 JjqILqvFp4jgn6R3YUq40W942a0E4j3vMnd5+FkSEpJsqp6oKUL0ECgWHQj/oi+sTB
	 H9yB5lqGEQrnrSykZRRx0vce+3oAnkRcTpa2xop0j4JJVG3xU4UkGfqNikHSt9YGpg
	 8OcOTo5hgNeP8U7u62W6AbETRxnpqFunB6Ygg3U1BRWYpskcv+zuPaK+PjCjqjEeov
	 geqfigj8ljHgA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 00/19] ARM: platform and feature deprecation
Date: Wed,  1 Jul 2026 23:23:34 +0200
Message-Id: <20260701212353.2196041-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Sorry for dropping the ball on v1 of this series almost two years ago.
This is attempt to bring the source code to the state that we discussed
back in 2024, regarding a timeline for deprecating and removing features,
in particular platforms and ABIs that are basically unused and are
also getting in the way of maintenance.

The earlier consensus was to remove these features in 2025 or 2026
after the corresponding LTS kernel release. I would suggest pushing
these to early 2027 now, see the patch description for details on
each one:

 - all board files that are still not converted to DT
   (except for OMAP1 and S3C)

 - iWMMXt FPU support

 - ARMv6/ARM1136r0 (not ARMv6K/ARM1136r1/ARM1176) along with the
   OMAP24xx and i.MX31 SoCs using it

 - Cortex-M3/M4/M7 based microcontroller support
   (stm32, imxrt, lpc18xx, samv7)

 - LSI Axxia platform

 - OABI, OABI-compat and NWFPE are confined to StrongARM based
   builds and scheduled for removal once StrongARM is gone.

 - DEPRECATED_PARAM_STRUCT, which was originally scheduled for
   removal in 2006 (!)

The ARCH_S3C64XX platform was scheduled for removal in 2024, but is
still actively used and will get removed once Mark Brown stops using
it. The OMAP1 platform has some remaining boardfiles and is expected to
get converted to DT.

Big-endian ARMv7 CPU support is not scheduled for removal but marked
as broken the same way as ARM64 has, to reduce the need for testing
unused configurations. This may be removed in the future if arm64 does
it as well (note: big-endian ARMv5 support is not deprecated because
it is used by ixp4xx).

Regarding actually removing the code, I would suggest linux-7.4 (January
2027), removing both the board files and any drivers that have either
become newly unused or were missed in a previous machine removal series,
followed by removing support for then unused CPUs a release later.

Maintainers of the above features, please provide Acks or let me know
if you think any of them need to hand around for longer.

Changes since v1:

  - fix build failures for ARMv6 patch
  - update timelines
  - add a few more patches for features that were not
    quite as obsolete two years ago

Links to previous discussion:

  https://lore.kernel.org/linux-arm-kernel/20210109174357.GB1551@shell.armlinux.org.uk/
  https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/
  https://lore.kernel.org/all/20241204102904.1863796-1-arnd@kernel.org/

Arnd Bergmann (19):
  ARM: use CONFIG_AEABI by default everywhere
  ARM: limit OABI support to StrongARM CPUs
  ARM: rework ARM11 CPU selection logic
  ARM: deprecate support for ARM1136r0
  ARM: turn CONFIG_ATAGS off by default
  ARM: mark CPU_ENDIAN_BE8 as deprecated
  ARM: update DEPRECATED_PARAM_STRUCT removal timeline
  ARM: s3c64xx: extend deprecation schedule
  ARM: update FPE_NWFPE help text
  ARM: mark IWMMXT as deprecated
  ARM: mark ARCH_DOVE as deprecated
  ARM: PXA: mark remaining board files as deprecated
  ARM: orion5x: mark all board files as deprecated
  ARM: mark mach-sa1100 as deprecated
  ARM: mark RiscPC as deprecated
  ARM: mark footbridge as deprecated
  ARM: mark Cortex-M3/M4/M7 based boards as deprecated
  ARM: mark axxia platform as deprecated
  ARM: mark mv78xx0 support as deprecated

 arch/arm/Kconfig                        | 80 ++++++++++++++-----------
 arch/arm/Kconfig.platforms              |  2 +-
 arch/arm/configs/am200epdkit_defconfig  |  3 +-
 arch/arm/configs/aspeed_g4_defconfig    |  2 -
 arch/arm/configs/aspeed_g5_defconfig    |  1 -
 arch/arm/configs/assabet_defconfig      |  3 +
 arch/arm/configs/at91_dt_defconfig      |  2 -
 arch/arm/configs/axm55xx_defconfig      |  2 -
 arch/arm/configs/bcm2835_defconfig      |  1 -
 arch/arm/configs/clps711x_defconfig     |  1 -
 arch/arm/configs/collie_defconfig       |  2 +-
 arch/arm/configs/davinci_all_defconfig  |  1 -
 arch/arm/configs/dove_defconfig         |  2 +-
 arch/arm/configs/ep93xx_defconfig       |  1 -
 arch/arm/configs/footbridge_defconfig   |  2 +
 arch/arm/configs/gemini_defconfig       |  1 -
 arch/arm/configs/h3600_defconfig        |  3 +-
 arch/arm/configs/hisi_defconfig         |  1 -
 arch/arm/configs/imx_v4_v5_defconfig    |  1 -
 arch/arm/configs/integrator_defconfig   |  2 -
 arch/arm/configs/ixp4xx_defconfig       |  1 -
 arch/arm/configs/jornada720_defconfig   |  3 +-
 arch/arm/configs/keystone_defconfig     |  1 -
 arch/arm/configs/lpc32xx_defconfig      |  1 -
 arch/arm/configs/mmp2_defconfig         |  1 -
 arch/arm/configs/moxart_defconfig       |  2 -
 arch/arm/configs/mps2_defconfig         |  1 -
 arch/arm/configs/multi_v4t_defconfig    |  2 -
 arch/arm/configs/multi_v5_defconfig     | 10 ----
 arch/arm/configs/mv78xx0_defconfig      |  3 +-
 arch/arm/configs/mvebu_v5_defconfig     | 10 ----
 arch/arm/configs/mxs_defconfig          |  1 -
 arch/arm/configs/neponset_defconfig     |  3 +
 arch/arm/configs/netwinder_defconfig    |  3 +
 arch/arm/configs/nhk8815_defconfig      |  1 -
 arch/arm/configs/omap1_defconfig        |  3 +-
 arch/arm/configs/orion5x_defconfig      | 11 ----
 arch/arm/configs/pxa168_defconfig       |  2 -
 arch/arm/configs/pxa3xx_defconfig       |  2 -
 arch/arm/configs/pxa910_defconfig       |  2 -
 arch/arm/configs/pxa_defconfig          |  5 --
 arch/arm/configs/rpc_defconfig          |  3 +
 arch/arm/configs/s3c6400_defconfig      |  2 +
 arch/arm/configs/sama5_defconfig        |  1 -
 arch/arm/configs/sama7_defconfig        |  1 -
 arch/arm/configs/spear13xx_defconfig    |  1 -
 arch/arm/configs/spitz_defconfig        |  2 +-
 arch/arm/configs/stm32_defconfig        |  3 +-
 arch/arm/configs/versatile_defconfig    |  2 -
 arch/arm/configs/vt8500_v6_v7_defconfig |  1 -
 arch/arm/configs/wpcm450_defconfig      |  2 -
 arch/arm/mach-at91/Kconfig              |  4 +-
 arch/arm/mach-axxia/Kconfig             |  4 +-
 arch/arm/mach-dove/Kconfig              |  8 ++-
 arch/arm/mach-footbridge/Kconfig        |  7 ++-
 arch/arm/mach-imx/Kconfig               | 13 +++-
 arch/arm/mach-mv78xx0/Kconfig           |  4 +-
 arch/arm/mach-omap2/Kconfig             | 18 ++++--
 arch/arm/mach-orion5x/Kconfig           | 47 +++++++++++----
 arch/arm/mach-pxa/Kconfig               | 10 +++-
 arch/arm/mach-rpc/Kconfig               |  5 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx       | 15 +++--
 arch/arm/mach-sa1100/Kconfig            |  5 +-
 arch/arm/mach-stm32/Kconfig             | 14 +++--
 arch/arm/mach-versatile/Kconfig         | 15 +++--
 arch/arm/mm/Kconfig                     | 29 ++++++++-
 66 files changed, 227 insertions(+), 170 deletions(-)

-- 
2.39.5

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
