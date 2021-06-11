Return-Path: <SRS0=GheF=LF=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05373C48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 09:47:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 87400613F0; Fri, 11 Jun 2021 09:47:16 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D380C613DF
	for <soc@kernel.org>; Fri, 11 Jun 2021 09:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D380C613DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
	by xavier.telenet-ops.be with bizsmtp
	id FlnD2500a25eH3q01lnDK6; Fri, 11 Jun 2021 11:47:14 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lrdkv-00FcQL-I0; Fri, 11 Jun 2021 11:47:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lrdku-00CZqj-NI; Fri, 11 Jun 2021 11:47:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas ARM SoC updates for v5.14 (take two)
Date: Fri, 11 Jun 2021 11:47:00 +0200
Message-Id: <cover.1623403793.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.14.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.14 (take two)

    - Enable support for the new RZ/G2L SoC variants in the arm64
      defconfig.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.14 (take two)

    - External interrupt (INTC-EX) support for the R-Car M3-W+ SoC,
    - Initial support for the new RZ/G2L SoC on the RZ/G2L SMARC EVK
      board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.14

    - Initial support for the new RZ/G2L SoC variants.

  [GIT PULL 4/4] Renesas DT binding updates for v5.14

    - Document support for the new RZ/G2L, RZ/G2LC, and RZ/G2UL SoCs,
    - Document support for the new RZ/G2L SMARC EVK board.

Note that the new Renesas RZ/G2L DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.14 (take two)" (for clk),
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.14 (take two)" (for
    soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
