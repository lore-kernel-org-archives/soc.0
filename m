Return-Path: <SRS0=YE/A=N6=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B9C2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 13:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A68CC2BBFC; Fri, 28 Jun 2024 13:16:02 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C1A3C32786
	for <soc@kernel.org>; Fri, 28 Jun 2024 13:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C1A3C32786
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:acf4:1256:ab55:12e6])
	by albert.telenet-ops.be with bizsmtp
	id h1Fs2C0085ECAAU061Fsiq; Fri, 28 Jun 2024 15:15:52 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBS6-000VGQ-7X;
	Fri, 28 Jun 2024 15:15:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSC-00BlRF-2Z;
	Fri, 28 Jun 2024 15:15:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.11 (take two)
Date: Fri, 28 Jun 2024 15:15:46 +0200
Message-Id: <cover.1719578273.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.11.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.11

    - Add R-Car fuse driver.

  [GIT PULL 2/3] Renesas DT binding updates for v6.11

    - Document support for R-Car E-FUSE controllers.

  [GIT PULL 3/3] Renesas DTS updates for v6.11 (take two)

    - Add E-FUSE support for the R-Car V3U, S4-8, V4H, and V4M SoCs,
    - Add sound support for the R-Car V4M SoC,
    - Miscellaneous fixes and improvements.

Note that the new R-Car Fuse DT bindings, and/or driver and platform
data are shared by multiple driver and DT source files, and thus
included in multiple pull requests:
  - "[GIT PULL 1/3] Renesas driver updates for v6.11",
  - "[GIT PULL 2/3] Renesas DT binding updates for v6.11",
  - "[GIT PULL 3/3] Renesas DTS updates for v6.11 (take two)",
  - "[GIT PULL] pinctrl: renesas: Updates for v6.11 (take two)" (for
    pinctrl).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
