Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22311C433F5
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 07:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11A53C340EB; Tue, 22 Feb 2022 07:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27567C340F5;
	Tue, 22 Feb 2022 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645516375;
	bh=7W+48+p9FHSui6hTHAHtej3AoHyqR9ldakkTL54voaQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dSPYO3z0c40a3LGOZS1o7yHNqhvQiyY9KzC5hjRhAHu2zhnvhC3DgaXwfdjNVkgpP
	 SdfeM4JCE55gjwZsswe/D7jDQH9NcHrHC383Tq63s7aApNU+eAGi4yFBMlB6KPkYmM
	 l5Nq76XGj5Ag0i4TcutJAMfo12RMXLXVfyWDEsQRpu5Ie8MF9U+9wIs+9la5ZOepZX
	 ETo0sivdSMg2MdBKjidxP3agpXyEDgA+Jsc0nWpAml/CXyM1ec+gNTt0+IQNWqftGj
	 u5yvXua63JJIUgCZDziwHejGEmgqqJsE3ABgda1mTwoFKIyeONCC2oYccpu037F5jr
	 tTB1vX96UNGbQ==
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
Subject: [GIT PULL 4/6] i.MX arm device tree change for 5.18
Date: Tue, 22 Feb 2022 15:52:24 +0800
Message-Id: <20220222075226.160187-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222075226.160187-1-shawnguo@kernel.org>
References: <20220222075226.160187-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.18

for you to fetch changes up to 9baabac707a57c035a47b101e7a7af01340058d6:

  ARM: dts: imx6qp-sabresd: Enable PCIe support (2022-02-22 14:57:30 +0800)

----------------------------------------------------------------
i.MX arm device tree change for 5.18:

- A series from Alexander Stein to update imx6qdl based TQMA6 and MBA6
  devices, adding I2C bus recovery, marking GPIO buttons as wakeup
  source etc.
- A set of maintenance patches from Oleksij Rempel adding display,
  CAN termination and thermal support for i.MX6 based boards from
  Plymovent, Protonic and from Kverneland.
- A couple of patches from Thierry Reding to correct i.MX28 RTC
  compatbile, and rename RTC device nodes for i.MX SoCs.
- Update i.MX7 device tree to use audio_mclk_post_div clock instead of
  audio_mclk_root_clk, and move PCIe out of AIPS3 bus.
- A couple of patches on imx6qdl-phytec to support PMIC MFD subdevices.
- Add pinctrl header support for i.MXRT1050 SoC.
- Other small and random changes.

----------------------------------------------------------------
Abel Vesa (1):
      ARM: dts: imx7: Use audio_mclk_post_div instead audio_mclk_root_clk

Alexander Stein (5):
      ARM: dts: imx6qdl-mba6: Move rtc alias to common location
      ARM: dts: imx6qdl: tqma6: Add i2c bus recovery
      ARM: dts: imx6qdl: tqma6: Mark gpio-buttons as wakeup-source
      ARM: dts: imx6qdl: tqma6: Remove obsolete comment
      ARM: dts: imx6qdl-mba6: Move pinmux to regulator node

Andrej Picej (1):
      ARM: dts: imx6qdl-phytec: add missing pmic MFD subdevices

Dario Binacchi (1):
      ARM: dts: imx28: reparent gpmi clock to ref_gpmi

Fabio Estevam (1):
      ARM: dts: imx6sx-udoo-neo: Add HDMI support

Jesse Taube (1):
      ARM: dts: imxrt1050-pinfunc: Add pinctrl binding header

Marek Vasut (3):
      ARM: dts: imx6qdl-dhcom-pdk2: Include missing headers
      ARM: dts: imx: Add missing LVDS decoder on M53Menlo
      ARM: dts: imx7: Move PCIe out of AIPS3

Oleksij Rempel (4):
      ARM: dts: imx6dl-prtvt7: Add display and panel nodes
      ARM: dts: imx6qdl-vicut1: add CAN termination support
      ARM: dts: imx6dl: plym2m, prtvt7, victgo: make use of new resistive-adc-touch driver
      ARM: dts: imx6dl: plym2m, prtvt7, victgo: add thermal zones and hwmon

Richard Zhu (1):
      ARM: dts: imx6qp-sabresd: Enable PCIe support

Robin van der Gracht (1):
      ARM: dts: imx6dl-prtvt7: Add missing tvp5150 video decoder node

Thierry Reding (2):
      ARM: dts: imx28: Use correct compatible string for RTC
      ARM: dts: imx: Rename RTC device tree nodes

Yunus Bas (1):
      ARM: dts: imx6qdl-phytec: handle unneeded MFD-subdevices correctly

 arch/arm/boot/dts/imx28-tx28.dts                  |   2 +-
 arch/arm/boot/dts/imx28.dtsi                      |   2 +
 arch/arm/boot/dts/imx51-ts4800.dts                |   2 +-
 arch/arm/boot/dts/imx53-m53menlo.dts              |  29 +-
 arch/arm/boot/dts/imx53-tx53.dtsi                 |   2 +-
 arch/arm/boot/dts/imx6dl-plym2m.dts               | 131 ++-
 arch/arm/boot/dts/imx6dl-prtvt7.dts               | 203 ++++-
 arch/arm/boot/dts/imx6dl-victgo.dts               | 121 ++-
 arch/arm/boot/dts/imx6q-tbs2910.dts               |   2 +-
 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi         |   3 +
 arch/arm/boot/dts/imx6qdl-mba6.dtsi               |  16 +-
 arch/arm/boot/dts/imx6qdl-mba6a.dtsi              |   6 -
 arch/arm/boot/dts/imx6qdl-mba6b.dtsi              |  11 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi      |  13 +
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi |  10 +
 arch/arm/boot/dts/imx6qdl-tqma6.dtsi              |  14 +
 arch/arm/boot/dts/imx6qdl-tqma6a.dtsi             |   7 +-
 arch/arm/boot/dts/imx6qdl-tqma6b.dtsi             |   7 +-
 arch/arm/boot/dts/imx6qdl-tx6-mb7.dtsi            |   2 +-
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi             |  12 +-
 arch/arm/boot/dts/imx6qp-sabresd.dts              |   6 +-
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi            |  74 ++
 arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts      |   2 +-
 arch/arm/boot/dts/imx7-colibri-aster.dtsi         |   2 +-
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi       |   2 +-
 arch/arm/boot/dts/imx7-colibri.dtsi               |   4 +-
 arch/arm/boot/dts/imx7-mba7.dtsi                  |   2 +-
 arch/arm/boot/dts/imx7d-nitrogen7.dts             |   2 +-
 arch/arm/boot/dts/imx7d-pico-hobbit.dts           |   4 +-
 arch/arm/boot/dts/imx7d-pico-pi.dts               |   4 +-
 arch/arm/boot/dts/imx7d-sdb.dts                   |   4 +-
 arch/arm/boot/dts/imx7d.dtsi                      |  86 +-
 arch/arm/boot/dts/imx7s-warp.dts                  |   4 +-
 arch/arm/boot/dts/imxrt1050-pinfunc.h             | 993 ++++++++++++++++++++++
 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi         |   2 +-
 35 files changed, 1647 insertions(+), 139 deletions(-)
 create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
