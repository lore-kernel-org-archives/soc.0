Return-Path: <SRS0=MxOY=Z6=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485E3C6FA82
	for <soc@archiver.kernel.org>; Tue, 27 Sep 2022 13:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F328C433D7; Tue, 27 Sep 2022 13:28:34 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53C74C433B5
	for <soc@kernel.org>; Tue, 27 Sep 2022 13:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53C74C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:d95b:5c9b:4085:7c0d])
	by albert.telenet-ops.be with bizsmtp
	id R1UV2800P3Qogd1061UVXX; Tue, 27 Sep 2022 15:28:30 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1odAdR-006Qbr-Ci; Tue, 27 Sep 2022 15:28:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1odAdQ-000v4T-UF; Tue, 27 Sep 2022 15:28:28 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: Drop CMDLINE_* dependency on ATAGS
Date: Tue, 27 Sep 2022 15:28:26 +0200
Message-Id: <09f0619e8038654d01588d9ad3a023485b2bd77f.1664285209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On arm32, the configuration options to specify the kernel command line
type depend on ATAGS.  However, the actual CMDLINE cofiguration option
does not depend on ATAGS, and the code that handles this is not specific
to ATAGS (see drivers/of/fdt.c:early_init_dt_scan_chosen()).

Hence users who desire to override the kernel command line on arm32 must
enable support for ATAGS, even on a pure-DT system.  Other architectures
(arm64, loongarch, microblaze, nios2, powerpc, and riscv) do not impose
such a restriction.

Hence drop the dependency on ATAGS.

Fixes: bd51e2f595580fb6 ("ARM: 7506/1: allow for ATAGS to be configured out when DT support is selected")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ea8adbf25651438a..68923a69b1d41188 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1599,7 +1599,6 @@ config CMDLINE
 choice
 	prompt "Kernel command line type" if CMDLINE != ""
 	default CMDLINE_FROM_BOOTLOADER
-	depends on ATAGS
 
 config CMDLINE_FROM_BOOTLOADER
 	bool "Use bootloader kernel arguments if available"
-- 
2.25.1

