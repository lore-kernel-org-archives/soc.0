Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461C8C54EE9
	for <soc@archiver.kernel.org>; Sun, 18 Sep 2022 09:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C9B3C433D6; Sun, 18 Sep 2022 09:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C82C4347C;
	Sun, 18 Sep 2022 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663493316;
	bh=Jxrfd/Jqty6dZDZs1yKpvqW+4/AF/hlo4HJxp5DVvuY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NtTBWHyKGtMLOg8EeQa129vrxrNNLou/ncRSNADGVTSZZE6QQ85j63hZnkOeyHeO3
	 3niI0QH/mWxtlZ7d2kj8/bq718OubsMG3SNqLiY8wXTgTYx4iRo33HvcJIE+T3Vxhk
	 5VaVsz4ZMhBR183HxCVjQeKNoP8AaCnCE1kYq4gpp3D8YPhQdN7MTeOu1QRWamJeA9
	 13WjrGDSXWSw+gJY+xiMi3FoDmB6QPBcWNez4RopNYDX2gbrrl2YFVML2iaCFge7rE
	 3Lf10s9YfIsoj8eXbWaaFehb3AMASa/2kIKXYxHlqQ/HNyUuQp8gEHaVzBo2fL69bE
	 /d86LMxDpZmmw==
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
Subject: [GIT PULL 3/4] i.MX device tree change for 6.1
Date: Sun, 18 Sep 2022 17:28:05 +0800
Message-Id: <20220918092806.2152700-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220918092806.2152700-1-shawnguo@kernel.org>
References: <20220918092806.2152700-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.1

for you to fetch changes up to b7fd68ac27200b917ce4494c591858194e584634:

  ARM: dts: imx6qdl-gw54xx: add CAN regulator (2022-09-17 12:21:38 +0800)

----------------------------------------------------------------
i.MX device tree change for 6.1

- A series from Alexander Stein to add missing properties for i.MX6 SRAM.
- Drop 'interrupts' property when 'interrupts-extended' is present. This
  fixes a dtbs_check warning with i.MX6 DT.
- Update device trees to use generic name 'dma-controller' for SDMA.
- A set of changes from Krzysztof Kozlowski to align SPI, LED and
  gpio-keys node name with dtschema.
- A series of indentation and white-space cleanups from Marcel Ziswiler
  to address various checkpatch warnings.
- Add DDR pinmux defines to VF610 DT header.
- A couple of changes from Peng Fan to update clock-names and add IPG
  clock for i.MX7ULP LPI2C devices.
- Improve device tree structure for Kontron i.MX6UL/ULL based boards.
- A series of changes from Tim Harvey to add CAN regulator for Gateworks
  i.MX6QDL boards.
- Various small and random board specific updates.

----------------------------------------------------------------
Alexander Stein (8):
      ARM: dts: imx6: delete interrupts property if interrupts-extended is set
      ARM: dts: imx6q-mccmon6: Add fsl,err006687-workaround-present property
      ARM: dts: imx6q: add missing properties for sram
      ARM: dts: imx6dl: add missing properties for sram
      ARM: dts: imx6qp: add missing properties for sram
      ARM: dts: imx6sl: add missing properties for sram
      ARM: dts: imx6sll: add missing properties for sram
      ARM: dts: imx6sx: add missing properties for sram

Christoph Niedermaier (1):
      ARM: dts: imx6qdl-dhcom: Move IPU iomux node from PDK2 to SoM file

David Jander (1):
      ARM: dts: imx6qdl-vicut1.dtsi: Add backlight-isb node

Frieder Schrempf (2):
      ARM: dts: imx6ul-kontron: Simplify devicetree structure
      ARM: dts: imx6ul-kontron: Add imx6ull-kontron-bl to Makefile

Haibo Chen (1):
      ARM: dts: imx7d-sdb: config the max pressure for tsc2046

Joy Zou (1):
      ARM: dts: imx: update sdma node name format

Krzysztof Kozlowski (4):
      ARM: dts: imx: align SPI node name with dtschema
      ARM: dts: imx: align LED node names with dtschema
      ARM: dts: imx: align gpio-keys node names with dtschema
      ARM: dts: vf610: align SPI node name with dtschema

Kuldeep Singh (1):
      ARM: dts: ls1021a: Use generic node name for DMA

Lucas Stach (1):
      ARM: dts: imx6qdl-kontron-samx6i: hook up DDC i2c bus

