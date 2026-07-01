Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B7A3CF1F9;
	Wed,  1 Jul 2026 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941128; cv=none; b=CSeJShrxx9OG6v5sWQwygr5NrmlHBvZghKApRLT1wUTdppLqY4GduL3CmeX1VUmE1j0AzIh/AI8KKGa2JPbJ5LW/1rdf6BbOk1E1C1cw0tlka4wTRU69hnT0Htp5Mhvxfc+ZHJHNobr3xfXELkcBG+9FWg9yLeXihj447zDq+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941128; c=relaxed/simple;
	bh=moeVcL1jeOOyoNBvFmmaO1ARWJYN110R3Sp9im9ltIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8y7GvEJFywGjCCZHuAyTEot+6YOwg+A81ZdfOoxdU8TvELi/qa2nudXFouUsY7r/k94BJv/RvKPGDyU+arfTBuA61yMlu8nt0hvnyeenfUEuFaM5FibfSRWMzRZl2y/50kIGvJwiPVV/ZM0K7rPN7KwkeJetQaOg+exUqF+IZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNimZ8F/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNimZ8F/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CBB1F00A3D;
	Wed,  1 Jul 2026 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941124;
	bh=dhWl/U8KLapLF8jZpCzb0eK4W+iXSV9Vy9h9O8ccSmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aNimZ8F/YuIc2DVF01SN6cTaO/JeHNh4IT13ON1ElNZ3EBC1sAEZRQ4/fwf7tIndi
	 8MPADAtxyF7Z62PezwydnUnGoWVRE+4CTxNrLP8LpN7iB5EF+rtNfD4kjlGh1vMkBv
	 JKk1dM4DOYd5T5VyazWaRFvaXoB1euiR6UMKWGnnnkZ1a/9V2CdvogcXO1UgFv8LKe
	 xAOjLhzxxk6V4VUBMXAuWGWCzw5byj62N1cSA2NYQXa8c0s7eewb3q8lY46VNJ0G7o
	 NxuQVCLyhfpqc0BEjLyyZbXWwRrBxtcRBxH1nZ6zWXNH3uIU9jUYtjQdkM2c/QXYqQ
	 lKPfgdj7x7YrQ==
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
Subject: [PATCH v2 09/19] ARM: update FPE_NWFPE help text
Date: Wed,  1 Jul 2026 23:23:43 +0200
Message-Id: <20260701212353.2196041-10-arnd@kernel.org>
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

The help text is seriously outdated and predates the introduction of
VFP floating point units that were available as early as some ARM926
based systems.

Change the help text to reflect that this is now a legacy feature
and that it will go away along with OABI support in the future.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 48937e70d55a..1f02183cff13 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1651,16 +1651,16 @@ menu "Floating point emulation"
 comment "At least one emulation must be selected"
 
 config FPE_NWFPE
-	bool "NWFPE math emulation"
+	bool "NWFPE math emulation (DEPRECATED)"
 	depends on (!AEABI || OABI_COMPAT) && !THUMB2_KERNEL
 	help
 	  Say Y to include the NWFPE floating point emulator in the kernel.
-	  This is necessary to run most binaries. Linux does not currently
-	  support floating point hardware so you need to say Y here even if
-	  your machine has an FPA or floating point co-processor podule.
 
-	  You may say N here if you are going to load the Acorn FPEmulator
-	  early in the bootup.
+	  This is only used on OABI userspace binaries, either using a
+	  pure OABI (!CONFIG_AEABI) kernel, or the OABI emulation.
+
+	  Support for NWFPE will be removed in the future when OABI
+	  support is removed.
 
 config FPE_NWFPE_XP
 	bool "Support extended precision"
-- 
2.39.5

