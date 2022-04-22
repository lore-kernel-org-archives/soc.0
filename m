Return-Path: <SRS0=Z9GS=VA=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ED7C433FE
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 14:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF526C385A9; Fri, 22 Apr 2022 14:55:16 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1341C385A4
	for <soc@kernel.org>; Fri, 22 Apr 2022 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1341C385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4KlHWX4qD6z50LdB
	for <soc@kernel.org>; Fri, 22 Apr 2022 16:55:04 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
	by xavier.telenet-ops.be with bizsmtp
	id Mquw2700B2Ah9RF01quwKD; Fri, 22 Apr 2022 16:54:56 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nhugS-001cQ9-66; Fri, 22 Apr 2022 16:54:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nhugR-00COlH-Oe; Fri, 22 Apr 2022 16:54:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM DT updates for v5.19
Date: Fri, 22 Apr 2022 16:54:51 +0200
Message-Id: <cover.1650638505.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650638502.git.geert+renesas@glider.be>
References: <cover.1650638502.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.19-tag1

for you to fetch changes up to aa70cbda745d5d2085f2847b875d0da3173a9032:

  ARM: dts: r9a06g032: Drop "arm,cortex-a7-timer" from timer node (2022-04-19 10:27:36 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.19

  - ADC, SDHI, CAN-FD, I2C, QSPI, timer, watchdog, sound, USB, SPI, GPU,
    cpufreq, and thermal support for the RZ/V2L SoC, and the RZ/V2L
    SMARC EVK development board,
  - USB, I2C, Audio, NOR Flash, timer, SPI support for RZ/G2LC SMARC EVK
    development board,
  - Can-FD support for the R-Car M30W+ and V3U SoCs, and the Falcon
    development board,
  - I2C and GPIO support for the R-Car S4-8 SoC,
  - I2C EEPROM support for the Falcon development board,
  - SPI Multi I/O Bus Controller (RPC-IF) support for the R-Car H3,
    M3-W(+), M3-N, E3, and D3 SoCs,
  - RPC HyperFlash support for the Draak, Ebisu, Salvator-X(S), and ULCB
    development boards,
  - Initial support (UART, DMAC, pin control, SDHI, eMMC, Ethernet) for
    the RZ/G2UL SoC, and the RZ/G2UL SMARC EVK development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (20):
      arm64: dts: renesas: r9a07g044c2-smarc: Enable usb2.0
      arm64: dts: renesas: rzg2lc-smarc-pinfunction: Sort the nodes
      arm64: dts: renesas: rzg2l-smarc: Move out i2c3 and Audio codec from common dtsi
      arm64: dts: renesas: rzg2lc-smarc: Enable i2c{0,1,2}
      arm64: dts: renesas: rzg2lc-smarc: Enable Audio
      arm64: dts: renesas: rzg2lc-smarc-som: Enable serial NOR flash
      arm64: dts: renesas: rzg2lc-smarc-som: Enable OSTM
      arm64: dts: renesas: rzg2lc-smarc-som: Add vdd core regulator
      dt-bindings: clock: Add R9A07G043 CPG Clock and Reset Definitions
      arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on carrier board
      arm64: dts: renesas: rzg2l-smarc: Move gpios property of vccq_sdhi1 from common dtsi
      arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC
      arm64: dts: renesas: Add initial device tree for RZ/G2UL Type-1 SMARC EVK
      arm64: dts: renesas: r9a07g043: Fillup the pinctrl stub node
      arm64: dts: renesas: rzg2ul-smarc: Add scif0 and audio clk pins
      arm64: dts: renesas: r9a07g043: Add SDHI nodes
      arm64: dts: renesas: r9a07g043: Add GbEthernet nodes
      arm64: dts: renesas: rzg2ul-smarc: Enable microSD on SMARC platform
      arm64: dts: renesas: rzg2ul-smarc-som: Enable eMMC on SMARC platform
      arm64: dts: renesas: rzg2ul-smarc-som: Enable Ethernet on SMARC platform

Geert Uytterhoeven (11):
      arm64: dts: renesas: r8a779f0: Add I2C nodes
      arm64: dts: renesas: spider-cpu: Add I2C4 and EEPROMs
      arm64: dts: renesas: spider: Add Ethernet sub-board
      arm64: dts: renesas: rcar-gen3: Add RPC device nodes
      arm64: dts: renesas: draak: Add RPC HyperFlash device node
      arm64: dts: renesas: ebisu: Add RPC HyperFlash device node
      arm64: dts: renesas: salvator-common: Add RPC HyperFlash device node
      arm64: dts: renesas: ulcb: Add RPC HyperFlash device node
      Merge tag 'renesas-r9a07g043-dt-binding-defs-tag' into HEAD
      arm64: dts: renesas: r8a779f0: Add GPIO nodes
      ARM: dts: r9a06g032: Drop "arm,cortex-a7-timer" from timer node

Kieran Bingham (1):
      arm64: dts: renesas: falcon-cpu: Use INTC_EX for SN65DSI86

Koji Matsuoka (1):
      arm64: dts: renesas: r8a77961: Add CAN-FD node

Lad Prabhakar (16):
      arm64: dts: renesas: r9a07g054: Fillup the ADC stub node
      arm64: dts: renesas: r9a07g054: Fillup the SDHI{0,1} stub nodes
      arm64: dts: renesas: r9a07g054l2-smarc: Drop deleting gpio-hog pins related to SDHI
      arm64: dts: renesas: r9a07g054: Fillup the CANFD stub node
      arm64: dts: renesas: r9a07g054l2-smarc: Drop deleting can{0,1}-stb-hog nodes
      arm64: dts: renesas: r9a07g054: Fillup the I2C{0,1,2,3} stub nodes
      arm64: dts: renesas: r9a07g054: Fillup the sbc stub node
      arm64: dts: renesas: r9a07g054: Fillup the OSTM{0,1,2} stub nodes
      arm64: dts: renesas: r9a07g054: Fillup the WDT{0,1,2} stub nodes
      arm64: dts: renesas: r9a07g054: Add SSI{1,2,3} nodes and fillup the SSI0 stub node
      arm64: dts: renesas: r9a07g054: Add USB2.0 phy and host support
      arm64: dts: renesas: r9a07g054: Add USB2.0 device support
      arm64: dts: renesas: r9a07g054: Add SPI{0,2} nodes and fillup SPI1 stub node
      arm64: dts: renesas: r9a07g054: Fillup the GPU node
      arm64: dts: renesas: r9a07g054: Add OPP table
      arm64: dts: renesas: r9a07g054: Add TSU node

Ulrich Hecht (2):
      arm64: dts: renesas: r8a779a0: Add CANFD device node
      arm64: dts: renesas: falcon: Enable CANFD 0 and 1

Wolfram Sang (5):
      ARM: dts: rcar-gen2: Add interrupt properties to watchdog nodes
      ARM: dts: rzg1: Add interrupt properties to watchdog nodes
      arm64: dts: renesas: rcar-gen3: Add interrupt properties to watchdog nodes
      arm64: dts: renesas: rzg2: Add interrupt properties to watchdog nodes
      arm64: dts: renesas: rcar-gen4: Add interrupt properties to watchdog nodes

 arch/arm/boot/dts/r8a7743.dtsi                     |   1 +
 arch/arm/boot/dts/r8a7744.dtsi                     |   1 +
 arch/arm/boot/dts/r8a7745.dtsi                     |   1 +
 arch/arm/boot/dts/r8a77470.dtsi                    |   1 +
 arch/arm/boot/dts/r8a7790.dtsi                     |   1 +
 arch/arm/boot/dts/r8a7791.dtsi                     |   1 +
 arch/arm/boot/dts/r8a7792.dtsi                     |   1 +
 arch/arm/boot/dts/r8a7793.dtsi                     |   1 +
 arch/arm/boot/dts/r8a7794.dtsi                     |   1 +
 arch/arm/boot/dts/r9a06g032.dtsi                   |   3 +-
 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 arch/arm64/boot/dts/renesas/draak.dtsi             |  58 ++
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  58 ++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  42 ++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  17 +
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |  12 +-
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  24 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  57 ++
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  20 +
 .../boot/dts/renesas/r8a779f0-spider-ethernet.dtsi |  15 +
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts    |  10 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 163 ++++++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         | 481 +++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts |  97 ++++
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts  |  76 ---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         | 584 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  |   8 -
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   |  16 -
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  19 +
 .../boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  64 ++-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |  61 +++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  27 +
 .../boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  63 +++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  | 233 ++++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      |  24 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  49 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |  49 ++
 include/dt-bindings/clock/r9a07g043-cpg.h          | 184 +++++++
 47 files changed, 2457 insertions(+), 141 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
 create mode 100644 include/dt-bindings/clock/r9a07g043-cpg.h
