Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AD8C64E7B
	for <soc@archiver.kernel.org>; Wed,  2 Dec 2020 14:27:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 567B2221FA; Wed,  2 Dec 2020 14:27:52 +0000 (UTC)
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] i.MX device tree update for 5.11
Date: Wed,  2 Dec 2020 22:27:15 +0800
Message-ID: <20201202142717.9262-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142717.9262-1-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <soc.lore.kernel.org>
Message-ID: <20201202142715.hhZIupYMbFI03Y4K72liTRzlM4ACBt7xVtaHVKuRESQ@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.11

for you to fetch changes up to 327106e4217b8ef4f74640d7de15a0a287690aba:

  ARM: dts: imx28: Fix label name for L2 switch (2020-12-01 09:42:11 +0800)

----------------------------------------------------------------
i.MX device tree update for 5.11:

- New board support: imx6dl-alti6p, imx6dl-lanmcu, mx6qp-prtwd3,
  imx6ul-phytec-segin and imx7d-flex-concentrator.
- Fix schema warnings for pwm-leds, watchdog and GPIO hog devices.
- A few patches from Krzysztof Kozlowski to correct compatibles for
  i.MX6/7 boards.
- A series from Matthias Schiffer to polish imx7-mba7 board support.
- Update i.MX6/7 device trees for fsl,stop-mode support.
- Correct fsl,rcpm-wakeup of LS1021A to get flextimer wake-up work.
- A series of patch from Stefan Riedmueller to update phytec and segin
  devices.
- Other small and random changes.

----------------------------------------------------------------
Alexander Dahl (1):
      ARM: dts: imx: Fix schema warnings for pwm-leds

Bruno Thomsen (1):
      ARM: dts: imx7: add support for kamstrup flex concentrator

Jagan Teki (1):
      ARM: dts: imx6q-icore-ofcap10: Use 10.1" Ampire panel compatible

Jonathan Neuschäfer (2):
      ARM: dts: imx50-kobo-aura: Add 'grp' suffix to pinctrl node names
      ARM: dts: imx50-kobo-aura: Enable eKTF2132 touchscreen

Krzysztof Kozlowski (8):
      ARM: dts: imx: align GPIO hog names with dtschema
      ARM: dts: imx: align watchdog node name with dtschema
      ARM: dts: vf: align watchdog node name with dtschema
      ARM: dts: imx6dl-pico: fix board compatibles
      ARM: dts: imx6dl: add compatibles for Aristainetos boards
      ARM: dts: imx6sl-warp: correct vendor in compatible to Revotics
      ARM: dts: imx7s-warp: correct vendor in compatible to Element14
      ARM: dts: imx6q-pico: fix board compatibles

Lukasz Majewski (1):
      ARM: dts: imx28: Fix label name for L2 switch

Marc Kleine-Budde (1):
      ARM: dts: imx: Change flexcan node name to "can"

Marco Felsch (1):
      ARM: dts: imx6qdl-kontron-samx6i: increase i2c-frequency

Matthias Schiffer (10):
      ARM: dts: imx7-mba7: update compatible strings
      ARM: dts: imx7-mba7: drop incorrect num-chipselects property
      ARM: dts: imx7-mba7: remove unsupported PHY LED setup
      ARM: dts: imx7-mba7: disable ethernet PHY clock outputs
      ARM: dts: imx7-mba7: configure watchdog
      ARM: dts: imx7-mba7: update MMC aliases
      ARM: dts: imx7-mba7: add audio support
      ARM: dts: imx7-mba7: enable RS485 on UART7
      ARM: dts: imx7-mba7: specify USB over-current polarity
      ARM: dts: imx7-mba7: set dr_mode to otg on usbotg1

Oleksij Rempel (4):
      ARM: dts: imx6/7: sync fsl,stop-mode with current flexcan driver
      ARM: dts: add Altesco I6P board
      ARM: dts: add Van der Laan LANMCU board
      ARM: dts: add Protonic WD3 board

Peng Fan (1):
      ARM: dts: imx: add usb alias

Ran Wang (2):
      ARM: dts: ls1021a: fix flextimer failed to wake system
      ARM: dts: ls1021a: fix rcpm failed to claim resource

Stefan Riedmueller (5):
      ARM: dts: imx6ul: segin: Fix stmpe touchscreen subnode name
      ARM: dts: imx6: phytec: Set correct eeprom compatible
      ARM: dts: imx6: phytec: Add eeprom pagesize
      ARM: dts: imx6ul: phytec: Add support for optional PEB-AV-02 LCD adapter
      ARM: dts: imx6ul: segin: peb-av-02: Mark stmpe touch as wakeup-source

Yuantian Tang (1):
      ARM: dts: ls1021a: update calibration table for TMU module

