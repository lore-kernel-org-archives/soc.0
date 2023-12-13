Return-Path: <SRS0=4rAY=HY=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F477C4167B
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 15:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65898C433C8; Wed, 13 Dec 2023 15:33:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 943F3C433C7
	for <soc@kernel.org>; Wed, 13 Dec 2023 15:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 943F3C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rDREa-0004RM-7y; Wed, 13 Dec 2023 16:33:16 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.8
Date: Wed, 13 Dec 2023 16:33:13 +0100
Message-Id: <20231213153313.278867-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.8

for you to fetch changes up to c3c46acd5be9a3351c163d2869045cab4d5342dc:

  dt-bindings: reset: hisilicon,hi3660-reset: Drop providers and consumers from example (2023-11-29 11:49:45 +0100)

----------------------------------------------------------------
Reset controller updates for v6.8

Make use of devm_platform_get_and_ioremap_resource() and
device_get_match_data() in several drivers, support the Amlogic C3 reset
controller, and improve various device tree binding documents.

----------------------------------------------------------------
Lad Prabhakar (1):
      dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/Five SoC

Rob Herring (4):
      reset: Use device_get_match_data()
      dt-bindings: reset: qcom: drop unneeded quotes
      dt-bindings: reset: imx-src: Simplify compatible schema and drop unneeded quotes
      dt-bindings: reset: hisilicon,hi3660-reset: Drop providers and consumers from example

Yangtao Li (7):
      reset: brcmstb: Use devm_platform_get_and_ioremap_resource()
      reset: meson-audio-arb: Convert to devm_platform_ioremap_resource()
      reset: qcom-aoss: Convert to devm_platform_ioremap_resource()
      reset: qcom: Convert to devm_platform_ioremap_resource()
      reset: simple: Convert to devm_platform_get_and_ioremap_resource()
      reset: sunplus: Use devm_platform_get_and_ioremap_resource()
      reset: uniphier-glue: Use devm_platform_get_and_ioremap_resource()

Zelong Dong (2):
      dt-bindings: reset: Add compatible and DT bindings for Amlogic C3 Reset Controller
      reset: reset-meson: add support for Amlogic C3 SoC Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml        |   1 +
 .../devicetree/bindings/reset/fsl,imx-src.yaml     |  31 ++----
 .../bindings/reset/hisilicon,hi3660-reset.yaml     |  25 +----
 .../devicetree/bindings/reset/qcom,aoss-reset.yaml |  10 +-
 .../devicetree/bindings/reset/qcom,pdc-global.yaml |   8 +-
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |   2 +-
 drivers/reset/reset-brcmstb.c                      |   3 +-
 drivers/reset/reset-meson-audio-arb.c              |   4 +-
 drivers/reset/reset-meson.c                        |   1 +
 drivers/reset/reset-npcm.c                         |   5 +-
 drivers/reset/reset-qcom-aoss.c                    |   4 +-
 drivers/reset/reset-qcom-pdc.c                     |   4 +-
 drivers/reset/reset-simple.c                       |   3 +-
 drivers/reset/reset-sunplus.c                      |   3 +-
 drivers/reset/reset-uniphier-glue.c                |   3 +-
 drivers/reset/sti/reset-syscfg.c                   |  11 +-
 include/dt-bindings/reset/amlogic,c3-reset.h       | 119 +++++++++++++++++++++
 17 files changed, 157 insertions(+), 80 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,c3-reset.h
