Return-Path: <SRS0=kxyi=FN=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A870E80ABE
	for <soc@archiver.kernel.org>; Fri, 29 Sep 2023 11:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3C99C433C8; Fri, 29 Sep 2023 11:10:29 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 938D4C433CC
	for <soc@kernel.org>; Fri, 29 Sep 2023 11:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 938D4C433CC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
	by baptiste.telenet-ops.be with bizsmtp
	id rnAN2A0061EgHdD01nANmJ; Fri, 29 Sep 2023 13:10:23 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qmBNd-004qNa-45;
	Fri, 29 Sep 2023 13:10:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qmBO2-001fr0-26;
	Fri, 29 Sep 2023 13:10:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v6.7
Date: Fri, 29 Sep 2023 13:10:10 +0200
Message-Id: <cover.1695985418.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.7.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v6.7

    - Refresh shmobile_defconfig for v6.6-rc3.

  [GIT PULL 2/5] Renesas ARM SoC updates for v6.7

    - Reserve boot area when SMP is enabled to prevent conflicts with
      FLASH,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/5] Renesas driver updates for v6.7

    - Identify the new RZ/G3S SoC,
    - Miscellaneous fixes and improvements.

  [GIT PULL 4/5] Renesas DT binding updates for v6.7

    - Document support for the new RZ/G3S (R9A08G045) SoC variants.

  [GIT PULL 5/5] Renesas DTS updates for v6.7

    - Add PCIe Host and Endpoint support for the R-Car S4-8 SoC and the
      Renesas Spider development board,
    - Add FLASH support for the Renesas Genmai and RSK+RZA1 development
      boards,
    - Add multi Component sound support for Renesas ULCB development
      boards equipped with the Shimafuji Kingfisher extension,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
