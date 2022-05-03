Return-Path: <SRS0=Ru3w=VL=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB7DC433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 16:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E0F1C385AF; Tue,  3 May 2022 16:01:08 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40DC5C385A9
	for <soc@kernel.org>; Tue,  3 May 2022 16:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40DC5C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nluxS-0008OU-K3; Tue, 03 May 2022 18:01:02 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v5.19
Date: Tue,  3 May 2022 18:00:57 +0200
Message-Id: <20220503160057.46625-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::4e
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.19

for you to fetch changes up to 2ca065dc9468fa1c60ada1e8cb9c1aa866367ec7:

  dt-bindings: reset: st,sti-powerdown: Convert to yaml (2022-05-03 17:41:30 +0200)

----------------------------------------------------------------
Reset controller updates for v5.19

Add Meson-S4 SoC reset controller support to reset-meson, AST2600 LPC
reset controller support to reset-simple, and R9A07G054 USBPHY reset
controller support to reset-rzg2l-usbphy-ctrl. Add ACPI _RST support to
device_reset(), simplify the uniphier-glue reset driver using bulk API
and devres and clean up its dt-bindings docs. Convert most dt-bindings
docs from txt to yaml.

----------------------------------------------------------------
Joel Stanley (1):
      reset: simple: Add AST2600 compatible

Krishna Yarlagadda (1):
      reset: ACPI reset support

Kunihiko Hayashi (1):
      dt-bindings: reset: uniphier-glue: Clean up clocks, resets, and their names using compatible string

Lad Prabhakar (1):
      reset: Kconfig: Make RESET_RZG2L_USBPHY_CTRL depend on ARCH_RZG2L

Philipp Zabel (12):
      reset: uniphier-glue: Use reset_control_bulk API
      reset: uniphier-glue: Use devm_add_action_or_reset()
      dt-bindings: reset: amlogic,meson-axg-audio-arb: Convert to yaml
      dt-bindings: reset: ath79: Convert to yaml
      dt-bindings: reset: berlin: Convert to yaml
      dt-bindings: reset: bitmain,bm1880-reset: Convert to yaml
      dt-bindings: reset: lantiq,reset: Convert to yaml
      dt-bindings: reset: nuvoton,npcm-reset: Convert to yaml
      dt-bindings: reset: snps,axs10x-reset: Convert to yaml
      dt-bindings: reset: socfpga: Convert to yaml
      dt-bindings: reset: st,sti-picophyreset: Convert to yaml
      dt-bindings: reset: st,sti-powerdown: Convert to yaml

Zelong Dong (3):
      dt-bindings: reset: Add compatible for Meson-S4 Reset Controller
      dt-bindings: reset: add bindings for the Meson-S4 SoC Reset Controller
      reset: reset-meson: add support for the Meson-S4 SoC Reset Controller

 .../devicetree/bindings/reset/altr,rst-mgr.yaml    |  47 ++++++++
 .../bindings/reset/amlogic,meson-axg-audio-arb.txt |  22 ----
 .../reset/amlogic,meson-axg-audio-arb.yaml         |  56 +++++++++
 .../bindings/reset/amlogic,meson-reset.yaml        |   1 +
 .../devicetree/bindings/reset/ath79-reset.txt      |  20 ----
 .../devicetree/bindings/reset/berlin,reset.txt     |  23 ----
 .../bindings/reset/bitmain,bm1880-reset.txt        |  18 ---
 .../bindings/reset/bitmain,bm1880-reset.yaml       |  36 ++++++
 .../devicetree/bindings/reset/lantiq,reset.txt     |  30 -----
 .../devicetree/bindings/reset/lantiq,reset.yaml    |  49 ++++++++
 .../bindings/reset/marvell,berlin2-reset.yaml      |  38 +++++++
 .../bindings/reset/nuvoton,npcm-reset.txt          |  32 ------
 .../bindings/reset/nuvoton,npcm750-reset.yaml      |  50 +++++++++
 .../bindings/reset/qca,ar7100-reset.yaml           |  40 +++++++
 .../bindings/reset/snps,axs10x-reset.txt           |  33 ------
 .../bindings/reset/snps,axs10x-reset.yaml          |  48 ++++++++
 .../devicetree/bindings/reset/socfpga-reset.txt    |  16 ---
 .../reset/socionext,uniphier-glue-reset.yaml       |  52 ++++++---
 .../bindings/reset/st,sti-picophyreset.txt         |  42 -------
 .../devicetree/bindings/reset/st,sti-powerdown.txt |  45 --------
 .../bindings/reset/st,stih407-picophyreset.yaml    |  47 ++++++++
 .../bindings/reset/st,stih407-powerdown.yaml       |  49 ++++++++
 drivers/reset/Kconfig                              |   2 +-
 drivers/reset/core.c                               |  15 ++-
 drivers/reset/reset-meson.c                        |   6 +
 drivers/reset/reset-simple.c                       |   1 +
 drivers/reset/reset-uniphier-glue.c                |  75 ++++++-------
 include/dt-bindings/reset/amlogic,meson-s4-reset.h | 125 +++++++++++++++++++++
 28 files changed, 680 insertions(+), 338 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/altr,rst-mgr.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/ath79-reset.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/berlin,reset.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/lantiq,reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/lantiq,reset.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/snps,axs10x-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/socfpga-reset.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/st,sti-powerdown.txt
 create mode 100644 Documentation/devicetree/bindings/reset/st,stih407-picophyreset.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/st,stih407-powerdown.yaml
 create mode 100644 include/dt-bindings/reset/amlogic,meson-s4-reset.h
