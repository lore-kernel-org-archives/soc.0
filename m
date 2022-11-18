Return-Path: <SRS0=KCga=3S=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9320FC43217
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 16:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B69FC43470; Fri, 18 Nov 2022 16:45:34 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75E07C433D7
	for <soc@kernel.org>; Fri, 18 Nov 2022 16:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75E07C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4NDN1v2lZRz4xJXT
	for <soc@kernel.org>; Fri, 18 Nov 2022 17:45:23 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
	by andre.telenet-ops.be with bizsmtp
	id lslD2800129fmst01slDAw; Fri, 18 Nov 2022 17:45:14 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-000pAA-Os; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UJ-00FrgO-U1; Fri, 18 Nov 2022 17:45:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/7] Renesas ARM DT updates for v6.2 (take two)
Date: Fri, 18 Nov 2022 17:44:59 +0100
Message-Id: <cover.1668788921.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b9a0be2054964026aa58966ce9724b672f210835:

  arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts (2022-10-28 14:23:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v6.2-tag2

for you to fetch changes up to 884af88b756ccb57ed7cb6241c1fbd1080732124:

  arm64: dts: renesas: spider-ethernet: Enable Ethernet Switch and SERDES (2022-11-18 17:08:01 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v6.2 (take two)

  - Timer (TMU and CMT) and quad Cortex-A76 CPU topology support for
    the R-Car V4H SoC,
  - Watchdog, L2 cache, and system controller support for the RZ/V2M
    SoC on the RZ/V2M Evaluation Kit 2.0,
  - Ethernet Switch and SERDES supports for the R-Car S4-8 SoC and the
    Spider development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a09g011: Add L2 Cache node
      arm64: dts: renesas: r9a09g011: Add system controller node

Fabrizio Castro (4):
      arm64: dts: renesas: r9a09g011: Fix unit address format error
      arm64: dts: renesas: r9a09g011: Fix I2C SoC specific strings
      arm64: dts: renesas: r9a09g011: Add watchdog node
      arm64: dts: renesas: rzv2mevk2: Enable watchdog

Geert Uytterhoeven (5):
      arm64: dts: renesas: r8a779g0: Add L3 cache controller
      arm64: dts: renesas: r8a779g0: Add secondary CA76 CPU cores
      arm64: dts: renesas: r8a779g0: Add CPUIdle support
      arm64: dts: renesas: r8a779g0: Add CPU core clocks
      arm64: dts: renesas: r8a779g0: Add CA76 operating points

Lad Prabhakar (1):
      arm64: dts: renesas: rzg2l: Drop #address-cells from pinctrl nodes

Pierre Gondois (1):
      arm64: dts: renesas: rzg2l: Add missing cache-level properties

Thanh Quan (1):
      arm64: dts: renesas: r8a779g0: Add CMT node

Wolfram Sang (5):
      arm64: dts: renesas: r8a779f0: Fix HSCIF "brg_int" clock
      arm64: dts: renesas: r8a779f0: Fix SCIF "brg_int" clock
      arm64: dts: renesas: r8a779g0: Add TMU nodes
      arm64: dts: renesas: white-hawk-cpu: Sort RWDT entry correctly
      arm64: dts: renesas: spider-cpu: Switch from SCIF3 to HSCIF0

Yoshihiro Shimoda (2):
      arm64: dts: renesas: r8a779f0: Add Ethernet Switch and SERDES nodes
      arm64: dts: renesas: spider-ethernet: Enable Ethernet Switch and SERDES

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  30 +--
 .../boot/dts/renesas/r8a779f0-spider-ethernet.dtsi |  90 +++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 126 +++++++++-
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |   8 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 265 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |   4 +
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  31 ++-
 10 files changed, 522 insertions(+), 37 deletions(-)
