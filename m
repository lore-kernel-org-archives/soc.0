Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF6EC2BA1A
	for <soc@archiver.kernel.org>; Fri, 21 Jun 2024 09:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4CDFC32781; Fri, 21 Jun 2024 09:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C13C2BBFC;
	Fri, 21 Jun 2024 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962730;
	bh=BxDi/2A/VpuLHj7Y7p1xYV7lGTZaxc9UA9RFY1emoOA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VDDuJzigS8WBss4wiIY69MeRAwvbV+ziPD/anwU8G7q6Cs4mL9teBAO/9CLBaJuF6
	 365PpZmKRYhhhp3/x0df4bhEx5QltLapwOuGlkykJcsSuqjduOa2o5BxILGVbLBqla
	 CtyKR6mG3Qm1vIcNtugqoEVNwYuCmaPwVOYorOwUnwTeEX3iC2hk9eIdci0U2kPaoi
	 ZrjBOpmEjLfjka4IYrzkAQ+0QTFFdlzTktoJO7yR3kVaVKjrMfe9P/JDqzRi4nIzhI
	 bVxfEErAqWKlLNftWa4Ls+1CGVzMPr4F2zh6OASj4R3ge8s1yK/mmIWnXBpwnonSg1
	 A3YxGAIEORlhQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v3 4/5] irqchip/armada-370-xp: Add support for 32 MSI interrupts on non-IPI platforms
Date: Fri, 21 Jun 2024 11:38:31 +0200
Message-ID: <20240621093832.23319-5-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240621093832.23319-1-kabel@kernel.org>
References: <20240621093832.23319-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

The doorbell interrupts have the following layout on IPI vs no-IPI
platforms:

                    |  0...7  |  8...15  |       16...31       |
  ------------------+---------+----------+---------------------+
       IPI platform |   IPI   |   n/a    |         MSI         |
  ------------------+---------+----------+---------------------+
   non-IPI platform |                   MSI                    |
  ------------------+------------------------------------------+

Currently the driver only allows for the upper 16...31 interrupts for
MSI domain (i.e. the MSI domain has only 16 interrupts).

On platforms where IPI is not available, we can use whole 32 MSI
interrupts.

Implement support also for the lower 16 MSI interrupts on non-IPI
platforms.

Signed-off-by: Pali Rohár <pali@kernel.org>
[ refactored, changed commit message ]
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/irqchip/irq-armada-370-xp.c | 77 +++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index aca64de4e3f8..ada257aeba78 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -13,6 +13,7 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -136,6 +137,7 @@
 
 #define ARMADA_370_XP_MAX_PER_CPU_IRQS		(28)
 
+/* IPI and MSI interrupt definitions for IPI platforms */
 #define IPI_DOORBELL_START                      (0)
 #define IPI_DOORBELL_END                        (8)
 #define IPI_DOORBELL_MASK                       0xFF
@@ -144,6 +146,14 @@
 #define PCI_MSI_DOORBELL_END                    (32)
 #define PCI_MSI_DOORBELL_MASK                   0xFFFF0000
 
+/* MSI interrupt definitions for non-IPI platforms */
+#define PCI_MSI_FULL_DOORBELL_START		0
+#define PCI_MSI_FULL_DOORBELL_NR		32
+#define PCI_MSI_FULL_DOORBELL_END		32
+#define PCI_MSI_FULL_DOORBELL_MASK		GENMASK(31, 0)
+#define PCI_MSI_FULL_DOORBELL_SRC0_MASK		GENMASK(15, 0)
+#define PCI_MSI_FULL_DOORBELL_SRC1_MASK		GENMASK(31, 16)
+
 static void __iomem *per_cpu_int_base;
 static void __iomem *main_int_base;
 static struct irq_domain *armada_370_xp_mpic_domain;
@@ -152,7 +162,7 @@ static int parent_irq;
 #ifdef CONFIG_PCI_MSI
 static struct irq_domain *armada_370_xp_msi_domain;
 static struct irq_domain *armada_370_xp_msi_inner_domain;
