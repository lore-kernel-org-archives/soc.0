Return-Path: <SRS0=dswN=7T=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F840C76195
	for <soc@archiver.kernel.org>; Mon, 27 Mar 2023 08:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 376EAC4339B; Mon, 27 Mar 2023 08:57:29 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 615CFC433EF
	for <soc@kernel.org>; Mon, 27 Mar 2023 08:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 615CFC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4PlRXF48jlz4x1NZ
	for <soc@kernel.org>; Mon, 27 Mar 2023 10:57:17 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
	by andre.telenet-ops.be with bizsmtp
	id dLx82900R1C8whw01Lx81P; Mon, 27 Mar 2023 10:57:10 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pgieO-00ExYy-Ri;
	Mon, 27 Mar 2023 10:57:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pgif6-002atb-Bo;
	Mon, 27 Mar 2023 10:57:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.4
Date: Mon, 27 Mar 2023 10:57:00 +0200
Message-Id: <cover.1679907055.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.4.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.4

    - Enable support for the Dialog Semiconductor DA7213 Codec, and the
      Renesas RZ/V2M xHCI and USB3.1 DRD controllers in the arm64
      defconfig,
    - Disable support for the obsolete R-Car H3 ES1.* (R8A77950) SoC in
      the arm64 defconfig,
    - Refresh shmobile_defconfig for v6.3-rc1,
    - Enable additional support for RZ/N1 platforms in multi_v7_defconfig.

  [GIT PULL 2/4] Renesas driver updates for v6.4

    - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas DT binding updates for v6.4

    - Document support for the Renesas RZ/N1 EB board with an RZ/N1D-DB
      daughter board,
    - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC.

  [GIT PULL 4/4] Renesas DTS updates for v6.4

    - Add USB3 support for the RZ/V2M SoC and the RZ/V2M Evaluation Kit 2.0,
    - Add uSD card and eMMC support for the  RZ/V2M Evaluation Kit 2.0,
    - Add CAN-FD, thermal, GMSL2 video capture, and sound support for the
      R-Car V4H SoC and the White-Hawk development board,
    - Add PMU support for the RZ/G2UL, RZ/G2L{,C}, and RZ/V2L SoCs,
    - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC,
    - Add I2C EEPROM support for the Atmark Techno Armadillo-800-EVA, and
      the Renesas Condor and ULCB development boards,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
