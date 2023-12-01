Return-Path: <SRS0=/gx/=HM=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B767C4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 12:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D389C433C9; Fri,  1 Dec 2023 12:28:40 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC70AC433C7
	for <soc@kernel.org>; Fri,  1 Dec 2023 12:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC70AC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7f2e:4977:a943:cc87])
	by albert.telenet-ops.be with bizsmtp
	id H0UU2B00F0rKVV8060UUP0; Fri, 01 Dec 2023 13:28:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92cr-00ARcA-SN;
	Fri, 01 Dec 2023 13:28:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92dA-00CVCy-HG;
	Fri, 01 Dec 2023 13:28:28 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.8
Date: Fri,  1 Dec 2023 13:28:15 +0100
Message-Id: <cover.1701433485.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.8.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v6.8

    - Enable support for the Renesas VersaClock 3 clock generator in the
      arm64 defconfig,
    - Enable support for the Renesas EtherAVB module in the arm multi_v7
      defconfig,
    - Refresh shmobile_defconfig for v6.7-rc1.

  [GIT PULL 2/2] Renesas DTS updates for v6.8

    - Add FLASH support for the Renesas Marzen and Blanche development
      boards,
    - Add 4-bit TX support for the QSPI FLASHes on the RZ/G2L, RZ/G2LC,
      and RZ/V2L SMARC SoMs,
    - Add SDHI support for the RZ/G3S SMARC development kit,
    - Add LCD support for the Atmark Techno Armadillo-800-EVA development
      board, which requires switching from the legacy frame buffer device
      driver to the DRM driver,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
