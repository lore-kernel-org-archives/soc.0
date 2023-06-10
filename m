Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818D3C77B7A
	for <soc@archiver.kernel.org>; Sat, 10 Jun 2023 07:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 681C2C433D2; Sat, 10 Jun 2023 07:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F31AC433EF;
	Sat, 10 Jun 2023 07:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686381960;
	bh=JYDVz0Vf2OKiBnHFRiL8ukIx1vh6hZl5NkC3EqiCcAk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoQj8HIZQYtdnsP1uQyBsuIwE2rnMAfU5vsv1CvmNGOdSIOTIVKOjjnzIOa67xLrH
	 bf64CXZaaNJ+6zuske1WhxRjiNr11z2RtXoZ1QL3MqKHXHYWOl3Wvnlz4X4Iy9yBhO
	 B+vY0Y9+I4WT7cPy/BLvMGr00Qsl5t+U2+rgdtO3GBrZCpijjseqa89jE7TBxR8M7S
	 z9hkeCgGJO87cBQwwJFr4RNuLS0BPVO2455YrBTKtXDo1MTK40N+A0Up2Z/vM8fsrk
	 01dNLC9RiTiBVFallehrNUjgHe2s7TXJUKqAcyJmjtXhKMctKBXslH/+8yGcNk6OBC
	 QxMihuwoxIIoA==
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
Subject: [GIT PULL 2/4] i.MX ARM device tree for 6.5
Date: Sat, 10 Jun 2023 15:25:28 +0800
Message-Id: <20230610072530.418847-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230610072530.418847-1-shawnguo@kernel.org>
References: <20230610072530.418847-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.5

for you to fetch changes up to 5ef0f31fb9285d72bbe3bfd80be34284d4b9c7dd:

  ARM: dts: imx6qdl: vicut1: rename power to power-button (2023-06-04 21:07:31 +0800)

----------------------------------------------------------------
i.MX ARM device tree for 6.5:

- New board support: Marantec Maveo Box.
- Add HDMI support for TQMa6x/MBa6 board.
- A series from Andrew Lunn to add phy-mode and fixed links for Ethernet
  devices on imx51, imx6qdl and vf610.
- A bunch of changes from Fabio Estevam to clean up deprecated and
  invalid properies, fix up node names to remove dt-schema warnings.
- A series of maintenance updates for Protonic Holland boards, mostly
  on the USB subsystem configuration, thermal zones, and the naming of
  GPIO keys.
- Update dma-apbh device node name to remove dtbs_check warnings.
- Remove invalid nodes from fan-controller for a couple of Gateworks
  boards.
- Small random updates and clean-ups on various boards.

----------------------------------------------------------------
Alexander Stein (3):
      ARM: dts: mba6ulx: add missing vcc supplies to i2c devices
      ARM: dts: imx6qdl-mba6: add mac address for USB ethernet controller
      ARM: dts: imx6qdl: Add HDMI to TQMa6x/MBa6

Andrew Lunn (3):
      ARM: dts: imx51: ZII: Add missing phy-mode
      ARM: dts: imx6qdl: Add missing phy-mode and fixed links
      ARM: dts: vf610: ZII: Add missing phy-mode and fixed links

Christoph Niedermaier (2):
      ARM: dts: imx6ull-dhcor: Remove mmc aliases from DHCOR SoM
      ARM: dts: imx6ull-dhcor: Add Marantec maveo box

David Jander (1):
      ARM: dts: imx6dl: prtvt7: Remove touchscreen inversion

Fabio Estevam (23):
      ARM: dts: imx7d-sdb: Replace deprecated spi-gpio properties
      ARM: dts: imx6ul-14x14-evk: Replace deprecated spi-gpio properties
      ARM: dts: imx51-zii-rdu1: Replace deprecated spi-gpio properties
      ARM: dts: vf610-zii-dev-rev-b: Replace deprecated spi-gpio properties
      ARM: dts: imx6ul-tx6ul: Replace deprecated spi-gpio properties
      ARM: dts: imx28-tx28: Replace deprecated spi-gpio properties
      ARM: dts: imx28-cfa: Replace deprecated spi-gpio properties
      ARM: dts: imx6sx: Add LDB support
      ARM: dts: imx7d-smegw01: Remove unneeded #address-cells/#size-cells
      ARM: dts: imx7d-smegw01: Pass 'gpr' to the pinctrl groups
      ARM: dts: imx7d-smegw01: Use pinctrl-0 for pinctrl_rfkill
      ARM: dts: imx7d-smegw01: Pass Ethernet aliases
      ARM: dts: imx6ull-phytec-tauri: Remove invalid property
      ARM: dts: imx7d-flex-concentrator: Remove invalid ecspi property
      ARM: dts: imx35: Remove invalid wdog property
      ARM: dts: vfxxx: Remove invalid wdog property
      ARM: dts: imx6qdl-icore-rqs: Use the 'vmmc-supply' property
      ARM: dts: imx7d-sdb: Describe the SD card regulator
      ARM: dts: imx7d-sdb: Allow UHS modes
      ARM: dts: imx6: Use the mux- prefix
      ARM: dts: imx: Use 'pmic' as node name
      ARM: dts: imx6ul-ccimx6ulsom: Fix the "coin" regulator name
      ARM: dts: imx: Use 'eeprom' as node name

