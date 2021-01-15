Return-Path: <SRS0=Ulf+=GS=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D06BC433E0
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 09:46:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 42576235E4; Fri, 15 Jan 2021 09:46:24 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 542CB23436
	for <soc@kernel.org>; Fri, 15 Jan 2021 09:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 542CB23436
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by michel.telenet-ops.be with bizsmtp
	id GxmM2400K4C55Sk06xmMMa; Fri, 15 Jan 2021 10:46:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1l0LgT-003iyG-4y; Fri, 15 Jan 2021 10:46:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1l0LgS-009nD1-HR; Fri, 15 Jan 2021 10:46:20 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM DT updates for v5.12
Date: Fri, 15 Jan 2021 10:46:09 +0100
Message-Id: <20210115094610.2334058-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115094610.2334058-1-geert+renesas@glider.be>
References: <20210115094610.2334058-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.12-tag1

for you to fetch changes up to 1f4449e12c5c6682a6f4f8dbc7288c19c1c844f1:

  arm64: dts: renesas: r8a779a0: Add SYS-DMAC nodes (2021-01-14 12:13:00 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.12

  - Timer (CMT/TMU) support for R-Car Gen3 SoCs,
  - Watchdog (RWDT), pincontrol (PFC), GPIO, and DMA (SYS-DMAC) support
    for the R-Car V3U SoC,
  - USB2 clock selector and SPI Multi I/O Bus Controller (RPC-IF)
    support for RZ/G2 SoCs,
  - Support for the Beacon EmbeddedWorks RZ/G2H and RZ/G2N kits,
  - Various fixes and improvements.

----------------------------------------------------------------
Adam Ford (17):
      arm64: dts: renesas: beacon kit: Fix choppy Bluetooth Audio
      arm64: dts: renesas: beacon kit: Remove unnecessary nodes
      arm64: dts: renesas: beacon: Fix audio-1.8V pin enable
      arm64: dts: renesas: beacon: Fix LVDS PWM Backlight
      arm64: dts: renesas: beacon: Fix RGB Display PWM Backlight
      arm64: dts: renesas: beacon: Don't make vccq_sdhi0 always on
      arm64: dts: renesas: beacon: Enable SPI
      arm64: dts: renesas: beacon: Correct I2C bus speeds
      arm64: dts: renesas: beacon: Configure programmable clocks
      arm64: dts: renesas: beacon kit: Fix Audio Clock sources
      arm64: dts: renesas: beacon: Configure Audio CODEC clocks
      arm64: dts: renesas: beacon: Better describe keys
      arm64: dts: renesas: beacon-rzg2m-kit: Rearrange SoC unique functions
      arm64: dts: renesas: r8a774b1: Introduce beacon-rzg2n-kit
      arm64: dts: renesas: r8a774e1: Introduce beacon-rzg2h-kit
      arm64: dts: renesas: rzg2: Add usb2_clksel to RZ/G2 M/N/H
      arm64: dts: renesas: rzg2: Add RPC-IF Support

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779a0: Add GPIO nodes
      arm64: dts: renesas: r8a779a0: Add SYS-DMAC nodes

Hoang Vo (2):
      arm64: dts: renesas: r8a779a0: Add RWDT node
      arm64: dts: renesas: falcon: Enable watchdog timer

Niklas Söderlund (2):
      arm64: dts: renesas: rcar-gen3: Add missing CMT nodes
      arm64: dts: renesas: rcar-gen3: Add missing TMU nodes

Ulrich Hecht (1):
      arm64: dts: renesas: r8a779a0: Add pinctrl device node

 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi | 137 +++++++------
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |  43 ++--
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |  41 ++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  32 +++
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |  66 +++++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  32 +++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  17 ++
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |  71 +++++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  32 +++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  65 ++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  65 ++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          | 135 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  65 ++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  65 ++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          | 135 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   5 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 217 +++++++++++++++++++++
 18 files changed, 1140 insertions(+), 85 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
