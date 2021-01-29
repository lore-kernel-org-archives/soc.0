Return-Path: <SRS0=yapO=HA=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4079C433DB
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 09:50:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 99E3C64E2C; Fri, 29 Jan 2021 09:50:42 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8018564E34
	for <soc@kernel.org>; Fri, 29 Jan 2021 09:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8018564E34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by andre.telenet-ops.be with bizsmtp
	id NZqf2400C4C55Sk01ZqfW0; Fri, 29 Jan 2021 10:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1l5QQI-001YQP-O9; Fri, 29 Jan 2021 10:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1l5PlP-00Ai0w-CM; Fri, 29 Jan 2021 10:08:23 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas ARM SoC updates for v5.12 (take two)
Date: Fri, 29 Jan 2021 10:08:13 +0100
Message-Id: <20210129090815.2552425-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.12.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM DT updates for v5.12 (take two)

    - Increase support (SPI, I2C, Ethernet, Serial, MMC) for the R-Car V3U
      SoC on the Renesas Falcon board,
    - Disable SD functions for plain eMMC,
    - A minor fix.

  [GIT PULL 2/2] Renesas driver updates for v5.12

    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