Haibo Chen (2):
      ARM: dts: imx6sll-evk: add eMMC node support
      ARM: dts: imx6sll-evk: avoid underscores in node name

Krzysztof Kozlowski (1):
      ARM: dts: imx7ulp: add address/size-cells to OCOTP

Oleksij Rempel (11):
      ARM: dts: imx6dl: lanmcu: Disable unused USB PHY nodes
      ARM: dts: imx6dl: lanmcu: Configure over-current polarity for USB OTG node
      ARM: dts: imx6dl: Add trip points to thermal zones on several devices
      ARM: dts: imx6dl: vicut1: Address USB related warnings
      ARM: dts: imx6dl: alti6p: fix different USB related warnings
      ARM: dts: imx6dl: prtmvt: fix different USB related warnings
      ARM: dts: imx6qp: prtwd3: Enable USB over current detection on USB OTG port
      ARM: dts: imx6ul: prti6g: fix USB over-current detection on USB OTG port
      ARM: dts: imx6dl: plybas: fix USB over-current detection on USB OTG port
      ARM: dts: imx6dl: prtrvt, prtvt7, prti6q, prtwd2: fix USB related warnings
      ARM: dts: imx6qdl: vicut1: rename power to power-button

Robin van der Gracht (3):
      ARM: dts: imx6qdl: vicut1: The sgtl5000 uses i2s not ac97
      ARM: dts: imx6dl: prtvt7: Adjust default backlight brightness to 65
      ARM: dts: imx6q: prtwd2: Correct iomux configuration for ENET MDIO and MDC

Stefan Wahren (2):
      ARM: dts: imx: Adjust dma-apbh node name
      ARM: dts: imx6ul: Add clock and PGC node to GPC

