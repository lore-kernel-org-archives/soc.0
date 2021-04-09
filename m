Return-Path: <SRS0=3PsG=JG=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61241C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 05:20:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B16E61165; Fri,  9 Apr 2021 05:20:52 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A947610A2;
	Fri,  9 Apr 2021 05:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A947610A2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: hector@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 5947A41E57;
	Fri,  9 Apr 2021 05:20:45 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH] asm-generic/io.h: Unbork ioremap_np() declaration
Date: Fri,  9 Apr 2021 14:20:38 +0900
Message-Id: <20210409052038.58925-1-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It accidentally slipped into the #ifdef for ioremap_uc().

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 include/asm-generic/io.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index 082e0c96db6e..76d456c516a1 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -995,6 +995,7 @@ static inline void __iomem *ioremap_uc(phys_addr_t offset, size_t size)
 {
 	return NULL;
 }
+#endif
 
 /*
  * ioremap_np needs an explicit architecture implementation, as it
@@ -1013,8 +1014,6 @@ static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
 }
 #endif
 
-#endif
-
 #ifdef CONFIG_HAS_IOPORT_MAP
 #ifndef CONFIG_GENERIC_IOMAP
 #ifndef ioport_map
-- 
2.30.0

