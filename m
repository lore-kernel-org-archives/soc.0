Return-Path: <SRS0=MxOY=Z6=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1AFC6FA83
	for <soc@archiver.kernel.org>; Tue, 27 Sep 2022 13:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDB24C43470; Tue, 27 Sep 2022 13:26:51 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F392DC433D7
	for <soc@kernel.org>; Tue, 27 Sep 2022 13:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F392DC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:d95b:5c9b:4085:7c0d])
	by albert.telenet-ops.be with bizsmtp
	id R1Sl2800E3Qogd1061Sl7e; Tue, 27 Sep 2022 15:26:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1odAbk-006Qb7-KW; Tue, 27 Sep 2022 15:26:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1odAbk-000uvu-7K; Tue, 27 Sep 2022 15:26:44 +0200
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
Subject: [PATCH] ARM: Drop CMDLINE_FORCE dependency on !ARCH_MULTIPLATFORM
Date: Tue, 27 Sep 2022 15:26:26 +0200
Message-Id: <c557b149780faa2299700585afc9d270ede7f78b.1664285062.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On older platforms that boot an image with an appended DTB, or where
the boot loader has no support for updating chosen/bootargs, it is
common to rely on CMDLINE_FORCE.

While a fixed command line can make the kernel unbootable on other
platforms, it is not guaranteed to cause that.  E.g. all Renesas boards
use the same chosen/bootargs in upstream DTS, which works fine if your
DHCP server hands out proper nfsroot parameters.

Fixes: 84fc863606239d8b ("ARM: make ARCH_MULTIPLATFORM user-visible")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 22f62ad919bfd831..ea8adbf25651438a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1616,7 +1616,6 @@ config CMDLINE_EXTEND
 
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
-	depends on !ARCH_MULTIPLATFORM
 	help
 	  Always use the default kernel command string, even if the boot
 	  loader passes other arguments to the kernel.
-- 
2.25.1

