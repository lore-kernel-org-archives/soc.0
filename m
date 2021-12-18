Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E581BC433F5
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 07:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D05A6C36AE8; Sat, 18 Dec 2021 07:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA52C36AEB;
	Sat, 18 Dec 2021 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639811709;
	bh=OA4QyRmgEbhSmDFLjrYwjnuOKKoFSq3IEAwL4KnMCTk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d8fzPXs4c4kecCq3zDoRg0jxQalT0VLuCstl6ZoTkvIRJSJ3xa+qU/yeoowbYsN2l
	 Qe530qmcesryUv1vBBnfZ5i6jObNQiB3EvRKk5aWdBkUj/p6KerE4ceS7Y2zK9CKSE
	 OGGRnmuk1NJ69erengauYbURYsLDgmZk5AuhDSmbP/ys0GgdfVqQpkdtiCZ5+V5kNk
	 vJZzdOpc+nuAncqsFl/H5Kwlx6ELsk9BVxBqOYxLhRJDDrd6As7xyUeX7CxQUIOYn2
	 XruadHoO7SwipQjVxYJ+rD+wr7sRTJbDvPUGNfFWPX5mgT03BBHfWhRxOq2QXBW9Yp
	 yrLdL0Jxf1xlQ==
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
Subject: [GIT PULL 5/6] i.MX arm64 device tree change for 5.17
Date: Sat, 18 Dec 2021 15:14:26 +0800
Message-Id: <20211218071427.26745-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211218071427.26745-1-shawnguo@kernel.org>
References: <20211218071427.26745-1-shawnguo@kernel.org>

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.17

for you to fetch changes up to 0bc3e333a0c82ee8691bcfdf441644ce02bd8be0:

  arm64: dts: imx8mp-evk: configure multiple queues on eqos (2021-12-16 18:14:25 +0800)

----------------------------------------------------------------
i.MX arm64 device tree change for 5.17:

- New SoC support: i.MX8 ULP.
- New board support: i.MX8MM/MN based TQMa8Mx boards, iMX8MN BSH SMM S2,
  i.MX8 ULP EVK.
- A series from Adam Ford to enable Camera and USB support for
  imx8mm-beacon device.
- Add overlays for various serdes protocols on LS1028A QDS board using
  different PHY cards.
- A series from Biwen Li to update LS1028A devices around RTC, flextimer
  and PWM support.
- A series from Joakim Zhang to update ENET/FEC suppport on i.MX8M
  devices.
- A couple of changes from Lucas Stach to update nitrogen8-som Ethernet
  PHY and I2C1 pad configuration.
- A series from Martin Kepplinger to split out a shared imx8mq-librem5-r3
  dtsi for Librem5 devices.
- Add cache descriptions for i.MX8 SoCs.
- A series from Vladimir Oltean to update ls1028a-rdb device tree in
  order to share the DTS between Linux and U-Boot.
- Random device addtion to various i.MX8 and LX2160A based devices.

----------------------------------------------------------------
Adam Ford (4):
      arm64: dts: imx8mm-beacon: Enable USB Controllers
      arm64: dts: imx8mm: Add CSI nodes
      arm64: dts: imx8mm-beacon: Enable OV5640 Camera
      arm64: dts: imx8mq-evk: link regulator to VPU domain

Alex Marginean (1):
      arm64: dts: ls1028a-qds: add overlays for various serdes protocols

Alexander Stein (3):
      arm64: dts: freescale: add initial device tree for TQMa8MQML with i.MX8MM
      arm64: dts: freescale: add initial device tree for TQMa8MQNL with i.MX8MN
      arm64: dts: freescale: add initial device tree for TQMa8Mx with i.MX8M

Ariel D'Alessandro (1):
      arm64: dts: imx8mn-bsh-smm-s2/pro: Add iMX8MN BSH SMM S2 boards

Arnaud Ferraris (1):
      arm64: dts: freescale: add 'chassis-type' property

Biwen Li (5):
      arm64: dts: lx2162a-qds: add interrupt line for RTC node
      arm64: dts: ls1028a: add ftm_alarm1 node to be used as wakeup source
      arm64: dts: ls1028a: add flextimer based pwm nodes
      arm64: dts: ls1028a-rdb: enable pwm0
      arm64: dts: ls1028a-qds: move rtc node to the correct i2c bus

David Heidelberg (1):
      arm64: dts: imx8mq: fix the schema check errors for fsl,tmu-calibration

Fabio Estevam (1):
      arm64: dts: imx8mm/n: Remove the 'pm-ignore-notify' property

Geert Uytterhoeven (1):
      arm64: dts: imx: imx8mn-beacon: Drop undocumented clock-names reference

Ioana Radulescu (1):
      arm64: dts: lx2160a-rdb: Add Inphi PHY node

Jacky Bai (2):
      arm64: dts: imx8ulp: Add the basic dtsi file for imx8ulp
      arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board

