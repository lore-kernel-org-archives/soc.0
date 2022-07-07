Return-Path: <SRS0=Y+sh=XM=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0023EC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 10:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5E49C341C6; Thu,  7 Jul 2022 10:14:08 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FD85C3411E
	for <soc@kernel.org>; Thu,  7 Jul 2022 10:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FD85C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1o9OWD-0004iB-OK; Thu, 07 Jul 2022 12:13:57 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v5.19
Date: Thu,  7 Jul 2022 12:13:44 +0200
Message-Id: <20220707101344.3329314-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v5.19

for you to fetch changes up to a57f68ddc8865d59a19783080cc52fb4a11dc209:

  reset: Fix devm bulk optional exclusive control getter (2022-06-29 15:56:20 +0200)

----------------------------------------------------------------
Reset controller fixes for v5.19

Fix the MAINTAINERS entry for the Synopsys AXS10x reset controller
driver, which still points to a nonexistent .txt file after the device
tree binding .yaml conversion.
Also, fix the devm_reset_control_bulk_get_optional_exclusive() call,
which was defective since its introduction due to a copy & paste error.

----------------------------------------------------------------
Lukas Bulwahn (1):
      MAINTAINERS: rectify entry for SYNOPSYS AXS10x RESET CONTROLLER DRIVER

Serge Semin (1):
      reset: Fix devm bulk optional exclusive control getter

 MAINTAINERS           | 2 +-
 include/linux/reset.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
