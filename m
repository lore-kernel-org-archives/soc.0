Return-Path: <SRS0=eG8q=RC=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD22DC4332F
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 11:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BE00C36AEA; Fri, 17 Dec 2021 11:07:21 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEC54C36AEE
	for <soc@kernel.org>; Fri, 17 Dec 2021 11:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DEC54C36AEE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
	by baptiste.telenet-ops.be with bizsmtp
	id XP7H2600H250X3001P7HaP; Fri, 17 Dec 2021 12:07:17 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1myB53-005Y8R-1j; Fri, 17 Dec 2021 12:07:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1myB52-00AQSJ-Ej; Fri, 17 Dec 2021 12:07:16 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.17 (take two)
Date: Fri, 17 Dec 2021 12:07:11 +0100
Message-Id: <cover.1639736716.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.17.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.17

    - Enable support for the new R-Car S4-8 SoC in the arm64 defconfig.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.17 (take two)

    - Initial support for the R-Car S4-8 SoC on the Spider CPU and
      BreakOut boards,
    - MIPI DSI display support for the R-Car V3u SoC and the Falcon board
      stack,
    - Thermal and GPU support for the RZ/G2L SoC and the RZ/G2L SMARC EVK
      development board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.17 (take two)

    - Core support for the R-Car S4-8 (R8A779F0) SoC, including System
      Controller (SYSC) and Reset (RST) support.

  [GIT PULL 4/4] Renesas DT binding updates for v5.17 (take two)

    - Document support for the R-Car S4-8 Spider CPU and BreakOut boards.

Note that the new Renesas R-Car S4-8 DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.17 (take two)" (for clk),
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.17 (take two)" (for soc),
  - "[GIT PULL 3/4] Renesas driver updates for v5.17 (take two)" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
