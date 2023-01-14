Return-Path: <SRS0=TcnV=5L=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F1C3DA78
	for <soc@archiver.kernel.org>; Sat, 14 Jan 2023 13:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6DD3C433F2; Sat, 14 Jan 2023 13:23:22 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02F50C43396
	for <soc@kernel.org>; Sat, 14 Jan 2023 13:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02F50C43396
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by andre.telenet-ops.be with bizsmtp
	id 8dP92900V4C55Sk01dP9ej; Sat, 14 Jan 2023 14:23:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGgV0-003z7H-0e;
	Sat, 14 Jan 2023 14:23:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGgV3-006HuS-OG;
	Sat, 14 Jan 2023 14:23:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DT updates for v6.3
Date: Sat, 14 Jan 2023 14:22:59 +0100
Message-Id: <cover.1673702293.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673702287.git.geert+renesas@glider.be>
References: <cover.1673702287.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.3-tag1

for you to fetch changes up to 2ef9e3ef3b8d9a59455a79f02ce9aff8544bd02d:

  arm64: dts: renesas: condor-i: add HS400 support for eMMC (2023-01-12 17:22:22 +0100)

----------------------------------------------------------------
Renesas DT updates for v6.3

  - Enable watchdog and timer (OSTM) support for the RZ/Five SMARC EVK
    development board,
  - Add operating points for the Cortex-A55 CPU cores on the R-Car S4-8
    SoC,
  - Add display support for the R-Car V4H SoC and the White-Hawk
    development board,
  - Add eMMC and SDHI support for the RZ/V2M SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Adam Ford (1):
      arm64: boot: dts: r8a774[a/b/e]1-beacon: Consolidate sound clocks

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g011: Add eMMC and SDHI support

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779f0: Add CA55 operating points
      arm64: dts: renesas: ulcb-kf: Fix pca9548 i2c-mux node names

Lad Prabhakar (2):
      riscv: dts: renesas: rzfive-smarc-som: Enable WDT
      riscv: dts: renesas: rzfive-smarc-som: Enable OSTM nodes

Tomi Valkeinen (2):
      arm64: dts: renesas: r8a779g0: Add display related nodes
      arm64: dts: renesas: white-hawk-cpu: Add DP output support

Wolfram Sang (1):
      arm64: dts: renesas: condor-i: add HS400 support for eMMC

 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  19 +++
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |  21 ----
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |  21 ----
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |  21 ----
 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts |   4 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  62 ++++++++++
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  94 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 130 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  48 ++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   4 +-
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  |  12 --
 11 files changed, 359 insertions(+), 77 deletions(-)
