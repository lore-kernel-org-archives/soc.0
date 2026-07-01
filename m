Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EA93C5552;
	Wed,  1 Jul 2026 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941103; cv=none; b=MMbWHjbeIlWVD0YbuQ+Qf+LkjyRBqoSuJUYiYV4jFiRgn253Tm2UhBUk0P2in/IRZRRoRpBAXYC8qOW8wzQZrF0yRQR/70tmSkPmAvelLZxWCy7hflJV614ovLB0Met3SISicrat6TWQwUXrfyoTX0kKyT0U02ZbXlk56QPTjVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941103; c=relaxed/simple;
	bh=BrcxSpHFOcDQ8VwDwhc4FS8TPd83WsMQXuDolyr5MiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xw40D/K1CA5/A/kwxDcdJlC6RF8KwqVOVlTMdoL119CI4ipQk6hvbcr/8AY7IkEzWUYQLoxLyehZGNNrTEZvdvmV+7ThIhYRYz4R2u4F6gTPO881R6vP6WTHMmZ7rErIYoEFJ364Epm4hyjQYORD9rZngaMTTotxrOJXyE/FevI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW5/Iuwa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW5/Iuwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB70A1F000E9;
	Wed,  1 Jul 2026 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941100;
	bh=neVVvwQwuyehYBW5/uf+qB8Aaz3ea9KXcSRRGKM52LY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dW5/IuwaQddtvXG80KYrUmHKUP6uGqbWllc20qiZhcQSpyn0Y8YLsOOWOiZEE5QIQ
	 abMmAy1GaBEqf12EkB0x1DIDu8dHdBT4R4cA4eKPoZ1hxR/6W+tOw6+C9oPqv4jlST
	 Gdm6PEakdLofC5ofqkVAx6q4gj7S+bd0MPqoGRPKjBboa4ocrfH0ICRBCQDRz9zuoW
	 +c56K9NmjofBYOOr1HRrrC4SPaUQSQY2oA8YBc+YVeGOfDbkYJ0b1208q73YMHpI/N
	 kW+twL9QI5NigP8Q3Btg/eHNsJ0+3nJdUZfinEg1hDpeQvVpLHFadt5ccO/4NFK8Rh
	 juwK2RlWFs+OA==
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
Subject: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
Date: Wed,  1 Jul 2026 23:23:40 +0200
Message-Id: <20260701212353.2196041-7-arnd@kernel.org>
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

Following the deprecation of big-endian ARMv8 mode in arch/arm64 in commit
1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN"),
this does the same for ARMv7 (and v6), leaving the code around but
disabled by default: There are no known products that make use of this
mode any more, and it only hangs around for testing that it still works.

At the moment, there are no known bugs with big-endian ARMv7 mode, but
it does break occasionally and require someone to fix it.  By marking
the code as 'depends on BROKEN' now, it will no longer be covered by CI
testing. If any users remain, they can keep patching out the dependency
but are more likely to run into regressions.

The big-endian ARMv5 support (CONFIG_CPU_ENDIAN_BE32) in contrast is
still used on Intel IXP4xx platform, and is the only currently supported
mode there, so this one can still be enabled.

There is no timeline for actually removing the code at this point,
we will likely debate this if we ever remove IXP4xx support on arm,
or big-endian support on ARM64.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 27010b9389ad..048edb011511 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -778,7 +778,8 @@ config CPU_LITTLE_ENDIAN
 	  space builds.
 
 config CPU_BIG_ENDIAN
-	bool "Build big-endian kernel"
+	bool "Build big-endian kernel (DEPRECATED)"
+	depends on ARCH_MULTI_V5 || BROKEN
 	depends on !LD_IS_LLD
 	help
 	  Say Y if you plan on running a kernel in big-endian mode.
-- 
2.39.5

