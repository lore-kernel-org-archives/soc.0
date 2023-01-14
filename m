Return-Path: <SRS0=TcnV=5L=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A2C6379F
	for <soc@archiver.kernel.org>; Sat, 14 Jan 2023 13:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87A09C433F1; Sat, 14 Jan 2023 13:23:22 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F37D8C433D2
	for <soc@kernel.org>; Sat, 14 Jan 2023 13:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F37D8C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by andre.telenet-ops.be with bizsmtp
	id 8dP92900T4C55Sk01dP9ei; Sat, 14 Jan 2023 14:23:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGgUz-003z7E-W6;
	Sat, 14 Jan 2023 14:23:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGgV3-006HuH-M2;
	Sat, 14 Jan 2023 14:23:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.3
Date: Sat, 14 Jan 2023 14:22:56 +0100
Message-Id: <cover.1673702287.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.3.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.3

    - Enable support for the Renesas RZ/G2L MIPI DSI, CSI-2, and Camera
      Receiving Unit drivers in the arm64 defconfig,
    - Refresh shmobile_defconfig for v6.1-rc5.

  [GIT PULL 2/3] Renesas driver updates for v6.3

    - Add missing A3DUL power domain on R-Car V4H.

  [GIT PULL 3/3] Renesas DT updates for v6.3

    - Enable watchdog and timer (OSTM) support for the RZ/Five SMARC EVK
      development board,
    - Add operating points for the Cortex-A55 CPU cores on the R-Car S4-8
      SoC,
    - Add display support for the R-Car V4H SoC and the White-Hawk
      development board,
    - Add eMMC and SDHI support for the RZ/V2M SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
