Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2FF2D877A
	for <soc@lists.linux.dev>; Sun,  5 Jul 2026 08:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783241419; cv=none; b=MMz+GOKEcH+8bNp/mUvsHWger2jNHQBE05rbDmuYP2VasxUM7YUsNuApqzfwaJF/zV+pC5g1NcEfYtg5ldU/k8jb1c8OnBIh9UUbXcAinXot01+J1GPvdyUNLeXVofgU0+MPFxWD+eVJkr07OhHC5YcoC1562Bo8oXMUGd2EgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783241419; c=relaxed/simple;
	bh=UACOGRi5zwKM/GlH3MUrcVH7NTPYPiS/pta0KBrGtsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FWSI1kx3+pnd1LfWaoIeseDPk/QeHlr0EzoocUZGLfhwidyGYucVpFLaG4nlqhkhu/zsIjIUH36MT9Hp2AXkaWYnwnbbWSNsBnTPIlJUvdJiJEO9MKr5vIXOsEzlXjLU1xKYqvHsCYajqZWg1XNHkR1I59+I01vJM5f3pMNDpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=akKcMfnG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="akKcMfnG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493d3135f62so3814735e9.2
        for <soc@lists.linux.dev>; Sun, 05 Jul 2026 01:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783241412; x=1783846212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTixSXqM1M3nFZ6wcRAermlWHzTw0peN+qhtvG6hqcg=;
        b=akKcMfnGsRxuyYXCsfcsk7cTpeE/UtUlCTOnf2gGYTg3QHb4FUIx4H48DcSZs+cyrm
         KE6AnRpXmDd2LKzyDUvOcopBLqjnWErhIhMZqUFCq6cwNA7uCLtzghSmdBuMoq5AG0bH
         npdN0WWi2aea/dfPkUndVvoquWnDeUzGsziM0MN41gC2T4Yi2uny1XKMxNRC52jBSF5Y
         GzCc0TZykFQbvegHjTrbWs/vKZr/3QTiQXXZ00NcbqYLc793FDD4NGVyaPAfYablk95/
         xzypfMBo/O+EDHxkO5QVkDm//eZhShN4z7rnz753FitjctFtY/yXIHsj5Ovd6ToFJW6j
         3/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783241412; x=1783846212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTixSXqM1M3nFZ6wcRAermlWHzTw0peN+qhtvG6hqcg=;
        b=c2XuTJYQMzysvpnOwUxDKNhnP3JsMPXITww7lFOebokSx3d71ObzSCzPuDWQZ5Nz7K
         YYOo4BBcTnL2SL/bQaWjoMX8Ei6TuEz1yBuCBIxHmlpyUOUVqL8ZC/bLyE9V4Duvmd28
         MydnbES21u/gHtpSnS3ST6otrhP4DAblP8XEVlBcLx2+nYwMOObgqGxjN2ARKMwUq+o/
         dEdWt9AQVyAy3KGKGxeAzEmJRpwfKMZxRiTMHAgHLNzsk1OLmWc8OOwTknsPcxDjqcBT
         FJFgZEs9UVfCRa5XnL3WKdaAIsbOb2huNNiN5VaG6dt/QjKQb1vIsh/H9eJFRiurS2Kx
         H5zA==
X-Forwarded-Encrypted: i=1; AFNElJ/5xP0+FX36JKsNbRvFoDYgbh1Q8rVcz+lvPZthbsDkFdVLiloQ2fibtnkQB481Awj8o8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtrEi6LdrGL0edyoOcZWzCSpjW6ukQ41omoAst+OPqK9PMTmnB
	NaReA/k+RDtNTBE7abWsmNi5QYt3y1zwZP7RAXbeAAbQnS7etKWMsv27vGkxCIjV1s0=
