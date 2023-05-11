Return-Path: <SRS0=FZKn=BA=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78DDC7EE22
	for <soc@archiver.kernel.org>; Thu, 11 May 2023 13:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 968EBC4339C; Thu, 11 May 2023 13:32:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB5C5C433EF
	for <soc@kernel.org>; Thu, 11 May 2023 13:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB5C5C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1px6PM-0004bz-Gd; Thu, 11 May 2023 15:32:36 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.5
Date: Thu, 11 May 2023 15:32:35 +0200
Message-Id: <20230511133235.874566-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.5

for you to fetch changes up to afb39e2bd36af1d80913bb6851caece829526217:

  reset: mpfs: select AUXILIARY_BUS (2023-05-08 09:28:31 +0200)

----------------------------------------------------------------
Reset controller updates for v6.5

Use devm_platform_ioremap_resource() instead of platform_get_resource()
and devm_ioremap_resource() in various drivers, simplify the stih407
Kconfig and use regmap_field_read_poll_timeout() instead of open-coded
waiting, and use dev_err_probe() in the meson-audio-arb reset driver.
With its platform gone, remove the now obsolete oxnas reset driver.
Drop depends on the non-user-visible CONFIG_AUXILIARY_BUS symbol.

----------------------------------------------------------------
Alain Volmat (1):
      reset: sti: rely on regmap_field_read_poll_timeout for ack wait

Lukas Bulwahn (1):
      reset: sti: simplify driver's config and build

Neil Armstrong (1):
      reset: oxnas: remove obsolete reset driver

Philipp Zabel (2):
      reset: starfive: select AUXILIARY_BUS
      reset: mpfs: select AUXILIARY_BUS

Ye Xingchen (7):
      reset: ath79: Use devm_platform_ioremap_resource()
      reset: axs10x: Use devm_platform_ioremap_resource()
      reset: lpc18xx: Use devm_platform_ioremap_resource()
      reset: reset-hsdk: Use devm_platform_ioremap_resource()
      reset: meson: Use devm_platform_ioremap_resource()
      reset: brcmstb-rescal: Use devm_platform_ioremap_resource()
      reset: meson-audio-arb: Use dev_err_probe()

 .../devicetree/bindings/reset/oxnas,reset.txt      |  32 ------
 drivers/reset/Kconfig                              |   6 +-
 drivers/reset/Makefile                             |   1 -
 drivers/reset/reset-ath79.c                        |   4 +-
 drivers/reset/reset-axs10x.c                       |   4 +-
 drivers/reset/reset-brcmstb-rescal.c               |   4 +-
 drivers/reset/reset-hsdk.c                         |   7 +-
 drivers/reset/reset-lpc18xx.c                      |   4 +-
 drivers/reset/reset-meson-audio-arb.c              |   7 +-
 drivers/reset/reset-meson.c                        |   4 +-
 drivers/reset/reset-oxnas.c                        | 114 ---------------------
 drivers/reset/starfive/Kconfig                     |   3 +-
 drivers/reset/sti/Kconfig                          |   4 -
 drivers/reset/sti/Makefile                         |   4 +-
 drivers/reset/sti/reset-syscfg.c                   |  18 +---
 15 files changed, 18 insertions(+), 198 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/oxnas,reset.txt
 delete mode 100644 drivers/reset/reset-oxnas.c
