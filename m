Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50113EB64DD
	for <soc@archiver.kernel.org>; Sun, 13 Aug 2023 13:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3990DC433C7; Sun, 13 Aug 2023 13:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FC4C433C8;
	Sun, 13 Aug 2023 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691933674;
	bh=JwTOJcAMD8jvMk1gytsVUYqGbLQFYMjRa0CIvfPXG4M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tIFEb1xcJzn9ge1XKhG/d1Ei7RSf0m5uQ1oVnoyRUNSFQGeQS9L/tMTFLZI2MeCr8
	 q9RFEqqN0H1ZuDO8ZXGlMDGHNJbFEp9nkUEp/8XW1pOsqSoUI0mSs6OVuJO0/jcF1M
	 Yhu1gKbhH6OQwBYs8/56hvYFzVAXMGus+/Ngp2ZILKC18/Z/o1xF+yyqTlcIbaDb6r
	 YVWn1sifQZqNzf+iqK3iqIvNA9ymABBD0WGx5iozCmFpsY32cOMuLZpIaS4R9+ckxu
	 aQffao9gQR9HuglJirLRI+JcePYb2Iw+MP+6Dfv3AQSaQad1C+/Zhc3u3FZKhaqQeq
	 xH/6eP/HCYIzQ==
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
Subject: [GIT PULL 5/6] i.MX arm64 device tree chanage for 6.6
Date: Sun, 13 Aug 2023 21:33:53 +0800
Message-Id: <20230813133354.847010-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230813133354.847010-1-shawnguo@kernel.org>
References: <20230813133354.847010-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.6

for you to fetch changes up to 60ac8a775a9147867a9d222d970ab2ca158dc23a:

  arm64: dts: imx8mq-librem5-devkit: Drop power-supply (2023-08-12 10:00:05 +0800)

----------------------------------------------------------------
i.MX arm64 device tree chanage for 6.6:

- New board device trees: i.MX93 based MBa93xxLA SBC, DEBIX SOM A,
  Gateworks i.MX8MM and i.MX8MP Venice boards.
- Add HDMI audio and video support for i.MX8MM/N Beacon board.
- Add coresight trace support for i.MX8MQ SoC.
- Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties.
- Add sound card support for verdin-imx8mp devices.
- A couple of change from Frank Li to add CPU frequency table and
  thermal support for i.MX8QM SoC.
- Add L1 and L2 cache info for LS1028A SoC.
- A series of i.MX93 changes from Peng Fan t oadd thermal and CM33 core
  support.
- A few imx8mq-librem5 updates from Martin Kepplinger and
  Sebastian Krzyszkowiak.
- A series of imx8mp-phycore-som changes from Teresa Remmet to update
  regulators.
- A bunch of changes from Tim Harvey to update various Gateworks boards.
- A bunch of dtschema warning fixes from Fabio Estevam, Krzysztof
  Kozlowski, etc.
- Other small and random changes.

----------------------------------------------------------------
Adam Ford (3):
      arm64: dts: imx8mn-beacon: Add HDMI video with sound
      arm64: dts: imx8mm-beacon: Change camera I2C address
      arm64: dts: imx8mm-beacon: Add HDMI video with sound

Alexander Stein (7):
      arm64: dts: freescale: add initial device tree for MBa93xxLA SBC board
      arm64: dts: imx8mq: Add coresight trace components
      arm64: dts: imx8qm: Fix VPU core alias name
      arm64: dts: imx8qm: Fix VPU core alias name
      arm64: dts: imx8: conn: Fix reg order for USB3 controller
      arm64: dts: tqma8mqnl: Add vcc supply to i2c eeproms
      arm64: dts: freescale: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties

Cem Tenruh (1):
      arm64: dts: imx8mm-phyboard-polis: Add i2c4 sda-/scl-gpios

Christian Hemp (1):
      arm64: dts: imx8mp-phycore-som: Remove eth phy interrupt

