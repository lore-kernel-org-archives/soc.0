Return-Path: <SRS0=8Gze=LR=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4776BC04FF6
	for <soc@archiver.kernel.org>; Fri, 12 Apr 2024 10:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 350E4C32783; Fri, 12 Apr 2024 10:49:09 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8661BC32786
	for <soc@kernel.org>; Fri, 12 Apr 2024 10:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8661BC32786
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id AAox2C00G0SSLxL06Aox03; Fri, 12 Apr 2024 12:48:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESF-00GpBt-Sl;
	Fri, 12 Apr 2024 12:48:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDj5-004eQV-Sw;
	Fri, 12 Apr 2024 12:01:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.10
Date: Fri, 12 Apr 2024 12:01:40 +0200
Message-Id: <cover.1712915536.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
References: <cover.1712915528.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.10-tag1

for you to fetch changes up to be4e4dd8a1994e5730dfdb8dfaf1f2418f8a199d:

  arm64: dts: renesas: rzg3s-smarc-som: Fix Ethernet aliases (2024-04-09 09:34:52 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.10

  - Add HDMI capture support for the Function expansion board for the
    Eagle development board,
  - Add PMIC support for the RZ/G2UL SMARC EVK development board,
  - Add thermal, more serial ((H)SCIF), and timer (CMT and TMU) support
    for the R-Car V4M SoC,
  - Add Timer Unit (TMU) support for the R-Mobile APE6, R-Car Gen2, and
    RZ/G1 SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and built-in RTC, GPIO and ONKEY

Claudiu Beznea (1):
      arm64: dts: renesas: rzg3s-smarc-som: Fix Ethernet aliases

Duy Nguyen (1):
      arm64: dts: renesas: r8a779h0: Add thermal nodes

Geert Uytterhoeven (8):
      ARM: dts: renesas: r8a73a4: Add TMU nodes
      ARM: dts: renesas: rzg1: Add TMU nodes
      ARM: dts: renesas: rcar-gen2: Add TMU nodes
      arm64: dts: renesas: r8a779h0: Add remaining HSCIF nodes
      arm64: dts: renesas: r8a779h0: Add SCIF nodes
      arm64: dts: renesas: gray-hawk-single: Add second debug serial port
      ARM: dts: renesas: r9a06g032: Remove duplicate interrupt-parent
      arm64: dts: renesas: gray-hawk-single: Enable nfsroot

Lad Prabhakar (1):
      ARM: dts: renesas: r7s72100: Add interrupt-names to SCIF nodes

Niklas Söderlund (1):
      arm64: dts: renesas: eagle: Add capture overlay for Function expansion board

Thanh Quan (2):
      arm64: dts: renesas: r8a779h0: Add CMT nodes
      arm64: dts: renesas: r8a779h0: Add TMU nodes

 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   8 +
 arch/arm/boot/dts/renesas/r8a73a4.dtsi             |  37 +++
 arch/arm/boot/dts/renesas/r8a7742.dtsi             |  58 ++++
 arch/arm/boot/dts/renesas/r8a7743.dtsi             |  58 ++++
 arch/arm/boot/dts/renesas/r8a7744.dtsi             |  58 ++++
 arch/arm/boot/dts/renesas/r8a7745.dtsi             |  58 ++++
 arch/arm/boot/dts/renesas/r8a77470.dtsi            |  44 +++
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |  58 ++++
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |  58 ++++
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |  59 ++++
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |  58 ++++
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |  58 ++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   1 -
 arch/arm64/boot/dts/renesas/Makefile               |   3 +
 .../renesas/r8a77970-eagle-function-expansion.dtso | 214 ++++++++++++++
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts |  27 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          | 311 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      |  58 ++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   4 +-
 include/dt-bindings/clock/r8a73a4-clock.h          |   4 +
 20 files changed, 1228 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
