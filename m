Return-Path: <SRS0=1EZI=YC=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8EFC00144
	for <soc@archiver.kernel.org>; Fri, 29 Jul 2022 13:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89BFEC433D6; Fri, 29 Jul 2022 13:36:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C2C5C433C1
	for <soc@kernel.org>; Fri, 29 Jul 2022 13:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C2C5C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oHQAD-00038c-Pk; Fri, 29 Jul 2022 15:36:25 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v5.20
Date: Fri, 29 Jul 2022 15:36:20 +0200
Message-Id: <20220729133620.488379-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.20

for you to fetch changes up to d985db83622679fc496ed824088e066528b3a872:

  reset: tps380x: Fix spelling mistake "Voltags" -> "Voltage" (2022-07-28 14:08:50 +0200)

----------------------------------------------------------------
Reset controller updates for v5.20

Allow reset-simple to be selected under EXPERT and reset-a10sr to be
built under COMPILE_TEST. Add Renesas RZ/G2UL USBPHY binding and a new
driver for the TI TPS380x line of voltage supervisor ICs with manual
reset control.

A patch to make reset-microchip-sparx5 buildable as a module had to be
reverted as that turned out to break MDIO on kswitch-d10.

----------------------------------------------------------------
Ben Dooks (2):
      reset: allow building of reset simple driver if expert config selected
      reset: reset-simple should depends on HAS_IOMEM

Biju Das (1):
      dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G2UL USBPHY Control bindings

Clément Léger (1):
      reset: microchip-sparx5: allow building as a module

Colin Ian King (1):
      reset: tps380x: Fix spelling mistake "Voltags" -> "Voltage"

Marco Felsch (2):
      dt-bindings: reset: Add TPS380x documentation
      reset: tps380x: Add TPS380x device driver supprt

Philipp Zabel (2):
      reset: a10sr: allow building under COMPILE_TEST
      Revert "reset: microchip-sparx5: allow building as a module"

 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |   1 +
 .../bindings/reset/ti,tps380x-reset.yaml           |  49 ++++++++
 drivers/reset/Kconfig                              |  13 ++-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tps380x.c                      | 126 +++++++++++++++++++++
 5 files changed, 188 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/ti,tps380x-reset.yaml
 create mode 100644 drivers/reset/reset-tps380x.c
