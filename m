Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0DB3C13EC;
	Wed,  1 Jul 2026 21:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941179; cv=none; b=HjhD0o1AE5ipHfAkXObx5TO9aImvxEWrzVrxpSdRiH9dWuj1SFDluUhoLalaDjb6a16go04Izyz3oLuR7zfx9R0XjXyVN6XmFYxcmTf70Giuo1z0QezPKaehBS9e4wLP+i7YJTNrAoX8IwXwH5nz2/yLx7zqrJ9Cf254Tc5OXPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941179; c=relaxed/simple;
	bh=uxNjB5QuoBAO9JvKfaH1I63LAqb9LjaR/qx3z6uVHyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XL3neIRUfbsSGiGFvrWa0heX2miBPPdo3QL8/1bSfIOpJSEagjdBfODzcytMowQ8+XnidJfgN8I0tCDv0hgmM7RLmdNtellZyZlzd8ocapuoBKRArz0iXlyIt75wWv8ftt5a7PuOFyBd0A+K51cQMJCZEI0cuxJS9GzWJnyKdyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxgA8TWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxgA8TWC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74B81F000E9;
	Wed,  1 Jul 2026 21:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941178;
	bh=claxqKdJjDBG4bp86+Kgv1KwKi6DWddvXbYHWowqs7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YxgA8TWC2w0t5bEKvxhTKBYvk7Q93vFUa2kdPOexxkZDugTuHJgugP5p6ZsMhC6FM
	 24o3Im+1r0Yth6zWiAgs+B8e4CKfrdO80T/2/lb4m590l/zB55VHHD0jVGsbH4K+zR
	 p8ZMPrE/Rw5/d5am40SxvfXIm6A/FCBicZuUGRr0QIs094BFHaMdZNoRPq9XIHR0j5
	 7FCCqyF6YM+7TrtIvz9+j2vGtL5MPnX0bRhtdpOxQICtrixOL3jeHXSA2l5gxzPv66
	 eHxwpZa6pw6N9T+7yAZCwCSF8e45nan7GNd33X63wLNFH1T5E+sD0WZ5VhicmkAFN+
	 vdA3j3ec7kFzQ==
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
Subject: [PATCH v2 16/19] ARM: mark footbridge as deprecated
Date: Wed,  1 Jul 2026 23:23:50 +0200
Message-Id: <20260701212353.2196041-17-arnd@kernel.org>
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

Along with RiscPC and SA1100, these are the last remaining Intel StrongARM
machines. The Corel NetWinder used to be particular popular in the late
1990s, but was discontinued during the bankruptcy of rebel.com in 2001.
The other machine is the DEC (later Intel) EBSA285 evaluation board that
was made in small numbers in 1997 for software developers.

The footbridge/netwinder platform was the main target for the first Debian
2.0 "Hamm" release on the Arm architecture back in 1998, but was dropped
in Debian 6.0 "Squeeze" in 2011, which only supported ARMv4T and higher
with the EABI based ports as ARMv4 hardware had fallen already out of
use by that time.

Link: http://netwinder.org/
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-footbridge/Kconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-footbridge/Kconfig b/arch/arm/mach-footbridge/Kconfig
index 78189997caa1..96a74d447028 100644
--- a/arch/arm/mach-footbridge/Kconfig
+++ b/arch/arm/mach-footbridge/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_FOOTBRIDGE
-	bool "FootBridge Implementations"
+	bool "FootBridge Implementations (DEPRECATED)"
 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
 	depends on !(ARCH_MOXART || ARCH_GEMINI || ARCH_SA1100)
 	depends on ATAGS
@@ -12,7 +12,10 @@ menuconfig ARCH_FOOTBRIDGE
 	select NEED_MACH_MEMORY_H
 	help
 	  Support for systems based on the DC21285 companion chip
-	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
+	  ("FootBridge"), used in the EBSA285 and the Rebel NetWinder.
+
+	  Support for these machines will go away in 2027,
+	  unless there are any remaining users that speak up.
 
 if ARCH_FOOTBRIDGE
 
-- 
2.39.5

