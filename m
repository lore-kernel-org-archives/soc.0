Return-Path: <SRS0=s+W4=PV=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F44C5320E
	for <soc@archiver.kernel.org>; Thu, 22 Aug 2024 08:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C263C4AF0F; Thu, 22 Aug 2024 08:52:22 +0000 (UTC)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F546C4AF0C
	for <soc@kernel.org>; Thu, 22 Aug 2024 08:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F546C4AF0C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4WqH570RyJz4wxh8
	for <soc@kernel.org>; Thu, 22 Aug 2024 10:52:11 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by albert.telenet-ops.be with bizsmtp
	id 2ws22D00W22R5AR06ws2yo; Thu, 22 Aug 2024 10:52:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y0-000VWx-23;
	Thu, 22 Aug 2024 10:52:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y2-002L5u-Ay;
	Thu, 22 Aug 2024 10:52:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.12
Date: Thu, 22 Aug 2024 10:51:53 +0200
Message-Id: <cover.1724316485.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724316478.git.geert+renesas@glider.be>
References: <cover.1724316478.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.12-tag1

for you to fetch changes up to ab7d885a33a7ef328a97ccae0d1340b68c3db9ad:

  arm64: dts: renesas: gray-hawk-single: Add CAN-FD support (2024-08-20 09:40:52 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.12

  - Add support for sound, push switches, and GP LEDs on the Gray Hawk
    Single development board,
  - Add missing iommus properties on R-Car Gen3/Gen4 and RZ/G2 SoCs,
  - Add PWM support for the R-Car V4M SoC,
  - Improve Ethernet descriptions on the RZ/G2L, RZ/G2LC, and RZ/G2UL
    SMARC SoMs,
  - Add DMAC support for the RZ/G3S SoC,
  - Add CAN-FD support for the R-Car V4M SoC and the Gray Hawk Single
    development board.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: dts: renesas: r9a08g045: Add DMAC node

Duy Nguyen (1):
      arm64: dts: renesas: r8a779h0: Add CAN-FD node

Geert Uytterhoeven (15):
      arm64: dts: renesas: r8a774a1: Add missing iommus properties
      arm64: dts: renesas: r8a774b1: Add missing iommus properties
      arm64: dts: renesas: r8a774c0: Add missing iommus properties
      arm64: dts: renesas: r8a774e1: Add missing iommus properties
      arm64: dts: renesas: r8a77960: Add missing iommus properties
      arm64: dts: renesas: r8a77961: Add missing iommus properties
      arm64: dts: renesas: r8a77965: Add missing iommus properties
      arm64: dts: renesas: r8a77970: Add missing iommus property
      arm64: dts: renesas: r8a77980: Add missing iommus properties
      arm64: dts: renesas: r8a779a0: Add missing iommus properties
      arm64: dts: renesas: r8a779g0: Add missing iommus properties
      arm64: dts: renesas: r8a779h0: Add missing iommus properties
      arm64: dts: renesas: gray-hawk-single: Add push switches
      arm64: dts: renesas: gray-hawk-single: Add GP LEDs
      arm64: dts: renesas: gray-hawk-single: Add CAN-FD support

Khanh Le (1):
      arm64: dts: renesas: r8a779h0: Add PWM device nodes

Kuninori Morimoto (1):
      arm64: dts: renesas: gray-hawk-single: Add Sound support

Paul Barker (6):
      arm64: dts: renesas: rzg2l: Enable Ethernet TXC output
      arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
      arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
      arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
      arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
      arm64: dts: renesas: rzg2ul: Set Ethernet PVDD to 1.8V

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   6 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  26 +++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   3 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   8 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  22 +++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  20 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   5 +
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 212 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  93 +++++++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  38 ++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  86 +++++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |  43 +++--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |  86 +++++----
 17 files changed, 575 insertions(+), 80 deletions(-)
