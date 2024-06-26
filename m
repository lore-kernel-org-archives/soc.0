Return-Path: <SRS0=/atB=N4=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD068C27C4F
	for <soc@archiver.kernel.org>; Wed, 26 Jun 2024 16:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2659C32782; Wed, 26 Jun 2024 16:34:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA572C116B1
	for <soc@kernel.org>; Wed, 26 Jun 2024 16:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA572C116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sMVbd-0002l9-6T; Wed, 26 Jun 2024 18:34:49 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.10
Date: Wed, 26 Jun 2024 18:34:43 +0200
Message-Id: <20240626163443.61384-1-p.zabel@pengutronix.de>
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

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.10

for you to fetch changes up to ab35896730a5e8fdf885a23fa2e27f286c5f94b2:

  reset: hisilicon: hi6220: add missing MODULE_DESCRIPTION() macro (2024-06-21 13:49:25 +0200)

----------------------------------------------------------------
Reset controller fixes for v6.10

Fix a missing GPIOLIB dependency for the GPIO reset controller and add
a missing MODULE_DESCRIPTION for the hi6220 reset driver to fix some
build warnings.

----------------------------------------------------------------
Jeff Johnson (1):
      reset: hisilicon: hi6220: add missing MODULE_DESCRIPTION() macro

Mark Brown (1):
      reset: gpio: Fix missing gpiolib dependency for GPIO reset controller

 drivers/reset/Kconfig                  | 1 +
 drivers/reset/hisilicon/hi6220_reset.c | 1 +
 2 files changed, 2 insertions(+)