Marcel Ziswiler (11):
      ARM: dts: imx6-sabrelite: change to use SPDX identifiers
      ARM: dts: imx6qdl-mba6: don't use multiple blank lines
      ARM: dts: imx6qdl: phytec: no spaces at start of line, indent use tabs
      ARM: dts: imx6qdl-sabre: change to use SPDX identifiers
      ARM: dts: imx7d-pico: indent use tabs, no spaces at start of line
      ARM: dts: vf610: no spaces in indent but tabs
      ARM: dts: vf610-twr: indent use tabs, no spaces at start of line
      ARM: dts: vf610: don't use multiple blank lines
      ARM: dts: vf610: ddr pinmux
      ARM: dts: imx6sl: use tabs for code indent
      ARM: dts: imx6sx-udoo-neo: don't use multiple blank lines

Marco Felsch (1):
      ARM: dts: imx6qdl-kontron-samx6i: move phy reset into phy-node

Michal Vokáč (1):
      ARM: dts: imx6dl-yapp4: Bind the backlight controller to the LCD panel

Oleksij Rempel (1):
      ARM: dts: imx6: skov: migrate to resistive-adc-touch

Peng Fan (2):
      ARM: dts: imx7ulp: update the LPI2C clock-names
      ARM: dts: imx7ulp: Add IPG clock for lpi2c

Philipp Zabel (1):
      ARM: dts: imx6qdl-tqma6x: add fixed power supplies

