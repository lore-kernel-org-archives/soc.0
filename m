Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D35CC48BCF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 08:26:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 718BF61261; Sun, 13 Jun 2021 08:26:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 989C96108D;
	Sun, 13 Jun 2021 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623572766;
	bh=LSa0htpDryMuUxmpqOuiUQ94owQpQJDkEM1GOeBkRTY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uN0LdZlnVhTcSvUs0RmI5Up0QmIr71Sn5+SJrRWitGVFRFQttvLEteiDREfdj1tKM
	 SUU+RTYfVSZ7Cle6ZwnCC8W6MUm+oZf69xe4A9w2uxhAFwLddbj7ST2JweDtVgjj8v
	 iBnwRj1YNmQS5ygcGAneGreuo42hkSjzwmSQ2K7gtyu8MiH1ZSbce5qP9Mgq38tz+f
	 g9g7NEjyDF7QEwELuLNNUzL6flouRscllC0bY7qLERhUweF2ZQCZeD1BT6m3kUlfIT
	 E4cC2B43HC22hedHSHHRtjsdRv262hBwrzM9/iyFy/usDvZSYwjCEX9tfXYjXXACVP
	 xV6Jv2FK1gaHA==
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
Subject: [GIT PULL 5/6] i.MX arm64 device tree changes for 5.14
Date: Sun, 13 Jun 2021 16:25:43 +0800
Message-Id: <20210613082544.16067-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
References: <20210613082544.16067-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.14

for you to fetch changes up to 21cc1f222e890fa989d1395e47b16777fea46e5f:

  arm64: dts: imx8mn-evk: disable over current for usb (2021-06-12 17:59:43 +0800)

----------------------------------------------------------------
i.MX arm64 device tree chagnes for 5.14:

- New board support: i.MX8MM Gateworks GW7901 board.
- Add SPBA bus description for i.MX8MN and i.MX8MM.
- A series of update on imx8mq-nitrogen board to add USB OTG/Host and
  LT8912 MIPI-DSI to HDMI support.
- Correct enet clock description for i.MX8 Connection Subsystem.
- A couple of patches from Heiko Schocher to add FlexSPI device for
  i.MX8MP SoC and enable SPI NOR Flash support on imx8mp-phycore-som.
- Remove the reference to audio IPG clock on i.MX8MP.
- Enable EQOS Ethernet and PMIC device support for imx8mp-evk.
- Disable USB over-current on imx8mm-evk and imx8mn-evk.
- Add dma-ranges description for i.MX8MM and i.MX8MN SoC.
- Add PCIe clock description for i.MX8MQ SoC.
- Enable PCIe support on freeway board.
- Enable OPTEE support on ls1028a-rdb board.

----------------------------------------------------------------
Adam Ford (3):
      arm64: dts: imx8mn: Add spba1 bus
      arm64: dts: imx8mm: Add spba1 and spba2 buses
      arm64: dts: imx8mn-beacon-som: Assign PMIC clock

Adrien Grassein (3):
      arm64: dts: imx8mq-nitrogen: add USB OTG support
      arm64: dts: imx8mq-nitrogen: add USB HOST support
      arm64: dts: imx8mq-nitrogen: add lt8912 MIPI-DSI to HDMI

Dong Aisheng (1):
      arm64: dts: imx8: conn: fix enet clock setting

Heiko Schocher (2):
      arm64: dts: imx8mp: add flexspi node
      arm64: dts: imx8mp-phycore-som: enable spi nor

Jacky Bai (1):
      arm64: dts: imx8mp: Remove the reference to audio ipg clock on imx8mp

Joakim Zhang (1):
      arm64: dts: imx8mp-evk: enable EQOS ethernet

Kornel Duleba (1):
      arm64: dts: fsl-ls1028a: Correct ECAM PCIE window ranges

Li Jun (2):
      arm64: dts: imx8mm-evk: disable over current for usb1
      arm64: dts: imx8mn-evk: disable over current for usb

Lucas Stach (3):
      arm64: dts: imx8mm: specify dma-ranges
      arm64: dts: imx8mn: specify dma-ranges
      arm64: dts: imx8mq: assign PCIe clocks

Mian Yousaf Kaukab (2):
      arm64: dts: ls1012a: enable PCIe on freeway board
      arm64: dts: ls208xa: remove bus-num from dspi node

Richard Zhu (1):
      arm64: dts: imx8mq-evk: add one regulator used to power up pcie phy

Sahil Malhotra (1):
      arm64: dts: ls1028a-rdb: enable optee node

Tim Harvey (1):
      arm64: dts: imx: Add i.mx8mm Gateworks gw7901 dts support

Uwe Kleine-König (1):
      arm64: dts: imx8mp-evk: Add PMIC device

Zhen Lei (1):
      arm64: dts: freescale: Separate each group of data in the property 'reg'

 arch/arm64/boot/dts/freescale/Makefile             |    1 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts |    4 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |   14 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |    4 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   24 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |   12 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   24 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   24 +-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |   16 +-
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     |   16 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |    1 -
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   24 +-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |   50 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |    1 +
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    | 1019 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  363 +++----
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |    3 +
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |    1 +
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  147 +--
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  139 +++
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   25 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   18 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |    1 +
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts  |  182 ++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   16 +
 25 files changed, 1789 insertions(+), 340 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