-static DECLARE_BITMAP(msi_used, PCI_MSI_DOORBELL_NR);
+static DECLARE_BITMAP(msi_used, PCI_MSI_FULL_DOORBELL_NR);
 static DEFINE_MUTEX(msi_used_lock);
 static phys_addr_t msi_doorbell_addr;
 #endif
@@ -168,6 +178,30 @@ static inline bool is_ipi_available(void)
 	return parent_irq <= 0;
 }
 
+static inline u32 msi_doorbell_mask(void)
+{
+	return is_ipi_available() ? PCI_MSI_DOORBELL_MASK :
+				    PCI_MSI_FULL_DOORBELL_MASK;
+}
+
+static inline unsigned int msi_doorbell_start(void)
+{
+	return is_ipi_available() ? PCI_MSI_DOORBELL_START :
+				    PCI_MSI_FULL_DOORBELL_START;
+}
+
+static inline unsigned int msi_doorbell_size(void)
+{
+	return is_ipi_available() ? PCI_MSI_DOORBELL_NR :
+				    PCI_MSI_FULL_DOORBELL_NR;
+}
+
+static inline unsigned int msi_doorbell_end(void)
+{
+	return is_ipi_available() ? PCI_MSI_DOORBELL_END :
+				    PCI_MSI_FULL_DOORBELL_END;
+}
+
 static inline bool is_percpu_irq(irq_hw_number_t irq)
 {
 	if (irq <= ARMADA_370_XP_MAX_PER_CPU_IRQS)
@@ -225,7 +259,7 @@ static void armada_370_xp_compose_msi_msg(struct irq_data *data, struct msi_msg
 
 	msg->address_lo = lower_32_bits(msi_doorbell_addr);
 	msg->address_hi = upper_32_bits(msi_doorbell_addr);
-	msg->data = BIT(cpu + 8) | (data->hwirq + PCI_MSI_DOORBELL_START);
+	msg->data = BIT(cpu + 8) | (data->hwirq + msi_doorbell_start());
 }
 
 static int armada_370_xp_msi_set_affinity(struct irq_data *irq_data,
@@ -258,7 +292,7 @@ static int armada_370_xp_msi_alloc(struct irq_domain *domain, unsigned int virq,
 	int hwirq, i;
 
 	mutex_lock(&msi_used_lock);
-	hwirq = bitmap_find_free_region(msi_used, PCI_MSI_DOORBELL_NR,
+	hwirq = bitmap_find_free_region(msi_used, msi_doorbell_size(),
 					order_base_2(nr_irqs));
 	mutex_unlock(&msi_used_lock);
 
@@ -295,9 +329,10 @@ static void armada_370_xp_msi_reenable_percpu(void)
 	u32 reg;
 
 	/* Enable MSI doorbell mask and combined cpu local interrupt */
-	reg = readl(per_cpu_int_base + ARMADA_370_XP_IN_DRBEL_MSK_OFFS)
-		| PCI_MSI_DOORBELL_MASK;
+	reg = readl(per_cpu_int_base + ARMADA_370_XP_IN_DRBEL_MSK_OFFS);
+	reg |= msi_doorbell_mask();
 	writel(reg, per_cpu_int_base + ARMADA_370_XP_IN_DRBEL_MSK_OFFS);
+
 	/* Unmask local doorbell interrupt */
 	writel(1, per_cpu_int_base + ARMADA_370_XP_INT_CLEAR_MASK_OFFS);
 }
@@ -309,7 +344,7 @@ static int armada_370_xp_msi_init(struct device_node *node,
 		ARMADA_370_XP_SW_TRIG_INT_OFFS;
 
 	armada_370_xp_msi_inner_domain =
-		irq_domain_add_linear(NULL, PCI_MSI_DOORBELL_NR,
+		irq_domain_add_linear(NULL, msi_doorbell_size(),
 				      &armada_370_xp_msi_domain_ops, NULL);
 	if (!armada_370_xp_msi_inner_domain)
 		return -ENOMEM;
@@ -325,6 +360,10 @@ static int armada_370_xp_msi_init(struct device_node *node,
 
 	armada_370_xp_msi_reenable_percpu();
 
+	/* Unmask low 16 MSI irqs on non-IPI platforms */
+	if (!is_ipi_available())
+		writel(0, per_cpu_int_base + ARMADA_370_XP_INT_CLEAR_MASK_OFFS);
+
 	return 0;
 }
 #else
@@ -619,20 +658,20 @@ static void armada_370_xp_handle_msi_irq(struct pt_regs *regs, bool is_chained)
 	u32 msimask, msinr;
 
 	msimask = readl_relaxed(per_cpu_int_base +
-				ARMADA_370_XP_IN_DRBEL_CAUSE_OFFS)
-		& PCI_MSI_DOORBELL_MASK;
+				ARMADA_370_XP_IN_DRBEL_CAUSE_OFFS);
+	msimask &= msi_doorbell_mask();
 
 	writel(~msimask, per_cpu_int_base +
 	       ARMADA_370_XP_IN_DRBEL_CAUSE_OFFS);
 
-	for (msinr = PCI_MSI_DOORBELL_START;
-	     msinr < PCI_MSI_DOORBELL_END; msinr++) {
+	for (msinr = msi_doorbell_start();
+	     msinr < msi_doorbell_end(); msinr++) {
 		unsigned int irq;
 
 		if (!(msimask & BIT(msinr)))
 			continue;
 
-		irq = msinr - PCI_MSI_DOORBELL_START;
+		irq = msinr - msi_doorbell_start();
 
 		generic_handle_domain_irq(armada_370_xp_msi_inner_domain, irq);
 	}
@@ -661,7 +700,7 @@ static void armada_370_xp_mpic_handle_cascade_irq(struct irq_desc *desc)
 		if (!(irqsrc & ARMADA_370_XP_INT_IRQ_FIQ_MASK(cpuid)))
 			continue;
 
-		if (irqn == 1) {
+		if (irqn == 0 || irqn == 1) {
 			armada_370_xp_handle_msi_irq(NULL, true);
 			continue;
 		}
@@ -722,6 +761,7 @@ static int armada_370_xp_mpic_suspend(void)
 
 static void armada_370_xp_mpic_resume(void)
 {
+	bool src0, src1;
 	int nirqs;
 	irq_hw_number_t irq;
 
@@ -761,9 +801,18 @@ static void armada_370_xp_mpic_resume(void)
 	/* Reconfigure doorbells for IPIs and MSIs */
 	writel(doorbell_mask_reg,
 	       per_cpu_int_base + ARMADA_370_XP_IN_DRBEL_MSK_OFFS);
-	if (is_ipi_available() && (doorbell_mask_reg & IPI_DOORBELL_MASK))
+
+	if (is_ipi_available()) {
+		src0 = doorbell_mask_reg & IPI_DOORBELL_MASK;
+		src1 = doorbell_mask_reg & PCI_MSI_DOORBELL_MASK;
+	} else {
+		src0 = doorbell_mask_reg & PCI_MSI_FULL_DOORBELL_SRC0_MASK;
+		src1 = doorbell_mask_reg & PCI_MSI_FULL_DOORBELL_SRC1_MASK;
+	}
+
+	if (src0)
 		writel(0, per_cpu_int_base + ARMADA_370_XP_INT_CLEAR_MASK_OFFS);
-	if (doorbell_mask_reg & PCI_MSI_DOORBELL_MASK)
+	if (src1)
 		writel(1, per_cpu_int_base + ARMADA_370_XP_INT_CLEAR_MASK_OFFS);
 
 	if (is_ipi_available())
-- 
2.44.2

