Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506A5C3DA7D
	for <soc@archiver.kernel.org>; Tue,  3 Jan 2023 21:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39CA4C433D2; Tue,  3 Jan 2023 21:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE0DC4339C;
	Tue,  3 Jan 2023 21:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672779897;
	bh=NVIPLNYadwmjyO6vDZQxAZdtNdwO+ess1cn15D0qw2s=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=SkkSGtF1vkXkWTJNQJm22SXWH2CUOczc5Mshw5+BvXm1WkFJukw4CKrnQeaYHDbCI
	 9Fg59EwtsGD2Bo+bMqf4Dt3vFOQlLTBa8UCxS6uDVkfEbE7qj0SkUbPhwtoSQHHM9x
	 xFowfTASYWM9JB/kuYwuDXFsGzna1YItCCGeCGEr/sYAivnXJ4X4XGZeFy+F3Rv4Qc
	 bIX+JN2ytWpJgsONwursvqauYalnaNgemd2NGju6nCoz6+co4qTAQUGekm00Y64GKP
	 wQrxGcS0Q0xO9TS1NvqG9UA7dHhXNTjDmbDHPap/cNtmNPTYJhVErrSlWpRUBXEMnb
	 9RCahHg6uXXvQ==
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
Subject: [RFC v5.1 7/9] RISC-V: create a function based cache management interface
Date: Tue,  3 Jan 2023 21:03:59 +0000
Message-Id: <20230103210400.3500626-8-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y62nOqzyuUKqYDpq@spud>
References: <Y62nOqzyuUKqYDpq@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3722; i=conor.dooley@microchip.com; h=from:subject; bh=KCrSQFVyUXaCXRh9Hgy+cOwp3MiY7fZYkk/trWQ+OXo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlbZljaNOUW+m1dw/mg+7tU0rLz1xoOTOQuj1Pu4E9ZXdDG 9mF3RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYSY8/I0HvvZ8td23t/0yZHTVzx3V bzz+yTr4o1P2uIfprRkR8ec4aRoVGVy+hDQsWL0LRp2lOmqtT7fFG8smWjaPRGh/bihdOvsQEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The Zicbo* set of extensions for cache maintenance arrived too late &
several SoCs exist without them that require non-coherent DMA.
As things stand, the StarFive JH7100, Microchip PolarFire SoC & Renesas
RZ/Five all require cache maintenance and lack instructions for this
purpose.
Similar to the interface already used by the SiFive CCache driver to add
cacheinfo_ops, create an interface for registering cache management
functions for a given cache controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Yes, I made the cmo_patchfunc() __maybe_unused to escape LKP complaints.
The other option that Prabhakar mentioned was having explicit functions
for each of the operations, in which case I cmo_patchfunc() would go
away. I don't particularly like the name of that function, so any
suggestions there would be great!
---
 arch/riscv/Kconfig.erratas          |  4 ++++
 arch/riscv/include/asm/cacheflush.h | 19 +++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 21 +++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index f0f0c1abd52b..b8542e6e8f18 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -1,5 +1,8 @@
 menu "CPU errata selection"
 
+config ERRATA_CMO_FUNC
+	bool
+
 config ERRATA_ANDES
 	bool "Andes AX45MP errata"
 	depends on !XIP_KERNEL
@@ -14,6 +17,7 @@ config ERRATA_ANDES
 config ERRATA_ANDES_CMO
 	bool "Apply Andes cache management errata"
 	depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
+	select ERRATA_CMO_FUNC
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index e22019668b9e..795205ec2028 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -62,6 +62,25 @@ void riscv_noncoherent_supported(void);
 static inline void riscv_noncoherent_supported(void) {}
 #endif
 
+struct riscv_cache_maint_ops {
+	void (*cmo_patchfunc) (unsigned int cache_size, void *vaddr,
+			       size_t size, int dir, int ops);
+};
+
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+void riscv_set_cache_maint_ops(struct riscv_cache_maint_ops *ops);
+#else
+static void riscv_set_cache_maint_ops(struct riscv_cache_maint_ops *ops) {}
+#endif
+
+#ifdef CONFIG_ERRATA_CMO_FUNC
+asmlinkage void cmo_patchfunc(unsigned int cache_size, void *vaddr, size_t size,
+			      int dir, int ops);
+#else
+__maybe_unused static void cmo_patchfunc(unsigned int cache_size, void *vaddr,
+					 size_t size, int dir, int ops) {}
+#endif
+
 /*
  * Bits in sys_riscv_flush_icache()'s flags argument.
  */
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index e2b82034f504..2f4f147ea0b9 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -83,3 +83,24 @@ void riscv_noncoherent_supported(void)
 	     "Non-coherent DMA support enabled without a block size\n");
 	noncoherent_supported = true;
 }
+
+static struct riscv_cache_maint_ops *rv_cache_maint_ops;
+static DEFINE_STATIC_KEY_FALSE(cmo_patchfunc_present);
+
+void riscv_set_cache_maint_ops(struct riscv_cache_maint_ops *ops)
+{
+	rv_cache_maint_ops = ops;
+	static_branch_enable(&cmo_patchfunc_present);
+}
+EXPORT_SYMBOL_GPL(riscv_set_cache_maint_ops);
+
+#ifdef CONFIG_ERRATA_CMO_FUNC
+asmlinkage void cmo_patchfunc(unsigned int cache_size, void *vaddr, size_t size,
+			      int dir, int ops)
+{
+	if (!static_branch_unlikely(&cmo_patchfunc_present))
+		return;
+
+	rv_cache_maint_ops->cmo_patchfunc(cache_size, vaddr, size, dir, ops);
+}
+#endif
-- 
2.39.0

