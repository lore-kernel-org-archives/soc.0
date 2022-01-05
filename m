Return-Path: <SRS0=2nfe=RV=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26A0C433F5
	for <soc@archiver.kernel.org>; Wed,  5 Jan 2022 17:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F625C36AE9; Wed,  5 Jan 2022 17:25:42 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4325BC36AE3
	for <soc@kernel.org>; Wed,  5 Jan 2022 17:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4325BC36AE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n5A2c-0002JR-PI; Wed, 05 Jan 2022 18:25:38 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [GIT PULL] Reset controller fixes for v5.16, part 2
Date: Wed,  5 Jan 2022 18:25:15 +0100
Message-Id: <20220105172515.273947-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 69125b4b9440be015783312e1b8753ec96febde0:

  reset: tegra-bpmp: Revert Handle errors in BPMP response (2021-11-17 17:22:27 +0100)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v5.16-2

for you to fetch changes up to 92c959bae2e54ba1e2540ba5f813f7752bd76be1:

  reset: renesas: Fix Runtime PM usage (2021-12-15 11:20:30 +0100)

----------------------------------------------------------------
Reset controller fixes for v5.16, part 2

Fix pm_runtime_resume_and_get() error handling in the
reset-rzg2l-usbphy-ctrl driver.

----------------------------------------------------------------
Heiner Kallweit (1):
      reset: renesas: Fix Runtime PM usage

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
