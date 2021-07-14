Return-Path: <SRS0=2m9N=MG=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75291C07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 09:33:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4A57161360; Wed, 14 Jul 2021 09:33:48 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5676120A
	for <soc@kernel.org>; Wed, 14 Jul 2021 09:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D5676120A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
	by michel.telenet-ops.be with bizsmtp
	id UxZl2500H1ccfby06xZlEd; Wed, 14 Jul 2021 11:33:45 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1m3bGz-0015V1-0Z; Wed, 14 Jul 2021 11:33:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1m3bGy-00A3Cq-Ay; Wed, 14 Jul 2021 11:33:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm: Typo s/PCI_IXP4XX_LEGACY/IXP4XX_PCI_LEGACY/
Date: Wed, 14 Jul 2021 11:33:43 +0200
Message-Id: <82ce37c617293521f095a945a255456b9512769c.1626255077.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig symbol PCI_IXP4XX_LEGACY does not exist, but IXP4XX_PCI_LEGACY
does.

Fixes: d5d9f7ac58ea1041 ("ARM/ixp4xx: Make NEED_MACH_IO_H optional")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
v2:
  - Add Reviewed-by.
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3ea1c417339ff6bb..82f908fa5676ac15 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -395,7 +395,7 @@ config ARCH_IXP4XX
 	select IXP4XX_IRQ
 	select IXP4XX_TIMER
 	# With the new PCI driver this is not needed
-	select NEED_MACH_IO_H if PCI_IXP4XX_LEGACY
+	select NEED_MACH_IO_H if IXP4XX_PCI_LEGACY
 	select USB_EHCI_BIG_ENDIAN_DESC
 	select USB_EHCI_BIG_ENDIAN_MMIO
 	help
-- 
2.25.1

