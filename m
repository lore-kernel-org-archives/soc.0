Return-Path: <SRS0=j9JP=L7=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0CCC04FFE
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 07:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31366C2BD11; Fri, 26 Apr 2024 07:35:31 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4C42C113CE
	for <soc@kernel.org>; Fri, 26 Apr 2024 07:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4C42C113CE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a8cf:a8c7:966f:f6c0])
	by andre.telenet-ops.be with bizsmtp
	id FjbL2C00R4stinQ01jbLld; Fri, 26 Apr 2024 09:35:21 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s0G6Q-00A8CG-KI;
	Fri, 26 Apr 2024 09:35:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s0G76-00CYFW-Jp;
	Fri, 26 Apr 2024 09:35:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.10 (take two)
Date: Fri, 26 Apr 2024 09:35:19 +0200
Message-Id: <cover.1714116737.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit be4e4dd8a1994e5730dfdb8dfaf1f2418f8a199d:

  arm64: dts: renesas: rzg3s-smarc-som: Fix Ethernet aliases (2024-04-09 09:34:52 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.10-tag2

for you to fetch changes up to f026b6426603d25d2c8a8c517925c7b243cf223d:

  arm64: dts: renesas: r8a779h0: Link IOMMU consumers (2024-04-23 09:42:41 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.10 (take two)

  - Add external interrupt (IRQC) support for the RZ/Five SoC,
  - Add SPI (MSIOF), external interrupt (INTC-EX), and IOMMU support for
    the R-Car V4M SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      arm64: dts: renesas: s4sk: Fix ethernet0 alias
      arm64: dts: renesas: r8a779h0: Add INTC-EX node
      arm64: dts: renesas: r8a779h0: Link IOMMU consumers

Lad Prabhakar (4):
      riscv: dts: renesas: r9a07g043f: Add IRQC node to RZ/Five SoC DTSI
      arm64: dts: renesas: r9a07g043: Move interrupt-parent property to common DTSI
      riscv: dts: renesas: rzfive-smarc-som: Drop deleting interrupt properties from ETH0/1 nodes
      arm64: dts: renesas: rzg3s-smarc-som: Enable eMMC by default

Thanh Le (1):
      arm64: dts: renesas: r8a779h0: Add IPMMU nodes

Thanh Quan (1):
      arm64: dts: renesas: r8a779h0: Add MSIOF nodes

 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi         | 226 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi        |   1 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi       |   4 -
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi  |   2 +-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi       |  75 +++++++
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi |  16 --
 7 files changed, 306 insertions(+), 24 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
