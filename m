Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6BDC43334
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 09:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D583AC341C5; Tue, 14 Jun 2022 09:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5070AC3411B;
	Tue, 14 Jun 2022 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655200521;
	bh=v7dLIOLpIK9fPX4/r91okwDP4I4+ugm/BFQFvofpVCM=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=u6uByHyowRXSB4fiAZlRnH1ZkQih+C/IbIPolvcLk+XiCkKHmekcDP73jkkOyX5hz
	 KPQFHC1w72x4DCG0Z/wy9oIVS0nIH29ua+imWU2dj2GOsVvo3+lIAvnuKiK2z5wEcb
	 1oN7WRQy3Pi437Li5j6g7tsw0JBq0ljwsMA6ZxuyOAjjVBhk+f0tc5uTh7HgmSlA3m
	 KLW+OOW0vsqVNyGfNXRIZjDqYOYFQ8rLltFJvXCPiItVHNqqLEwPjHGHLE2U6UXWFu
	 n5qs+vZ3mGyBAxwhUK1KG2Q6/q1P2aXsX0S3b/U9E++cA6Ow45w4Q+xkHt7IdbUoFs
	 MkCgroOAKjr5g==
Date: Tue, 14 Jun 2022 17:55:15 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.19
Message-ID: <20220614095515.GU254723@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.19

for you to fetch changes up to 7c7eaeefb0ae226da9233d5db265652d900e1fcb:

  soc: imx: imx8m-blk-ctrl: fix display clock for LCDIF2 power domain (2022-06-14 11:53:42 +0800)

----------------------------------------------------------------
i.MX fixes for 5.19:

- Correct i.MX7 power domain for HSIC USB PHY node to fix an USB Host
  issue, that is all downstream events will be lost if USB host is
  runtime suspended.
- Fix i.MX8M blk-ctrl LCDIF2 power domain to point to refer to the
  correct clock.
- Correct i.MX6Q/DL PU regulator ramp delay to fix some peripherals
  power-up failure especially when the chip is at a low temperature.
- Fix capacitive touch reset polarity for imx6qdl-colibri board.

----------------------------------------------------------------
Alexander Stein (2):
      ARM: dts: imx7: Move hsic_phy power domain to HSIC PHY node
      soc: imx: imx8m-blk-ctrl: fix display clock for LCDIF2 power domain

Lucas Stach (1):
      ARM: dts: imx6qdl: correct PU regulator ramp delay

Max Krummenacher (1):
      ARM: dts: imx6qdl-colibri: Fix capacitive touch reset polarity

 arch/arm/boot/dts/imx6qdl-colibri.dtsi | 2 +-
 arch/arm/boot/dts/imx6qdl.dtsi         | 2 +-
 arch/arm/boot/dts/imx7s.dtsi           | 2 +-
 drivers/soc/imx/imx8m-blk-ctrl.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
