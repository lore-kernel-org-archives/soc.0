Return-Path: <SRS0=Za4V=QC=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59247CD3431
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 10:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31727C4CEC6; Wed,  4 Sep 2024 10:39:50 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C95F7C4CEC2
	for <soc@kernel.org>; Wed,  4 Sep 2024 10:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C95F7C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1slnQO-0006Of-DB; Wed, 04 Sep 2024 12:39:44 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.12
Date: Wed,  4 Sep 2024 12:39:21 +0200
Message-Id: <20240904103921.1479579-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.12

for you to fetch changes up to 487b1b32e317b85c2948eb4013f3e089a0433d49:

  reset: eyeq: add platform driver (2024-09-02 12:12:41 +0200)

----------------------------------------------------------------
Reset controller updates for v6.12

Use get_device()/put_device() to keep reset controller devices alive
while their reset controls are acquired.
Enable support for the Amlogic T7 SoC reset controller.
Remove unused EyeQ reset bindings and add a reset controller driver
to be instantiated as auxiliary device by the EyeQ clock driver.
Fix OF node leaks in the k210 and berlin probe() error paths.
Add some simplifications and cleanup in the core, lcp18xx driver, and
uniphier bindings.

----------------------------------------------------------------
Clément Léger (1):
      reset: core: add get_device()/put_device on rcdev

Krzysztof Kozlowski (6):
      dt-bindings: reset: socionext,uniphier-glue-reset: add top-level constraints
      reset: berlin: fix OF node leak in probe() error path
      reset: k210: fix OF node leak in probe() error path
      reset: simplify locking with guard()
      reset: lpc18xx: simplify with dev_err_probe()
      reset: lpc18xx: simplify with devm_clk_get_enabled()

Théo Lebrun (2):
      Revert "dt-bindings: reset: mobileye,eyeq5-reset: add bindings"
      reset: eyeq: add platform driver

Zelong Dong (2):
      dt-bindings: reset: Add Amlogic T7 reset controller
      reset: reset-meson: Add support for Amlogic T7 SoC reset controller

 .../bindings/reset/amlogic,meson-reset.yaml        |   1 +
 .../bindings/reset/mobileye,eyeq5-reset.yaml       |  43 --
 .../reset/socionext,uniphier-glue-reset.yaml       |   8 +-
 drivers/reset/Kconfig                              |  13 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               |  17 +-
 drivers/reset/reset-berlin.c                       |   3 +-
 drivers/reset/reset-eyeq.c                         | 570 +++++++++++++++++++++
 drivers/reset/reset-k210.c                         |   3 +-
 drivers/reset/reset-lpc18xx.c                      |  43 +-
 drivers/reset/reset-meson.c                        |   6 +
 11 files changed, 617 insertions(+), 91 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
 create mode 100644 drivers/reset/reset-eyeq.c
