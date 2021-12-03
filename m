Return-Path: <SRS0=3L+D=QU=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA85C43217
	for <soc@archiver.kernel.org>; Fri,  3 Dec 2021 11:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18E99C53FD1; Fri,  3 Dec 2021 11:31:45 +0000 (UTC)
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0FCDC53FCB
	for <soc@kernel.org>; Fri,  3 Dec 2021 11:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0FCDC53FCB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 4J59dM47P5zMr2nb
	for <soc@kernel.org>; Fri,  3 Dec 2021 12:31:35 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
	by andre.telenet-ops.be with bizsmtp
	id RnXT2600Y3eLghq01nXTGf; Fri, 03 Dec 2021 12:31:28 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mt6ml-002IYN-FF; Fri, 03 Dec 2021 12:31:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mt6mk-000hQn-QQ; Fri, 03 Dec 2021 12:31:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.17
Date: Fri,  3 Dec 2021 12:31:17 +0100
Message-Id: <cover.1638530605.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.17.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM DT updates for v5.17

    - Serial, SPI, timer, watchdog, operating points, and QSPI FLASH
      support for the RZ/G2L SoC and the RZ/G2L SMARC EVK development
      board,
    - SDHI SDnH clocks for the R-Car Gen3 and RZ/G2 SoCs,
    - Display Unit support for the R-Car V3U SoC,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/4] Renesas ARM SoC updates for v5.17

    - Add a missing of_node_put().

  [GIT PULL 3/4] Renesas driver updates for v5.17

    - Add a remoteproc API for controlling the Cortex-R7 boot address on
      R-Car Gen3 SoCs,
    - Consolidate product register handling.

  [GIT PULL 4/4] Renesas DT binding updates for v5.17

    - Document SDHI SDnH clocks on R-Car Gen2 and later,
    - Document core support for the R-Car S4-8 (R8A779F0) SoC.

Note that due to dependencies between Renesas Clock and Renesas SDHI
driver changes, I'm handling Renesas SDHI changes for this cycle.
Hence the presence of a Renesas SDHI DT bindings update in part 4.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
