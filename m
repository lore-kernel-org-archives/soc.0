Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E896EC3DA7D
	for <soc@archiver.kernel.org>; Tue,  3 Jan 2023 21:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFEC5C43392; Tue,  3 Jan 2023 21:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B55C433EF;
	Tue,  3 Jan 2023 21:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672779902;
	bh=JSvers6ooGj7S89bt0SV5sdIoChbgErqxdTQvu7gK5U=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=GebX3SAxQluwud3ZPlEcg0kkeorC+KoKK01hemyEScmZJ45JBQM06Lj5XsCBVB+tI
	 cQAMScwqzcuAnjO4e3shm7Z9/lek8237K6YQIr3bblOy2XnGKt0ySwNLuxZG/YKBWQ
	 p8QUXXHmPKl83jPsfGe2RsvTWofd5XvoxdYA+crJz172IiCj/x/+ZXn0QnblIaNM+R
	 mpZCkPlbJ/giCK3SpU2ykIJK3zKr4xtawCwaQ1PTxHVZ6PD5R/U7+WrG5XluQOkRsm
	 QsN2uEawFZIo2fzoA9vE0+Ri7I90BAp0kqMQSFeZfjvA4JsM/uQwzqeU9MctMED5OM
	 bapMqpu5x015A==
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
Subject: [RFC v5.1 8/9] soc: renesas: Add L2 cache management for RZ/Five SoC
Date: Tue,  3 Jan 2023 21:04:00 +0000
Message-Id: <20230103210400.3500626-9-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y62nOqzyuUKqYDpq@spud>
References: <Y62nOqzyuUKqYDpq@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13665; i=conor.dooley@microchip.com; h=from:subject; bh=UgbJwiazn4htwD36u3aLhV+P7EIpC/n0AX0SnME6DEg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlbZlhuqry5P+Xl8Xcf+VVk5h874LB3YpNVk0+piOXB2BIb Q7NvHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI/iRGhm2m8jeEtvZ5Phe4/WK9pl 9ApnTMad2G/up+EZ6GNfbR2Qz/FB+YCbq/EfGe+GY1m3lfdePZyIvWryuSal78m+WnxXeQAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I/O Coherence Port (IOCP) provides an AXI interface for connecting
external non-caching masters, such as DMA controllers. The accesses
from IOCP are coherent with D-Caches and L2 Cache.

IOCP is a specification option and is disabled on the Renesas RZ/Five
SoC due to this reason IP blocks using DMA will fail.

The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
block that allows dynamic adjustment of memory attributes in the runtime.
It contains a configurable amount of PMA entries implemented as CSR
registers to control the attributes of memory locations in interest.
Below are the memory attributes supported:
* Device, Non-bufferable
* Device, bufferable
* Memory, Non-cacheable, Non-bufferable
* Memory, Non-cacheable, Bufferable
* Memory, Write-back, No-allocate
* Memory, Write-back, Read-allocate
* Memory, Write-back, Write-allocate
* Memory, Write-back, Read and Write-allocate

More info about PMA (section 10.3):
Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

As a workaround for SoCs with IOCP disabled CMO needs to be handled by
software. Firstly OpenSBI configures the memory region as
"Memory, Non-cacheable, Bufferable" and passes this region as a global
shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
allocations happen from this region and synchronization callbacks are
implemented to synchronize when doing DMA transactions.

