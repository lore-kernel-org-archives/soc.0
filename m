Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D51C27C4F
	for <soc@archiver.kernel.org>; Fri, 21 Jun 2024 09:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88586C32781; Fri, 21 Jun 2024 09:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F71C4AF0B;
	Fri, 21 Jun 2024 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962721;
	bh=vj6EQMvMATxpuv+etEjf5cI+Mx7UlzGS/ax61uO76rA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jd5mVQbk0jTQGRuaCYBn+mTNhDYwXfKLzsyDX4skZSpVKxtIvp3Ed9a3ruEOLVIMR
	 RRV0nWuxzB3Lh21r1t8/HEp1/TcN+Uh0HWvFsNfSeWhizc8027K9To2Zq2rNmd1MGX
	 RcSIj7L6oGa2GZflXxtDgJv3ia9BiMaGciq3qdmoiHRgViNGuQbDl/cmV9Muxil1bo
	 /3rkkPXaNFRy9OwN5UdoKAZ1h7ziXiYu1b+2IEPTPX5G/Vy/tA/ALRuHnWxdv1pPx8
	 my3odinsO8NxougcTMTJO+ruZmupd9Ii6aPyUdWNYnXfE/zH2x9L8mAVSbqQabY/Ys
	 cWsxjuZ4oCR+Q==
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
Subject: [PATCH v3 1/5] irqchip/armada-370-xp: Do not allow mapping IRQ 0 and 1
Date: Fri, 21 Jun 2024 11:38:28 +0200
Message-ID: <20240621093832.23319-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240621093832.23319-1-kabel@kernel.org>
References: <20240621093832.23319-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

IRQs 0 (IPI) and 1 (MSI) are handled internally by this driver,
generic_handle_domain_irq() is never called for these IRQs.

Disallow mapping these IRQs.

Signed-off-by: Pali Rohár <pali@kernel.org>
[ changed commit message ]
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/irqchip/irq-armada-370-xp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index 4b021a67bdfe..f488c35d9130 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -566,6 +566,10 @@ static struct irq_chip armada_370_xp_irq_chip = {
 static int armada_370_xp_mpic_irq_map(struct irq_domain *h,
 				      unsigned int virq, irq_hw_number_t hw)
 {
+	/* IRQs 0 and 1 cannot be mapped, they are handled internally */
+	if (hw <= 1)
+		return -EINVAL;
+
 	armada_370_xp_irq_mask(irq_get_irq_data(virq));
 	if (!is_percpu_irq(hw))
 		writel(hw, per_cpu_int_base +
-- 
2.44.2

