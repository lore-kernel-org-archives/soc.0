Return-Path: <SRS0=4rAY=HY=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85383C4167D
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 15:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EAB9C433CC; Wed, 13 Dec 2023 15:26:22 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BC53C433C7
	for <soc@kernel.org>; Wed, 13 Dec 2023 15:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BC53C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rDR7o-0005Gz-Aw; Wed, 13 Dec 2023 16:26:16 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.7
Date: Wed, 13 Dec 2023 16:26:06 +0100
Message-Id: <20231213152606.231044-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.7

for you to fetch changes up to 4a6756f56bcf8e64c87144a626ce53aea4899c0e:

  reset: Fix crash when freeing non-existent optional resets (2023-11-30 15:02:21 +0100)

----------------------------------------------------------------
Reset controller fixes for v6.7

Fix a void-pointer-to-enum-cast warning in the hisilicon hi6220 reset
driver and fix a NULL pointer dereference when freeing non-existent
optional resets requested via the reset_array API in the core.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      reset: Fix crash when freeing non-existent optional resets

Krzysztof Kozlowski (1):
      reset: hisilicon: hi6220: fix Wvoid-pointer-to-enum-cast warning

 drivers/reset/core.c                   | 8 ++++----
 drivers/reset/hisilicon/hi6220_reset.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
