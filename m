Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F882C43381
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 338CE64F44
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 338CE64F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M13O6yZ7If7YdMMyY+vHcSA2gsOYWTpsE7wbEsaAMQA=; b=xgzNP0CQ89HMBWBcHXoXnfVww
	NszZKJU4OKiUQHgm21sn/X9GS+k5hy9Enl6/2ozhl7SgQ3ndXJNneWSRAoVe0Z1H9pRj/gVvEarlD
	H5FBUxGKepKJSybaTrsDs0h0Tsq4TswM8zuo2v+Kb4oruS+26gLck/gD9vosHTcfeE9vjFJPxla0a
	aq35/zhyvHUakY0VmGMsT7Cy/Iy8H2Qsze5HaaR/SRRiPzhPJWvHmcOCtSEU1JjodVSTwjkAWYKcI
	abg0uF/1ESKA1u4BS93ijiB7DvQyRldo9e1gx9RLGprjwLi7Vyvc0GLor2CVJfIPacpL3k08V+g05
	mUHQJSQBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lRr-0008To-P5; Thu, 04 Feb 2021 20:41:55 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lR1-00084e-38
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:41:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 3A1C942864;
 Thu,  4 Feb 2021 20:40:59 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 16/18] irqchip/apple-aic: Add SMP / IPI support
Date: Fri,  5 Feb 2021 05:39:49 +0900
Message-ID: <20210204203951.52105-17-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154103_431667_F5439D96 
X-CRM114-Status: GOOD (  24.97  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204203949.siGdTJ_QHyzpXnwwBGN_o-KTH4OBbB9cn9rk7XortZQ@z>

Since the hardware IRQ controller only supports two IPIs per CPU and
Linux needs more, we implement 32 virtual IPIs using software and funnel
them through a single hardware IPI.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/irqchip/irq-apple-aic.c | 195 +++++++++++++++++++++++++++++++-
 1 file changed, 190 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 533e3ce9f432..daeffcca67ca 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -26,7 +26,9 @@
  *
  * Implementation notes:
  *
- * - This driver creates one IRQ domain for HW IRQs and the timer FIQs
+ * - This driver creates two IRQ domains, one for HW IRQs and the timer FIQs, and one for IPIs
+ * - Since Linux needs more than 2 IPIs, we implement a software IRQ controller and funnel all IPIs
+ *   into one per-CPU IPI (the second "self" IPI is unused).
  * - FIQ hwirq numbers are assigned after true hwirqs, and are per-cpu
  * - DT bindings use 3-cell form (like GIC):
  *   - <0 nr flags> - hwirq #nr
@@ -34,8 +36,8 @@
  *     - nr=0  physical timer
  *     - nr=1  virtual timer
  *   - <2 nr flags> - IPI #nr
- *     - nr=0  other IPI
- *     - nr=1  self IPI
+ *     - nr=0  other IPI (used internally for the virtual IPIs)
+ *     - nr=1  self IPI (unused)
  *
  */
 
@@ -91,6 +93,7 @@
 
 #define AIC_NR_FIQ		2
 #define AIC_NR_IPI		2
+#define AIC_NR_SWIPI		32
 
 /*
  * Max 31 bits in IPI SEND register (top bit is self).
@@ -101,9 +104,14 @@
 struct aic_irq_chip {
 	void __iomem *base;
 	struct irq_domain *hw_domain;
+	struct irq_domain *ipi_domain;
 	int nr_hw;
+	int ipi_hwirq;
 };
 
+atomic_t aic_vipi_flag[AIC_MAX_CPUS];
+atomic_t aic_vipi_mask[AIC_MAX_CPUS];
+
 static struct aic_irq_chip *aic_irqc;
 
 static inline u32 aic_ic_read(struct aic_irq_chip *ic, u32 reg)
@@ -159,6 +167,11 @@ static void aic_handle_irq(struct pt_regs *regs)
 		if (type == AIC_EVENT_TYPE_HW) {
 			handle_domain_irq(aic_irqc->hw_domain, irq, regs);
 		} else if (type == AIC_EVENT_TYPE_IPI) {
+			/*
+			 * Ensure loads from normal memory are ordered with respect to the wmb()
+			 * in aic_ipi_send_mask().
+			 */
+			rmb();
 			handle_domain_irq(aic_irqc->hw_domain,
 					  ic->nr_hw + AIC_NR_FIQ + irq - 1, regs);
 		} else {
@@ -202,11 +215,33 @@ static void __exception_irq_entry aic_handle_irq_or_fiq(struct pt_regs *regs)
 		aic_handle_irq(regs);
 }
 