Yunus Bas (1):
      ARM: dts: imx6ul: segin: Add phyBOARD-Segin with eMMC phyCORE-i.MX6UL

 arch/arm/boot/dts/Makefile                         |   6 +
 arch/arm/boot/dts/imx25.dtsi                       |   2 +-
 arch/arm/boot/dts/imx27.dtsi                       |   2 +-
 arch/arm/boot/dts/imx28.dtsi                       |   2 +-
 arch/arm/boot/dts/imx31.dtsi                       |   3 +-
 arch/arm/boot/dts/imx35.dtsi                       |   2 +-
 arch/arm/boot/dts/imx50-kobo-aura.dts              |  41 +-
 arch/arm/boot/dts/imx50.dtsi                       |   2 +-
 arch/arm/boot/dts/imx51-zii-rdu1.dts               |   2 +-
 arch/arm/boot/dts/imx51.dtsi                       |   4 +-
 arch/arm/boot/dts/imx53-ppd.dts                    |  15 +-
 arch/arm/boot/dts/imx53.dtsi                       |   4 +-
 arch/arm/boot/dts/imx6dl-alti6p.dts                | 564 +++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-aristainetos2_4.dts       |   2 +-
 arch/arm/boot/dts/imx6dl-aristainetos2_7.dts       |   2 +-
 arch/arm/boot/dts/imx6dl-aristainetos_4.dts        |   2 +-
 arch/arm/boot/dts/imx6dl-aristainetos_7.dts        |   2 +-
 arch/arm/boot/dts/imx6dl-lanmcu.dts                | 470 +++++++++++++++++
 arch/arm/boot/dts/imx6dl-pico-dwarf.dts            |   2 +-
 arch/arm/boot/dts/imx6dl-pico-hobbit.dts           |   2 +-
 arch/arm/boot/dts/imx6dl-pico-nymph.dts            |   2 +-
 arch/arm/boot/dts/imx6dl-pico-pi.dts               |   2 +-
 arch/arm/boot/dts/imx6q-icore-ofcap10.dts          |  28 +-
 arch/arm/boot/dts/imx6q-pico-dwarf.dts             |   2 +-
 arch/arm/boot/dts/imx6q-pico-hobbit.dts            |   2 +-
 arch/arm/boot/dts/imx6q-pico-nymph.dts             |   2 +-
 arch/arm/boot/dts/imx6q-pico-pi.dts                |   2 +-
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi             |   4 +-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi      |   6 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |   3 +-
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi  |   3 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi            |   8 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |  12 +-
 arch/arm/boot/dts/imx6qp-prtwd3.dts                | 553 ++++++++++++++++++++
 arch/arm/boot/dts/imx6sl-warp.dts                  |   4 +-
 arch/arm/boot/dts/imx6sl.dtsi                      |   3 +
 arch/arm/boot/dts/imx6sll.dtsi                     |   2 +
 arch/arm/boot/dts/imx6sx-softing-vining-2000.dts   |   8 +-
 arch/arm/boot/dts/imx6sx.dtsi                      |   7 +-
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts        |   2 +-
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi   |   1 +
 .../boot/dts/imx6ul-phytec-segin-ff-rdk-emmc.dts   |  94 ++++
 .../boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts   |   1 +
 .../boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi    | 151 ++++++
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi         |  43 --
 arch/arm/boot/dts/imx6ul.dtsi                      |  10 +-
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts  |   1 +
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts  |   1 +
 .../boot/dts/imx6ull-phytec-segin-peb-av-02.dtsi   |  26 +
 arch/arm/boot/dts/imx6ull-phytec-segin.dtsi        |   7 -
 arch/arm/boot/dts/imx7-mba7.dtsi                   |  69 ++-
 arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dts  |  25 +
 arch/arm/boot/dts/imx7d-flex-concentrator.dts      | 314 ++++++++++++
 arch/arm/boot/dts/imx7d-mba7.dts                   |   7 +-
 arch/arm/boot/dts/imx7d.dtsi                       |   6 +
 arch/arm/boot/dts/imx7s-mba7.dts                   |   2 +-
 arch/arm/boot/dts/imx7s-warp.dts                   |   4 +-
 arch/arm/boot/dts/imx7s.dtsi                       |   6 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |  81 ++-
 arch/arm/boot/dts/vfxxx.dtsi                       |   6 +-
 60 files changed, 2445 insertions(+), 196 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-alti6p.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-lanmcu.dts
 create mode 100644 arch/arm/boot/dts/imx6qp-prtwd3.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-emmc.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-peb-av-02.dtsi
 create mode 100644 arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dts
 create mode 100644 arch/arm/boot/dts/imx7d-flex-concentrator.dts
