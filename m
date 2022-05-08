Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F45DC433EF
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 03:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 413BDC385AF; Sun,  8 May 2022 03:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E31C385B3;
	Sun,  8 May 2022 03:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651981166;
	bh=MoeQBaMPfe3JBYOB20AnWizax2Gt9HEKwB0hbp9WQNg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jo2IEWP7I6rwc60eI11vTDE8dxx5lXkHObb8TLtDpzer41tFOxx9hgxWdBsGgTP93
	 A8WqQk4mNVy8Kd6LXHWD5CHnbPGJYAbiyDAFDrWqgDCLb/uA745dhF1psY46KfEOjl
	 z1rlgETbIYRtdt635DndIU8Q4qklMypEqsYsHcX/LPwTkwulac92vJQVI3hVQVKmkY
	 2ZLYg2kVFyRuLQzAPKIgdkcgFJdrGOKrndcf4QUrMFmRk7zrX1skesxvpn83bHBYEy
	 aRt29RILlIJKnnOr0kdXdEb1Eap/7upcC23IXVpcaOqvQau6k9B+fw2AiZE+C/khY2
	 80HeH+EYJ92Ng==
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
Subject: [GIT PULL 2/5] i.MX drivers update for 5.19
Date: Sun,  8 May 2022 11:38:40 +0800
Message-Id: <20220508033843.2773685-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220508033843.2773685-1-shawnguo@kernel.org>
References: <20220508033843.2773685-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Commit 'f11cf9e35e7f' from imx-bindings-5.19 is merged here to resolve
the dependency on constants in imx8mp-power.h.  Please consider to pull,
thanks!

Shawn


The following changes since commit f11cf9e35e7f740d158e298baf5764bcdd8a199e:

  dt-bindings: power: imx8mp: add defines for HDMI blk-ctrl domains (2022-05-05 09:24:41 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.19

for you to fetch changes up to 7a0c5cb67166ba546ec52e2dc2145b8f89caa9fc:

  soc: imx: fix semicolon.cocci warnings (2022-05-05 20:51:52 +0800)

----------------------------------------------------------------
i.MX drivers update for 5.19:

- A series from Lucas and Paul to update GPCv2 driver for i.MX8MP power
  domains, and add HSIO and HDMI block control support.

----------------------------------------------------------------
Lucas Stach (5):
      soc: imx: gpcv2: add PGC control register indirection
      soc: imx: gpcv2: add support for i.MX8MP power domains
      soc: imx: imx8m-blk-ctrl: set power device name
      soc: imx: add i.MX8MP HSIO blk-ctrl
      soc: imx: add i.MX8MP HDMI blk-ctrl

Paul Elder (1):
      soc: imx: imx8m-blk-ctrl: Add i.MX8MP media blk-ctrl

Shawn Guo (1):
      Merge commit 'f11cf9e35e7f' into imx/drivers

kernel test robot (1):
      soc: imx: fix semicolon.cocci warnings

 drivers/soc/imx/Makefile          |   1 +
 drivers/soc/imx/gpcv2.c           | 430 ++++++++++++++++++++++-
 drivers/soc/imx/imx8m-blk-ctrl.c  | 124 ++++++-
 drivers/soc/imx/imx8mp-blk-ctrl.c | 696 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 1237 insertions(+), 14 deletions(-)
 create mode 100644 drivers/soc/imx/imx8mp-blk-ctrl.c