Tim Harvey (2):
      ARM: dts: imx6qdl-gw54xx: remove invalid nodes from fan-controller
      ARM: dts: imx6qdl-gw5912: remove invalid nodes from fan-controller

 arch/arm/boot/dts/Makefile                       |   1 +
 arch/arm/boot/dts/imx23.dtsi                     |   2 +-
 arch/arm/boot/dts/imx28-cfa10049.dts             |  10 +-
 arch/arm/boot/dts/imx28-cfa10055.dts             |   6 +-
 arch/arm/boot/dts/imx28-cfa10056.dts             |   6 +-
 arch/arm/boot/dts/imx28-tx28.dts                 |   6 +-
 arch/arm/boot/dts/imx28.dtsi                     |   2 +-
 arch/arm/boot/dts/imx35.dtsi                     |   1 -
 arch/arm/boot/dts/imx51-zii-rdu1.dts             |   8 +-
 arch/arm/boot/dts/imx51-zii-scu2-mezz.dts        |   2 +-
 arch/arm/boot/dts/imx51-zii-scu3-esb.dts         |   1 -
 arch/arm/boot/dts/imx53-tqma53.dtsi              |   2 +-
 arch/arm/boot/dts/imx6dl-alti6p.dts              |  10 +
 arch/arm/boot/dts/imx6dl-lanmcu.dts              |   9 +
 arch/arm/boot/dts/imx6dl-plybas.dts              |   2 +-
 arch/arm/boot/dts/imx6dl-plym2m.dts              |  24 ++
 arch/arm/boot/dts/imx6dl-prtmvt.dts              |  11 +-
 arch/arm/boot/dts/imx6dl-prtrvt.dts              |   4 +
 arch/arm/boot/dts/imx6dl-prtvt7.dts              |  28 +-
 arch/arm/boot/dts/imx6dl-qmx6.dtsi               |   4 +-
 arch/arm/boot/dts/imx6dl-riotboard.dts           |   2 +-
 arch/arm/boot/dts/imx6dl-victgo.dts              |  24 ++
 arch/arm/boot/dts/imx6q-cm-fx6.dts               |   4 +-
 arch/arm/boot/dts/imx6q-display5.dtsi            |   6 +-
 arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts          |   2 +-
 arch/arm/boot/dts/imx6q-gw5400-a.dts             |   2 +-
 arch/arm/boot/dts/imx6q-h100.dts                 |   2 +-
 arch/arm/boot/dts/imx6q-kp.dtsi                  |   4 +-
 arch/arm/boot/dts/imx6q-novena.dts               |   2 +-
 arch/arm/boot/dts/imx6q-pistachio.dts            |   2 +-
 arch/arm/boot/dts/imx6q-prtwd2.dts               |   3 -
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi            |   8 +-
 arch/arm/boot/dts/imx6qdl-gw551x.dtsi            |   4 +-
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi            |   7 +-
 arch/arm/boot/dts/imx6qdl-gw5912.dtsi            |   2 -
 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi      |   4 +-
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi     |   4 +-
 arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi         |   8 +-
 arch/arm/boot/dts/imx6qdl-icore.dtsi             |   4 +-
 arch/arm/boot/dts/imx6qdl-mba6.dtsi              |  61 +++-
 arch/arm/boot/dts/imx6qdl-mba6a.dtsi             |   6 +
 arch/arm/boot/dts/imx6qdl-mba6b.dtsi             |   6 +
 arch/arm/boot/dts/imx6qdl-phytec-pbab01.dtsi     |   4 +-
 arch/arm/boot/dts/imx6qdl-prti6q.dtsi            |  11 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi         |   2 +-
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi           |   2 +-
 arch/arm/boot/dts/imx6qdl-tx6.dtsi               |   4 +-
 arch/arm/boot/dts/imx6qdl-var-dart.dtsi          |   4 +-
 arch/arm/boot/dts/imx6qdl-vicut1-12inch.dtsi     |   2 +-
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi            |  19 +-
 arch/arm/boot/dts/imx6qdl-wandboard-revd1.dtsi   |   2 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi          |  10 +-
 arch/arm/boot/dts/imx6qdl.dtsi                   |   2 +-
 arch/arm/boot/dts/imx6qp-prtwd3.dts              |   2 +-
 arch/arm/boot/dts/imx6sl-evk.dts                 |   2 +-
 arch/arm/boot/dts/imx6sll-evk.dts                |  75 ++++-
 arch/arm/boot/dts/imx6sx-sdb-reva.dts            |   2 +-
 arch/arm/boot/dts/imx6sx-sdb.dts                 |   2 +-
 arch/arm/boot/dts/imx6sx-softing-vining-2000.dts |   2 +-
 arch/arm/boot/dts/imx6sx.dtsi                    |  44 ++-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi          |   4 +-
 arch/arm/boot/dts/imx6ul-ccimx6ulsom.dtsi        |   2 +-
 arch/arm/boot/dts/imx6ul-pico.dtsi               |   2 +-
 arch/arm/boot/dts/imx6ul-prti6g.dts              |   1 +
 arch/arm/boot/dts/imx6ul-tx6ul.dtsi              |   6 +-
 arch/arm/boot/dts/imx6ul.dtsi                    |  14 +-
 arch/arm/boot/dts/imx6ull-dhcom-som.dtsi         |   2 -
 arch/arm/boot/dts/imx6ull-dhcor-maveo-box.dts    | 359 +++++++++++++++++++++++
 arch/arm/boot/dts/imx6ull-dhcor-som.dtsi         |   5 +
 arch/arm/boot/dts/imx6ull-phytec-tauri.dtsi      |   1 -
 arch/arm/boot/dts/imx7d-flex-concentrator.dts    |   2 -
 arch/arm/boot/dts/imx7d-nitrogen7.dts            |   2 +-
 arch/arm/boot/dts/imx7d-pico.dtsi                |   2 +-
 arch/arm/boot/dts/imx7d-sdb.dts                  |  58 +++-
 arch/arm/boot/dts/imx7d-smegw01.dts              |  14 +-
 arch/arm/boot/dts/imx7s-warp.dts                 |   2 +-
 arch/arm/boot/dts/imx7s.dtsi                     |   2 +-
 arch/arm/boot/dts/imx7ulp.dtsi                   |   2 +
 arch/arm/boot/dts/mba6ulx.dtsi                   |   4 +
 arch/arm/boot/dts/vf610-zii-cfu1.dts             |   2 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts        |   8 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-c.dts        |  12 +-
 arch/arm/boot/dts/vf610-zii-scu4-aib.dts         |  32 +-
 arch/arm/boot/dts/vf610-zii-spb4.dts             |   2 +-
 arch/arm/boot/dts/vf610-zii-ssmb-dtu.dts         |   2 +-
 arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts        |   2 +-
 arch/arm/boot/dts/vfxxx.dtsi                     |   1 -
 87 files changed, 899 insertions(+), 143 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6ull-dhcor-maveo-box.dts
