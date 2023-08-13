Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06462EB64DD
	for <soc@archiver.kernel.org>; Sun, 13 Aug 2023 13:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2A1AC433C8; Sun, 13 Aug 2023 13:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D28C433C7;
	Sun, 13 Aug 2023 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691933668;
	bh=C9ozZlvSJE/8hqKmM4G1SqkAoSObrYOxPr6mc8TuSS8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CVeVIq8arybR9EsrD5WvUFLWIw6VOw3VkZuJVUc4GOY2JtTWSQxT+BErZsDiR3Ysy
	 Ihjyz3KmQIkvgVqediYJ+Gt/it4VnfJbYjEnEBll7e/MYerlSson6vQlOxjRyqK6Rp
	 HgW4RZCBBiBZt+0s8Ohz07N25pbkW+3IH86VHI5GIz8hGbo5PwHk98GgUxpD+RXMV0
	 WfUzzaamq20sQcdJCMhdIlTWzBY4+RgTDZXumILzEx9xLkc074S1NhmvyQ7MWZLnxE
	 l5YeLi9K/RS1+HdlQH3r+masC7w4sin/6qEZEkdPcgiX9qWI/hvBNZLjg+OByC3hIT
	 8Y9J3LvTaBU7w==
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
Subject: [GIT PULL 4/6] i.MX ARM device tree change for 6.6
Date: Sun, 13 Aug 2023 21:33:52 +0800
Message-Id: <20230813133354.847010-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230813133354.847010-1-shawnguo@kernel.org>
References: <20230813133354.847010-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.6

for you to fetch changes up to db92a8d917c7d959584cc15f838a134c1b115915:

  ARM: dts: imx6qdl: mba6: Fix gpio-keys button node names (2023-08-12 09:45:11 +0800)

----------------------------------------------------------------
i.MX ARM device tree change for 6.6:

- New device tree for TQ-Systems MBLS102xA board.
- A bunch of dtschema warning fixes from Fabio Estevam and
  Krzysztof Kozlowski.
- Add missing supply regulator for imx6qdl-mba6 and imx6qdl-tqma6x.
- Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties.
- Disable the internal i.MX6 watchdog and rely on PMIC reboot handler
  for phycore and pfla02 boards.
- Replace NO_PAD_CTL by explicit pad configuration for karo-tx25 board.

----------------------------------------------------------------
Alexander Stein (8):
      ARM: dts: imx6qdl-mba6: Add missing supply regulator for lm75 and at24
      ARM: dts: imx6qdl-tqma6x: Add missing vs-supply for lm75
      ARM: dts: nxp/imx: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
      ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
      ARM: dts: ls1021a: add TQMLS1021A flash partition layout
      ARM: dts: imx6ul: mba6ulx: Fix stmpe811 node warnings
      ARM: dts: imx6ul: Fix nand-controller #size-cells
      ARM: dts: imx6qdl: mba6: Fix gpio-keys button node names

Andrej Picej (2):
      ARM: dts: imx6: pfla02: Rely on PMIC reboot/reset handler
      ARM: dts: imx6: phycore: Rely on PMIC reboot/reset handler

Fabio Estevam (13):
      ARM: dts: imx: Remove regulators from simple-bus
      ARM: dts: imx7d-sdb: Pass the Ethernet aliases
      ARM: dts: imx6sx: Describe the default LCDIF1 parent
      ARM: dts: imx53-qsb: Improve the parallel display description
      ARM: dts: imx6ul-geam: Remove invalid sgtl5000 property
      ARM: dts: imx: Pass #sound-dai-cells to sgtl5000
      ARM: dts: imx: Remove 'compatible' from the pfuze nodes
      ARM: dts: imx6q-cm-fx6: Remove invalid SPI flash entry
      ARM: dts: imx50-evk: Use generic node name for SPI NOR flash
      ARM: dts: imx53-smd: Remove invalid SPI flash entry
      ARM: dts: vfxxx: Pass 'mmc' as the esdhc node names
      ARM: dts: imx6q-prti6q: Fix the SDIO wifi node
      ARM: dts: imx6dl-b1x5pv2: Fix simple-audio routing property

Krzysztof Kozlowski (11):
      ARM: dts: nxp: add missing space before {
      ARM: dts: imx1-apf9328: correct ethernet reg addresses (split)
      ARM: dts: imx6sx-nitrogen6sx: drop incorrect regulator clock-names
      ARM: dts: imx6ull-colibri: drop incorrect regulator regulator-type
      ARM: dts: imx28-m28evk: populate fixed regulators
      ARM: dts: imx50-kobo-aura: switch to enable-gpios
      ARM: dts: imx23: drop incorrect reg in fixed regulators
      ARM: dts: imx25: drop incorrect reg in fixed regulators
      ARM: dts: imx27: drop incorrect reg in fixed regulators
      ARM: dts: imx28: drop incorrect reg in fixed regulators
      ARM: dts: nxp: mxs: split interrupts per cells

Uwe Kleine-König (1):
      ARM: dts: imx25/karo-tx25: Replace NO_PAD_CTL by explicit pad configuration

 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |   6 +-
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |  25 +-
 arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts      |  71 ++--
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            |  62 ++--
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts       |  19 +-
 .../nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts   |  25 +-
 .../dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts     |  19 +-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  |  21 +-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi |  30 +-
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx50-evk.dts            |   2 +-
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx50.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        |  25 +-
 .../nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts   |  23 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-ard.dts            |  19 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi           |  34 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts         |  34 +-
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts          |  33 +-
 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  65 ++--
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |   4 +-
 arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi        |  19 +-
 .../arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi |  36 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts     |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-arm2.dts           |  36 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts      |   2 -
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts         |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    |  55 ++-
 arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts       |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts          |  19 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts       |  67 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts           |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts      |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts         |   5 +-
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts        |   1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi     |   1 +
 .../boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi    |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |   2 +-
 .../boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi    |  30 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi      |   1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi      |   1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi      |  85 ++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi       |   2 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi       |   2 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |  79 ++--
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    | 132 +++----
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |   1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  | 121 +++---
 .../boot/dts/nxp/imx/imx6qdl-phytec-pbab01.dtsi    |  26 +-
 .../boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |  50 +--
 .../dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |   8 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi         |  58 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   | 147 ++++----
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      |   1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      |   1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi      |   1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi        |  36 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   |   1 +
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |   4 +-
 .../boot/dts/nxp/imx/imx6ul-ccimx6ulsbcexpress.dts |   2 +-
 .../arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsom.dtsi  |   1 -
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |   1 -
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-dwarf.dts    |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts   |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts       |   1 +
 .../boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dts    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     |   1 -
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts     |   1 +
 arch/arm/boot/dts/nxp/imx/imx7d-pico-nymph.dts     |   1 +
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi          |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |   5 +
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |   3 +-
 arch/arm/boot/dts/nxp/ls/Makefile                  |   1 +
 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts           |  10 +-
 .../dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts    | 405 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   | 107 ++++++
 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts      |  23 +-
 arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts  |  19 +-
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi               |  21 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts       |  34 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts       |  23 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts       |  23 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts       |  23 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts       |  23 +-
 .../boot/dts/nxp/mxs/imx28-eukrea-mbmx283lc.dts    |   2 +-
 .../boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi    |  82 ++---
 arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi           |  19 +-
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts         |  66 ++--
 arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts         |  45 +--
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts           |  19 +-
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi               |  24 +-
 arch/arm/boot/dts/nxp/vf/vf610-twr.dts             |  31 +-
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                |   4 +-
 106 files changed, 1435 insertions(+), 1191 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
