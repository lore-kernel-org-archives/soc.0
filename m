Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F1CEB64DD
	for <soc@archiver.kernel.org>; Sun, 13 Aug 2023 13:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A680C433CA; Sun, 13 Aug 2023 13:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96134C433C8;
	Sun, 13 Aug 2023 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691933654;
	bh=ncUFbhqR6e9ldrSREW37z6J2y7Xa6kmjekHtwylGqpQ=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=SDDvpm7fbuLHXbq3fxCtZJFt2yrIzycW281q3XUWAg+ppN6nDDMVlF7+8inKTtOmD
	 u7iAW6NmMPO79n002+hLJ9FueP+HMTZ+Cog+WE14rJ66QzuQUxkjHRMX1ed4EQwI4l
	 8OYP7g25mjSCVRf7/ve/CKqE9G1+gIyZo/ZcDKSqNTkojP8gHMVsB6zXYHORy1iGUC
	 jhwJSNQ6makqGkij7Ugepn3aRcipX+5KQesiVr7PmTIKe0hJnvs0xYcNfo5Chwr43T
	 E5FOZdNFDuaZ7eaHB0XbUDcUjqpwPs4YMdYLduHRP2aObwet2H5VpUiENW/Ar/Zs3D
	 hotWCuKcjPjZQ==
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
Subject: [GIT PULL 1/6] i.MX drivers update for 6.6
Date: Sun, 13 Aug 2023 21:33:49 +0800
Message-Id: <20230813133354.847010-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.6

for you to fetch changes up to c081197a33a2813881b534c44666024c97fb025d:

  firmware: imx: scu-irq: support identifying SCU wakeup source from sysfs (2023-08-11 22:14:10 +0800)

----------------------------------------------------------------
i.MX drivers update for 6.6:

- A series from NXP i.MX developers (Peng Fan, etc.) to update imx-scu
  and imx-scu-irq firmware drivers.
- Add dedicated lockdep class for nested genpd locks to fix a lockdep
  warning in imx93-blk-ctrl driver.
- A change from Rob to explicitly include correct DT headers for i.MX
  SoC drivers.
- Use devm_platform_ioremap_resource() in imx-weim bus driver.

----------------------------------------------------------------
Alexander Stein (1):
      soc: imx: imx93-blk-ctrl: Add dedicated lockdep class for nested genpd locks

Dong Aisheng (2):
      firmware: imx: scu: change init level to subsys_initcall_sync
      firmware: imx: scu: increase RPC timeout

Martin Kaiser (1):
      bus: imx-weim: use devm_platform_ioremap_resource

Peng Fan (4):
      firmware: imx: scu: use soc name for soc_id
      firmware: imx: scu: use EOPNOTSUPP
      firmware: imx: scu-irq: add imx_scu_irq_get_status
      firmware: imx: scu-irq: enlarge the IMX_SC_IRQ_NUM_GROUP

Ranjani Vaidyanathan (1):
      firmware: imx: scu-irq: support identifying SCU wakeup source from sysfs

Rob Herring (1):
      soc: imx: Explicitly include correct DT includes

Robin Gong (1):
      firmware: imx: scu-irq: fix RCU complaint after M4 partition reset

 drivers/bus/imx-weim.c             |   2 +-
 drivers/firmware/imx/imx-scu-irq.c | 118 +++++++++++++++++++++++++++++++------
 drivers/firmware/imx/imx-scu-soc.c |  20 ++++++-
 drivers/firmware/imx/imx-scu.c     |   9 ++-
 drivers/soc/imx/gpcv2.c            |   2 +-
 drivers/soc/imx/imx8m-blk-ctrl.c   |   3 +-
 drivers/soc/imx/imx8mp-blk-ctrl.c  |   2 +-
 drivers/soc/imx/imx93-blk-ctrl.c   |  17 +++++-
 drivers/soc/imx/imx93-pd.c         |   2 +-
 include/linux/firmware/imx/sci.h   |  16 +++--
 10 files changed, 158 insertions(+), 33 deletions(-)
