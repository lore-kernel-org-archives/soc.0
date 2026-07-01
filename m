Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFE3C0A04;
	Wed,  1 Jul 2026 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941119; cv=none; b=mWWk21jLwG+UUfr7SiP2ZHZT8Wj3Uxyn3McVGIOQJS543ZUkTbRM1POLu/PzUag39p81rfAzlD0xOCaDW78ZG4qX+hKC0YPGi0ps33fmF+X3OSgIg0hxlqzdsnwLo40fUlW0HqBrSxTVWqsrwDclsIZSHB9p1GxPSba/kROyMQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941119; c=relaxed/simple;
	bh=yoUc17v6EoiGokeo/e8r7T5IL6iqp06EL7Jur1HPUsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nXbxq1dDJ+JUu3Ek/PO2zteiSvJzZVLH0bwESw4LB3DiZrFLsjWJmQn1HTIJODtB+RUIYnEJjftGSMLgCB1rES6qd+N2lLHnHEAzm94LMap0auAENWeCitxPvNflP72Rn7SWVcWx8vN1DbtrbRYG2+Fs+8E/G06cCFFOvfQ8UvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iF9QKYav; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iF9QKYav"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391A11F000E9;
	Wed,  1 Jul 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941116;
	bh=V0AW54px2NeVNkCtE6J7vNcVIckqBSV/cfv9pyETQPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iF9QKYavkLZOF/lVBwhFnj51LRYXz2YXLO4dfYrJVkYQDPoTWRSAu3mKVD5ocp7M8
	 Jygbvz1qSDUgaT580hKbH+uTf0c0AWXzzG0DglyJghI5orb+oqmv5CMUIc8fUEotrM
	 ol6EqkdNSenUDH0GhAFKaoO9IlzH3MJa/AGalaSr4kzvASQrRFbDka1Bfdp78egkYO
	 3d8BNYFkUCbVZNKDH5wBpJNXlMVex5gfgXJuvr9lKdCUewkub2PqHZMM3nrKfJ5YfC
	 qlfNW1DsfcYdZHxPNsLTE1q6tE5EBBuV7tqPn8bDOpp8xwFfF27sGLfxxYv0PUstMa
	 AP7KJEd6dPO6g==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/19] ARM: s3c64xx: extend deprecation schedule
Date: Wed,  1 Jul 2026 23:23:42 +0200
Message-Id: <20260701212353.2196041-9-arnd@kernel.org>
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

Mark Brown is still using this machine for regular work, so it should
not be removed as originally scheduled.

Give the platform another year, with the option to extend it further
based on the state of ATAGS support next year.

I expect that we end up removing all of s3c64xx when either Mark has
moved his test setup to other hardware, or when all other ATAGS based
machines are getting removed.

Cc: Mark Brown <broonie@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c/Kconfig.s3c64xx | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 3f97fba8e4f5..52cfd9fb2a43 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -23,10 +23,17 @@ menuconfig ARCH_S3C64XX
 	help
 	  Samsung S3C64XX series based systems
 
-	  The platform is deprecated and scheduled for removal. Please reach to
-	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
-	  you still use it.
-	  Without such feedback, the platform will be removed after 2024.
+	  The use of ATAGS based board files is on its way out, and
+	  the only remaining S3C64xx machine in the kernel (Wolfson
+	  Cragganmore 6410) relies on this, without any realistic way
+	  to migrate it to devicetree.
+
+	  Support for S3C64XX will be kept until the 2027 LTS kernel
+	  release and may be removed in early 2028.
+
+	  Please reach out to the maintainers of the platform and
+	  linux-samsung-soc@vger.kernel.org if you use any additional
+	  s3c64xx machines based on devicetree.
 
 if ARCH_S3C64XX
 
-- 
2.39.5