Fabio Estevam (16):
      arm64: dts: imx8mq-librem5: Use 'vqmmc-supply'
      arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
      arm64: dts: imx8mm-evk: Add camera support
      arm64: dts: imx8mn-evk: Add HDMI support
      arm64: dts: imx8mn-evk: Add camera support
      arm64: dts: imx8dxl-evk: Remove 'fsl,spi-num-chipselects'
      arm64: dts: imx8mm-phyboard-polis-rdk: Remove 'fsl,spi-num-chipselects'
      arm64: dts: imx: Pass a single BD71847 clock entry
      arm64: dts: imx8mm-emcon: Fix the regulator names
      arm64: dts: imx8mp-evk: Add HDMI support
      arm64: dts: imx8m-venice: Pass "brcm,bcm4329-fmac"
      arm64: dts: imx8mp-msc-sm2s-ep1: Remove invalid sgtl5000 property
      arm64: dts: imx8mp-debix-model-a: Remove invalid rtc property
      arm64: dts: imx8m-beacon-kit: Remove extra sound-sai entry
      arm64: dts: imx8mm-emcon: Remove iomuxc pinctrl-names
      arm64: dts: imx8mm-beacon-baseboard: Remove usbotg2 pinctrl-names

Francesco Dolcini (2):
      arm64: dts: freescale: verdin-imx8mp: dahlia: add sound card
      arm64: dts: freescale: verdin-imx8mp: dev: add sound card

Frank Li (4):
      arm64: dts: imx8mp: remove arm,primecell-periphid at etm nodes
      arm64: dts: imx8qm: add cpu frequency table
      arm64: dts: imx8qm: add thermal zone and cooling map
      arm64: dts: imx8qm-mek: delete A72 thermal zone

Guido Günther (2):
      arm64: dts: imx8mq-librem5-devkit: Mark buck2 as always on
      arm64: dts: imx8mq-librem5-devkit: Drop power-supply

Haibo Chen (3):
      arm64: dts: imx8ulp: add flexspi node
      arm64: dts: imx8ulp-evk: add 100MHz/200MHz pinctrl setting for eMMC
      arm64: dts: imx8ulp-evk: enable lpi2c7 bus

Han Xu (1):
      arm64: dts: imx8ulp-evk: add spi-nor device support

Hugo Villeneuve (1):
      arm64: dts: imx8mn-var-som-symphony: update USB OTG for new board versions

Hui Wang (1):
      arm64: dts: ls1028a: add l1 and l2 cache info

Jonas Kuenstler (1):
      arm64: dts: imx8mp-phyboard-pollux: Add missing usdhc clocks assignment

