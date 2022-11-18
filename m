Return-Path: <SRS0=KCga=3S=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B6FC43219
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 16:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38971C433C1; Fri, 18 Nov 2022 16:45:34 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69025C433B5
	for <soc@kernel.org>; Fri, 18 Nov 2022 16:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69025C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4NDN1v2k8Dz4xBsj
	for <soc@kernel.org>; Fri, 18 Nov 2022 17:45:23 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
	by andre.telenet-ops.be with bizsmtp
	id lslC2800Q29fmst01slCAh; Fri, 18 Nov 2022 17:45:14 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-000pA8-Cx; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UJ-00FrgE-SI; Fri, 18 Nov 2022 17:45:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/7] Renesas SoC updates for v6.2 (take two)
Date: Fri, 18 Nov 2022 17:44:57 +0100
Message-Id: <cover.1668788918.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.2, and the first one including support for an SoC with a RISC-V
CPU core (and including no changes for SoCs with arm32 CPU cores).

It consists of 7 parts:

  [GIT PULL 1/7] Renesas ARM defconfig updates for v6.2

    - Enable support for Renesas R-Car S4-8 Spider Ethernet devices in the
      arm64 defconfig.

  [GIT PULL 2/7] Renesas ARM DT updates for v6.2 (take two)

    - Timer (TMU and CMT) and quad Cortex-A76 CPU topology support for
      the R-Car V4H SoC,
    - Watchdog, L2 cache, and system controller support for the RZ/V2M
      SoC on the RZ/V2M Evaluation Kit 2.0,
    - Ethernet Switch and SERDES supports for the R-Car S4-8 SoC and the
      Spider development board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/7] Renesas driver updates for v6.2 (take two)

    - Add support for identifying the SoC revision on RZ/V2M.

  [GIT PULL 4/7] Renesas DT binding updates for v6.2 (take two)

    - Document support for the Andes Technology AX45MP RISC-V CPU Core, as
      used on the Renesas RZ/Five SoC,
    - Document support for the Renesas RZ/V2M System Configuration.

  [GIT PULL 5/7] Renesas RISC-V defconfig updates for v6.2

    - Enable support for the Renesas RZ/Five SoC and the RZ/Five SMARC EVK
      board in the risc-v defconfig.

  [GIT PULL 6/7] Renesas RISC-V DT updates for v6.2

    - Add initial support for the Renesas RZ/Five SoC and the Renesas
      RZ/Five SMARC EVK development board.

  [GIT PULL 7/7] Renesas RISC-V SoC updates for v6.2

    - Add Kconfig option for Renesas RISC-V SoCs.

Thanks for pulling!

P.S. I'm wondering if I should reduce the number of branches?
     Probably it would make sense to (at least) use a single branch for
     the DTS changes, as the RZ/Five DTS files share base SoC and board
     DTS with RZ/G2UL through #include <arm64/renesas/...>.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
