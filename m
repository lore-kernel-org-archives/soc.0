Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B375DC27C4F
	for <soc@archiver.kernel.org>; Fri, 21 Jun 2024 09:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B5B2C32781; Fri, 21 Jun 2024 09:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC07C4AF09;
	Fri, 21 Jun 2024 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962727;
	bh=dZrLVKTdPiccjRN/nS6wrH8xra7iqcEJWj9cQdWfU3Y=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Viez9LUpLhXHiFu+0/0n8UqsEqbwBNJRjj4DKvzSbPQmn6qVtTPbk4ULWIyyZblu+
	 cq/jJ31HIvMJIbiXqD2IypwKXrVQEsRN92hhIGfckmEjslLqSo9ODKQ8iQNGFDqxI+
	 9zVFNjQ+QumvAdDn12NRyhG5MXH+Zz5hgUJKCyci1115m91JF1N1rLEf+iY/Xk2ID0
	 b2au888hEOzOI5hMhaCQTNGw7Qfxg/dEtRvsdxEFi7bAOaOFG1nyi4SgnaqJ7tvPu4
	 AJ023XhL3iHptBlGBlAI/urjDyKfSrA5/GGOsdm6XuvW3fXeXuCtK1aMxqEQ1gYWfn
	 kNBlOw46lzkkg==
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
Subject: [PATCH v3 3/5] irqchip/armada-370-xp: Do not touch IPI registers on platforms without IPI
Date: Fri, 21 Jun 2024 11:38:30 +0200
Message-ID: <20240621093832.23319-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240621093832.23319-1-kabel@kernel.org>
References: <20240621093832.23319-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

On platforms where IPI is not available in the MPIC, the IPI registers
instead represent an additional set of MSI interrupt registers (currently
unused by the driver).

Do not touch these registers on platforms where IPI is not available in
the MPIC.

Signed-off-by: Pali Rohár <pali@kernel.org>
[ refactored, changed commit message ]
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/irqchip/irq-armada-370-xp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index ea95e327f672..aca64de4e3f8 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -508,6 +508,9 @@ static void armada_xp_mpic_smp_cpu_init(void)
 	for (i = 0; i < nr_irqs; i++)
 		writel(i, per_cpu_int_base + ARMADA_370_XP_INT_SET_MASK_OFFS);
 
+	if (!is_ipi_available())
+		return;
+
 	/* Disable all IPIs */
 	writel(0, per_cpu_int_base + ARMADA_370_XP_IN_DRBEL_MSK_OFFS);
 
@@ -758,7 +761,7 @@ static void armada_370_xp_mpic_resume(void)
 	/* Reconfigure doorbells for IPIs and MSIs */
 	writel(doorbell_mask_reg,
 	       per_cpu_int_base + ARMADA_370_XP_IN_DRBEL_MSK_OFFS);
-	if (doorbell_mask_reg & IPI_DOORBELL_MASK)
+	if (is_ipi_available() && (doorbell_mask_reg & IPI_DOORBELL_MASK))
 		writel(0, per_cpu_int_base + ARMADA_370_XP_INT_CLEAR_MASK_OFFS);
 	if (doorbell_mask_reg & PCI_MSI_DOORBELL_MASK)
 		writel(1, per_cpu_int_base + ARMADA_370_XP_INT_CLEAR_MASK_OFFS);
@@ -809,13 +812,18 @@ static int __init armada_370_xp_mpic_of_init(struct device_node *node,
 	BUG_ON(!armada_370_xp_mpic_domain);
 	irq_domain_update_bus_token(armada_370_xp_mpic_domain, DOMAIN_BUS_WIRED);
 
+	/*
+	 * Initialize parent_irq before calling any other functions, since it is
+	 * used to distinguish between IPI and non-IPI platforms.
+	 */
+	parent_irq = irq_of_parse_and_map(node, 0);
+
 	/* Setup for the boot CPU */
 	armada_xp_mpic_perf_init();
 	armada_xp_mpic_smp_cpu_init();
 
 	armada_370_xp_msi_init(node, main_int_res.start);
 
-	parent_irq = irq_of_parse_and_map(node, 0);
 	if (parent_irq <= 0) {
 		irq_set_default_host(armada_370_xp_mpic_domain);
 		set_handle_irq(armada_370_xp_handle_irq);
-- 
2.44.2

