Return-Path: <SRS0=hyep=3E=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE0BC433FE
	for <soc@archiver.kernel.org>; Fri,  4 Nov 2022 10:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12F9AC433B5; Fri,  4 Nov 2022 10:50:09 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E335CC433C1
	for <soc@kernel.org>; Fri,  4 Nov 2022 10:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E335CC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c5ee:bf27:9df:5172])
	by laurent.telenet-ops.be with bizsmtp
	id gAq4280122kjr6L01Aq4ST; Fri, 04 Nov 2022 11:50:04 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oquGx-002mVI-9X; Fri, 04 Nov 2022 11:50:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oquGw-00HWEj-Mo; Fri, 04 Nov 2022 11:50:02 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM DT updates for v6.2
Date: Fri,  4 Nov 2022 11:49:53 +0100
Message-Id: <cover.1667558738.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.2.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM DT updates for v6.2

    - DMA, SPI (MSIOF), external interrupt (INTC-EX), PWM (PWM and TPU),
      SDHI, HyperFLASH/QSPI (RPC), and serial ((H)SCIF) support for the
      R-Car V4H SoC,
    - I/O expander, eMMC, and QSPI FLASH support for the White Hawk
      development board,
    - Preparatory work to share r9a07g043.dtsi between the ARM-based
      RZ/G2UL (R9A07G043U) and the RISC-V-based RZ/Five (R9A07G043F) SoCs,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/4] Renesas ARM SoC updates for v6.2

    - Drop selecting GPIOLIB and PINCTRL, which are already automatically
      selected as part of the SOC_RENESAS config option in
      drivers/soc/renesas/Kconfig.

  [GIT PULL 3/4] Renesas driver updates for v6.2

    - Let SOC_RENESAS select GPIOLIB and PINCTRL, so this does not have to
      be handled in two (soon three: arm/arm64/riscv), places.

  [GIT PULL 4/4] Renesas DT binding updates for v6.2

    - Move renesas.yaml from arm to soc, and document RZ/Five support.

Note that the second pull request depends on the third, and thus is
based on it.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
