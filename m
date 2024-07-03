Return-Path: <SRS0=XK1F=OD=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3836C2BD09
	for <soc@archiver.kernel.org>; Wed,  3 Jul 2024 10:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71BB2C2BD10; Wed,  3 Jul 2024 10:08:25 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 988F4C32781
	for <soc@kernel.org>; Wed,  3 Jul 2024 10:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 988F4C32781
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sOwuS-0006cE-F8; Wed, 03 Jul 2024 12:08:20 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.11, part 2
Date: Wed,  3 Jul 2024 12:08:09 +0200
Message-Id: <20240703100809.2773890-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454:

  Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.11-2

for you to fetch changes up to c1267e1afae60e0b1d17d3a2e55515ecccb22a3e:

  arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS (2024-07-03 10:51:53 +0200)

The diffstat also lists the changes already included in reset-for-v6.11,
because I've set the base commit to v6.10-rc5. This is pulled in by
the regulator-hw-enable-helper merge. The new tag is still based on
reset-for-v6.11 though, to avoid a merge conflict between the tegra-bpmp
and sti COMPILE_TEST commits.

----------------------------------------------------------------
Reset controller updates for v6.11, part 2

This tag adds USB VBUS regulator control for Renesas RZ/G2L SoCs,
which also touches PHY driver and device tree, and pulls in a new
regulator_hardware_enable() helper.

The Tegra BPMP reset driver can be compiled under COMPILE_TEST now.

----------------------------------------------------------------
Biju Das (6):
      reset: rzg2l-usbphy-ctrl: Move reset controller registration
      regulator: core: Add helper for allow HW access to enable/disable regulator
      dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document USB VBUS regulator
      reset: renesas: Add USB VBUS regulator device as child
      phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs
      arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS

Geert Uytterhoeven (1):
      reset: RESET_IMX8MP_AUDIOMIX should depend on ARCH_MXC

Philipp Zabel (5):
      reset: sti: allow building under COMPILE_TEST
      reset: meson-audio-arb: Use devm_clk_get_enabled()
      reset: zynqmp: allow building under COMPILE_TEST
      reset: tegra-bpmp: allow building under COMPILE_TEST
      Merge tag 'regulator-hw-enable-helper' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator into reset/next

Shengjiu Wang (1):
      reset: imx8mp-audiomix: Add AudioMix Block Control reset driver

 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |  10 ++
 Documentation/power/regulator/consumer.rst         |   6 +
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   |  11 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           |   8 +-
 drivers/regulator/core.c                           |  28 +++++
 drivers/reset/Kconfig                              |  14 +++
 drivers/reset/Makefile                             |   7 +-
 drivers/reset/reset-imx8mp-audiomix.c              | 128 +++++++++++++++++++++
 drivers/reset/reset-meson-audio-arb.c              |   9 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |  63 +++++++---
 drivers/reset/sti/Kconfig                          |   4 +-
 drivers/reset/tegra/Kconfig                        |   3 +-
 include/linux/regulator/consumer.h                 |   7 ++
 13 files changed, 262 insertions(+), 36 deletions(-)
 create mode 100644 drivers/reset/reset-imx8mp-audiomix.c
