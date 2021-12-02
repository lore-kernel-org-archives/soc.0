Return-Path: <SRS0=/kpj=QT=bootlin.com=herve.codina@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05C9C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 09:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C648C53FCB; Thu,  2 Dec 2021 09:53:13 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E9D9C00446;
	Thu,  2 Dec 2021 09:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E9D9C00446
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: herve.codina@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id F19DE240017;
	Thu,  2 Dec 2021 09:53:01 +0000 (UTC)
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
Subject: [PATCH 0/6] spear: Fix SPEAr3XX plgpio support
Date: Thu,  2 Dec 2021 10:52:49 +0100
Message-Id: <20211202095255.165797-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series fixes the plgpio support on SPEAr3xx SOCs.

The first four patches of this series fixes a ressources
sharing issue between the plgpio driver and the pinmux
driver.
Indeed, these two drivers can use the same IO address range
on some SPEAr3xx SOCs.
To solve the issue, a regmap (syscon managed) is used in both
drivers and the plgpio driver can reference the pinmux regmap
to use it.

The second part of this series is related to IRQs.
The plgpio on SPEAr320s SOC uses an IRQ line in the reserve
range (from SPEAr320 point of view).
This issue is fixed enabling all the 'reserved' IRQs and
adding a dtsi file for the SPEAr320s with the correct interrupt
for the plgpio node.

Best regards,
Herve

Herve Codina (6):
  pinctrl: spear: spear: Convert to regmap
  pinctrl: spear: plgpio: Convert to regmap
  pinctrl: spear: plgpio: Introduce regmap phandle
  ARM: dts: spear3xx: Use plgpio regmap in SPEAr310 and SPEAr320
  irq: spear-shirq: Add support for IRQ 0..6
  ARM: dts: spear3xx: Add spear320s dtsi

 arch/arm/boot/dts/spear310.dtsi        |   1 +
 arch/arm/boot/dts/spear320.dtsi        |   1 +
 arch/arm/boot/dts/spear320s.dtsi       |  24 ++++
 drivers/irqchip/spear-shirq.c          |   2 +
 drivers/pinctrl/spear/pinctrl-plgpio.c | 148 +++++++++++++++----------
 drivers/pinctrl/spear/pinctrl-spear.c  |  10 +-
 drivers/pinctrl/spear/pinctrl-spear.h  |  12 +-
 7 files changed, 131 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm/boot/dts/spear320s.dtsi

-- 
2.31.1

