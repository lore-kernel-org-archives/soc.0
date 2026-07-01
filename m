Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4273C196F;
	Wed,  1 Jul 2026 21:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941111; cv=none; b=mLvCtpkqwCIBUF35umDV3D1cAQPNCwj5SU+xa4JHHlGK5Pl9VUGYSmJrANjuzaScntllAvJcKz7L9kQAeye/1Kyvp0F7ECgB2+uBq7GEtseZQ1abgLq2+SgpJnjU1uAz6fdceuULbYMt0Ok+b265qEsQIIuD28rhoEO2ItI7jx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941111; c=relaxed/simple;
	bh=zvnc9er2mmNijkrSMbBktlo1owfZzdHn4QWogwFpWBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QKQEHVUC2qFurpLF2oVp4mipuc+2kym4yT++XctUy+wRx51WEDSfcdyifa+XVipLsUUT0loIgHF5RldV4dxVHCBUN92xHlMUC+jLzs84YU1LBZTWale6hjcoxvR1cNUZhVAVn/fy7q/mCK18FxLlq4jNb4IMfNrwT0caIQ4aOog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cpwi9iNC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cpwi9iNC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B10B1F00A3A;
	Wed,  1 Jul 2026 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941108;
	bh=JgpcsvqS4lKeX/TSFflfXG7PheS32/tusvELyLUCFYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cpwi9iNCpgKvQospHZ4QAiD+mSx+0MUfpFPEFzSHIn7BwQ2ftaLoMJQBZs3y7ZUMP
	 KbG7feh269ey5CZ7I6rB2RrlEHP+jfogHSkmhMmGh3wzXI5ymfEtolO/EbVQP6ULZ8
	 E0edaao/ZWEhA86d+CCIsLyf1Xj5Qyn0N4hmEpfsIFUihpJaYfToMgYizEi6rwiXzZ
	 PUAOtRr44ecwCOMKQKmM8s31wIM8SCI/apFF1UGLqk0/zx5AQ0FSYFooc6dhyRx//H
	 pSW6lMSita/9DlBAPT65QQ5/Lf4yNDcmBVG/gleaHx2gSMnVZLnKVbPKGdVxTmiqi0
	 REZVXtXXZeGyg==
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
Subject: [PATCH v2 07/19] ARM: update DEPRECATED_PARAM_STRUCT removal timeline
Date: Wed,  1 Jul 2026 23:23:41 +0200
Message-Id: <20260701212353.2196041-8-arnd@kernel.org>
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

This configuration option is for the older boot method that preceeded
ATAGS. This was scheduled for removal back in 2001, but the removal
never happened, presumably because nobody cared enough to actually do it,
not because there are any users left.

Add "(DEPRECATED)' to the Kconfig line and update the timeline so we can
remove it next year along with the other options that are not scheduled
for that timeframe.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0033d861e378..48937e70d55a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1401,11 +1401,11 @@ config ATAGS
 	  it is either converted to DT or removed.
 
 config DEPRECATED_PARAM_STRUCT
-	bool "Provide old way to pass kernel parameters"
+	bool "Provide old way to pass kernel parameters (DEPRECATED)"
 	depends on ATAGS
 	help
 	  This was deprecated in 2001 and announced to live on for 5 years.
-	  Some old boot loaders still use this way.
+	  It is now scheduled for removal in early 2027.
 
 # Compressed boot loader in ROM.  Yes, we really want to ask about
 # TEXT and BSS so we preserve their values in the config files.
-- 
2.39.5

