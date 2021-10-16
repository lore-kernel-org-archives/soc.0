Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22569C433EF
	for <soc@archiver.kernel.org>; Sat, 16 Oct 2021 14:02:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DF4896120A; Sat, 16 Oct 2021 14:02:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98F5C610D2;
	Sat, 16 Oct 2021 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634392933;
	bh=XJ0Q4Ut+FHYPnSZ/i6TZ0dYQTlCahYfCZPiS055X5sw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HAen5h6UXx5d/qTixW68KgY9bF14EIakLQrafHJ++mKo5iEu8fD5YOWn2hSakmbL4
	 8u8Bl4ngzJXuDuwixaMqyeLHuCuDxMftFVAm38p790K7ZtMEy2CSSwqt/pMQwA17c1
	 BmeEt/EACBD0ursI9vRN0PSLJSDbCQFEPwUOU5P9qqD9FD9ApYfQmXGlG0mc6ltojN
	 M3JBjXWplYjjVrP7UisZ64NXPcFEVjM+ICX2qsL5NHW4+5su2hWSnFwjwZRTxWoACC
	 S9BthugVV9WdosaxNpQuc2VSkcAhAiaLmtXNN610kDb7vZnFnGT7DeLIZlh1NtnKWh
	 dcbKM7QM46Rhg==
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
Subject: [GIT PULL 2/6] i.MX drivers update for 5.16
Date: Sat, 16 Oct 2021 22:01:34 +0800
Message-Id: <20211016140138.1603-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.16

for you to fetch changes up to 72949f76565c9ea9f4231c977774a31d4713c386:

  soc: imx: imx8m-blk-ctrl: off by one in imx8m_blk_ctrl_xlate() (2021-10-15 11:10:05 +0800)

----------------------------------------------------------------
i.MX drivers update for 5.16:

- Select REGMAP_MMIO for i.MX GPCv2 driver to avoid build issue.
- A couple of i.MX GPCv2 driver changes from Marek Vasut to turn
  domain->pgc into bitfield for i.MX8MM GPU domain support.
- A series from Lucas Stach adding support of i.MX8MM nested power
  domains like VPUMIX and DISPMIX which contains the ADB and BLK_CTRL.
- An off-by-one fix on Lucas' i.MX8M blk-ctrl driver code.

----------------------------------------------------------------
Dan Carpenter (1):
      soc: imx: imx8m-blk-ctrl: off by one in imx8m_blk_ctrl_xlate()

Ezequiel Garcia (1):
      imx: soc: Select REGMAP_MMIO

Lucas Stach (8):
      soc: imx: gpcv2: allow to disable individual power domains
      Revert "soc: imx: gpcv2: move reset assert after requesting domain power up"
      soc: imx: gpcv2: add lockdep annotation
      soc: imx: gpcv2: add domain option to keep domain clocks enabled
      soc: imx: gpcv2: keep i.MX8M* bus clocks enabled
      soc: imx: gpcv2: support system suspend/resume
      soc: imx: add i.MX8M blk-ctrl driver
      soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl

Marek Vasut (2):
      soc: imx: gpcv2: Turn domain->pgc into bitfield
      soc: imx: gpcv2: Set both GPC_PGC_nCTRL(GPU_2D|GPU_3D) for MX8MM GPU domain

 drivers/soc/imx/Kconfig          |   1 +
 drivers/soc/imx/Makefile         |   1 +
 drivers/soc/imx/gpcv2.c          | 134 +++++++---
 drivers/soc/imx/imx8m-blk-ctrl.c | 523 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 618 insertions(+), 41 deletions(-)
 create mode 100644 drivers/soc/imx/imx8m-blk-ctrl.c
