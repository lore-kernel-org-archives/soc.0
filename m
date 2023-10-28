Return-Path: <SRS0=ZN3n=GK=bombadil.srs.infradead.org=BATV+6c3bbb90ef8500451138+7370+infradead.org+hch@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF24FC0032E
	for <soc@archiver.kernel.org>; Sat, 28 Oct 2023 15:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 662C3C433C7; Sat, 28 Oct 2023 15:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8C87C433C8
	for <soc@kernel.org>; Sat, 28 Oct 2023 15:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8C87C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FxkCEAoZmyHY1dntYcqNDbito2HrHRLcbjhcpqYAyOw=; b=0e2nZ5N/JExBnNaMEd1R5rBRvS
	Pcais6AzEzcdwqykWKoVr+NKoY+bIIRr/p8zJS8XKCt7R5JuA/6SMLDIiW8O1O2UhjZxqihcXllPT
	pKZ4f2oRuY47Rc2GgY4iPzJf5hIqiQpajlVzyZaGQST4A9L6rmsTQXfaFJjGEQj+APaxDEH5OHipQ
	J0cprTppfL5Qun0MVdt1z52HacHZ09gdhFDnqWmrtrKqRK31jCEdq0Bu/90HdjUV7ABnyZya6NQnm
	biJq0K4/rT68dn2XicVrKdT1gFn75gGszyvnuzC9kX5ooujTJZSDBYbujapRppIA2DDhzMpZcWAHj
	e2crXUAQ==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qwlae-000cV5-0R;
	Sat, 28 Oct 2023 15:51:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: geert+renesas@glider.be,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
List-Id: <soc.lore.kernel.org>
Cc: conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	soc@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: split cache ops out of dma-noncoherent.c
Date: Sat, 28 Oct 2023 17:51:01 +0200
Message-Id: <20231028155101.1039049-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The cache ops are also used by the pmem code which is unconditionally
built into the kernel.  Move them into a separate file that is built
based on the correct config option.

Fixes: fd962781270e ("riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/Makefile          |  1 +
 arch/riscv/mm/cache-ops.c       | 17 +++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c | 15 ---------------
 3 files changed, 18 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/mm/cache-ops.c

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 9c454f90fd3da2..3a4dfc8babcf8c 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -36,3 +36,4 @@ endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
 obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
+obj-$(CONFIG_RISCV_NONSTANDARD_CACHE_OPS) += cache-ops.o
diff --git a/arch/riscv/mm/cache-ops.c b/arch/riscv/mm/cache-ops.c
new file mode 100644
index 00000000000000..a993ad11d0eca9
--- /dev/null
+++ b/arch/riscv/mm/cache-ops.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#include <asm/dma-noncoherent.h>
+
+struct riscv_nonstd_cache_ops noncoherent_cache_ops __ro_after_init;
+
+void
+riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops *ops)
+{
+	if (!ops)
+		return;
+	noncoherent_cache_ops = *ops;
+}
+EXPORT_SYMBOL_GPL(riscv_noncoherent_register_cache_ops);
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index b76e7e192eb183..341bd6706b4c56 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -15,12 +15,6 @@ static bool noncoherent_supported __ro_after_init;
 int dma_cache_alignment __ro_after_init = ARCH_DMA_MINALIGN;
 EXPORT_SYMBOL_GPL(dma_cache_alignment);
 
-struct riscv_nonstd_cache_ops noncoherent_cache_ops __ro_after_init = {
-	.wback = NULL,
-	.inv = NULL,
-	.wback_inv = NULL,
-};
-
 static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	void *vaddr = phys_to_virt(paddr);
@@ -162,12 +156,3 @@ void __init riscv_set_dma_cache_alignment(void)
 	if (!noncoherent_supported)
 		dma_cache_alignment = 1;
 }
-
-void riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops *ops)
-{
-	if (!ops)
-		return;
-
-	noncoherent_cache_ops = *ops;
-}
-EXPORT_SYMBOL_GPL(riscv_noncoherent_register_cache_ops);
-- 
2.39.2

