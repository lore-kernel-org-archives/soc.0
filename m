Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3F5C4338F
	for <soc@archiver.kernel.org>; Sat, 14 Aug 2021 13:39:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B9E060F9F; Sat, 14 Aug 2021 13:39:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3782860F92;
	Sat, 14 Aug 2021 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628948352;
	bh=LX+ERigAyoR/GYeAckGr0gGDAcTboOLSNey/VX1tzmY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ryp8v8cDVte1CyM9BTDvBVvjIezKkOAQ/NkajkfZTY8NJNIUjxXyIrjDB8gM2ZjtG
	 GRnCCC2CDZCPevPM8XpBn2axRgUOg1Aw6CdMdVbnUSFY0Q5+c0XpHKbEkug1DA1ca7
	 xJ+xuWzMv7AsZ2fqSgNSh7uWxKORMcK/5XuZ3JaacZ/9XdvYPywgat+53MMstdfBwt
	 xV/KbxqC8a9y2RyIEIYTGkEHjxvSa6Z0qVceVpn6SMDO+0sfqaycgvS3KBUBNptufb
	 hDomRIK8L2pxvjbDhqcOxKPZn8aHHR+oaaAC/KSc4OJLz/odwTPkzbutBw+LEsfkYT
	 W82GoYr6HCqpw==
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
Subject: [GIT PULL 2/4] i.MX arm32 device tree changes for 5.15
Date: Sat, 14 Aug 2021 21:38:51 +0800
Message-Id: <20210814133853.9981-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210814133853.9981-1-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.15

for you to fetch changes up to 87a8c7164022d2e5c558bc0e14075c7a50af7f95:

  ARM: dts: imx6qp-prtwd3: configure ENET_REF clock to 125MHz (2021-08-14 13:45:58 +0800)

----------------------------------------------------------------
i.MX arm32 device tree changes for 5.15:

- A series from Christoph Niedermaier to clean up i.MX6 DHCOM support.
- New board support: DHCOM based PicoITX, DHSOM based DRC02, SolidRun
  SolidSense, SKOV i.MX6 boards.
- Add WiFi support for i.MX7D base reMkarkable2 device.
- Add FTM devices for i.MX7 to have Flex Timers support.
- Configure ENET_REF clock to 125MHz for imx6qp-prtwd3 to support RGMII
  PHY mode.
- Drop unneeded #address-cells and #size-cells from vf610-zii SPI EEPROM
  device node.
- Add missing USB OTG OC pinmux and Crypto device for i.MX6QDL Gateworks
  boards.

----------------------------------------------------------------
Alistair Francis (1):
      ARM: dts: imx7d-remarkable2: Add WiFi support

Aswath Govindraju (1):
      ARM: dts: vf610-zii-dev-rev-b: Remove #address-cells and #size-cells property from at93c46d dt node

Christoph Niedermaier (15):
      ARM: dts: imx6q-dhcom: Add the parallel system bus
      ARM: dts: imx6q-dhcom: Add interrupt and compatible to the ethernet PHY
      ARM: dts: imx6q-dhcom: Fill GPIO line names on DHCOM SoM
      ARM: dts: imx6q-dhcom: Adding Wake pin to the PCIe pinctrl
      ARM: dts: imx6q-dhcom: Align stdout-path with other DHCOM SoMs
      ARM: dts: imx6q-dhcom: Add keys and leds to the PDK2 board
      ARM: dts: imx6q-dhcom: Remove ddc-i2c-bus property
      ARM: dts: imx6q-dhcom: Set minimum memory size of all DHCOM i.MX6 variants
      ARM: dts: imx6q-dhcom: Use 1G ethernet on the PDK2 board
      ARM: dts: imx6q-dhcom: Rework of the DHCOM GPIO pinctrls
      ARM: dts: imx6q-dhcom: Rearrange of iomux
      ARM: dts: imx6q-dhcom: Cleanup of the devicetrees
      ARM: dts: imx6qdl-dhcom: Split SoC-independent parts of DHCOM SOM and PDK2
      ARM: dts: imx6qdl-dhcom: Add DHCOM based PicoITX board
      ARM: dts: imx6qdl-dhcom: Add DHSOM based DRC02 board

Oleksij Rempel (1):
      ARM: dts: imx6qp-prtwd3: configure ENET_REF clock to 125MHz

Russell King (1):
      ARM: dts: add SolidRun SolidSense support

Sam Ravnborg (1):
      ARM: dts: add SKOV imx6q and imx6dl based boards

Thomas Perrot (1):
      ARM: dts: imx7: add ftm nodes for Flex Timers

Tim Harvey (2):
      ARM: dts: imx6qdl-gw5xxx: add missing USB OTG OC pinmux
      ARM: dts: imx6qdl-gw5904: atecc508a support

 arch/arm/boot/dts/Makefile                         |  11 +-
 arch/arm/boot/dts/imx6dl-dhcom-picoitx.dts         |  20 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts         |  13 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts         | 106 ++++
 arch/arm/boot/dts/imx6dl-solidsense.dts            |  54 ++
 arch/arm/boot/dts/imx6q-dhcom-pdk2.dts             | 270 +--------
 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts          |  36 ++
 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts          | 128 +++++
 .../boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
 arch/arm/boot/dts/imx6q-solidsense.dts             |  54 ++
 arch/arm/boot/dts/imx6qdl-dhcom-drc02.dtsi         | 139 +++++
 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi          | 361 ++++++++++++
 arch/arm/boot/dts/imx6qdl-dhcom-picoitx.dtsi       |  69 +++
 ...imx6q-dhcom-som.dtsi => imx6qdl-dhcom-som.dtsi} | 631 +++++++++++++++------
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi              |   1 +
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              |   1 +
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi              |   1 +
 arch/arm/boot/dts/imx6qdl-gw553x.dtsi              |   1 +
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi              |   5 +
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi       |  54 ++
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi            | 477 ++++++++++++++++
 arch/arm/boot/dts/imx6qdl-solidsense.dtsi          | 160 ++++++
 arch/arm/boot/dts/imx6qp-prtwd3.dts                |   2 +
 arch/arm/boot/dts/imx6s-dhcom-drc02.dts            |  30 +
 arch/arm/boot/dts/imx7d-remarkable2.dts            |  91 +++
 arch/arm/boot/dts/imx7s.dtsi                       |  28 +
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts          |   2 -
 27 files changed, 2431 insertions(+), 441 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-dhcom-picoitx.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-solidsense.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
 create mode 100644 arch/arm/boot/dts/imx6q-solidsense.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-drc02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-picoitx.dtsi
 rename arch/arm/boot/dts/{imx6q-dhcom-som.dtsi => imx6qdl-dhcom-som.dtsi} (57%)
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-solidsense.dtsi
 create mode 100644 arch/arm/boot/dts/imx6s-dhcom-drc02.dts
