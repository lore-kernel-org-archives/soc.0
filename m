Return-Path: <SRS0=GdFq=DO=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4165C001E0
	for <soc@archiver.kernel.org>; Fri, 28 Jul 2023 11:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FA0AC433D9; Fri, 28 Jul 2023 11:57:12 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26314C433CB
	for <soc@kernel.org>; Fri, 28 Jul 2023 11:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26314C433CB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
	by laurent.telenet-ops.be with bizsmtp
	id Sbx62A0020d1nm801bx66X; Fri, 28 Jul 2023 13:57:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qPM5U-002mIg-Mr;
	Fri, 28 Jul 2023 13:57:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qPM5h-00AqNg-QH;
	Fri, 28 Jul 2023 13:57:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.6
Date: Fri, 28 Jul 2023 13:56:59 +0200
Message-Id: <cover.1690545139.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.5.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.6

    - Enable CSI driver support for Renesas RZ/V2M based platforms,
    - Enable MTU3a PWM and RAA215300 PMIC/RTC driver support, as used on
      Renesas RZ/{G2L,G2LC,G2UL,V2L} SMARC EVKs.

  [GIT PULL 2/3] Renesas ARM SoC updates for v6.6

    -   Drop unused OF includes.

  [GIT PULL 3/3] Renesas DTS updates for v6.6

    - Add Clocked Serial Interface (CSI) support for the RZ/V2M SoC,
    - Add PMIC, RTC, and PWM support for the RZ/G2L, RZ/G2LC, and RZ/V2L
      SMARC EVK development boards,
    - Add PWM (MTU3a) support for the RZ/G2UL and RZ/Five SoCs,
    - Add External interrupt (INTC-EX) support for the R-Car S4-8 SoC,
    - Add LED support for the Spider development board,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
