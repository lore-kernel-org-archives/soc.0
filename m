Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688E1C48BCF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 08:26:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 44D7661222; Sun, 13 Jun 2021 08:26:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BA3C61248;
	Sun, 13 Jun 2021 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623572764;
	bh=TYX7FhNkEcdly4SwtHEpXAnTweI/BtiW5jRVeNf1qXM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tiSgU2lbe0Vbq0WDZ7N3pL5+CAtkbiH05xF5GGolgUgJemtOZ6ZgzAqdfLE2yIhcB
	 DEgdD+Nl+fH6RlMnv6friIwuRrPbeIOGJcbD721v8XOHvEQeMXThPQDo4yV396BMOW
	 W+OLgvldqeznQ4MxaypMcLcBoBG8Gjz8AMBRdnfRcn6W4wTnXKP+ltGYm3LUN0+RSn
	 kPwiLFd55rDzl/tHPoUvdHcDocitcW9TuvLtuymAuWmqBRCb3NB1QmWpSVAFAhO1Cp
	 bDjrX/plCgGtwDbe2R/T1e2GJ64NJPfEYyZhAuiqAL14CSYWCGrBBy/G2iI5nGUGz4
	 LT4R56fpVdw3w==
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
Subject: [GIT PULL 4/6] i.MX device tree changes for 5.14
Date: Sun, 13 Jun 2021 16:25:42 +0800
Message-Id: <20210613082544.16067-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
References: <20210613082544.16067-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.14

for you to fetch changes up to 1fac5db35ee91b88b07f6e062b0c2355fe71b289:

  ARM: dts: imx6: Add GE B1x5v2 (2021-06-12 12:22:22 +0800)

----------------------------------------------------------------
i.MX device tree changes for 5.14:

- New board support: i.MX6Q DaSheng COM-9XX SBC board, i.MX28 based XEA
  board, GE B1x5v2 boards.
- A series from Christoph Niedermaier to correct imx6q-dhcom
  descriptions, add device aliases and ethernet VIO regulator.
- Correct Ethernet node name for imx51-digi-connectcore-som and
  imx53-ard board to comply DT schema.
- A couple of update on imx6dl-yapp4 board, configuring OLED display
  segment offset, and using aliases to set custom MMC device indexes.
- A series from Oleksij Rempel and Robin van der Gracht to update
  Protonic boards: imx6dl-prtvt7, imx6dl-plym2m and imx6qdl-vicut1.
- A series from Shengjiu Wang to improve various audio support on NXP
  reference boards.
- Rename pinfunc for i.MX25 GPIO_[A-F] pads for consistency.

----------------------------------------------------------------
Christoph Niedermaier (5):
      ARM: dts: imx6q-dhcom: Fix ethernet reset time properties
      ARM: dts: imx6q-dhcom: Fix ethernet plugin detection problems
      ARM: dts: imx6q-dhcom: Add gpios pinctrl for i2c bus recovery
      ARM: dts: imx6q-dhcom: Add aliases for i2c, serial and rtc
      ARM: dts: imx6q-dhcom: Add ethernet VIO regulator

Dillon Min (1):
      ARM: dts: imx: Add i.mx6q DaSheng COM-9XX SBC board support

Fabio Estevam (1):
      ARM: dts: imx6qdl-wandboard-revd1: Remove PAD_EIM_D22 from hog group

Geert Uytterhoeven (2):
      ARM: dts: i.MX51: digi-connectcore-som: Correct Ethernet node name
      ARM: dts: imx53-ard: Correct Ethernet node name

Lukasz Majewski (1):
      ARM: dts: imx28: Add DTS description of imx28 based XEA board

Michal Vokáč (2):
      ARM: dts: imx6dl-yapp4: Configure the OLED display segment offset
      ARM: dts: imx6dl-yapp4: Use aliases to set custom MMC device indexes

Oleksij Rempel (8):
      ARM: dts: imx6: edmqmx6: set phy-mode to RGMII-ID
      ARM: dts: imx6dl-riotboard: configure PHY clock and set proper EEE value
      ARM: dts: imx6dl-prtvt7: add TSC2046 touchscreen node
      ARM: dts: imx6dl-prtvt7: Remove backlight enable gpio
      ARM: dts: imx6dl-prtvt7: fix PWM cell count for the backlight node.
      ARM: dts: imx6dl-plym2m: remove touchscreen-size-* properties
      ARM: dts: imx6dl: enable touchscreen debounce filter on PLYM2M and PRTVT7 boards
      ARM: dts: imx6qdl-vicut1: add interrupt-counter nodes

Primoz Fiser (1):
      ARM: dts: imx6: phyFLEX: Fix UART hardware flow control

Robin van der Gracht (3):
      ARM: dts: imx6dl-prtvt7: Enable the VPU
      ARM: dts: imx6dl-prtvt7: The sgtl5000 uses i2s not ac97
      ARM: dts: imx6dl-prtvt7: Remove unused 'sound-dai-cells' from ssi1 node

Sebastian Reichel (1):
      ARM: dts: imx6: Add GE B1x5v2

Shengjiu Wang (4):
      ARM: dts: imx6ul-14x14-evk: Switch to fsl-asoc-card sound card
      ARM: dts: imx7d-sdb: Add HDMI audio sound card
      ARM: dts: imx6qdl-sabresd: Add asrc support for wm8962 sound card
      ARM: dts: imx6qdl-sabresd: Configure the gpio for hp detect

Uwe Kleine-König (1):
      ARM: dts: imx25-pinfunc: Fix gpio function name for pads GPIO_[A-F]

 arch/arm/boot/dts/Makefile                        |   9 +-
 arch/arm/boot/dts/imx25-pinfunc.h                 |  12 +-
 arch/arm/boot/dts/imx28-lwe.dtsi                  | 170 ++++++
 arch/arm/boot/dts/imx28-xea.dts                   |  99 ++++
 arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi |   2 +-
 arch/arm/boot/dts/imx53-ard.dts                   |   2 +-
 arch/arm/boot/dts/imx6dl-b105pv2.dts              |  32 ++
 arch/arm/boot/dts/imx6dl-b105v2.dts               |  32 ++
 arch/arm/boot/dts/imx6dl-b125pv2.dts              |  30 ++
 arch/arm/boot/dts/imx6dl-b125v2.dts               |  30 ++
 arch/arm/boot/dts/imx6dl-b155v2.dts               |  32 ++
 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi             | 413 +++++++++++++++
 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi              |  58 ++
 arch/arm/boot/dts/imx6dl-plym2m.dts               |   6 +-
 arch/arm/boot/dts/imx6dl-prtvt7.dts               |  36 +-
 arch/arm/boot/dts/imx6dl-qmx6.dtsi                | 612 ++++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-riotboard.dts            |   2 +
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi        |   3 +
 arch/arm/boot/dts/imx6q-dhcom-som.dtsi            |  71 ++-
 arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts           |   2 +-
 arch/arm/boot/dts/imx6q-ds.dts                    |  17 +
 arch/arm/boot/dts/imx6qdl-ds.dtsi                 | 458 ++++++++++++++++
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi      |   5 +-
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi            |  10 +
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi             |  41 +-
 arch/arm/boot/dts/imx6qdl-wandboard-revd1.dtsi    |   1 -
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi           |  50 +-
 arch/arm/boot/dts/imx7d-sdb.dts                   |   7 +
 28 files changed, 2173 insertions(+), 69 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx28-lwe.dtsi
 create mode 100644 arch/arm/boot/dts/imx28-xea.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b105pv2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b105v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b125pv2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b125v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b155v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-qmx6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi
