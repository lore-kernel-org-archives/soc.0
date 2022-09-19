Return-Path: <SRS0=xMIe=ZW=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92D9C6FA8B
	for <soc@archiver.kernel.org>; Mon, 19 Sep 2022 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEA70C433D6; Mon, 19 Sep 2022 12:04:13 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E45ABC433C1
	for <soc@kernel.org>; Mon, 19 Sep 2022 12:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E45ABC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:ed67:3be8:ebe5:696d])
	by xavier.telenet-ops.be with bizsmtp
	id Mo422800J0GZoLL01o422x; Mon, 19 Sep 2022 14:04:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oaFVK-005cI1-8H; Mon, 19 Sep 2022 14:04:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oaFVJ-00GClc-I3; Mon, 19 Sep 2022 14:04:01 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.1 (take two)
Date: Mon, 19 Sep 2022 14:03:53 +0200
Message-Id: <cover.1663588772.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.1.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM DT updates for v6.1 (take two)

    - Merge Renesas ARM/ARM64 maintainers entries,
    - CAN support for the RZ/N1 SoC and the RZN1D-DB development board,
    - Watchdog, pin control, I2C (EEPROM), GPIO (LEDS/switches), and
      Ethernet support for the R-Car V4H SoC and the White Hawk
      development board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/2] Renesas ARM SoC updates for v6.1

    - Drop superfluous selects of SOC_BUS.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
