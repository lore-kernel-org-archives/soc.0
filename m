Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8602D3DD51C;
	Wed,  1 Jul 2026 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941136; cv=none; b=LM/ufjAImCib+M1p+0xja5y1G61vmtQAY70YQafHC9QD67Qb5pa1fx1o+ZeYJmtRQG4cYgU2J+V9qMWXIBJX2XCpVvzdjj/id11/+n0JsEPQqCf9/OV5dwEEkNd0uZbu2Y2y0sv4fdCnjX9x4HVWXGb1+ZMD2UipWklz3zW50Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941136; c=relaxed/simple;
	bh=LTEiYIxl7G0yr1rZMK/MbCkPvesEZcJzWj5HONJfzGs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A89icVCSW2haYNzQWY9vKYcbnPKGwJEbliaXOitRQP3zlTDhbXfzp92mEyOaYy2z/KztnHFyP6RIO1X1BgsXcAM8gEGj7eZiERP1Xg8ae2gglQF1HkmYk96+cBasazK0HheT/b2NhmJEfGqlOsjrWa8+MlPotjYgQPbL0YBuE8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grs2EkX0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grs2EkX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E2D1F000E9;
	Wed,  1 Jul 2026 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941131;
	bh=wlayQOEl2KZTkzmBCwJs/YLxYkgF9FY4O+U8iZIcOt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=grs2EkX0EEzX86/S44iVTmiUw/jk2hbNJMEGEJCJVKoaHyA+Iu0aR/4yv7eDkUg5a
	 nIVTHUgGUwgZGrjh5by8y2+zc7Cw3b6kDfiDeyh1GNtvW85cGAYEEYbyXIIsHzl3qK
	 /130aRuLFvtszDMkblUqumfJbzSQ9UU6+r8KRdN7sJpNQr7lF80PJtk3M9/qqsfLCj
	 FPKucqqkU3xftK3SgRunQtOjNkf/J4oTPBwvvI2UUV/KUPAt3fvKzybK0+EMJgHBcQ
	 Q3Af7Be2XVscl5KLq56Y6gULJjv9lcRMuAvjx1DMqG8gOXXZp8uVP2laIpXu5WijXp
	 nJ68BXcB1bX6w==
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
Subject: [PATCH v2 10/19] ARM: mark IWMMXT as deprecated
Date: Wed,  1 Jul 2026 23:23:44 +0200
Message-Id: <20260701212353.2196041-11-arnd@kernel.org>
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

With no remaining users and support getting removed from future compilers,
there seems little point in keeping iwmmxt around much longer.

On the other hand, the iwmmxt support in the kernel rarely gets in the
way, so there is little cost, so set a removal date of early 2027 for
the moment. If anyone is still using this, it can be extended as long
there is binutils support.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1f02183cff13..e2bdf2591c10 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -513,13 +513,21 @@ config PLAT_VERSATILE
 source "arch/arm/mm/Kconfig"
 
 config IWMMXT
-	bool "Enable iWMMXt support"
-	depends on CPU_XSCALE || CPU_XSC3 || CPU_MOHAWK
-	default y if PXA27x || PXA3xx || ARCH_MMP
+	bool "Enable iWMMXt support (DEPRECATED)"
+	depends on PXA27x || PXA3xx || ARCH_MMP
 	help
 	  Enable support for iWMMXt context switching at run time if
 	  running on a CPU that supports it.
 
+	  Machines that actually support this feature are very rare,
+	  and support is deprecated in new gcc-14.  While there were a
+	  few applications that used this in the past, none are known
+	  to still do so.
+
+	  If you use this, please send a patch to remove the
+	  deprecation, otherwise this will be removed in early
+	  2027.
+
 if !MMU
 source "arch/arm/Kconfig-nommu"
 endif
-- 
2.39.5

