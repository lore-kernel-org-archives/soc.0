Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1845F396B68;
	Wed,  1 Jul 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941164; cv=none; b=hzil5s/tHRCpO4Sa0KfhAPypJQGoaC8qkcGzWILZvc2Pg0vyLXlkddC/+5+VCAeFA7QV7cpyt0qjVsqW4mtnG8mY5MLBA3ObCgSHKQwVJ8xKi8sRbGYIUCboh2p8o1yxjoJSCgS/8ofR42AWfUE411NScqj6MUDWn1MWFBLMFHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941164; c=relaxed/simple;
	bh=Kc+n8bmN65Z7fGWRpLBHRwwwGoC8m4lDiWogopCHWfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8NsVGBb9OIlze2gC/qqY2OXA1I1diAa3MA3Kq/aLPnBZYMVEgbraCQeV6m6O5zVLIevM1vL3M82myXiL9vuPjy0KlloB9K81rrMcn5h6MHnmpLwOPI2fNtGi+lk7IlUUcSGVz7z7F1+J1WLPUYA/1rD8HE0IcPZ7ZwrRWJ0m3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTWf1+Er; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTWf1+Er"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567D41F000E9;
	Wed,  1 Jul 2026 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941162;
	bh=poxKs3wWC0uOWO62se4SxK9nVbQpyNDuaVwfA5HPjRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RTWf1+Er1XsT+8u/oDE4fVu0HSH/ftWvccZWcG3SWgiPRpNB4QTRWL07hG/Tw1YNa
	 r1M6/cIDmBFxjt5FGphzrmZSX9Ymp9A+xvc4FOmcp3h7DDlZ9KC7ahOOYEXv6sOdFy
	 HRh624t2XxldsFa2AeRQNk+8XX3YNolyJbUenmWxTvUP8aPMoxuWdq9gNFX2b/qggx
	 7CA/owN6sKYcM3dYxV5B+pNpKbIWRLqgsJsIzhXflvAmJTwJpfSLHfn68ZyPlWnQV6
	 d0BPAAHn5lKsT6EFKMQP8ucOJjIvCxjG2z2elhgfp4774GVoSjmQRdP2LFMHTGPl9M
	 vqFRPehhlkzTg==
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
Subject: [PATCH v2 14/19] ARM: mark mach-sa1100 as deprecated
Date: Wed,  1 Jul 2026 23:23:48 +0200
Message-Id: <20260701212353.2196041-15-arnd@kernel.org>
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

Most of the old StrongARM1100 machines were removed two years ago as part
of a wider cleanup, the remaining four were left either because someone
showed interest in converting them to devicetree, or because they were
still supported by qemu and therefore useful to keep the platform alive.

None of the devicetree conversion actually happened, and qemu has
marked the platform as deprecated, so do the same in the kernel now.

If anyone is still running one of these four machines and planning
to keep updating their kernels, please speak up now so we can adapt
the plans as needed.

If nobody is found using StrongARM1100 any more, it can be removing
during 2027, leaving 6.12-LTS as the last longterm support kernel
for it.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-sa1100/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
index e23700e0d6c8..d50721e39641 100644
--- a/arch/arm/mach-sa1100/Kconfig
+++ b/arch/arm/mach-sa1100/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_SA1100
-	bool "SA11x0 Implementations"
+	bool "SA11x0 Implementations (DEPRECATED)"
 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
 	depends on !(ARCH_MOXART || ARCH_GEMINI)
 	depends on ATAGS
@@ -20,6 +20,9 @@ menuconfig ARCH_SA1100
 	help
 	  Support for StrongARM 11x0 based boards.
 
+	  Support for these machines will go away in 2027,
+	  unless there are any remaining users that speak up.
+
 if ARCH_SA1100
 
 config SA1100_ASSABET
-- 
2.39.5

