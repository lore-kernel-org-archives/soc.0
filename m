Return-Path: <SRS0=tBpQ=S2=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAF3C433FE
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 14:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D89AC340E9; Fri, 11 Feb 2022 14:20:00 +0000 (UTC)
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22CB3C340F1
	for <soc@kernel.org>; Fri, 11 Feb 2022 14:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22CB3C340F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 4JwG393NMVzMrFkQ
	for <soc@kernel.org>; Fri, 11 Feb 2022 15:19:49 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
	by albert.telenet-ops.be with bizsmtp
	id tqKi2600D3ZSXJh06qKiu4; Fri, 11 Feb 2022 15:19:42 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nIWlx-000M8j-SO; Fri, 11 Feb 2022 15:19:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nIWLx-00Gh8N-JP; Fri, 11 Feb 2022 14:52:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.18
Date: Fri, 11 Feb 2022 14:52:10 +0100
Message-Id: <cover.1644587197.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.18.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.18

    - Enable the new Audio Graph Card2 driver which can handle sound cards
      more flexibly in the arm64 defconfig,
    - Disable unneeded 8250 serial options in shmobile_defconfig,
    - Enable additional support for Renesas platforms in the arm64
      defconfig.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.18

    - External interrupt (INTC-EX) support for the R-Car V3U SoC,
    - Initial support for the RZ/G2LC and RZ/V2L SoCs, and the RZ/G2LC and
      RZ/V2L SMARC EVK development boards,
    - Support for MAX9286 GMSL deserializers and GSML cameras on the Eagle
      and Condor development boards,
    - NAND support for the RZ/N1D SoC,
    - DMA engine (SYS-DMAC) support for the R-Car S4-8 SoC,
    - LVDS support for the R-Car M3-W+ SoC,
    - HDMI output and 9-axis sensor support for the Kingfisher (ULCB
      extension) board,
    - MAX96712 GMSL serializer support for the Falcon development board,
    - MOST network support for the R-Car H3, M3-W, M3-W+, M3-N, E3, and D3
      SoCs,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.18

    - Initial support for the new RZ/V2L SoC,
    - RZ/G2L product revision support.

  [GIT PULL 4/4] Renesas DT binding updates for v5.18

    - Document support for the new RZ/V2L SoC and the RZ/V2L SMARC EVK
      board.

Note that the new Renesas RZ/V2L DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.18" (for clk),
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.18" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
