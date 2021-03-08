Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3303BC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 15:34:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F363365218; Mon,  8 Mar 2021 15:34:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 060B565208;
	Mon,  8 Mar 2021 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615217674;
	bh=j0NgJNYgPcYbBvwr1Be+M0r5NEbw1hmJwjIfe3Edh1s=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=pF/hs/lBnF6WFs3i0RF4RIoz0ZhEuz+xWNHHYn0q9FyBu4GEbjSECt1YhDsQPKDwn
	 RSI88DtEXb6WS4APkZcvZNFm+Sc0/LqkOjih+QOGUvYtBVmFnLm1w72e6mBQ9v8a61
	 0K8pG0JVo2EZZ/++MyUAUSt2ydc8sFdiXVdsKcsuUL7aT60rqfn5jbSeo5obAg145c
	 4y32rNGS3msLRtD2k+eEO1Ccf/n+FDec3XuAvmE/YfFWnOrAXUaBe0waKwhiT66LKa
	 zaJZr1aPum6Yi7HRkJOT6xi/HkDdn4uJAGxhuY0Pbfmz0vYL1v3cOnDCbEOqSDZCWx
	 5ZZhhaUyKtOnQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: omap1: fix building with clang IAS
Date: Mon,  8 Mar 2021 16:34:21 +0100
Message-Id: <20210308153430.2530616-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The clang integrated assembler fails to build one file with
a complex asm instruction:

arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: error: invalid instruction, any one of the following would fix this:
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^
arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: armv6t2
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^
arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: thumb2
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^

The problem is that 'NR_IRQS_LEGACY' is not defined here. Apparently
gas does not care because we first add and then subtract this number,
leading to the immediate value to be the same regardless of the
specific definition of NR_IRQS_LEGACY.

Neither the way that 'gas' just silently builds this file, nor the
way that clang IAS makes nonsensical suggestions for how to fix it
is great. Fortunately there is an easy fix, which is to #include
the header that contains the definition.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/ams-delta-fiq-handler.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
index a0fb7cca0fc3..e6a33024f6b4 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
+++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
@@ -16,6 +16,7 @@
 
 #include <asm/assembler.h>
 #include <linux/soc/ti/omap1-io.h>
+#include <asm/irq.h>
 
 #include "hardware.h"
 #include "ams-delta-fiq.h"
-- 
2.29.2

