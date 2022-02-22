Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACADC433F5
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 07:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E733C340EB; Tue, 22 Feb 2022 07:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38E8C340E8;
	Tue, 22 Feb 2022 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645516368;
	bh=W/dGaDpjEmR/Mp33239tj3Ddrx48J5wp/pOUAnKy0yE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=kTjNUnIvQLgbgk7iiiPks7LatvJQa+I6ryHEm9pG6o+2cF1K+5ooSuEbX8CQJWQYu
	 3oNCm/M5xuwGkefBRuFeK7DO4kV4X1kMETG7VsYxxblVOWMCEOhfPHllTp6pWaTaVL
	 AIR7SwPafXR+nsmN7CVh7aiLmzw709Fs9LTL/cDrZiCIXrmsXac7V4TRM+AUxSKXcD
	 V1ZwbvPSJ+cAshxdwIv8Bz/vyJhAD1mHX5AO3ewDKpwPamuvZBp7wBO2Ns0KxuDXb8
	 TDgT+gKGC15B6qUbd1ospvImyg3Dp7cqtduKqlMg11YNnODDkdE1vIzmNnKSt9BXfJ
	 +Ly8s0zK4G7Xw==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers update for 5.18
Date: Tue, 22 Feb 2022 15:52:21 +0800
Message-Id: <20220222075226.160187-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Commit 7a7b1414ea9a ("dt-bindings: power: imx8mq: add defines for VPU
blk-ctrl domains") on imx/bindings branch is merged here to resolve
a dependency on VPU blk-ctrl domain defines.

Please consider to pull, thanks!

Shawn


The following changes since commit 7a7b1414ea9a3641672be768afe16f583f0b76e7:

  dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains (2022-02-11 10:49:26 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.18

for you to fetch changes up to e6cb5408289f4202f4088731a4ac98c7ffaedb9d:

  bus: imx-weim: add DT overlay support for WEIM bus (2022-02-22 14:55:12 +0800)

----------------------------------------------------------------
i.MX drivers update for 5.18:

- Drop LS1021A device check from soc-imx driver as it's unneeded since
  commit commit 4ebd29f91629 ("soc: imx: Register SoC device only on
  i.MX boards").
- Add support for power domains provided by the VPU blk-ctrl on the
  i.MX8MQ.
- Add resource owner management API which will be used to check whether
  M4 is under control of Linux.
- Add VPU MU resources support into SCU power domain driver.
- Support DT overlay for WEIM bus driver with OF reconfiguration
  notifier handler.

----------------------------------------------------------------
Fabio Estevam (1):
      soc: imx: Remove Layerscape check

Ivan Bornyakov (1):
      bus: imx-weim: add DT overlay support for WEIM bus

Lucas Stach (1):
      soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl

Ming Qian (1):
      firmware: imx: scu-pd: imx8q: add vpu mu resources

Peng Fan (1):
      firmware: imx: add get resource owner api

Shawn Guo (1):
      Merge commit '7a7b1414ea9a3641672be768afe16f583f0b76e7' into imx/drivers

 drivers/bus/imx-weim.c              | 135 +++++++++++++++++++++++++++++++++---
 drivers/firmware/imx/rm.c           |  45 ++++++++++++
 drivers/firmware/imx/scu-pd.c       |   4 ++
 drivers/soc/imx/imx8m-blk-ctrl.c    |  66 ++++++++++++++++++
 drivers/soc/imx/soc-imx.c           |   3 -
 include/linux/firmware/imx/svc/rm.h |   5 ++
 6 files changed, 246 insertions(+), 12 deletions(-)
