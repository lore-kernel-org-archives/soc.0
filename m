Return-Path: <SRS0=AH2k=5B=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D6FC46467
	for <soc@archiver.kernel.org>; Wed,  4 Jan 2023 09:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 174A1C433D2; Wed,  4 Jan 2023 09:59:06 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57EB8C433EF
	for <soc@kernel.org>; Wed,  4 Jan 2023 09:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57EB8C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pD0Y0-0000TQ-T3; Wed, 04 Jan 2023 10:59:00 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.2
Date: Wed,  4 Jan 2023 10:58:55 +0100
Message-Id: <20230104095855.3809733-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.2

for you to fetch changes up to 3a2390c6777e3f6662980c6cfc25cafe9e4fef98:

  reset: uniphier-glue: Fix possible null-ptr-deref (2023-01-03 11:30:46 +0100)

----------------------------------------------------------------
Reset controller fixes for v6.2

Avoid a build error by disabling the invalid combination of building
reset-ti-sci built-in but ti-sci as a module.
Fix a possible NULL pointer dereference in reset-uniphier-glue in case
platform_get_resource() fails.

----------------------------------------------------------------
Hui Tang (1):
      reset: uniphier-glue: Fix possible null-ptr-deref

Randy Dunlap (1):
      reset: ti-sci: honor TI_SCI_PROTOCOL setting when not COMPILE_TEST

 drivers/reset/Kconfig               | 2 +-
 drivers/reset/reset-uniphier-glue.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)