Joakim Zhang (7):
      arm64: dts: imx8mn-evk: add hardware reset for FEC PHY
      arm64: dts: imx8mp-evk: add hardware reset for EQOS PHY
      arm64: dts: imx8m: disable smart eee for FEC PHY
      arm64: dts: imx8m: configure FEC PHY VDDIO voltage
      arm64: dts: imx8mp-evk: disable CLKOUT clock for ENET PHY
      arm64: dts: imx8m: remove unused "nvmem_macaddr_swap" property for FEC
      arm64: dts: imx8mp: add mac address for EQOS

Kuldeep Singh (1):
      arm64: dts: lx2162a: Add CAN nodes for LX2162A-QDS

Li Yang (2):
      arm64: dts: ls1088a: Add reboot nodes
      arm64: dts: ls1088a: add snps incr burst type adjustment for usb1

Lucas Stach (3):
      arm64: dts: nitrogen8-som: correct network PHY reset
      arm64: dts: nitrogen8-som: correct i2c1 pad-ctrl
      arm64: dts: imx8mm: don't assign PLL2 in SoC dtsi

Martin Kepplinger (4):
      arm64: dts: split out a shared imx8mq-librem5-r3.dtsi description
      arm64: dts: imx8mq-librem5: describe power supply for cameras
      arm64: dts: imx8mq-librem5: describe the selfie cam
      arm64: dts: imx8mq-librem5-r3.dtsi: describe selfie cam XSHUTDOWN pin

Meng Li (1):
      arm64: dts: fsl-ls1043a-rdb: add delay between CS and CLK signal for flash device

Pankaj Bansal (1):
      arm64: dts: lx2160a-qds: Add mdio mux nodes

Pankaj Gupta (1):
      arm64: dts: lx2160a: add optee-tz node

Peng Fan (6):
      arm64: dts: imx8m: add cache info
      arm64: dts: imx8qm: add cache info
      arm64: dts: imx8qxp: add cache info
      dt-bindings: power: imx8ulp: add power domain header file
      arm64: dts: imx8ulp: add scmi firmware node
      arm64: dts: imx8ulp: add power domain entry for usdhc

Ran Wang (1):
      arm64: dts: lx2160a: enable usb3-lpm-capable for usb3 nodes

Vabhav Sharma (1):
      arm64: dts: ls1028a-qds: enable lpuart1

Vladimir Oltean (4):
      arm64: dts: ls1028a-rdb: sort nodes alphabetically by label
      arm64: dts: ls1028a-rdb: add an alias for the FlexSPI controller
      arm64: dts: ls1028a-rdb: add aliases for the Ethernet ports
      arm64: dts: ls1028a-rdb: update copyright

Xiaoliang Yang (1):
      arm64: dts: imx8mp-evk: configure multiple queues on eqos

Xiaowei Bao (1):
      arm64: dts: ls1028a: Add PCIe EP nodes

Yangbo Lu (1):
      arm64: dts: lx2162a-qds: support SD UHS-I and eMMC HS400 modes

 arch/arm64/boot/dts/freescale/Makefile             |  22 +
 .../boot/dts/freescale/fsl-ls1028a-qds-13bb.dts    | 113 +++
 .../boot/dts/freescale/fsl-ls1028a-qds-65bb.dts    | 108 +++
 .../boot/dts/freescale/fsl-ls1028a-qds-7777.dts    |  82 ++
 .../boot/dts/freescale/fsl-ls1028a-qds-85bb.dts    | 107 +++
 .../boot/dts/freescale/fsl-ls1028a-qds-899b.dts    |  75 ++
 .../boot/dts/freescale/fsl-ls1028a-qds-9999.dts    |  79 ++
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |  39 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  | 103 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     | 130 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts  |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  13 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  | 149 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |  21 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  10 +
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |  21 +
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |  93 ++
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   1 -
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   7 +
 .../dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts   |   1 -
 .../dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts  |   1 -
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts | 253 ++++++
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 335 +++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  86 +-
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     |   1 -
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   1 -
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    | 426 +++++++++
 .../arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts |  48 +
 .../boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts    |  80 ++
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |   9 +
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts | 237 +++++
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 322 +++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  29 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  73 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  35 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   9 +
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  25 +-
 .../boot/dts/freescale/imx8mq-librem5-r3.dtsi      |  45 +
 .../arm64/boot/dts/freescale/imx8mq-librem5-r4.dts |  16 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |  97 +-
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      |   1 +
 .../boot/dts/freescale/imx8mq-nitrogen-som.dtsi    |  15 +-
 .../boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts   | 349 ++++++++
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  | 360 ++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          | 115 ++-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  38 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |  28 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  64 ++
 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h    | 978 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 434 +++++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          | 282 ++++++
 include/dt-bindings/power/imx8ulp-power.h          |  26 +
 52 files changed, 5840 insertions(+), 154 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-9999.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
 create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/mba8mx.dtsi
 create mode 100644 include/dt-bindings/power/imx8ulp-power.h