Example PMA region passes as a DT node from OpenSBI:
    reserved-memory {
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;

        pma_resv0@58000000 {
            compatible = "shared-dma-pool";
            reg = <0x0 0x58000000 0x0 0x08000000>;
            no-map;
            linux,dma-default;
        };
    };

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
[Conor: moved the driver to drivers/cache]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/errata_list.h |  28 ++-
 drivers/cache/Kconfig                |   9 +
 drivers/cache/Makefile               |   2 +
 drivers/cache/ax45mp_cache.c         | 253 +++++++++++++++++++++++++++
 drivers/soc/renesas/Kconfig          |   4 +
 5 files changed, 290 insertions(+), 6 deletions(-)
 create mode 100644 drivers/cache/ax45mp_cache.c

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 48e899a8e7a9..7636b83c1ecb 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -125,8 +125,8 @@ asm volatile(ALTERNATIVE(						\
 #define THEAD_SYNC_S	".long 0x0190000b"
 
 #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)		\
-asm volatile(ALTERNATIVE_2(						\
-	__nops(6),							\
+asm volatile(ALTERNATIVE_3(						\
+	__nops(14),							\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
@@ -134,7 +134,7 @@ asm volatile(ALTERNATIVE_2(						\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
-	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
+	__nops(9), 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
@@ -142,8 +142,24 @@ asm volatile(ALTERNATIVE_2(						\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
-	THEAD_SYNC_S, THEAD_VENDOR_ID,					\
-			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
+	THEAD_SYNC_S "\n\t"						\
+	__nops(8), THEAD_VENDOR_ID,					\
+			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO,	\
+	"addi sp,sp,-16\n\t"						\
+	"sd s0,0(sp)\n\t"						\
+	"sd ra,8(sp)\n\t"						\
+	"addi s0,sp,16\n\t"						\
+	"mv a4,%6\n\t"							\
+	"mv a3,%5\n\t"							\
+	"mv a2,%4\n\t"							\
+	"mv a1,%3\n\t"							\
+	"mv a0,%0\n\t"							\
+	"call cmo_patchfunc\n\t"					\
+	"ld ra,8(sp)\n\t"						\
+	"ld s0,0(sp)\n\t"						\
+	"addi sp,sp,16\n\t",						\
+	ANDESTECH_VENDOR_ID, ERRATA_ANDESTECH_NO_IOCP,			\
+	CONFIG_ERRATA_ANDES_CMO)					\
 	: : "r"(_cachesize),						\
 	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
 	    "r"((unsigned long)(_start) + (_size)),			\
@@ -151,7 +167,7 @@ asm volatile(ALTERNATIVE_2(						\
 	    "r"((unsigned long)(_size)),				\
 	    "r"((unsigned long)(_dir)),					\
 	    "r"((unsigned long)(_ops))					\
-	: "a0")
+	: "a0", "a1", "a2", "a3", "a4", "memory")
 
 #define THEAD_C9XX_RV_IRQ_PMU			17
 #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index bc852f005c10..e3309a668d1b 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -6,6 +6,15 @@ menuconfig CACHE_CONTROLLER
 
 if CACHE_CONTROLLER
 
+config AX45MP_L2_CACHE
+	bool "Andes Technology AX45MP L2 Cache controller"
+	depends on RISCV
+	depends on RISCV_SBI
+	default y
+	help
+	  Support for the L2 cache controller on Andes Technology AX45MP
+	  platforms.
+
 config SIFIVE_CCACHE
 	bool "Sifive Composable Cache controller"
 	depends on RISCV
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index 1f5dc339bf82..f175d16d8611 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
+
+obj-$(CONFIG_AX45MP_L2_CACHE)	+= ax45mp_cache.o
 obj-$(CONFIG_SIFIVE_CCACHE)	+= sifive_ccache.o
diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
new file mode 100644
index 000000000000..a488b85b9eea
--- /dev/null
+++ b/drivers/cache/ax45mp_cache.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * non-coherent cache functions for Andes AX45MP
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/cacheinfo.h>
+#include <linux/dma-direction.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+#include <asm/cacheflush.h>
+#include <asm/sbi.h>
+
+/* L2 cache registers */
+#define AX45MP_L2C_REG_CTL_OFFSET		0x8
+
+#define AX45MP_L2C_REG_C0_CMD_OFFSET		0x40
+#define AX45MP_L2C_REG_C0_ACC_OFFSET		0x48
+#define AX45MP_L2C_REG_STATUS_OFFSET		0x80
+
+/* D-cache operation */
+#define AX45MP_CCTL_L1D_VA_INVAL		0
+#define AX45MP_CCTL_L1D_VA_WB			1
+
+/* L2 CCTL status */
+#define AX45MP_CCTL_L2_STATUS_IDLE		0
+
+/* L2 CCTL status cores mask */
+#define AX45MP_CCTL_L2_STATUS_C0_MASK		0xf
+
+/* L2 cache operation */
+#define AX45MP_CCTL_L2_PA_INVAL			0x8
+#define AX45MP_CCTL_L2_PA_WB			0x9
+
+#define AX45MP_L2C_REG_PER_CORE_OFFSET		0x10
+#define AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET	4
+
+#define AX45MP_L2C_REG_CN_CMD_OFFSET(n)	\
+	(AX45MP_L2C_REG_C0_CMD_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
+#define AX45MP_L2C_REG_CN_ACC_OFFSET(n)	\
+	(AX45MP_L2C_REG_C0_ACC_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
+#define AX45MP_CCTL_L2_STATUS_CN_MASK(n)	\
+	(AX45MP_CCTL_L2_STATUS_C0_MASK << ((n) * AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET))
+
+#define AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
+#define AX45MP_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
+
+#define AX45MP_CACHE_LINE_SIZE			64
+
+struct ax45mp_priv {
+	void __iomem *l2c_base;
+	u32 ax45mp_cache_line_size;
+};
+
+static struct ax45mp_priv *ax45mp_priv;
+static struct riscv_cache_maint_ops ax45mp_cmos;
+
+/* L2 Cache operations */
+static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
+{
+	return readl(ax45mp_priv->l2c_base + AX45MP_L2C_REG_STATUS_OFFSET);
+}
+
+/*
+ * Software trigger CCTL operation (cache maintenance operations) by writing
+ * to ucctlcommand and ucctlbeginaddr registers and write-back an L2 cache
+ * entry.
+ */
+static void ax45mp_cpu_dcache_wb_range(void *start, void *end, int line_size)
+{
+	void __iomem *base = ax45mp_priv->l2c_base;
+	int mhartid = smp_processor_id();
+	unsigned long pa;
+
+	while (end > start) {
+		csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
+		csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, AX45MP_CCTL_L1D_VA_WB);
+
+		pa = virt_to_phys(start);
+		writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
+		writel(AX45MP_CCTL_L2_PA_WB,
+		       base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
+		while ((ax45mp_cpu_l2c_get_cctl_status() &
+			AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
+			AX45MP_CCTL_L2_STATUS_IDLE)
+			;
+
+		start += line_size;
+	}
+}
+
+/*
+ * Software trigger CCTL operation by writing to ucctlcommand and ucctlbeginaddr
+ * registers and invalidate the L2 cache entry.
+ */
+static void ax45mp_cpu_dcache_inval_range(void *start, void *end, int line_size)
+{
+	void __iomem *base = ax45mp_priv->l2c_base;
+	int mhartid = smp_processor_id();
+	unsigned long pa;
+
+	while (end > start) {
+		csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
+		csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, AX45MP_CCTL_L1D_VA_INVAL);
+
+		pa = virt_to_phys(start);
+		writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
+		writel(AX45MP_CCTL_L2_PA_INVAL,
+		       base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
+		while ((ax45mp_cpu_l2c_get_cctl_status() &
+			AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
+			AX45MP_CCTL_L2_STATUS_IDLE)
+			;
+
+		start += line_size;
+	}
+}
+
+static void ax45mp_cpu_dma_inval_range(void *vaddr, size_t size)
+{
+	char cache_buf[2][AX45MP_CACHE_LINE_SIZE];
+	unsigned long start = (unsigned long)vaddr;
+	unsigned long end = start + size;
+	unsigned long old_start = start;
+	unsigned long old_end = end;
+	unsigned long line_size;
+	unsigned long flags;
+
+	if (unlikely(start == end))
+		return;
+
+	line_size = ax45mp_priv->ax45mp_cache_line_size;
+
+	memset(&cache_buf, 0x0, sizeof(cache_buf));
+	start = start & (~(line_size - 1));
+	end = ((end + line_size - 1) & (~(line_size - 1)));
+
+	local_irq_save(flags);
+	if (unlikely(start != old_start))
+		memcpy(&cache_buf[0][0], (void *)start, line_size);
+
+	if (unlikely(end != old_end))
+		memcpy(&cache_buf[1][0], (void *)(old_end & (~(line_size - 1))), line_size);
+
+	ax45mp_cpu_dcache_inval_range(vaddr, (void *)end, line_size);
+
+	if (unlikely(start != old_start))
+		memcpy((void *)start, &cache_buf[0][0], (old_start & (line_size - 1)));
+
+	local_irq_restore(flags);
+}
+
+static void ax45mp_cpu_dma_wb_range(void *vaddr, size_t size)
+{
+	unsigned long start = (unsigned long)vaddr;
+	unsigned long end = start + size;
+	unsigned long line_size;
+	unsigned long flags;
+
+	line_size = ax45mp_priv->ax45mp_cache_line_size;
+	local_irq_save(flags);
+	start = start & (~(line_size - 1));
+	ax45mp_cpu_dcache_wb_range(vaddr, (void *)end, line_size);
+	local_irq_restore(flags);
+}
+
+static void ax45mp_no_iocp_cmo(unsigned int cache_size, void *vaddr, size_t size, int dir, int ops)
+{
+	if (ops == NON_COHERENT_DMA_PREP)
+		return;
+
+	if (ops == NON_COHERENT_SYNC_DMA_FOR_DEVICE) {
+		switch (dir) {
+		case DMA_FROM_DEVICE:
+			ax45mp_cpu_dma_inval_range(vaddr, size);
+			break;
+		case DMA_TO_DEVICE:
+		case DMA_BIDIRECTIONAL:
+			ax45mp_cpu_dma_wb_range(vaddr, size);
+			break;
+		default:
+			break;
+		}
+		return;
+	}
+
+	/* op == NON_COHERENT_SYNC_DMA_FOR_CPU */
+	if (dir == DMA_BIDIRECTIONAL || dir == DMA_FROM_DEVICE)
+		ax45mp_cpu_dma_inval_range(vaddr, size);
+}
+
+static void ax45mp_configure_l2_cache(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = of_property_read_u32(np, "cache-line-size", &ax45mp_priv->ax45mp_cache_line_size);
+	if (ret) {
+		dev_err(dev, "Failed to get cache-line-size, defaulting to 64 bytes\n");
+		ax45mp_priv->ax45mp_cache_line_size = AX45MP_CACHE_LINE_SIZE;
+	}
+
+	if (ax45mp_priv->ax45mp_cache_line_size != AX45MP_CACHE_LINE_SIZE) {
+		dev_err(dev, "Expected cache-line-size to be 64 bytes (found:%u). Defaulting to 64 bytes\n",
+			ax45mp_priv->ax45mp_cache_line_size);
+		ax45mp_priv->ax45mp_cache_line_size = AX45MP_CACHE_LINE_SIZE;
+	}
+}
+
+static int ax45mp_l2c_probe(struct platform_device *pdev)
+{
+	ax45mp_priv = devm_kzalloc(&pdev->dev, sizeof(*ax45mp_priv), GFP_KERNEL);
+	if (!ax45mp_priv)
+		return -ENOMEM;
+
+	ax45mp_priv->l2c_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ax45mp_priv->l2c_base))
+		return PTR_ERR(ax45mp_priv->l2c_base);
+
+	ax45mp_configure_l2_cache(pdev);
+
+	ax45mp_cmos.cmo_patchfunc = ax45mp_no_iocp_cmo;
+	riscv_set_cache_maint_ops(&ax45mp_cmos);
+
+	return 0;
+}
+
+static const struct of_device_id ax45mp_cache_ids[] = {
+	{ .compatible = "andestech,ax45mp-cache" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver ax45mp_l2c_driver = {
+	.driver = {
+		.name = "ax45mp-l2c",
+		.of_match_table = ax45mp_cache_ids,
+	},
+	.probe = ax45mp_l2c_probe,
+};
+
+static int __init ax45mp_cache_init(void)
+{
+	return platform_driver_register(&ax45mp_l2c_driver);
+}
+arch_initcall(ax45mp_cache_init);
+
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Andes AX45MP L2 cache driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 660498252ec5..c3475c084685 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -340,6 +340,10 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	select ARCH_RZG2L
+	select AX45MP_L2_CACHE
+	select DMA_GLOBAL_POOL
+	select ERRATA_ANDES
+	select ERRATA_ANDES_CMO
 	help
 	  This enables support for the Renesas RZ/Five SoC.
 
-- 
2.39.0

