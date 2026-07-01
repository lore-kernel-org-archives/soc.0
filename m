Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254303BB126;
	Wed,  1 Jul 2026 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941088; cv=none; b=R47iOS/9Ve0h1oIQSKxI3CH/L6MnONn7C1HK6MSYNQMgHo2bTSkdTADlbmdmvhzQQtImw9VA2dbwlzwAHEtQ/48MjQhUyPO1ZO0upF4T6GPDhDAQ4Tr8CC7Lf6+UAssMSYz3irILvjQS0kiseyLlwCJPwiCrDgaVx1LaMD2/WJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941088; c=relaxed/simple;
	bh=pFyl1c/W8Aa+3xbgqYeG/LUWsYQKksAj78TnHIEH3QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mGdNFXLMt+TmXwJ6CVPbT8S1wI4wJg2QNmNGl1fxoNELRN4V3IHJ1WoUCqJ7o7Q30rp+L6+dDjSXysP7X5liaJyD5oIW9VZVwD9sM7RWd3WogbETybO0uEto8YujNvDKzk9s5utBWtOKGhBbzouV0o/7QQsyWzcLlQzpgyxa6X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuaa7Rz1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuaa7Rz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD861F000E9;
	Wed,  1 Jul 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941085;
	bh=vLx/iEsRuv2uj6cpHmGsY4bubQffaS78ScCm1mMJrGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fuaa7Rz1gbu989is+E1RaAOW8+RzHNQ5dEpFCPSCCOFAZd2dGsl1aby/TzX4zQmTz
	 4g+TZBXV2KWudX5XgzjttBoUkzmgZ9RyCOQy3Vws+1jrlmbX6HQgvYRnOPTEfcBH0Q
	 LW9bgW1EaJzBX3jvUk1VljCmzVCRQ95tqCrq8QIb7tVL3oHLBvjwNitJZqDmzbLQ9r
	 nutNkaGPr2kw84QAyKVZyA1eEWRH/kHgMkoJki2+ll35I7/4gakRfQ+0U9mWCDs1Cv
	 n23ZoNVlGp7zoaE1HhifWcW2r0wa2LmdOuN0ZMVlAflpyDNp5trTINp9c0sAsVRHVT
	 dqYz6hqlbpfBw==
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
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 04/19] ARM: deprecate support for ARM1136r0
Date: Wed,  1 Jul 2026 23:23:38 +0200
Message-Id: <20260701212353.2196041-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260701212353.2196041-1-arnd@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This CPU revision remains a special case as it is now incompatible
with CONFIG_SMP. Only the Nokia N8x0 is used in practice, and even
that one is fairly rare these days, so let's plan to remove all of
them after the 2026 LTS kernel release.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-imx/Kconfig       |  5 ++++-
 arch/arm/mach-omap2/Kconfig     | 15 ++++++++++++---
 arch/arm/mach-versatile/Kconfig |  5 ++++-
 arch/arm/mm/Kconfig             |  2 ++
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 041e73ad203a..f85a5f8c0a58 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -40,13 +40,16 @@ if ARCH_MULTI_V6
 comment "ARM1136 platforms"
 
 config SOC_IMX31
-	bool "i.MX31 support"
+	bool "i.MX31 support (DEPRECATED)"
 	depends on !SMP
 	select CPU_ARM1136R0
 	select MXC_AVIC
 	help
 	  This enables support for Freescale i.MX31 processor
 
+	  This SoC is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
+
 config SOC_IMX35
 	bool "i.MX35 support"
 	select CPU_ARM1136R1
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 13987ffbba00..79f8afe3a6bf 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -207,18 +207,24 @@ comment "OMAP Core Type"
 	depends on ARCH_OMAP2
 
 config SOC_OMAP2420
-	bool "OMAP2420 support"
+	bool "OMAP2420 support (DEPRECATED)"
 	depends on ARCH_OMAP2
 	default y
 	select OMAP_DM_SYSTIMER
 	select OMAP_DM_TIMER
 	select SOC_HAS_OMAP2_SDRC
+	help
+	  This SoC is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
 
 config SOC_OMAP2430
-	bool "OMAP2430 support"
+	bool "OMAP2430 support (DEPRECATED)"
 	depends on ARCH_OMAP2
 	default y
 	select SOC_HAS_OMAP2_SDRC
+	help
+	  This SoC is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
 
 config SOC_OMAP3430
 	bool "OMAP3430 support"
@@ -249,11 +255,14 @@ config MACH_NOKIA_N810_WIMAX
 	bool
 
 config MACH_NOKIA_N8X0
-	bool "Nokia N800/N810"
+	bool "Nokia N800/N810 (DEPRECATED)"
 	depends on SOC_OMAP2420
 	default y
 	select MACH_NOKIA_N810
 	select MACH_NOKIA_N810_WIMAX
+	help
+	  This machine is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
 
 endmenu
 
diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
index de42da7de8c8..1ee9b6608d71 100644
--- a/arch/arm/mach-versatile/Kconfig
+++ b/arch/arm/mach-versatile/Kconfig
@@ -110,11 +110,14 @@ config INTEGRATOR_CM1026EJS
 	select CPU_ARM1026
 
 config INTEGRATOR_CM1136JFS
-	bool "Integrator/CM1136JF-S core module"
+	bool "Integrator/CM1136JF-S core module (DEPRECATED)"
 	depends on ARCH_INTEGRATOR_AP
 	depends on ARCH_MULTI_V6
 	depends on !SMP
 	select CPU_ARM1136R0
+	help
+	  This machine is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
 
 config ARCH_INTEGRATOR_CP
 	bool "Support Integrator/CP platform"
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index f3d71e89a31f..27010b9389ad 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -410,6 +410,8 @@ config CPU_ARM1136R0
 	help
 	  These early revisions of ARM1136 lack support for the
 	  ARMv6k extensions for multiprocessing.
+	  Support for this revision is scheduled for removal
+	  from the kernel in early 2027.
 
 config CPU_ARM1136R1
 	bool
-- 
2.39.5

