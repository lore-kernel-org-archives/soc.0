Return-Path: <SRS0=Ha5J=DZ=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2839DC001B0
	for <soc@archiver.kernel.org>; Tue,  8 Aug 2023 14:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C958C433C9; Tue,  8 Aug 2023 14:59:57 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88DB0C433C7
	for <soc@kernel.org>; Tue,  8 Aug 2023 14:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88DB0C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qTOBb-00089J-Ly; Tue, 08 Aug 2023 16:59:51 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.6
Date: Tue,  8 Aug 2023 16:59:50 +0200
Message-Id: <20230808145950.3057250-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.6

for you to fetch changes up to 417a3a5ae44a14b4eeb3df514b2c006b19771f82:

  reset: ti: syscon: remove unneeded call to platform_set_drvdata() (2023-08-08 15:31:00 +0200)

----------------------------------------------------------------
Reset controller updates for v6.6

Clean up DT includes and remove unneeded platform_set_drvdata() calls
across reset drivers, add support for the Versal NET platform to the
zynqmp driver, and let the hisilicon driver use dev_err_probe().

----------------------------------------------------------------
Andrei Coardos (10):
      reset: ath79: remove unneeded call to platform_set_drvdata()
      reset: bcm6345: remove unneeded call to platform_set_drvdata()
      reset: lantiq: remove unneeded call to platform_set_drvdata()
      reset: lpc18xx: remove unneeded call to platform_set_drvdata()
      reset: meson: remove unneeded call to platform_set_drvdata()
      reset: npcm: remove unneeded call to platform_set_drvdata()
      reset: uniphier-glue: remove unneeded call to platform_set_drvdata()
      reset: zynq: remove unneeded call to platfrom_set_drvdata()
      reset: zynqmp: removed unneeded call to platform_set_drvdata()
      reset: ti: syscon: remove unneeded call to platform_set_drvdata()

Piyush Mehta (2):
      dt-bindings: reset: Updated binding for Versal-NET reset driver
      reset: reset-zynqmp: add support for Versal NET platform

Rob Herring (1):
      reset: Explicitly include correct DT includes

Wang Ming (1):
      reset: hisilicon: Use dev_err_probe instead of dev_err

 Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml |  1 +
 drivers/reset/hisilicon/hi6220_reset.c                         |  1 -
 drivers/reset/hisilicon/reset-hi3660.c                         |  6 +++---
 drivers/reset/reset-ath79.c                                    |  2 --
 drivers/reset/reset-bcm6345.c                                  |  2 --
 drivers/reset/reset-imx7.c                                     |  2 +-
 drivers/reset/reset-intel-gw.c                                 |  2 +-
 drivers/reset/reset-k210.c                                     |  1 -
 drivers/reset/reset-lantiq.c                                   |  1 -
 drivers/reset/reset-lpc18xx.c                                  |  2 --
 drivers/reset/reset-meson-audio-arb.c                          |  3 ++-
 drivers/reset/reset-meson.c                                    |  3 ---
 drivers/reset/reset-microchip-sparx5.c                         |  3 ++-
 drivers/reset/reset-mpfs.c                                     |  1 +
 drivers/reset/reset-npcm.c                                     |  2 --
 drivers/reset/reset-qcom-aoss.c                                |  2 +-
 drivers/reset/reset-qcom-pdc.c                                 |  2 +-
 drivers/reset/reset-simple.c                                   |  1 -
 drivers/reset/reset-ti-syscon.c                                |  2 --
 drivers/reset/reset-uniphier-glue.c                            |  4 +---
 drivers/reset/reset-uniphier.c                                 |  1 -
 drivers/reset/reset-zynq.c                                     |  1 -
 drivers/reset/reset-zynqmp.c                                   | 10 +++++++---
 23 files changed, 21 insertions(+), 34 deletions(-)
