Return-Path: <SRS0=Z9GS=VA=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB4EC433EF
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 14:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D4CFC385A8; Fri, 22 Apr 2022 14:55:15 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55219C385B4
	for <soc@kernel.org>; Fri, 22 Apr 2022 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55219C385B4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4KlHWX4yfhz4wwkX
	for <soc@kernel.org>; Fri, 22 Apr 2022 16:55:04 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
	by baptiste.telenet-ops.be with bizsmtp
	id Mqux2700A2Ah9RF01quxTH; Fri, 22 Apr 2022 16:54:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nhugS-001cQ7-MT; Fri, 22 Apr 2022 16:54:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nhugR-00COl7-MQ; Fri, 22 Apr 2022 16:54:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas ARM defconfig updates for v5.19
Date: Fri, 22 Apr 2022 16:54:49 +0200
Message-Id: <cover.1650638502.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.19.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.19

    - Enable support for the Renesas RZ/V2L SoC and the Maxim MAX96712
      Quad GMSL2 Deserializer in the arm64 defconfig,
    - Refresh shmobile_defconfig for v5.18-rc1.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.19

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

  [GIT PULL 3/4] Renesas driver updates for v5.19

    - Initial support for the new RZ/G2UL SoC.

  [GIT PULL 4/4] Renesas DT binding updates for v5.19

    - Document support for the new RZ/G2UL SoC and the RZ/G2UL SMARC EVK
      development board.

Note that the new Renesas RZ/G2UL DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.19" (for clk),
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.19" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
