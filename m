Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF4C32772
	for <soc@archiver.kernel.org>; Tue, 23 Aug 2022 09:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C552C433D6; Tue, 23 Aug 2022 09:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1F8C433C1;
	Tue, 23 Aug 2022 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661246798;
	bh=230swWdIKHhtddcRArowETTp21Wj+wqdKayt3kSa4zc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=gRmm1ZGTSm80elNHqo9zh8ReopC/TZEfOs6O/TOlwrjBWbipoxkvzBEIyI0p19VMf
	 v97J8SvyZoRQmudxgWcHxDk1xIdKYU4wUS0DNlgPUyUoqv4FCij1sZJAGd0lCohUVG
	 6PjxktPKooX4pMQhWGtjNdzoqDCbSWrE5V0JEzm7tx3Rtpc2zRdElY/5V4nArLbGp4
	 wjPHL56ERL5dBZspFeSkvLHV+1tl6q29dSJs1htRrbDjWYqegGeTtsMgj4CoVrKbnn
	 ctbQ/66wZT/s001hwVKjGRABKPG4RDasllyVlktmjhOffVIU39q532o4iIFN7lRXXo
	 /G/N3PQbnfW4g==
Date: Tue, 23 Aug 2022 17:26:31 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.0
Message-ID: <20220823092631.GV149610@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.0

for you to fetch changes up to 8f143b9f3849828870bb2a7f28288095ad9a329d:

  arm64: dts: freescale: verdin-imx8mp: fix atmel_mxt_ts reset polarity (2022-08-22 10:07:46 +0800)

----------------------------------------------------------------
i.MX fixes for 6.0:

- Remove superfluous interrupt-names from imx8mq-tqma8mq RTC device to
  silence dtbs_check warning.
- A few Verdin board fixes on CAN clock frequency, mcp251xfd interrupt,
  atmel_mxt_ts reset polarity and USB PHY.
- Remove duplicated node and fix spi-flash compatible for
  imx6qdl-kontron-samx6i.
- A couple of i.MX8M Plus DHCOM fixes from Marek Vasut on ECSPI1 pinmux
  and I2C5 GPIO assignment.
- A couple of Venice fixes on SAI2 pin settings and phy-mode.
- Drop in-band autoneg for 2500base-x phy-mode on ls1028a-qds-65bb
  board.
- Revert the power device name setting change from imx8m-blk-ctrl
  driver, as it causes issue for sysfs cleanup path.
- Fix gpcv2 driver to assert reset before ungating clock.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: imx8mq-tqma8mq: Remove superfluous interrupt-names

Andrejs Cainikovs (2):
      arm64: dts: imx8mm-verdin: update CAN clock to 40MHz
      arm64: dts: imx8mm-verdin: use level interrupt for mcp251xfd

David Jander (1):
      ARM: dts: imx6qdl-vicut1.dtsi: Fix node name backlight_led

Marcel Ziswiler (2):
      arm64: dts: freescale: verdin-imx8mm: fix atmel_mxt_ts reset polarity
      arm64: dts: freescale: verdin-imx8mp: fix atmel_mxt_ts reset polarity

Marco Felsch (3):
      Revert "soc: imx: imx8m-blk-ctrl: set power device name"
      ARM: dts: imx6qdl-kontron-samx6i: remove duplicated node
      ARM: dts: imx6qdl-kontron-samx6i: fix spi-flash compatible

Marek Vasut (3):
      arm64: dts: imx8mp: Adjust ECSPI1 pinmux on i.MX8M Plus DHCOM
      soc: imx: gpcv2: Assert reset before ungating clock
      arm64: dts: imx8mp: Fix I2C5 GPIO assignment on i.MX8M Plus DHCOM

Peng Fan (1):
      arm64: dts: imx8mp-venice-gw74xx: fix sai2 pin settings

Philippe Schenker (1):
      arm64: dts: verdin-imx8mm: add otg2 pd to usbphy

Tim Harvey (1):
      arm64: dts: imx8mm-venice-gw7901: fix port/phy validation

Vladimir Oltean (1):
      arm64: dts: ls1028a-qds-65bb: don't use in-band autoneg for 2500base-x

 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi          | 12 +-----------
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi                  |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dts |  1 -
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi       | 11 ++++++-----
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi    | 14 +++++++-------
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi       |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi      |  1 -
 drivers/soc/imx/gpcv2.c                                |  5 ++++-
 drivers/soc/imx/imx8m-blk-ctrl.c                       |  1 -
 11 files changed, 29 insertions(+), 34 deletions(-)
