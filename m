Return-Path: <SRS0=BlQ1=ZF=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E586C6FA83
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 09:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1619FC433C1; Fri,  2 Sep 2022 09:37:17 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8393FC43142
	for <soc@kernel.org>; Fri,  2 Sep 2022 09:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8393FC43142
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by michel.telenet-ops.be with bizsmtp
	id Exd32800z4C55Sk06xd3Wo; Fri, 02 Sep 2022 11:37:05 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oU36l-003hal-Ej; Fri, 02 Sep 2022 11:37:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oU36k-007eR1-Jz; Fri, 02 Sep 2022 11:37:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.1
Date: Fri,  2 Sep 2022 11:36:48 +0200
Message-Id: <cover.1662111124.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.1.

It consists of 3 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.1

    - Refresh shmobile_defconfig for v6.0-rc1,
    - Enable additional support for Renesas platforms in the arm64
      defconfig.

  [GIT PULL 2/4] Renesas ARM DT updates for v6.1

    - SDHI and eMMC support for the R-Car S4-8 SoC and the Spider
      development board,
    - Timer (CMT and TMU) and SPI (MSIOF) support for the R-Car S4-8 SoC,
    - External and GPIO interrupt support for the RZ/G2L and RZ/V2L SoCs,
    - Initial support for the R-Car H3Ne-1.7G (R8A779MB) SoC,
    - SPI DMA support for the RZ/G2UL, RZ/G2L, and RZ/V2L SoCs,
    - Pin control and I2C support for the RZ/V2M SoC and the RZ/V2M
      Evaluation Kit,
    - initial support for the R-Car V3H2 (R8A77980A) SoC and the Condor-I
      development board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v6.1

    - Auto-enable the RZ/G2L external and GPIO interrupt controller driver
      when needed,
    - Identify the R-Car H3Ne-1.7G and RZ/Five SoCs.

  [GIT PULL 4/4] Renesas DT binding updates for v6.1

    - Document support for the R-Car H3Ne-1.7G SoC on the Salvator-XS and
      ULCB development boards,
    - Document system controller support for the RZ/Five SoC,
    - Document support for the R-Car V3H2 SoC and the Condor-I development
      board.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