X-Gm-Gg: AfdE7ckzclm0/GlNMxtnKbdb1Po3TQrjAkawcjanVPJm1m5j9HHsdlTlyN8f5PqCsRB
	QIZHfOWC1eZH/3IEtLteqAKA0bixFbnjCFWWzJV0dKY2FPa6WO86NcOcxRP5Dqdme8gSK/V5dqm
	FKRpSdpMfamVhs81lVGhDxNN9GFiokqibBIHl26tJ2dpjIyTj93hJ6k0bP9liCpoS523Luj11Zd
	Z7cjESTpPNTBKOp/dqoavTj7p7jxUlMNWBYoOEScZAQhClGwvjZoHqBiLvIjinGSCMnHl8qfzv8
	Q0mAftCkCi1M58TXas5ODmzwcTHyz7rhrJr4E/l06VMBB9nPLBIflrnZZdpJZF3RtTYmqMwRUfg
	o49em6F9vqmizjQ4RkqQruAODU7J6BJuRo6nL+atgbKyLsxJsYcCzYRP11+YLi8UQkXzi82ZLpP
	DkEzhJI03nbOmINanwAQ==
X-Received: by 2002:a05:600c:8b17:b0:493:bdaf:83a7 with SMTP id 5b1f17b1804b1-493d11f8c55mr65567935e9.28.1783241412156;
        Sun, 05 Jul 2026 01:50:12 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960b06sm13667826f8f.28.2026.07.05.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:50:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev,
	Imre Kaloz <kaloz@openwrt.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: Don't let ARMv5 platforms select USE_OF
Date: Sun,  5 Jul 2026 10:50:00 +0200
Message-ID: <20260705085000.3510576-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UACOGRi5zwKM/GlH3MUrcVH7NTPYPiS/pta0KBrGtsQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqShq4ZQaUz2sgd5mn3XqmqSu5yqtJWJAFqNvOW 1EMngDN2a+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakoauAAKCRCPgPtYfRL+ TtF6CACsq3oN9xBSWZAYF+udT8In3FGzcI9+Kw+Z3Vn2Z1skdF5IJvOLCcP1jCbNLc8YbiimQNY ZvhF7mbdQh8XIIHBlPjLdf/UpxTcTzTUv8KioedjFEfcCyA1ZKGtCUel4HvdfS2WDAX/6XtCu+8 4y44kavClHYDRVKgm0jVdd236wmzgwS87b8XWELqHeMmTcS9kxr8g9fPVMVlbtZ5lWfSB4OSy7j Ha4Pmv/3X5PYZY5yJCmdP/AwKlv57EICLpwEpIuaP7bsAnRnQgJ0mxjJXVROSjhiRLhmuTni5D6 IhCOcjT3ukfqUSw122Aj5K6lNeFvaAa3qLU7wCslL3lF1dWP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

USE_OF is already selected by ARM (unless ARCH_FOOTBRIDGE || ARCH_RPC ||
ARCH_SA1100; these all conflict with ARCH_MULTI_V5). So there is no need
for an explicit select and it can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

If I should split this patch by mach-*, tell me, but I think it's simple
enough and these architectures don't move much, so getting this in via
armsoc should be fine?!

Best regards
Uwe

 arch/arm/mach-ixp4xx/Kconfig | 1 -
 arch/arm/mach-pxa/Kconfig    | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index cb46802f5ce5..7f812020e082 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -14,6 +14,5 @@ menuconfig ARCH_IXP4XX
 	select IXP4XX_TIMER
 	select USB_EHCI_BIG_ENDIAN_DESC
 	select USB_EHCI_BIG_ENDIAN_MMIO
-	select USE_OF
 	help
 	  Support for Intel's IXP4XX (XScale) family of processors.
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 66e26990e2c8..c478fb8a6f78 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -22,7 +22,6 @@ config MACH_PXA25X_DT
 	select PINCTRL
 	select POWER_SUPPLY
 	select PXA25x
-	select USE_OF
 	help
 	  Include support for Marvell PXA25x based platforms using
 	  the device tree. Needn't select any other machine while
@@ -33,7 +32,6 @@ config MACH_PXA27X_DT
 	select PINCTRL
 	select POWER_SUPPLY
 	select PXA27x
-	select USE_OF
 	help
 	  Include support for Marvell PXA27x based platforms using
 	  the device tree. Needn't select any other machine while
@@ -47,7 +45,6 @@ config MACH_PXA3XX_DT
 	select PINCTRL
 	select POWER_SUPPLY
 	select PXA3xx
-	select USE_OF
 	help
 	  Include support for Marvell PXA3xx based platforms using
 	  the device tree. Needn't select any other machine while

base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
-- 
2.55.0.11.g153666a7d9bb

