Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771C4C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Sep 2021 09:53:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3EBEF60F43; Mon, 27 Sep 2021 09:53:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8D060F70;
	Mon, 27 Sep 2021 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632736427;
	bh=0Fj65JXbuxZGtuGCEpwlOS482/Z2ZnxDqxnU0qnk8kI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=TQ3qfRdrDleOFX8TYfi0C7bFoN4J5r7MOJW1aZeGBme7hXswu79QRia+CTPjhnZBc
	 qtFR/J0C/lAAg1oIE3LMUl4cP9UFFHRYAWJIlYJOJCougxj8zWlD9LXLPUfiQZJFCE
	 BH59W+yFhDamEy3Gd6767vTbm4OWNrlDB5S/XOfnlM5XPJ6Ittuw9+ncWpy9xTb4M+
	 BLzBpOC6gB8xTnfaRJo2UzheS4Qp8mNGkHvqMG6BDFJcUyvqEtVLYTyQrjHV5tFCdk
	 i0bFcoSuvCRT+rBPQ9GvgqilqK+CogVfcI8ASVE6kzdmmAgrpr1zRFKZpR575sNVev
	 XRAmCGNrUb77Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dove: mark 'putc' as inline
Date: Mon, 27 Sep 2021 11:53:33 +0200
Message-Id: <20210927095343.1015422-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This can cause a randconfig warning without the 'inline' flag
that every other platform uses:

In file included from arch/arm/boot/compressed/misc.c:29:
arch/arm/mach-dove/include/mach/uncompress.h:14:13: error: 'putc' defined but not used [-Werror=unused-function]
   14 | static void putc(const char c)
      |             ^~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-dove/include/mach/uncompress.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-dove/include/mach/uncompress.h b/arch/arm/mach-dove/include/mach/uncompress.h
index 7a4bd8838036..ddf873f35e2b 100644
--- a/arch/arm/mach-dove/include/mach/uncompress.h
+++ b/arch/arm/mach-dove/include/mach/uncompress.h
@@ -11,7 +11,7 @@
 
 #define LSR_THRE	0x20
 
-static void putc(const char c)
+static inline void putc(const char c)
 {
 	int i;
 
@@ -24,7 +24,7 @@ static void putc(const char c)
 	*UART_THR = c;
 }
 
-static void flush(void)
+static inline void flush(void)
 {
 }
 
-- 
2.29.2

