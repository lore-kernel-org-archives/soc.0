Return-Path: <SRS0=2nfe=RV=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CACC433EF
	for <soc@archiver.kernel.org>; Wed,  5 Jan 2022 17:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98DCBC36AE3; Wed,  5 Jan 2022 17:26:25 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC20AC36AE0
	for <soc@kernel.org>; Wed,  5 Jan 2022 17:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC20AC36AE0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n5A3L-0002Rs-2p; Wed, 05 Jan 2022 18:26:23 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [GIT PULL] Reset controller updates vor v5.17
Date: Wed,  5 Jan 2022 18:26:18 +0100
Message-Id: <20220105172618.302522-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.17

for you to fetch changes up to 89e7a6698fdd6d0cccf5bab11abc51f813944cd8:

  reset: uniphier-glue: Use devm_add_action_or_reset() (2021-12-16 09:59:55 +0100)

----------------------------------------------------------------
Reset controller updates vor v5.17

Add an optional variant of of_reset_control_get_exclusive(), document
a deprecated hi3660-reset device tree property, check whether reset
deassertion worked in the reset-rzg2l-usbphy-ctrl driver, and simplify
the uniphier-glue driver a bit.

----------------------------------------------------------------
Biju Das (1):
      reset: Add of_reset_control_get_optional_exclusive()

David Heidelberg (1):
      dt-bindings: reset: document deprecated HiSilicon property

Heiner Kallweit (1):
      reset: renesas: Check return value of reset_control_deassert()

Philipp Zabel (2):
      reset: uniphier-glue: Use reset_control_bulk API
      reset: uniphier-glue: Use devm_add_action_or_reset()

 .../bindings/reset/hisilicon,hi3660-reset.yaml     |  5 ++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |  4 +-
 drivers/reset/reset-uniphier-glue.c                | 75 ++++++++++------------
 include/linux/reset.h                              | 20 ++++++
 4 files changed, 62 insertions(+), 42 deletions(-)
