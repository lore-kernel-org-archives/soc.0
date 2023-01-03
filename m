Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A70C3DA7D
	for <soc@archiver.kernel.org>; Tue,  3 Jan 2023 21:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A560C433D2; Tue,  3 Jan 2023 21:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7F1C433EF;
	Tue,  3 Jan 2023 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672779880;
	bh=bttnpUl6BCbE/q8KnOj1xu1MAvPXwKnVgzNXk3Zdw1U=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ehLSXd8BDiBlDNlrSH0ntTP5uuxPr/+QIyBR2Sb4rQbPOQO9IOKFWmRY5fjcxgeJs
	 nOKybp0XvjxJTOMcOTF714uDtv8Fw0SkqRthGiEZVQUIm44LnrcxLmXiKfVpcpLUan
	 QqC66vdlmlBaRD/LBx8NEOd13h99It7Y3jfouf1pI97RjLTaN9rVwPE2zvviT4ly4O
	 ha0RJj6bmrMr4Ibe5bOPXtL/hT0+xllulYtG5yPjk+9PXIYnspqxqHLfdpvgiXF8Uq
	 QW+pE8sdSVm3yYwCuXL3Xcv2wSwcGfNMnC8Weq27qGNat91z+1mQgju5fRnIeEJ8J7
	 UsSdaoizTp1vg==
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org,
	arnd@arndb.de,
	palmer@dabbelt.com,
	prabhakar.csengg@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	geert@linux-m68k.org,
	guoren@kernel.org,
	hch@infradead.org,
	heiko@sntech.de,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	magnus.damm@gmail.com,
	nathan@kernel.org,
	paul.walmsley@sifive.com,
	philipp.tomsich@vrull.eu,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	soc@kernel.org
Subject: [RFC v5.1 4/9] riscv: mm: dma-noncoherent: Pass direction and operation to ALT_CMO_OP()
Date: Tue,  3 Jan 2023 21:03:56 +0000
Message-Id: <20230103210400.3500626-5-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y62nOqzyuUKqYDpq@spud>
References: <Y62nOqzyuUKqYDpq@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4711; i=conor.dooley@microchip.com; h=from:subject; bh=5zfzekcxdW4CVPyyS9wITNvNNLsIZnhw4rmXAoz+xFo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlbZlgkO0Rd3O8yMSrsS+iOuE3fPmR9s34mIGRxxD6Ku1Z7 5bmkjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk4ktGhl81R/Q4Lv/2/rs57ZJQvr VOwcmDsvXXkueY8125c3ya6ESGv4KXtp571sCyKcpi8ifvSeddPPm//b288Uv2w3M7BDvbN3MCAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass direction and operation to ALT_CMO_OP() macro.

Vendors might want to perform different operations based on the direction
and callbacks (arch_sync_dma_for_device/arch_sync_dma_for_cpu/
arch_dma_prep_coherent) so to handle such cases pass the direction and
operation to ALT_CMO_OP() macro. This is in preparation for adding errata
for the Andes CPU core.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
[Conor: blindy & incorrectly "fixed" pmem compilation. I've not even
tried to use the defines.]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cacheflush.h  |  4 ++++
 arch/riscv/include/asm/errata_list.h |  8 ++++++--
 arch/riscv/mm/dma-noncoherent.c      | 15 ++++++++++-----
 arch/riscv/mm/pmem.c                 |  4 ++--
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 03e3b95ae6da..e22019668b9e 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -8,6 +8,10 @@
 
 #include <linux/mm.h>
 
+#define NON_COHERENT_SYNC_DMA_FOR_DEVICE	0
+#define NON_COHERENT_SYNC_DMA_FOR_CPU		1
+#define NON_COHERENT_DMA_PREP			2
+
 static inline void local_flush_icache_all(void)
 {
 	asm volatile ("fence.i" ::: "memory");
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 2ba7e6e74540..48e899a8e7a9 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -124,7 +124,7 @@ asm volatile(ALTERNATIVE(						\
 #define THEAD_flush_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
-#define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
+#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)		\
 asm volatile(ALTERNATIVE_2(						\
 	__nops(6),							\
 	"mv a0, %1\n\t"							\
@@ -146,7 +146,11 @@ asm volatile(ALTERNATIVE_2(						\
 			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
 	: : "r"(_cachesize),						\
 	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
-	    "r"((unsigned long)(_start) + (_size))			\
+	    "r"((unsigned long)(_start) + (_size)),			\
+	    "r"((unsigned long)(_start)),				\
+	    "r"((unsigned long)(_size)),				\
+	    "r"((unsigned long)(_dir)),					\
+	    "r"((unsigned long)(_ops))					\
 	: "a0")
 
 #define THEAD_C9XX_RV_IRQ_PMU			17
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d919efab6eba..e2b82034f504 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -19,13 +19,16 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size,
+			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
 		break;
 	case DMA_FROM_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size,
+			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
 		break;
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size,
+			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
 		break;
 	default:
 		break;
@@ -42,7 +45,8 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size,
+			   dir, NON_COHERENT_SYNC_DMA_FOR_CPU);
 		break;
 	default:
 		break;
@@ -53,7 +57,8 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	void *flush_addr = page_address(page);
 
-	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size,
+		   0, NON_COHERENT_DMA_PREP);
 }
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
index 089df92ae876..4233e28d8611 100644
--- a/arch/riscv/mm/pmem.c
+++ b/arch/riscv/mm/pmem.c
@@ -10,12 +10,12 @@
 
 void arch_wb_cache_pmem(void *addr, size_t size)
 {
-	ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size, 0, 0);
 }
 EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
 
 void arch_invalidate_pmem(void *addr, size_t size)
 {
-	ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size, 0, 0);
 }
 EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
-- 
2.39.0

