Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC4B3148D3;
	Wed,  1 Jul 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941194; cv=none; b=EnUWV+ioHE4P5vTLeSjf63YmvmnCOuQIAB3o4wSQlmrB+MP7RNaQLjc9KdeVYZmVLPj9PC4RjDHjYqMtRPEauxgiTjKqcHdCsVMSi9+WnESxmlkQTcim5VxHuFtMFEHQoChnjkbPgMkU+jTrUr6t4haY4fIaCbhtGfRkk+t7HuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941194; c=relaxed/simple;
	bh=DcBMXA5vwlIVZdXu/vwQiAGtIUjwJXeKS0kMPjLHut4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E/HMaMHsdK+90qPbJx/lk4EJyemuqJkFN/Pq+HK8OBxLCmPOmWaQB3e9jtphpQhrC3aLQY4LTKlu2NB0qOYU8HrWa2H2KsSm1jxRBcNYUAHF6CsdlpChCt6XPidjk8p6GgzxskQRnzZPdDqK0KPHobjfvdSyfr1/05zgbhenYLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/my/gat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/my/gat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405661F00A3D;
	Wed,  1 Jul 2026 21:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941193;
	bh=OOOlnTfLdeQJz5KZc0pbvMZ9NKjblGZAbxQxn1igGQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h/my/gat2xn2CRrztx6PRB9yjkMYCfyxNjTyBjRywG7bYRe/eAv0ahiLxFo+QtexN
	 2ToOm/W3a1EEeYV0faDPG0IF2kw/x5skroJDF94g4j7C/L+ANULKfr7/hn5Jl8u323
	 LtDHlhJvkDUB7krcMu4KTur12NHllyDR6L69BW3+1kqHI9B4QDZy/zTqaZcgtgPFLC
	 J8g57gm1+/SEkdgHZRegzrCxdCCdUkWb7aRjexnfPtEHnUYW0hTO4VD8Czg9jbti+8
	 dY4TQUzCEWaGtA6xzzOW06qEoLGkBbnJbC/8T/3ZCEFsDNdyoP1ywbji7oTY4soUCQ
	 +rek29d+FeB9g==
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
Subject: [PATCH v2 18/19] ARM: mark axxia platform as deprecated
Date: Wed,  1 Jul 2026 23:23:52 +0200
Message-Id: <20260701212353.2196041-19-arnd@kernel.org>
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

The Axxia platform was initially upstream by Anders Berg for LSI and
later Avago, but this included only support for I2C and reset drivers,
while most of the interesting bits (network, pci, rapidio, usb, ...) or
the arm64 platform support were never merged.

The downstream kernel was maintained by Intel up to linux-5.15 when
the product line was discontinued. Known users include Nokia and
Ericsson, but both of them use kernels derived from the out-of-tree
drivers rather than the upstream version, and will be able to continue
doing that even when the rudimentary mainline support is gone.

Mark it as deprecated for removal after the next LTS kernel.

Link: https://github.com/axxia/linux-yocto
Cc: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-axxia/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-axxia/Kconfig b/arch/arm/mach-axxia/Kconfig
index d3eae6037913..f773a66c1402 100644
--- a/arch/arm/mach-axxia/Kconfig
+++ b/arch/arm/mach-axxia/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config ARCH_AXXIA
-	bool "LSI Axxia platforms"
+	bool "LSI Axxia platforms (DEPRECATED)"
 	depends on ARCH_MULTI_V7 && ARM_LPAE
 	select ARM_AMBA
 	select ARM_GIC
@@ -13,3 +13,5 @@ config ARCH_AXXIA
 
 	  The LSI Axxia platforms require a Flattened Device Tree to be passed
 	  to the kernel.
+
+	  This platform is scheduled for removal in early 2027
-- 
2.39.5

