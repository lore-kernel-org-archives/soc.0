Return-Path: <SRS0=M9xQ=UQ=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC90FC433EF
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 15:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2FBAC385A1; Wed,  6 Apr 2022 15:33:50 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C757C385A3
	for <soc@kernel.org>; Wed,  6 Apr 2022 15:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C757C385A3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nc7fE-0005gr-NT; Wed, 06 Apr 2022 17:33:44 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [GIT PULL] Reset controller fixes for v5.18
Date: Wed,  6 Apr 2022 17:33:37 +0200
Message-Id: <20220406153337.1265414-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v5.18

for you to fetch changes up to 03cb66463b5547b289099a95ac4ea591cca88ca9:

  dt-bindings: reset: Add parent "resets" property as optional (2022-04-04 11:35:29 +0200)

The first two patches were part of the missed reset-for-v5.17 tag.

----------------------------------------------------------------
Reset controller fixes for v5.18

Document the deprecated 'hisi,rst-syscon' device tree property for
hisilicon,hi3660-reset, add an error check to reset deassertion in
reset-rzg2l-usbphy-ctrl, restore transfer error handling in Tegra
reset-bpmp, and document the optional 'resets' device tree property
for socionext,uniphier-reset.

----------------------------------------------------------------
David Heidelberg (1):
      dt-bindings: reset: document deprecated HiSilicon property

Heiner Kallweit (1):
      reset: renesas: Check return value of reset_control_deassert()

Kunihiko Hayashi (1):
      dt-bindings: reset: Add parent "resets" property as optional

Sameer Pujar (1):
      reset: tegra-bpmp: Restore Handle errors in BPMP response

 .../devicetree/bindings/reset/hisilicon,hi3660-reset.yaml        | 5 +++++
 .../devicetree/bindings/reset/socionext,uniphier-reset.yaml      | 3 +++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c                          | 4 +++-
 drivers/reset/tegra/reset-bpmp.c                                 | 9 ++++++++-
 4 files changed, 19 insertions(+), 2 deletions(-)
