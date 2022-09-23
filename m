Return-Path: <SRS0=QJcS=Z2=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CC3C6FA82
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1860C433D7; Fri, 23 Sep 2022 14:35:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46537C433D6
	for <soc@kernel.org>; Fri, 23 Sep 2022 14:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46537C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1objm1-0003aV-Uv; Fri, 23 Sep 2022 16:35:26 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.0
Date: Fri, 23 Sep 2022 16:35:19 +0200
Message-Id: <20220923143519.41735-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::4e
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.0

for you to fetch changes up to ae358d71d4623ed0a466a7498f8ce25c7fda22d1:

  reset: npcm: fix iprst2 and iprst4 setting (2022-09-22 17:48:35 +0200)

----------------------------------------------------------------
Reset controller fixes for v6.0

Fix the i.MX8MP PCIe PHY PERST bit polarity, issue the Sparx5 "switch"
reset (which turned out to be a rather more global reset) early on
startup, stubbing out the reset controller driver, and fix the NPCM8XX
USB reset sequence by setting IPSRST4 bits in the correct register.

----------------------------------------------------------------
Michael Walle (1):
      reset: microchip-sparx5: issue a reset on startup

Richard Zhu (1):
      reset: imx7: Fix the iMX8MP PCIe PHY PERST support

Tomer Maimon (1):
      reset: npcm: fix iprst2 and iprst4 setting

 drivers/reset/reset-imx7.c             |  1 +
 drivers/reset/reset-microchip-sparx5.c | 22 +++++++++++++++++-----
 drivers/reset/reset-npcm.c             |  2 +-
 3 files changed, 19 insertions(+), 6 deletions(-)
