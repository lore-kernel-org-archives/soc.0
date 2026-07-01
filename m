Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C4B36C9E4;
	Wed,  1 Jul 2026 21:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941143; cv=none; b=YrDB9FrtjBjNwipAKRyDpBMtIIO8csbOm6EVBcdQ6zOVjkfAKGtgZzgrEJOTObjTsiNuIX8iFcDHkk68g6qjMIqJ9GU1Z3DVfBYI2vZC5DvQkMR7AsXZg8FSFdYoCfxbiW5loNYAa7+3yOYxGdxdz+z1TtftGbYx/2LY+nq+8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941143; c=relaxed/simple;
	bh=JvPRJ2sOlQjQTnVS8jmUjlWmh8btfgjiDxlS+BDBRcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SValUMc7R+B1Abgi2oQNS+3xPj6f2fDF2JJojvEhXX3Oica6Hepx9AgOl/V23gEpHyVgOChEJWrwXgrabyWcYUq+Zjfho1TtNwXz0ok26EGuqkWOTYbg9L5q0ejaalMOFTVpN0MBCtWlPUwiuv+XdKnwHSeb/suziyuYxh+kWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drMX/zVM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drMX/zVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691811F00A3A;
	Wed,  1 Jul 2026 21:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941139;
	bh=99rTkGtMEhY28UmP5cIJYBXAGUjxeodjcs2HZAq97+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=drMX/zVMUi6s614tuhfwQRqRrQHr6+zq4Y5CybzpIA2njdUcZR+VYgbQICRIUsuVW
	 vtqQsl310YGSy/QMtESwwJkMisKBLCpbg/FSD5DHIVy8NA73wp7EqpgYCMK0/MSi55
	 7zSzytbdEkCy+FheLAH3R/jru4JEgnlpV9Fi56BjSLVoKxD5HxBd4PSZzOlvtacIaS
	 QF6VorAoIbPH2jD72LBHyFDyp6vtothOeXCYxk+1hPiPGvbrGfT8wd6pRvR0YtEvyS
	 QWtQ4qGgmJepkhuR8ecSWbPT3fYTFUNVwawVD70Uf0rYQl7FdHpPPftXks3ZD53T7Y
	 qIQGzxzdGrf8Q==
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
Subject: [PATCH v2 11/19] ARM: mark ARCH_DOVE as deprecated
Date: Wed,  1 Jul 2026 23:23:45 +0200
Message-Id: <20260701212353.2196041-12-arnd@kernel.org>
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

The Marvell Armada 510 (Dove) platform is supported both as devicetree
and atags/boardfile variants, with varying degrees of hardware support.

Russell was the last known user of the board file version, and there
are very few users overall. Unless Russell still needs this variant,
let's remove after the next LTS kernel, leaving the CONFIG_MACH_DOVE
variant with devicetree.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-dove/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-dove/Kconfig b/arch/arm/mach-dove/Kconfig
index 996888ffcfe7..f547120e223e 100644
--- a/arch/arm/mach-dove/Kconfig
+++ b/arch/arm/mach-dove/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig ARCH_DOVE
-	bool "Marvell Dove" if ARCH_MULTI_V7
+	bool "Marvell Dove (DEPRECATED)" if ARCH_MULTI_V7
 	depends on ATAGS
 	select CPU_PJ4
 	select GPIOLIB
@@ -11,7 +11,11 @@ menuconfig ARCH_DOVE
 	select PM_GENERIC_DOMAINS if PM
 	select PCI_QUIRKS if PCI
 	help
-	  Support for the Marvell Dove SoC 88AP510
+	  Support for the Marvell Dove SoC 88AP510 using board files.
+
+	  Support for this machine will be removed in early 2027, unless
+	  there is a strong reason to keep it. Users should migrate to
+	  the devicetree-enabled version (CONFIG_MACH_DOVE) instead.
 
 if ARCH_DOVE
 
-- 
2.39.5

