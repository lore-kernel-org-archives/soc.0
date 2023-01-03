Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B653DC3DA7D
	for <soc@archiver.kernel.org>; Tue,  3 Jan 2023 21:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1A0AC433EF; Tue,  3 Jan 2023 21:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31830C4339B;
	Tue,  3 Jan 2023 21:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672779908;
	bh=lLEVQzA2tlebT8QA/9LqkjR/b1kC1VTxb7QPcn+rtZ4=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=bgGm0ooI7Z7O8S2Kcc9oCnizUQcbqmdnTLhZRgi8QA9WMy12WagUsUxPtcQbAuN4u
	 4UMDRypjqe+7i/r+FGAOLr+IT+rk0NStICzwVYB9j25put4GtxuWnllBBepIdcqrdo
	 Sd3Rf41jHzV8Nue/P5N9nqD0VNdgOW2+Mjy9kRRbVHlw+NUwIwKHADR8je4tPfSPym
	 FxS+AzNRWMxY5TwevKk96Mhfpzw7/LRI1nJqgQQUdchL1tACKga97s2otheCyx6kJ3
	 3Z+lB6YsbVta+l25ypLyXorVsbuTHrEJ6XF6PWwpGtk5lVu7bVHY4K28wvuBPfKqew
	 yaMHrWsDlJI8A==
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
	soc@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: [RFC v5.1 9/9] [DON'T APPLY] cache: sifive-ccache: add cache flushing capability
Date: Tue,  3 Jan 2023 21:04:01 +0000
Message-Id: <20230103210400.3500626-10-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y62nOqzyuUKqYDpq@spud>
References: <Y62nOqzyuUKqYDpq@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3267; i=conor.dooley@microchip.com; h=from:subject; bh=SqqmRKmJx1EFKtyZtFH3JDmksLOmZmeyHlLx3UHKDvY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlbZlj+bZvcG2t3PfD4fdEU258+/yK7V2xeznZdXHDuXj7J TwKzO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRia8ZGXo+B97IuG6V7Bxw3+3r+a +6xzfPjOI+ftSBJ5oj/61kdQjD/4LL5x/OCX727NaKh/9+ZSQ1ryou+jFz2o0/0uctfPfpT2QGAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Daire McNamara <daire.mcnamara@microchip.com>

SiFive L2 cache controller can flush L2 cache. Expose this capability via
driver.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
[Conor: rebase on top of move to cache subsystem]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This commit needs more work, and a way to enable it from errata. I've
not gone and done this as PolarFire SoC has archid etc all set to zero.
So we need to go figure out a workaround for this, before adding in
errata enabling code for this. I've included it here as a second user of
the cache management stuff, since what's currently upstream for the
ccache driver does not do any cache management.
---
 drivers/cache/sifive_ccache.c | 45 +++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 47e7d6557f85..3c00f205bace 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -9,12 +9,14 @@
 #define pr_fmt(fmt) "CCACHE: " fmt
 
 #include <linux/debugfs.h>
+#include <linux/dma-direction.h>
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/device.h>
 #include <linux/bitfield.h>
 #include <asm/cacheinfo.h>
+#include <asm/cacheflush.h>
 #include <cache/sifive_ccache.h>
 
 #define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
@@ -42,11 +44,15 @@
 #define SIFIVE_CCACHE_WAYENABLE 0x08
 #define SIFIVE_CCACHE_ECCINJECTERR 0x40
 
+#define SIFIVE_CCACHE_FLUSH64 0x200
+#define SIFIVE_CCACHE_FLUSH32 0x240
+
 #define SIFIVE_CCACHE_MAX_ECCINTR 4
 
 static void __iomem *ccache_base;
 static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
 static struct riscv_cacheinfo_ops ccache_cache_ops;
+static struct riscv_cache_maint_ops ccache_cmos;
 static int level;
 
 enum {
@@ -205,6 +211,42 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	return IRQ_HANDLED;
 }
 
+static void sifive_ccache_dma_wback_inv(void* vaddr, unsigned long size)
+{
+	void * __iomem flush = ccache_base + SIFIVE_CCACHE_FLUSH64;
+	phys_addr_t start = virt_to_phys(vaddr);
+	phys_addr_t aligned_start = start & ~0x3f;
+	u64 addr;
+	u64 end;
+	u64 aligned_end;
+
+	size += start - aligned_start;
+	end = start + size;
+	aligned_end = end += 0x3f;
+	aligned_end &= ~0x3f;
+
+	for (addr = aligned_start; addr < aligned_end; addr += 64)
+		writeq(addr, flush);
+}
+
+static void sifive_ccache_cmo(unsigned int cache_size, void *vaddr, size_t size,
+			      int dir, int ops)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		sifive_ccache_dma_wback_inv(vaddr, size);
+		break;
+	case DMA_FROM_DEVICE:
+		sifive_ccache_dma_wback_inv(vaddr, size);
+		break;
+	case DMA_BIDIRECTIONAL:
+		sifive_ccache_dma_wback_inv(vaddr, size);
+		break;
+	default:
+		break;
+	}
+}
+
 static int __init sifive_ccache_init(void)
 {
 	struct device_node *np;
@@ -254,6 +296,9 @@ static int __init sifive_ccache_init(void)
 	ccache_cache_ops.get_priv_group = ccache_get_priv_group;
 	riscv_set_cacheinfo_ops(&ccache_cache_ops);
 
+	ccache_cmos.cmo_patchfunc = sifive_ccache_cmo;
+	riscv_set_cache_maint_ops(&ccache_cmos);
+
 #ifdef CONFIG_DEBUG_FS
 	setup_sifive_debug();
 #endif
-- 
2.39.0

