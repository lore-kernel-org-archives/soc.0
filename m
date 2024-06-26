Return-Path: <SRS0=/atB=N4=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05646C27C4F
	for <soc@archiver.kernel.org>; Wed, 26 Jun 2024 16:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC89BC32789; Wed, 26 Jun 2024 16:33:04 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C785AC116B1
	for <soc@kernel.org>; Wed, 26 Jun 2024 16:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C785AC116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sMVZu-0002PV-2q; Wed, 26 Jun 2024 18:33:02 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.11
Date: Wed, 26 Jun 2024 18:32:58 +0200
Message-Id: <20240626163258.61222-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::4e
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.11

for you to fetch changes up to eb5d88b1538850c6d9ddfcd0b59dc7c84831b530:

  reset: RESET_IMX8MP_AUDIOMIX should depend on ARCH_MXC (2024-06-25 14:28:11 +0200)

----------------------------------------------------------------
Reset controller updates for v6.11

Move reset controller registration to the end in rzg2l-usbphy-ctrl, to
simplify the probe error path, add a new i.MX8MP AudioMix reset driver,
allow to build some drivers under COMPILE_TEST with fewer dependencies,
and use the devm_clk_get_enabled convenience wrapper in meson-audio-arb.

The latter causes a trivial merge conflict [1] with

  b99e9c096148f ("reset: meson-audio-arb: Convert to platform remove callback returning void")

because I didn't manage to send that in last round. There is no overlap
though.

[1] https://lore.kernel.org/all/Znmufb9L78FCoSSS@sirena.org.uk/

----------------------------------------------------------------
Biju Das (1):
      reset: rzg2l-usbphy-ctrl: Move reset controller registration

Geert Uytterhoeven (1):
      reset: RESET_IMX8MP_AUDIOMIX should depend on ARCH_MXC

Philipp Zabel (3):
      reset: sti: allow building under COMPILE_TEST
      reset: meson-audio-arb: Use devm_clk_get_enabled()
      reset: zynqmp: allow building under COMPILE_TEST

Shengjiu Wang (1):
      reset: imx8mp-audiomix: Add AudioMix Block Control reset driver

 drivers/reset/Kconfig                   |  14 ++++
 drivers/reset/Makefile                  |   5 +-
 drivers/reset/reset-imx8mp-audiomix.c   | 128 ++++++++++++++++++++++++++++++++
 drivers/reset/reset-meson-audio-arb.c   |   9 +--
 drivers/reset/reset-rzg2l-usbphy-ctrl.c |  32 ++++----
 drivers/reset/sti/Kconfig               |   4 +-
 6 files changed, 167 insertions(+), 25 deletions(-)
 create mode 100644 drivers/reset/reset-imx8mp-audiomix.c
