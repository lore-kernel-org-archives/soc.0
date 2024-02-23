Return-Path: <SRS0=fj43=KA=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAEAC54798
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 11:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E58F7C433B2; Fri, 23 Feb 2024 11:21:19 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DCA4C43390
	for <soc@kernel.org>; Fri, 23 Feb 2024 11:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DCA4C43390
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6f61:ab26:80d6:d9d4])
	by xavier.telenet-ops.be with bizsmtp
	id qbM72B00Q2itsqh01bM7gT; Fri, 23 Feb 2024 12:21:09 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTbu-001P3l-Vg;
	Fri, 23 Feb 2024 12:21:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTc3-00D0P1-9o;
	Fri, 23 Feb 2024 12:21:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.9 (take two)
Date: Fri, 23 Feb 2024 12:20:57 +0100
Message-Id: <cover.1708687130.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.9.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas DT binding updates for v6.9 (take two)

    - Restore sort order,
    - Document preferred compatible naming,

  [GIT PULL 2/2] Renesas DTS updates for v6.9 (take two)

    - Add pin control, I2C, GPIO, CA76 cluster, Ethernet, SD/MMC, DMA, and
      HyperFLASH/QSPI (RPC) support for the R-Car V4M SoC,
    - Add I2C EEPROM, Ethernet, eMMC, and QSPI FLASH support for the Gray
      Hawk Single development board,
    - Fix PCIe power on ULCB development boards equipped with the
      Shimafuji Kingfisher extension,
    - Add PSCI support for the RZ/G3S SoC,
    - Add camera support for the RZ/G2UL SMARC EVK development board,
    - Add display support for the RZ/G2L{,C} and RZ/V2L SoCs and SMARC EVK
      development boards,
    - Miscellaneous fixes and improvements,

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
