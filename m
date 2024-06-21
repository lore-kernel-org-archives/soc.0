Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4FDC27C4F
	for <soc@archiver.kernel.org>; Fri, 21 Jun 2024 09:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B31CCC32781; Fri, 21 Jun 2024 09:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E53EC2BBFC;
	Fri, 21 Jun 2024 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962733;
	bh=ebsxRfG7w+7jqsb7KNkQhLDZDTRew3CMFRyjawbrcIU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzw4NvpH5VYO0Arp61CObhIZ6F1k0b/RYgwPvWh4MfI6ZwfvoE98zutQMX1k3mbFb
	 9i+HDwtrPdc5IaWJhfFGx+COdVC41mZevXz+ZO3IMLxkRYYZyVqiCRiJfMqL9w5U48
	 +FL7g0gBmkJuxeRDtjStmfQtCGR6y9e5iB3frm3GdgCH8+zNUhYaPtAokck7dQB8iA
	 4uzBqQrUUTpdNbA6VQh/VKCs5IzlG0K/Drd9nEms2v1NmxSzeKJKhbfphSaSRWO3TC
	 zBh+vLO3BN1ZtCG2eWlJg3Q6t6rmXcOQ7nFAFKW9bTY3mhLY7XDuZL0kpjGRTPrQLW
	 afOSd9GlXLg2w==
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
Subject: [PATCH v3 5/5] irqchip/armada-370-xp: Use atomic_io_modify() instead of another spinlock
Date: Fri, 21 Jun 2024 11:38:32 +0200
Message-ID: <20240621093832.23319-6-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240621093832.23319-1-kabel@kernel.org>
References: <20240621093832.23319-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the dedicated atomic_io_modify() instead of hardcoded
spin_lock() + readl() + writel() + spin_unlock() sequence.

This allows us to drop the irq_controller_lock spinlock from the driver.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/irqchip/irq-armada-370-xp.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index ada257aeba78..dce2b80bf439 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -512,24 +512,18 @@ static __init void armada_xp_ipi_init(struct device_node *node)
 	set_smp_ipi_range(base_ipi, IPI_DOORBELL_END);
 }
 
-static DEFINE_RAW_SPINLOCK(irq_controller_lock);
-
 static int armada_xp_set_affinity(struct irq_data *d,
 				  const struct cpumask *mask_val, bool force)
 {
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	unsigned long reg, mask;
 	int cpu;
 
 	/* Select a single core from the affinity mask which is online */
 	cpu = cpumask_any_and(mask_val, cpu_online_mask);
-	mask = 1UL << cpu_logical_map(cpu);
 
-	raw_spin_lock(&irq_controller_lock);
-	reg = readl(main_int_base + ARMADA_370_XP_INT_SOURCE_CTL(hwirq));
-	reg = (reg & (~ARMADA_370_XP_INT_SOURCE_CPU_MASK)) | mask;
-	writel(reg, main_int_base + ARMADA_370_XP_INT_SOURCE_CTL(hwirq));
-	raw_spin_unlock(&irq_controller_lock);
+	atomic_io_modify(main_int_base + ARMADA_370_XP_INT_SOURCE_CTL(hwirq),
+			 ARMADA_370_XP_INT_SOURCE_CPU_MASK,
+			 BIT(cpu_logical_map(cpu)));
 
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
 
-- 
2.44.2

