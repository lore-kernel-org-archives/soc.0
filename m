Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1121CC4361A
	for <soc@archiver.kernel.org>; Thu,  3 Dec 2020 23:18:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D16CF22482; Thu,  3 Dec 2020 23:18:50 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
Date: Fri,  4 Dec 2020 00:18:40 +0100
Message-Id: <20201203231847.1484900-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These definitions are evidently left over from the days when
sparsemem settings were platform specific. This was no longer
the case when the platform got merged.

There was no warning in the past, but now the asm/sparsemem.h
header ends up being included indirectly, causing this warning:

In file included from /git/arm-soc/arch/arm/mach-keystone/keystone.c:24:
arch/arm/mach-keystone/memory.h:10:9: warning: 'SECTION_SIZE_BITS' macro redefined [-Wmacro-redefined]
 #define SECTION_SIZE_BITS       34
        ^
arch/arm/include/asm/sparsemem.h:23:9: note: previous definition is here
 #define SECTION_SIZE_BITS       28
        ^

Clearly the definitions never had any effect here, so remove them.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-keystone/memory.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-keystone/memory.h b/arch/arm/mach-keystone/memory.h
index 9147565d0581..1b9ed1271e05 100644
--- a/arch/arm/mach-keystone/memory.h
+++ b/arch/arm/mach-keystone/memory.h
@@ -6,9 +6,6 @@
 #ifndef __MEMORY_H
 #define __MEMORY_H
 
-#define MAX_PHYSMEM_BITS	36
-#define SECTION_SIZE_BITS	34
-
 #define KEYSTONE_LOW_PHYS_START		0x80000000ULL
 #define KEYSTONE_LOW_PHYS_SIZE		0x80000000ULL /* 2G */
 #define KEYSTONE_LOW_PHYS_END		(KEYSTONE_LOW_PHYS_START + \
-- 
2.27.0

