Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EB4C433DB
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 12:02:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A54A564F53; Thu,  4 Feb 2021 12:02:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C405E64F42;
	Thu,  4 Feb 2021 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612440130;
	bh=RcGGIp9xfs8dsaZP1ukqwn4bIAVqGwF1a2ZA0v0PO74=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyZw+RdKqBxLFBdsmryPTgIj0kYSgovyR+phnQbmog38i3pGWcFsHe5Jkhcm3QNzt
	 fI8duguPmibuVXL+t5hdKDpreVGuHCn3xNlaTN+rpiTWN6gZV2qCO3lL9oRaU9Y8MB
	 qS3nbHISngvYjQPbbWTt4JbNVNgkZ6qrxPYCIkM6yp23F++ZCXNsupTKt6yUxAPJeF
	 6jkrHoXHLol4XjEmpgVu5O6ZHtNYAdm2yuUK9TWCbT4XqzdYmiDUde2a0FfslNZyU+
	 WOzFz5GStBdPfXmqGquhYDj7lZtItPgSuZ+V/3gFlZaFx4BEnSYI8n/rTTXBAZ3UXv
	 yzDNgewnzrfqA==
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
Subject: [GIT PULL 4/6] i.MX device tree change for 5.12
Date: Thu,  4 Feb 2021 20:01:48 +0800
Message-Id: <20210204120150.26186-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>

Hi,

Tag imx-fixes-5.11-2 is merged into the branch to resolve some
dependency around imx6-sr-som board support.

Shawn


The following changes since commit 82c082784e03a9a9c043345f9bc04bc8254cf6da:

  firmware: imx: select SOC_BUS to fix firmware build (2021-01-18 15:49:07 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.12

for you to fetch changes up to 498f8aee6ec000392d918ecbcbeb1b5ee3132006:

  ARM: dts: imx6: RDU2: adjust audio devices nomenclature (2021-01-30 21:52:31 +0800)

----------------------------------------------------------------
i.MX device tree change for 5.12:

- A series from Oleksij Rempel to add i.MX6 based Plymovent, Protonic
  and Kverneland boards.
- A series from Andreas Kemnade to improve UART support for ebook
  readers.
- A series from Fabio Estevam to update imx6ul-14x14-evk device tree for
  adding GPIO expander and camera support.
- A patch set from Lucas Stach to improve ZII RDU2 support, enabling
  WDOG, tuning I2C drive-strength, RMI4 and UCS1002 ALERT.
- Other small and random updates on various boards.

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: imx6q-logicpd: Drop unused clock-names reference

Andreas Kemnade (4):
      ARM: dts: imx6sl-tolino-shine2hd: correct console uart pinmux
      ARM: dts: imx6sl-tolino-shine2hd: add second uart
      ARM: dts: imx6sl-tolino-shine3: correct console uart pinmux
      ARM: dts: imx: e60k02: add second uart

Cory Tusar (1):
      ARM: dts: imx6: RDU2: adjust audio devices nomenclature

Fabio Estevam (4):
      ARM: dts: imx6ul-14x14-evk: Fix SPI chipselect polarity
      ARM: dts: imx6ul-14x14-evk: Enable the GPIO expander
      ARM: dts: imx6ul-14x14-evk: Describe the KSZ8081 reset
      ARM: dts: imx6ul-14x14-evk: Add camera support

Joakim Zhang (1):
      ARM: dts: imx6: add wakeup support via magic packet

Laurent Pinchart (1):
      ARM: dts: imx6q(dl): Move 'port' nodes under 'ports' for HDMI encoder

Lucas Stach (3):
      ARM: dts: imx6: RDU2: reduce i2c drive-strength
      ARM: dts: imx6: RDU2: enable RMI4 reduced reporting
      ARM: dts: imx6: RDU2: only trigger IRQ on falling edge ucs1002 ALERT pin

Mans Rullgard (1):
      ARM: dts: imx28: add pinmux for USB1 overcurrent on pwm2

Marek Vasut (1):
      ARM: dts: imx7: Mark timer with arm,cpu-registers-not-fw-configured

Oleksij Rempel (6):
      ARM: dts: add Plymovent M2M board
      ARM: dts: add Plymovent BAS board
      ARM: dts: add Protonic MVT board
      ARM: dts: add Protonic PRTI6G board
      ARM: dts: add Kverneland UT1, UT1Q and UT1P
      ARM: dts: add Kverneland TGO board

Philipp Zabel (1):
      ARM: dts: imx6: rdu2: enable WDOG1

Russell King (1):
      ARM: dts: imx6-sr-som: increase at8035 PHY gigabit Tw parameter

Shawn Guo (1):
      Merge tag 'imx-fixes-5.11-2' into imx/dt

 arch/arm/boot/dts/Makefile                    |   8 +
 arch/arm/boot/dts/e60k02.dtsi                 |   6 +
 arch/arm/boot/dts/imx28.dtsi                  |  10 +
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi |   1 -
 arch/arm/boot/dts/imx6dl-plybas.dts           | 394 ++++++++++++
 arch/arm/boot/dts/imx6dl-plym2m.dts           | 446 ++++++++++++++
 arch/arm/boot/dts/imx6dl-prtmvt.dts           | 852 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-victgo.dts           | 852 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-vicut1.dts           |  13 +
 arch/arm/boot/dts/imx6q-vicut1.dts            |  17 +
 arch/arm/boot/dts/imx6q.dtsi                  |  20 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi      |   1 +
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi         |   2 +
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi         | 803 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi       |  42 +-
 arch/arm/boot/dts/imx6qdl.dtsi                |  25 +-
 arch/arm/boot/dts/imx6qp-vicutp.dts           |  13 +
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts  |  18 +-
 arch/arm/boot/dts/imx6sl-tolino-shine3.dts    |  15 +-
 arch/arm/boot/dts/imx6sll-kobo-clarahd.dts    |  13 +-
 arch/arm/boot/dts/imx6sx-sdb.dtsi             |   2 +
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi       |  54 +-
 arch/arm/boot/dts/imx6ul-prti6g.dts           | 356 +++++++++++
 arch/arm/boot/dts/imx6ul.dtsi                 |   2 +
 arch/arm/boot/dts/imx7s.dtsi                  |   1 +
 25 files changed, 3917 insertions(+), 49 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-plybas.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-plym2m.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-prtmvt.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-victgo.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-vicut1.dts
 create mode 100644 arch/arm/boot/dts/imx6q-vicut1.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-vicut1.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qp-vicutp.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-prti6g.dts
