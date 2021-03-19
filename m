Return-Path: <SRS0=65lA=IR=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422FBC433DB
	for <soc@archiver.kernel.org>; Fri, 19 Mar 2021 08:51:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10FDB64F6D; Fri, 19 Mar 2021 08:51:56 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB7264F42
	for <soc@kernel.org>; Fri, 19 Mar 2021 08:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB7264F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
	by baptiste.telenet-ops.be with bizsmtp
	id i8rt2400B3CXdgx018rtWS; Fri, 19 Mar 2021 09:51:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lNArI-008kfs-PA; Fri, 19 Mar 2021 09:51:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lNArI-00BMy0-4d; Fri, 19 Mar 2021 09:51:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas ARM SoC updates for v5.13
Date: Fri, 19 Mar 2021 09:51:43 +0100
Message-Id: <20210319085146.2709844-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.13.

It consists of 2 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v5.13

    - Refresh shmobile_defconfig for v5.12-rc2.

  [GIT PULL 2/3] Renesas ARM DT updates for v5.13

    - OV7725 camera support for the iWave RainboW Qseven board (G21D), and
      its camera expansion board,
    - Add mmc aliases to fix /dev/mmcblkN order,
    - HDMI Display support for the R-Car Starter Kit Pro with R-Car M3-W+,
    - Support for running upstream kernels on the RZA2MEVB board, using
      the SDRAM present on the sub-board,
    - I2C EEPROM support for the Falcon development board,
    - Timer, thermal sensor, and CAN support for the R-Car V3U SoC.
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/3] Renesas driver updates for v5.13

    - Prepare rmobile-sysc for fw_devlink=on,
    - A minor cleanup.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
