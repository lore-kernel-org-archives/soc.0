Return-Path: <SRS0=8Gze=LR=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233A4C4345F
	for <soc@archiver.kernel.org>; Fri, 12 Apr 2024 10:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14FEAC2BD11; Fri, 12 Apr 2024 10:49:16 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5464EC2BD10
	for <soc@kernel.org>; Fri, 12 Apr 2024 10:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5464EC2BD10
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4VGCwx2DjPz4x0d7
	for <soc@kernel.org>; Fri, 12 Apr 2024 12:49:05 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id AAoy2C0030SSLxL01Aoylo; Fri, 12 Apr 2024 12:48:58 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESG-00GpCB-8Q;
	Fri, 12 Apr 2024 12:48:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDj5-004eQD-Ot;
	Fri, 12 Apr 2024 12:01:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.10
Date: Fri, 12 Apr 2024 12:01:36 +0200
Message-Id: <cover.1712915528.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.10.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.10

    - Enable support for the Renesas RZ/G2L display unit, DA9062 PMIC, and
      RZ/V2H (R9A09G057) SoC in the ARM64 defconfig,
    - Refresh shmobile_defconfig for v6.9-rc1.

  [GIT PULL 2/4] Renesas driver updates for v6.10

    - Identify the new RZ/V2H (R9A09G057) SoC,
    - Enable support for the TMU (Timer Unit) on R-Car Gen2 SoCs.

  [GIT PULL 3/4] Renesas DT binding updates for v6.10

    - Document support for the Renesas RZ/V2H(P) (R9A09G057) SoC variants.

  [GIT PULL 4/4] Renesas DTS updates for v6.10

    - Add HDMI capture support for the Function expansion board for the
      Eagle development board,
    - Add PMIC support for the RZ/G2UL SMARC EVK development board,
    - Add thermal, more serial ((H)SCIF), and timer (CMT and TMU) support
      for the R-Car V4M SoC,
    - Add Timer Unit (TMU) support for the R-Mobile APE6, R-Car Gen2, and
      RZ/G1 SoCs,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
