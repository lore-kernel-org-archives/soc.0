Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC563C27C4F
	for <soc@archiver.kernel.org>; Fri, 21 Jun 2024 09:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 921BCC4AF09; Fri, 21 Jun 2024 09:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31A6C2BBFC;
	Fri, 21 Jun 2024 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962724;
	bh=rjmq+a+eqDmXMO7oWjSTlXXoL3t36KVhnFeyO68IOhY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWtsPAWN7tacbP8TqQBX9XZ7Nw4o3usNXKyuJwXs2LsAfEKGWFm83kMtdDjX0Lgkr
	 jduC01mgYAfQvu3UCbhSZkRklwDrbTPy0AhWgtheYU0+vGd4Getl6rCtLWxtTbHQCH
	 hRk+woHJxOUDQiRhc5qj1dAEyPM3kHR870VTHm4R0Dw59CIOJatYnfcQg2x5WGSg8H
	 39J90qpMhsf8s8sWLIoFOWa0ifJKQSivenJN/fLv9e7kBIkA7p1iuW0OdbnQwa8OpI
	 Yqa9ZdmSP8mJyrf/5tmNnhP5wtLfKeBbXv2jpAFrd3xEoB8XDasEhZFsP730uOCHX4
	 AsAGQNyDT2A5w==
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
Subject: [PATCH v3 2/5] irqchip/armada-370-xp: Only call ipi_resume() if IPI is available
Date: Fri, 21 Jun 2024 11:38:29 +0200
Message-ID: <20240621093832.23319-3-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240621093832.23319-1-kabel@kernel.org>
References: <20240621093832.23319-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

IPI is available only on systems where the mpic controller does not
have a parent IRQ defined (e.g. on Armada XP). If a parent IRQ is
defined, inter-processor interrupts are handled by an interrupt
controller higher in the hierarchy (most probably a parent GIC).

Only call ipi_resume() on systems where IPI is available in the mpic
controller.

Signed-off-by: Pali Rohár <pali@kernel.org>
[ refactored a little and changed commit message ]
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/irqchip/irq-armada-370-xp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index f488c35d9130..ea95e327f672 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/syscore_ops.h>
 #include <linux/msi.h>
+#include <linux/types.h>
 #include <asm/mach/arch.h>
 #include <asm/exception.h>
 #include <asm/smp_plat.h>
@@ -156,6 +157,17 @@ static DEFINE_MUTEX(msi_used_lock);
 static phys_addr_t msi_doorbell_addr;
 #endif
 
+static inline bool is_ipi_available(void)
+{
+	/*
+	 * We distinguish IPI availability in the IC by the IC not having a
+	 * parent irq defined. If a parent irq is defined, there is a parent
+	 * interrupt controller (e.g. GIC) that takes care of inter-processor
+	 * interrupts.
+	 */
+	return parent_irq <= 0;
+}
+
 static inline bool is_percpu_irq(irq_hw_number_t irq)
 {
 	if (irq <= ARMADA_370_XP_MAX_PER_CPU_IRQS)
@@ -527,7 +539,8 @@ static void armada_xp_mpic_reenable_percpu(void)
 		armada_370_xp_irq_unmask(data);
 	}
 
-	ipi_resume();
+	if (is_ipi_available())
+		ipi_resume();
 
 	armada_370_xp_msi_reenable_percpu();
 }
@@ -750,7 +763,8 @@ static void armada_370_xp_mpic_resume(void)
 	if (doorbell_mask_reg & PCI_MSI_DOORBELL_MASK)
 		writel(1, per_cpu_int_base + ARMADA_370_XP_INT_CLEAR_MASK_OFFS);
 
-	ipi_resume();
+	if (is_ipi_available())
+		ipi_resume();
 }
 
 static struct syscore_ops armada_370_xp_mpic_syscore_ops = {
-- 
2.44.2

