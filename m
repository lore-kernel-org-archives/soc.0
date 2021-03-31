Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEA0C433C1
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 04:10:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 50A42619E3; Wed, 31 Mar 2021 04:10:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E498619E8;
	Wed, 31 Mar 2021 04:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617163845;
	bh=Sr65hYmDkG/dqoKauy259KiYePrdUVJQ/dgmQ8j7nYk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XFcXQCM0aCnnXQfQlknfAI9XkI+dcyqSOKWY8P4Qt7JJyoro0LYIyeoOmu84bJCti
	 /z1b6HI4HrNypRPAkfyoo6BMfAZko8g8eLP4EaT7hDxuNtYqtqkXpERZM7+SfrnHbU
	 eO/7wI0MNHpcdV3TqrePkNMVtrJ4B2ktDuCVO5eAl/n/lylhVWJBFO8Ists8z9wNc2
	 BovoaEzaiMKTYPpbVH7c3U8KOcFJKUPWUjZ82NCfZ+s1hW1eZwZUTIB3PBZ4L1Dz/s
	 +dPifgeTG8ilDCOW9o6zDjMbpzfcxSl2Q+f/BV0F4V2MffxxTp8hh3Y0PFXw9XP7ju
	 TAso8kSGOAhLA==
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
Subject: [GIT PULL 4/6] i.MX device tree change for 5.13
Date: Wed, 31 Mar 2021 12:10:17 +0800
Message-Id: <20210331041019.31345-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.13

for you to fetch changes up to 45b78dd39f04f6198f8e2e9fe9d155a5e8326aab:

  ARM: dts: imx6: pbab01: Set USB OTG port to peripheral (2021-03-30 16:33:16 +0800)

----------------------------------------------------------------
i.MX device tree change for 5.13:

- New board support: i.MX7D based reMarkable2.
- Clean up imx6ql-pfla02 hog group by moving pins into corresponded
  client groups.
- Add Netronix embedded controller for imx50-kobo-aura.
- A series from Sebastian Reichel to improve GE Bx50v3 device trees.
- Support I2C bus recovery for imx6qdl-wandboard by adding SCL/SDA
  GPIOs.
- Remove unnecessary #address-cells/#size-cells from imx6qdl-gw boards.
- Various small and random device tree update.

----------------------------------------------------------------
Alexander Shiyan (3):
      ARM: dts: imx6qdl-ts7970: Drop redundant "fsl,mode" option
      ARM: dts: imx6qdl-phytec-pbab01: Select synchronous mode for AUDMUX
      ARM: dts: imx6ql-pfla02: Move "hog" pins into corresponded pin groups

Alistair Francis (1):
      ARM: imx7d-remarkable2: Initial device tree for reMarkable2

Andreas Kemnade (1):
      ARM: dts: imx6sl-tolino-shine2hd: Add Netronix embedded controller

Dima Azarkin (1):
      ARM: dts: imx6qdl-wandboard: add scl/sda gpios definitions for i2c bus recovery

Fabio Estevam (3):
      ARM: dts: imx53-qsb: Describe the esdhc1 card detect pin
      ARM: dts: imx6dl-plybas: Fix gpio-keys W=1 warnings
      ARM: dts: imx7d-mba7: Remove unsupported PCI properties

Horia Geantă (1):
      ARM: dts: ls1021a: mark crypto engine dma coherent

Ian Ray (1):
      ARM: dts: imx: bx50v3: Define GPIO line names

Jonathan Neuschäfer (1):
      ARM: dts: imx50-kobo-aura: Add Netronix embedded controller

Philippe Schenker (1):
      ARM: dts: colibri-imx6ull: Change drive strength for usdhc2

Sebastian Reichel (4):
      ARM: dts: imx: Mark IIM as syscon on i.MX51/i.MX53
      ARM: dts: imx6q-ba16: add USB OTG VBUS enable GPIO
      ARM: dts: imx6q-ba16: improve PHY information
      ARM: dts: imx: bx50v3: i2c GPIOs are open drain

Serge Semin (1):
      ARM: dts: ls1021a: Harmonize DWC USB3 DT nodes name

Stefan Riedmueller (2):
      ARM: dts: imx6: pfla02: Fix USB vbus enable pinmuxing
      ARM: dts: imx6: pbab01: Set USB OTG port to peripheral

Tim Harvey (1):
      ARM: dts: imx6qdl-gw*: Remove unnecessary #address-cells/#size-cells

 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/imx50-kobo-aura.dts        |  16 ++-
 arch/arm/boot/dts/imx51.dtsi                 |   2 +-
 arch/arm/boot/dts/imx53-qsb-common.dtsi      |   2 +
 arch/arm/boot/dts/imx53.dtsi                 |   2 +-
 arch/arm/boot/dts/imx6dl-plybas.dts          |   6 +-
 arch/arm/boot/dts/imx6q-b450v3.dts           |   5 +
 arch/arm/boot/dts/imx6q-b650v3.dts           |   5 +
 arch/arm/boot/dts/imx6q-b850v3.dts           |   5 +
 arch/arm/boot/dts/imx6q-ba16.dtsi            |  21 ++++
 arch/arm/boot/dts/imx6q-bx50v3.dtsi          |  12 +--
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw551x.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw552x.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw560x.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw5903.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw5907.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw5910.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw5912.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-gw5913.dtsi        |   2 -
 arch/arm/boot/dts/imx6qdl-phytec-pbab01.dtsi |   6 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi |  38 +++----
 arch/arm/boot/dts/imx6qdl-ts7970.dtsi        |   1 -
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi     |  24 ++++-
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts |   7 +-
 arch/arm/boot/dts/imx6ull-colibri.dtsi       |  12 +--
 arch/arm/boot/dts/imx7d-mba7.dts             |   2 -
 arch/arm/boot/dts/imx7d-remarkable2.dts      | 146 +++++++++++++++++++++++++++
 arch/arm/boot/dts/ls1021a.dtsi               |   3 +-
 32 files changed, 270 insertions(+), 70 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx7d-remarkable2.dts
