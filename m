Return-Path: <SRS0=YIfF=VO=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7D9C433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 09:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18F97C385AE; Fri,  6 May 2022 09:32:33 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C97D0C385B5
	for <soc@kernel.org>; Fri,  6 May 2022 09:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C97D0C385B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
	by laurent.telenet-ops.be with bizsmtp
	id TMYM270051UVucw01MYMdQ; Fri, 06 May 2022 11:32:22 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nmuJw-0038XA-Jc; Fri, 06 May 2022 11:32:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nmuJv-00Aek5-PT; Fri, 06 May 2022 11:32:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v5.19 (take two)
Date: Fri,  6 May 2022 11:32:11 +0200
Message-Id: <cover.1651828600.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.19.

It consists of five parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v5.19 (take two)

    - Enable support for the Renesas RZ/G2UL and RZ/V2M SoCs in the arm64
      defconfig,

  [GIT PULL 2/5] Renesas ARM DT updates for v5.19 (take two)

    - I2C, sound, USB, CANFD, timer, watchdog, (Q)SPI, cpufreq, and
      thermal support for the RZ/G2UL SoC and the RZ/G2UL SMARC EVK
      development board,
    - Initial support for the R-Car V4H SoC and the Renesas White Hawk
      development board stack,
    - DMA, RTC, and USB support for the RZ/N1D SoC,
    - Initial support for the RZ/V2M SoC an the RZ/V2M Evaluation Kit
      Board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/5] Renesas ARM SoC updates for v5.19

    - Drop commas after sentinels.

  [GIT PULL 4/5] Renesas driver updates for v5.19 (take two)

    - Initial support for the R-Car V4H and RZ/V2M SoCs,
    - Miscellaneous fixes and improvements.

  [GIT PULL 5/5] Renesas DT binding updates for v5.19 (take two)

    - Document support for the R-Car V4H SoC and the White Hawk
      development board stack,
    - Document support for the RZ/V2M SoC and the RZ/V2M Evaluation Kit
      Board,
    - Document SPI Multi I/O Bus Controller (RPC-IF) support for RZ/G2UL,
    - Miscellaneous fixes and improvements.

Note that the new Renesas R-Car V4H and RZ/V2M DT Binding Definitions
are shared by driver and DT source files, and thus included in multiple
pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.19 (take two)" (for clk),
  - "[GIT PULL 2/5] Renesas ARM DT updates for v5.19 (take two)" (for soc),
  - "[GIT PULL 4/5] Renesas driver updates for v5.19 (take two)" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
