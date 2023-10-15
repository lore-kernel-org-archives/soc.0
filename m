Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B0DCDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 13:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7C9CC433C9; Sun, 15 Oct 2023 13:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A559C433CB;
	Sun, 15 Oct 2023 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697376213;
	bh=8rz5uaqyIuuAmdNLELmlmLdrgPEV+3eSaPvArEFkymA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BY1Rn49z7mhPHJ6hjMcD3rvE0fo5qNXVa0viIKFNGxZ7opO9U1JDEHsJom1nakY2f
	 3GZuJwO1ID3glKos91+EEX5Jh/6wWSEwR8ERueXBas/AOylsAP8Teo/6JUdiED9D2v
	 PupoewdVj6QJxRcCEdRFoCLuJYT4om0jK1tCgRxeFNiAzg8QwfrP8Gx8N01z4IxcNm
	 7w1eWM+NofkUEoWJmq6oaWpSvMspxFI5tpza62f792sVsAq081P3orUt1aQ1YJ0G8n
	 GFa0QbYIE3NG2j/fqSFANxXtjWwpuudsaGKbJd+s/afURI8rsDmLG9sD2zONHDfJYx
	 eMup7iInoQYBg==
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
Subject: [GIT PULL 2/4] i.MX ARM device tree changes for 6.7
Date: Sun, 15 Oct 2023 21:22:58 +0800
Message-Id: <20231015132300.2268016-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231015132300.2268016-1-shawnguo@kernel.org>
References: <20231015132300.2268016-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.7

for you to fetch changes up to 46da7fda11ae0f237df75144248fcdf561c48634:

  ARM: dts: imx7d-pico-pi: Disable USDHC1 (2023-10-10 20:41:48 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.7:

- New board support: Variscite VAR-SOM-MX6 SoM and Custom board.
- A bunch of dt-schema check fixes from Fabio Estevam.
- A couple of MBA6ULX changes from Alexander Stein that marks gpio-buttons
  as wakeup-source and improves gpio-keys button node names.
- Add ATM0700D4 panel support for sk-imx53 board.
- Correct regulator node name for imx6qdl-nitrogen6 board.
- A couple of Gateworks i.MX6QDL board update: adding MDIO nodes and
  populating Ethernet MAC address.

----------------------------------------------------------------
Alexander Stein (2):
      ARM: dts: imx6ul: mba6ulx: Mark gpio-buttons as wakeup-source
      ARM: dts: imx6ul: mba6ulx: Fix gpio-keys button node names

Dmitry Baryshkov (1):
      ARM: dts: imx: add support for the ATM0700D4 panel attached to sk-imx53

Fabio Estevam (23):
      ARM: dts: imx6qdl-gw591: Remove lis2de12 interrupt-names
      ARM: dts: imx6ul-tx6ul: Use preferred i2c-gpios properties
      ARM: dts: imx51-zii-rdu1: Use preferred i2c-gpios properties
      ARM: dts: imx7s: Fix CSI clocks
      ARM: dts: imx6ull-phytec-tauri: Remove board model and compatible
      ARM: dts: imx6ull-phytec-tauri: Fix compatible
      ARM: dts: imx6ull/7d-colibri: Fix compatible
      ARM: dts: mxs: Fix duart clock-names
      ARM: dts: mxs: Switch to #pwm-cells = <3>
      ARM: dts: imx28-tx28: Move phy_type to USB node
      ARM: dts: imx6q-b650v3: Fix fsl,tx-cal-45-dn-ohms
      ARM: dts: imx6q-pistachio: Use a valid value for fsl,tx-d-cal
      ARM: dts: imx7ulp: Fix usbphy1 compatible
      ARM: dts: imx53: Adjust the ecspi compatible
      ARM: dts: imx51: Remove invalid sahara compatible
      ARM: dts: imx27-phytec: Use eeprom as the node name
      ARM: dts: vfxxx: Write dmas in a single line
      ARM: dts: imx25: Fix dryice node
      ARM: dts: imx25: Fix sram node
      ARM: dts: imx25: Remove clock-names from the watchdog
      ARM: dts: imx7s: Remove #power-domain-cells from gpcv2
      ARM: dts: imx28: Fix dcp compatible
      ARM: dts: imx7d-pico-pi: Disable USDHC1

James Hilliard (2):
      ARM: dts: imx6qdl: Add Variscite VAR-SOM-MX6 SoM support
      ARM: dts: imx6q: Add Variscite MX6 Custom board support

Krzysztof Kozlowski (1):
      ARM: dts: nxp: imx6qdl-nitrogen6: correct regulator node name

Tim Harvey (2):
      ARM: dts: imx6qdl-gw5904: add internal mdio nodes
      ARM: dts: imx6qdl-gw5904: add dt props for populating eth MAC addrs

 arch/arm/boot/dts/nxp/imx/Makefile                 |   3 +
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |   7 +-
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    |   2 +-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts       |   4 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |   2 +-
 .../dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts  |  97 ++++
 .../dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts   | 112 ++++
 .../boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi |  45 ++
 arch/arm/boot/dts/nxp/imx/imx53.dtsi               |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts         |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts      |   4 +-
 .../boot/dts/nxp/imx/imx6q-var-mx6customboard.dts  | 247 +++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi      |  46 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi      |   1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi      |   1 -
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi     | 569 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |   6 +-
 .../dts/nxp/imx/imx6ull-colibri-emmc-aster.dts     |   1 -
 .../dts/nxp/imx/imx6ull-colibri-emmc-eval-v3.dts   |   1 -
 .../dts/nxp/imx/imx6ull-colibri-emmc-iris-v2.dts   |   3 +-
 .../boot/dts/nxp/imx/imx6ull-colibri-emmc-iris.dts |   1 -
 .../boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dts   |   2 +-
 .../dts/nxp/imx/imx6ull-colibri-wifi-aster.dts     |   2 +-
 .../dts/nxp/imx/imx6ull-colibri-wifi-eval-v3.dts   |   2 +-
 .../dts/nxp/imx/imx6ull-colibri-wifi-iris-v2.dts   |   2 +-
 .../boot/dts/nxp/imx/imx6ull-colibri-wifi-iris.dts |   2 +-
 .../boot/dts/nxp/imx/imx6ull-phytec-tauri-emmc.dts |   4 +-
 .../boot/dts/nxp/imx/imx6ull-phytec-tauri-nand.dts |   4 +-
 .../arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi |   5 -
 .../boot/dts/nxp/imx/imx7d-colibri-emmc-aster.dts  |   1 -
 .../dts/nxp/imx/imx7d-colibri-emmc-eval-v3.dts     |   1 -
 .../dts/nxp/imx/imx7d-colibri-emmc-iris-v2.dts     |   1 -
 .../boot/dts/nxp/imx/imx7d-colibri-emmc-iris.dts   |   1 -
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts        |   4 +
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |   7 +-
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |   2 +-
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |   9 +-
 arch/arm/boot/dts/nxp/mxs/imx23-evk.dts            |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts          |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts           |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi               |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts       |   2 +-
 .../boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi    |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-evk.dts            |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts         |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts         |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts           |   6 +-
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi               |   6 +-
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                |  27 +-
 55 files changed, 1185 insertions(+), 95 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