+static int aic_irq_set_affinity(struct irq_data *d,
+				const struct cpumask *mask_val, bool force)
+{
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct aic_irq_chip *ic = irq_data_get_irq_chip_data(d);
+	int cpu;
+
+	if (hwirq > ic->nr_hw)
+		return -EINVAL;
+
+	if (force)
+		cpu = cpumask_first(mask_val);
+	else
+		cpu = cpumask_any_and(mask_val, cpu_online_mask);
+
+	aic_ic_write(ic, AIC_TARGET_CPU + hwirq * 4, BIT(cpu));
+	irq_data_update_effective_affinity(d, cpumask_of(cpu));
+
+	return IRQ_SET_MASK_OK;
+}
+
 static struct irq_chip aic_chip = {
 	.name = "AIC",
 	.irq_mask = aic_irq_mask,
 	.irq_unmask = aic_irq_unmask,
 	.irq_eoi = aic_irq_eoi,
+	.irq_set_affinity = aic_irq_set_affinity,
 };
 
 static int aic_irq_domain_map(struct irq_domain *id, unsigned int irq,
@@ -264,6 +299,149 @@ static const struct irq_domain_ops aic_irq_domain_ops = {
 	.xlate = aic_irq_domain_xlate,
 };
 
+static void aic_ipi_mask(struct irq_data *d)
+{
+	struct aic_irq_chip *ic = irq_data_get_irq_chip_data(d);
+	u32 irq_bit = BIT(irqd_to_hwirq(d));
+	int this_cpu = smp_processor_id();
+
+	atomic_and(~irq_bit, &aic_vipi_mask[this_cpu]);
+
+	if (!atomic_read(&aic_vipi_mask[this_cpu]))
+		aic_ic_write(ic, AIC_IPI_MASK_SET, AIC_IPI_OTHER);
+}
+
+static void aic_ipi_unmask(struct irq_data *d)
+{
+	struct aic_irq_chip *ic = irq_data_get_irq_chip_data(d);
+	u32 irq_bit = BIT(irqd_to_hwirq(d));
+	int this_cpu = smp_processor_id();
+
+	/* Make sure the kernel's idea of logical CPU order is the same as AIC's */
+	WARN_ON(aic_ic_read(ic, AIC_WHOAMI) != this_cpu);
+
+	atomic_or(irq_bit, &aic_vipi_mask[this_cpu]);
+
+	aic_ic_write(ic, AIC_IPI_MASK_CLR, AIC_IPI_OTHER);
+}
+
+static void aic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
+{
+	struct aic_irq_chip *ic = irq_data_get_irq_chip_data(d);
+	u32 irq_bit = BIT(irqd_to_hwirq(d));
+	u32 send = 0;
+	int cpu;
+
+	for_each_cpu(cpu, mask) {
+		if (atomic_read(&aic_vipi_mask[cpu]) & irq_bit) {
+			atomic_or(irq_bit, &aic_vipi_flag[cpu]);
+			send |= AIC_IPI_SEND_CPU(cpu);
+		}
+	}
+
+	if (send) {
+		/*
+		 * Ensure that stores to Normal memory are visible to the
+		 * other CPUs before issuing the IPI.
+		 */
+		wmb();
+		aic_ic_write(ic, AIC_IPI_SEND, send);
+	}
+}
+
+static struct irq_chip ipi_chip = {
+	.name = "AIC-IPI",
+	.irq_mask = aic_ipi_mask,
+	.irq_unmask = aic_ipi_unmask,
+	.ipi_send_mask = aic_ipi_send_mask,
+};
+
+static void aic_handle_ipi(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	int this_cpu = smp_processor_id();
+	int i;
+	unsigned long firing;
+
+	chained_irq_enter(chip, desc);
+	aic_ic_write(aic_irqc, AIC_IPI_ACK, AIC_IPI_OTHER);
+
+	firing = atomic_xchg(&aic_vipi_flag[this_cpu], 0);
+
+	for_each_set_bit(i, &firing, AIC_NR_SWIPI) {
+		generic_handle_irq(irq_find_mapping(aic_irqc->ipi_domain, i));
+	}
+
+	aic_ic_write(aic_irqc, AIC_IPI_MASK_CLR, AIC_IPI_OTHER);
+	chained_irq_exit(chip, desc);
+}
+
+static int aic_ipi_alloc(struct irq_domain *d, unsigned int virq,
+			 unsigned int nr_irqs, void *args)
+{
+	int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_set_percpu_devid(virq + i);
+		irq_domain_set_info(d, virq + i, i, &ipi_chip, d->host_data,
+				    handle_percpu_devid_irq, NULL, NULL);
+	}
+
+	return 0;
+}
+
+static void aic_ipi_free(struct irq_domain *d, unsigned int virq,
+			 unsigned int nr_irqs)
+{
+	/* Not freeing IPIs */
+}
+
+static const struct irq_domain_ops aic_ipi_domain_ops = {
+	.alloc = aic_ipi_alloc,
+	.free = aic_ipi_free,
+};
+
+static int aic_init_smp(struct aic_irq_chip *irqc, struct device_node *node)
+{
+	struct irq_fwspec ipi_fwspec = {
+		.fwnode         = irqc->hw_domain->fwnode,
+		.param_count    = 3,
+		.param          = {
+			[0]     = AIC_IPI,
+			[1]     = 0,
+			[2]     = 0,
+		},
+	};
+	int base_ipi, mux_irq;
+
+	mux_irq = irq_create_fwspec_mapping(&ipi_fwspec);
+	if (WARN_ON(mux_irq <= 0))
+		return -ENODEV;
+
+	irqc->ipi_domain =
+		irq_domain_create_linear(irqc->hw_domain->fwnode, AIC_NR_SWIPI,
+					 &aic_ipi_domain_ops, irqc);
+	if (WARN_ON(!irqc->ipi_domain))
+		return -ENODEV;
+
+	irqc->ipi_domain->flags |= IRQ_DOMAIN_FLAG_IPI_SINGLE;
+	irq_domain_update_bus_token(irqc->ipi_domain, DOMAIN_BUS_IPI);
+
+	base_ipi = __irq_domain_alloc_irqs(irqc->ipi_domain, -1, AIC_NR_SWIPI,
+					   NUMA_NO_NODE, NULL, false, NULL);
+
+	if (WARN_ON(!base_ipi)) {
+		irq_domain_remove(irqc->ipi_domain);
+		return -ENODEV;
+	}
+
+	set_smp_ipi_range(base_ipi, AIC_NR_SWIPI);
+
+	irq_set_chained_handler_and_data(mux_irq, aic_handle_ipi, NULL);
+
+	return 0;
+}
+
 static int __init aic_of_ic_init(struct device_node *node,
 				 struct device_node *parent)
 {
@@ -298,6 +476,13 @@ static int __init aic_of_ic_init(struct device_node *node,
 
 	irq_domain_update_bus_token(irqc->hw_domain, DOMAIN_BUS_WIRED);
 
+	if (aic_init_smp(irqc, node)) {
+		irq_domain_remove(irqc->hw_domain);
+		iounmap(irqc->base);
+		kfree(irqc);
+		return -ENODEV;
+	}
+
 	set_handle_irq(aic_handle_irq_or_fiq);
 
 	for (i = 0; i < BITS_TO_LONGS(irqc->nr_hw); i++)
@@ -307,8 +492,8 @@ static int __init aic_of_ic_init(struct device_node *node,
 	for (i = 0; i < irqc->nr_hw; i++)
 		aic_ic_write(irqc, AIC_TARGET_CPU + i * 4, 1);
 
-	pr_info("AIC: initialized with %d IRQs, %d FIQs, %d IPIs\n",
-		irqc->nr_hw, AIC_NR_FIQ, AIC_NR_IPI);
+	pr_info("AIC: initialized with %d IRQs, %d FIQs, %d IPIs, %d vIPIs\n",
+		irqc->nr_hw, AIC_NR_FIQ, AIC_NR_IPI, AIC_NR_SWIPI);
 
 	return 0;
 }
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
