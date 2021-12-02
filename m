Return-Path: <SRS0=/kpj=QT=bootlin.com=herve.codina@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C72EC4332F
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 09:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56581C53FD1; Thu,  2 Dec 2021 09:53:23 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B15FC53FCB;
	Thu,  2 Dec 2021 09:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B15FC53FCB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: herve.codina@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id D0C41240021;
	Thu,  2 Dec 2021 09:53:18 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 5/6] irq: spear-shirq: Add support for IRQ 0..6
Date: Thu,  2 Dec 2021 10:52:54 +0100
Message-Id: <20211202095255.165797-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
References: <20211202095255.165797-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IRQ 0..7 are not supported by the driver for SPEAr320 SOC family.

IRQ 0 is not reserved in SPEAr320 SOC (assigned to GPIOINT).
Furthermore, in SPEAr320s SOC variant, IRQ 0..6 are assigned
as follow:
  IRQ 6 - NGPIO_INTR: Combined status of edge programmable
                      interrupts from GPIO ports
  IRQ 5 - TX_OR_INTR: I2S interrupt on Transmit FIFO overrun
  IRQ 4 - TX_EMP_INTR: I2S interrupt on Transmit FIFO empty
  IRQ 3 - RX_OR_INTR: I2S interrupt on Receive FIFO overrun
  IRQ 2 - RX_DA_INTR: I2S interrupt on data available in Receive FIFO
  IRQ 1 - Reserved
  IRQ 0 - GPIO_INTR: Legacy interrupt from GPIO ports

Add support for these IRQs in SPEAr320 SOC family.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/irqchip/spear-shirq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/spear-shirq.c b/drivers/irqchip/spear-shirq.c
index 1518ba31a80c..7c17a6f643ef 100644
--- a/drivers/irqchip/spear-shirq.c
+++ b/drivers/irqchip/spear-shirq.c
@@ -149,6 +149,8 @@ static struct spear_shirq spear320_shirq_ras3 = {
 	.offset		= 0,
 	.nr_irqs	= 7,
 	.mask		= ((0x1 << 7) - 1) << 0,
+	.irq_chip	= &dummy_irq_chip,
+	.status_reg	= SPEAR320_INT_STS_MASK_REG,
 };
 
 static struct spear_shirq spear320_shirq_ras1 = {
-- 
2.31.1