Krzysztof Kozlowski (4):
      arm64: dts: imx: minor whitespace cleanup around '='
      arm64: dts: imx8mm: split PCIe ranges
      arm64: dts: freescale: add missing space before {
      arm64: dts: imx8mm-phycore: drop uncorrect vselect-en

Marco Felsch (2):
      arm64: dts: imx8mp-debix: remove unused fec pinctrl node
      arm64: dts: freescale: Add DEBIX SOM A and SOM A I/O Board support

Martin Kepplinger (1):
      arm64: dts: imx8mq-librem5: set audio-1v8 always-on

Michael Walle (1):
      arm64: dts: ls1028a: sl28: get MAC addresses from VPD

Peng Fan (10):
      arm64: dts: imx93: add thermal support
      arm64: dts: imx93: add cma area for i.MX93 11x11 EVK
      arm64: dts: imx93: add cm33 node
      arm64: dts: imx93: enable CM33 for 11x11 EVK
      arm64: dts: imx8ulp: add cm33 node
      arm64: dts: imx8ulp: set default clock for SDHC
      arm64: dts: imx8ulp: add thermal node
      arm64: dts: imx8ulp: add cpuidle node
      arm64: dts: imx8ulp-evk: add reserved memory for cma
      arm64: dts: imx8ulp-evk: enable CM33 node

Sebastian Krzyszkowiak (3):
      arm64: dts: imx8mq-librem5-r4: Bump up proximity sensor's near level
      arm64: dts: imx8mq-librem5: Mark tps65982 as wakeup source
      arm64: dts: imx8mq-librem5: Reduce usdhc2's post-power-on-delay-ms to 20ms

Sherry Sun (2):
      arm64: dts: imx8dxl: remove "fsl,imx7ulp-lpuart" compatible for imx8dxl
      arm64: dts: imx93: add "fsl,imx8ulp-lpuart" compatible for imx93

Teresa Remmet (5):
      arm64: dts: imx8mp-phycore-som: Order properties alphabetically
      arm64: dts: imx8mp-phycore-som: Correct pad settings
      arm64: dts: imx8mp-phycore-som: Remove LDO2 and LDO4 pmic nodes
      arm64: dts: imx8mp-phycore-som: Add regulator names
      arm64: dts: imx8mp-phycore-som: Update regulator output voltages

Tim Harvey (13):
      arm64: dts: imx8mm-venice-gw7901: add cpu-supply node for cpufreq
      arm64: dts: imx8mm-venice-gw7901: add SDR50/SDR104 SDIO support for wifi
      arm64: dts: imx8m{m,n}-venice-gw7902: add SDR50/SDR104 SDIO support for wifi
      arm64: dts: imx8mm-venice-gw7904: enable UART1 hardware flow control
      arm64: dts: imx8mp-venice-gw74xx: update to revB PCB
      arm64: dts: freescale: fix imx8mm-venice-gw72xx-0x-imx219 overlay
      arm64: dts: imx8mm: add imx8mm-venice-gw73xx-0x-rpidsi overlay for display
      arm64: dts: imx8mm: add imx8mm-venice-gw72xx-0x-rpidsi overlay for display
      arm64: dts: imx8mp: add imx8mp-venice-gw74xx-rpidsi overlay for display
      arm64: dts: freescale: Add imx8mm-venice-gw7905-0x
      arm64: dts: freescale: Add imx8mp-venice-gw71xx-2x
      arm64: dts: freescale: Add imx8mp-venice-gw72xx-2x
      arm64: dts: freescale: Add imx8mp-venice-gw73xx-2x

Yannic Moog (2):
      arm64: dts: phycore-imx8mm: fix nor mtd partitions
      arm64: dts: imx8mm-phyboard-polis: Set debug uart muxing to 0x140

Yashwanth Varakala (2):
      arm64: dts: freescale: imx8mm-phyboard-polis: Add TPM node
      arm64: dts: imx8mp-phyboard-pollux-rdk: Fix led sub-node names

 arch/arm64/boot/dts/freescale/Makefile             |  14 +-
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts          |  12 +
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |   2 +
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |   8 +
 .../freescale/fsl-ls1028a-kontron-sl28-var4.dts    |   2 +
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     |  17 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  15 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi |   2 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   6 +-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  10 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   1 -
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |   8 +-
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |   5 +-
 .../arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 131 +++++
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   2 +-
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi    |  24 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |  48 ++
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |  51 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |   3 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |   2 +-
 .../freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtso  |  90 +++
 .../freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtso  |  90 +++
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |  53 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |  35 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |   2 +-
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |  20 +-
 .../boot/dts/freescale/imx8mm-venice-gw7905-0x.dts |  28 +
 .../boot/dts/freescale/imx8mm-venice-gw7905.dtsi   | 303 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   4 +-
 .../arm64/boot/dts/freescale/imx8mn-beacon-kit.dts | 133 +++++
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   2 +-
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |   2 +-
 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts  |   2 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dts       |   6 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      | 118 +++-
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |   2 +
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts |  32 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |  35 +-
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |  27 +-
 .../dts/freescale/imx8mp-debix-som-a-bmb-08.dts    | 472 +++++++++++++++
 .../boot/dts/freescale/imx8mp-debix-som-a.dtsi     | 285 +++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  66 +++
 .../boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts     |   1 -
 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi |   2 +-
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   8 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     | 155 +++--
 .../boot/dts/freescale/imx8mp-venice-gw71xx-2x.dts |  19 +
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi   | 236 ++++++++
 .../boot/dts/freescale/imx8mp-venice-gw72xx-2x.dts |  19 +
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   | 371 ++++++++++++
 .../boot/dts/freescale/imx8mp-venice-gw73xx-2x.dts |  19 +
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   | 414 +++++++++++++
 .../dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtso |  87 +++
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    | 265 +++++----
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |  56 +-
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |  55 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  20 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |  32 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r2.dts |   6 +-
 .../boot/dts/freescale/imx8mq-librem5-r3.dtsi      |  12 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r4.dts |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   7 +-
 arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi   |   2 +-
 .../boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          | 200 ++++++-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   4 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          | 212 ++++++-
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts    |   2 +-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   6 +-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      | 145 ++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |  73 ++-
 .../boot/dts/freescale/imx8x-colibri-aster.dtsi    |   2 +-
 .../boot/dts/freescale/imx8x-colibri-iris.dtsi     |   2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  56 ++
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     | 641 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  | 213 +++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  81 ++-
 77 files changed, 5222 insertions(+), 375 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7905-0x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7905.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
