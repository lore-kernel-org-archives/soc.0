Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE82C433F5
	for <soc@archiver.kernel.org>; Mon, 11 Apr 2022 02:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8847EC385AA; Mon, 11 Apr 2022 02:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7379C385A1;
	Mon, 11 Apr 2022 02:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649644987;
	bh=jFAjRZgPYtKz3SN2lDyPdZIi9S3ksXFDNIYpPdk2qCc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=p9H4NeXNxltz5Qt1L1/8gOVQiiu53e94coxFEFiVP1aZY95g2zVbvpic6Tkn/Abba
	 9cjfljh6oLQwQTfw6NwogBfMeJsLjo2Fa141p2tZ/OjkLcJKED8yS9lWPXTmcmfsUp
	 z3SKqjhRDsh5rYFWhPyDVDUATYRCz5vnf6iPeQVywfIsXrr7jvt5zEe4SUjZ1tPWxG
	 n4FWniwg91eUpzkFHNS9XyBQnDBmaeWwuL2zx2eJmn3f8F9v9bDGOyMbQ6GHaowHP0
	 3zxwW3ulHxg6lhhZZTXvscUZKKYOqY3dTy9fKGQJTAbyI5vicgQMdc9biPrVyPkcpy
	 ZilhZ+LH9PGyg==
Date: Mon, 11 Apr 2022 10:43:01 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.18
Message-ID: <20220411024301.GH129381@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.18

for you to fetch changes up to f571e9c9aafed2fbd60fd99aa4b9823221338b98:

  arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes (2022-04-11 09:38:07 +0800)

----------------------------------------------------------------
i.MX fixes for 5.18:

- Increase DOMAIN_MAX_CLKS in imx8m-blk-ctrl driver to fix an ISI hang
  on i.MX8MN.
- Fix spi-tx-bus-width on imx8mq-tqma8mq board.
- Fix an SGTL5000 detection issue by moving MCLK pinctrl into SGTL5000
  codec node.
- Fix spi2 pin configuration on imx8mm-venice board.
- Fix SCU clock controller's compatible property for i.MX8QM.
- Fix SAI device compatible for i.MX8MN.
- A couple of fixes from Rob to address issues in boolean properties
  and touchscreen property sizes.
- Fix OTG controller over-current configuration for imx8mm-venice-gw
  boards.
- Fix NULL but dereferenced coccicheck error in imx-weim driver.

----------------------------------------------------------------
Adam Ford (1):
      soc: imx: imx8m-blk-ctrl: Fix IMX8MN_DISPBLK_PD_ISI hang

Alexander Stein (1):
      arm64: dts: imx8mq-tqma8mq: change the spi-nor tx

Fabio Estevam (1):
      ARM: dts: imx6qdl-apalis: Fix sgtl5000 detection issue

Johan Hovold (1):
      arm64: dts: imx8mm-venice: fix spi2 pin configuration

Liu Ying (1):
      arm64: dts: imx8qm: Correct SCU clock controller's compatible property

Marek Vasut (1):
      arm64: dts: imx8mn: Fix SAI nodes

Rob Herring (2):
      ARM: dts: imx: Fix boolean properties with values
      arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes

Tim Harvey (1):
      ARM: dts: imx8mm-venice-gw{71xx,72xx,73xx}: fix OTG controller OC mode

Wan Jiabing (1):
      bus: imx-weim: fix NULL but dereferenced coccicheck error

 arch/arm/boot/dts/imx6qdl-apalis.dtsi              | 10 +++++--
 arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi       | 32 +++++++++++-----------
 .../boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi    |  4 +--
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |  8 +++---
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |  4 ++-
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |  4 ++-
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |  4 ++-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |  8 +++---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          | 10 +++----
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  2 +-
 drivers/bus/imx-weim.c                             |  3 +-
 drivers/soc/imx/imx8m-blk-ctrl.c                   |  2 +-
 13 files changed, 52 insertions(+), 41 deletions(-)