Tim Harvey (3):
      ARM: dts: imx6qdl-gw52xx: add CAN regulator
      ARM: dts: imx6qdl-gw53xx: add CAN regulator
      ARM: dts: imx6qdl-gw54xx: add CAN regulator

 arch/arm/boot/dts/Makefile                         |  5 +-
 arch/arm/boot/dts/imx23-xfi3.dts                   |  6 +-
 .../boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts  |  4 +-
 arch/arm/boot/dts/imx25.dtsi                       |  2 +-
 arch/arm/boot/dts/imx28-cfa10049.dts               |  8 +--
 arch/arm/boot/dts/imx28-cfa10055.dts               |  2 +-
 arch/arm/boot/dts/imx28-cfa10056.dts               |  2 +-
 arch/arm/boot/dts/imx28-duckbill-2-enocean.dts     |  2 +-
 arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi       |  8 +--
 arch/arm/boot/dts/imx28-tx28.dts                   |  2 +-
 arch/arm/boot/dts/imx31.dtsi                       |  2 +-
 .../boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts  |  4 +-
 arch/arm/boot/dts/imx35.dtsi                       |  2 +-
 arch/arm/boot/dts/imx50-kobo-aura.dts              |  6 +-
 arch/arm/boot/dts/imx50.dtsi                       |  2 +-
 arch/arm/boot/dts/imx51-apf51dev.dts               |  2 +-
 arch/arm/boot/dts/imx51-babbage.dts                |  2 +-
 arch/arm/boot/dts/imx51-zii-rdu1.dts               |  2 +-
 arch/arm/boot/dts/imx51.dtsi                       |  2 +-
 arch/arm/boot/dts/imx53-ard.dts                    | 10 ++--
 arch/arm/boot/dts/imx53-qsb-common.dtsi            |  8 +--
 arch/arm/boot/dts/imx53-smd.dts                    |  4 +-
 arch/arm/boot/dts/imx53-tx53.dtsi                  |  2 +-
 arch/arm/boot/dts/imx53.dtsi                       |  2 +-
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi      |  8 +--
 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi              |  2 +-
 arch/arm/boot/dts/imx6dl-prtmvt.dts                | 32 +++++------
 arch/arm/boot/dts/imx6dl-prtvt7.dts                | 30 +++++-----
 arch/arm/boot/dts/imx6dl-riotboard.dts             |  1 +
 arch/arm/boot/dts/imx6dl-victgo.dts                |  4 +-
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         |  1 +
 arch/arm/boot/dts/imx6dl.dtsi                      |  3 +
 arch/arm/boot/dts/imx6q-arm2.dts                   |  1 +
 arch/arm/boot/dts/imx6q-evi.dts                    |  1 +
 arch/arm/boot/dts/imx6q-mccmon6.dts                |  2 +
 arch/arm/boot/dts/imx6q-novena.dts                 |  4 +-
 arch/arm/boot/dts/imx6q-pistachio.dts              |  2 +-
 arch/arm/boot/dts/imx6q-sabrelite.dts              | 37 +-----------
 arch/arm/boot/dts/imx6q-utilite-pro.dts            |  2 +-
 arch/arm/boot/dts/imx6q-var-dt6customboard.dts     |  6 +-
 arch/arm/boot/dts/imx6q.dtsi                       |  3 +
 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi          | 33 -----------
 arch/arm/boot/dts/imx6qdl-dhcom-som.dtsi           | 33 +++++++++++
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              | 18 +++++-
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi              | 18 +++++-
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi              | 18 +++++-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi      | 20 ++++++-
 arch/arm/boot/dts/imx6qdl-mba6.dtsi                |  1 -
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi           |  1 +
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi       |  1 +
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi      |  1 +
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi          |  1 +
 .../boot/dts/imx6qdl-phytec-mira-peb-av-02.dtsi    |  2 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |  1 +
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi           | 37 +-----------
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi       | 65 +++++++++++++++-------
 arch/arm/boot/dts/imx6qdl-tqma6a.dtsi              |  2 +
 arch/arm/boot/dts/imx6qdl-tqma6b.dtsi              |  1 +
 arch/arm/boot/dts/imx6qdl-ts7970.dtsi              |  1 +
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi              | 22 ++++++++
 arch/arm/boot/dts/imx6qdl.dtsi                     |  2 +-
 arch/arm/boot/dts/imx6qp.dtsi                      |  6 ++
 arch/arm/boot/dts/imx6sl.dtsi                      | 25 +++++----
 arch/arm/boot/dts/imx6sll.dtsi                     |  3 +
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi             | 14 ++---
 arch/arm/boot/dts/imx6sx.dtsi                      |  8 ++-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            |  2 +-
 ...ron-n6310-s-43.dts => imx6ul-kontron-bl-43.dts} |  8 +--
 ...-n6x1x-s.dtsi => imx6ul-kontron-bl-common.dtsi} |  0
 ...l-kontron-n6310-s.dts => imx6ul-kontron-bl.dts} |  9 ++-
 arch/arm/boot/dts/imx6ul-kontron-n6310-som.dtsi    | 41 --------------
 arch/arm/boot/dts/imx6ul-kontron-n6311-s.dts       | 16 ------
 arch/arm/boot/dts/imx6ul-kontron-n6311-som.dtsi    | 40 -------------
 ...m-common.dtsi => imx6ul-kontron-sl-common.dtsi} | 15 +++++
 arch/arm/boot/dts/imx6ul-kontron-sl.dtsi           | 14 +++++
 arch/arm/boot/dts/imx6ul-tx6ul.dtsi                |  2 +-
 arch/arm/boot/dts/imx6ul.dtsi                      |  2 +-
 arch/arm/boot/dts/imx6ull-kontron-bl.dts           | 15 +++++
 arch/arm/boot/dts/imx6ull-kontron-n6411-s.dts      | 16 ------
 arch/arm/boot/dts/imx6ull-kontron-n6411-som.dtsi   | 40 -------------
 arch/arm/boot/dts/imx6ull-kontron-sl.dtsi          | 13 +++++
 arch/arm/boot/dts/imx7d-pico.dtsi                  | 10 ++--
 arch/arm/boot/dts/imx7d-sdb.dts                    | 13 ++---
 arch/arm/boot/dts/imx7d-zii-rmu2.dts               |  2 +-
 arch/arm/boot/dts/imx7d-zii-rpu2.dts               |  2 +-
 arch/arm/boot/dts/imx7s.dtsi                       |  2 +-
 arch/arm/boot/dts/imx7ulp.dtsi                     | 10 ++--
 arch/arm/boot/dts/ls1021a.dtsi                     |  2 +-
 arch/arm/boot/dts/vf610-bk4.dts                    |  2 +-
 arch/arm/boot/dts/vf610-pinfunc.h                  | 52 ++++++++++++++++-
 arch/arm/boot/dts/vf610-twr.dts                    |  2 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts          |  2 +-
 arch/arm/boot/dts/vf610.dtsi                       |  1 -
 93 files changed, 462 insertions(+), 435 deletions(-)
 rename arch/arm/boot/dts/{imx6ul-kontron-n6310-s-43.dts => imx6ul-kontron-bl-43.dts} (93%)
 rename arch/arm/boot/dts/{imx6ul-kontron-n6x1x-s.dtsi => imx6ul-kontron-bl-common.dtsi} (100%)
 rename arch/arm/boot/dts/{imx6ul-kontron-n6310-s.dts => imx6ul-kontron-bl.dts} (52%)
 delete mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6310-som.dtsi
 delete mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6311-s.dts
 delete mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6311-som.dtsi
 rename arch/arm/boot/dts/{imx6ul-kontron-n6x1x-som-common.dtsi => imx6ul-kontron-sl-common.dtsi} (90%)
 create mode 100644 arch/arm/boot/dts/imx6ul-kontron-sl.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-kontron-bl.dts
 delete mode 100644 arch/arm/boot/dts/imx6ull-kontron-n6411-s.dts
 delete mode 100644 arch/arm/boot/dts/imx6ull-kontron-n6411-som.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-kontron-sl.dtsi
