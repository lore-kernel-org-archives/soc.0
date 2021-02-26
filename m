Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858DDC433DB
	for <soc@archiver.kernel.org>; Fri, 26 Feb 2021 16:44:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4B89864F14; Fri, 26 Feb 2021 16:44:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 873D664F0D;
	Fri, 26 Feb 2021 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614357851;
	bh=H2YTMQM6RGZ40+WuXh4eMNp65ECystWvO4ylYg/h6gA=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=CXuh0VwWEoQwI8PVuntuQ6o3aPcuHorVUEukP7moPDI+z+B9wl61EQREIpalsWH9p
	 k3rqfixqto5YA/4HPHmOzwRFnDreWi7jsA/i4bwQGICQ/6LnCmUVJ19D+RlSXO8yWg
	 hY8FdTUC6Yr2myKZh+BegAT/BB0d1gripMBS5SayJ0enXvwQaJ7rvzmQgcnejdnrMU
	 8bBN9/+FEtWcFP0rXdM4eqCFMNOfYEXb/+gnHLggaGcP7StY0AWGAmAAZgyzMthqqS
	 a7YPEJiggmfEcnoWgH97erj0+JKfN2PTOuzI6Dl99c5eXbYTqjztpUz3jvT61SloL6
	 Pm7p1rOX69Iow==
From: Arnd Bergmann <arnd@kernel.org>
To: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
Date: Fri, 26 Feb 2021 17:43:31 +0100
Message-Id: <20210226164345.3889993-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Randconfig builds with ep93xx fail with the clang integrated
assembler that does not understand the maverick crunch extensions:

arch/arm/mach-ep93xx/crunch-bits.S:94:2: error: invalid instruction
 cfstr64 mvdx0, [r1, #0] @ save 64b registers

It is unclear if anyone is still using support for crunch: gcc-4.8 dropped
it in 2012 when it was already too broken to be used reliabled. glibc
support existed as an external patch but was never merged upstream.
We could consider removing the last bits of the kernel support as well.

Turn off the integrated assembler for this file for now.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-ep93xx/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefile
index 86768495f61d..f686577ba059 100644
--- a/arch/arm/mach-ep93xx/Makefile
+++ b/arch/arm/mach-ep93xx/Makefile
@@ -7,7 +7,7 @@ obj-y			:= core.o clock.o timer-ep93xx.o
 obj-$(CONFIG_EP93XX_DMA)	+= dma.o
 
 obj-$(CONFIG_CRUNCH)		+= crunch.o crunch-bits.o
-AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312
+AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312 $(cc-option, -fno-integrated-as)
 
 obj-$(CONFIG_MACH_ADSSPHERE)	+= adssphere.o
 obj-$(CONFIG_MACH_EDB93XX)	+= edb93xx.o
-- 
2.29.2

