Return-Path: <SRS0=9b4z=NQ=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B89FC2BA12
	for <soc@archiver.kernel.org>; Fri, 14 Jun 2024 09:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2993C4AF1C; Fri, 14 Jun 2024 09:07:08 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E51BFC4AF1D
	for <soc@kernel.org>; Fri, 14 Jun 2024 09:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E51BFC4AF1D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by andre.telenet-ops.be with bizsmtp
	id bM732C00F3w30qz01M73Sr; Fri, 14 Jun 2024 11:07:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2se-00BqO4-S4;
	Fri, 14 Jun 2024 11:07:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2tj-00FbJb-Bs;
	Fri, 14 Jun 2024 11:07:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.11
Date: Fri, 14 Jun 2024 11:06:57 +0200
Message-Id: <cover.1718355309.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.11.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v6.11

    - Enable support for Renesas R-Car Gen4 PCIe controllers and Marvell
      88Q2XXX 100/1000BASE-T1 Automotive Ethernet PHYs in the ARM64
      defconfig.

  [GIT PULL 2/2] Renesas DTS updates for v6.11

    - Add support for the second and third Ethernet interfaces on the
      White Hawk development board,
    - Add support for the second Ethernet interface on the RZ/N1 SoC,
    - Add I2C EEPROM support for the Condor-I development board,
    - Add video capture support for the R-Car V4M SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
