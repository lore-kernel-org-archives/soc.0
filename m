Return-Path: <SRS0=00RE=BP=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ED9C7EE23
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 09:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2071C433A7; Fri, 26 May 2023 09:48:43 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C24FC4339E
	for <soc@kernel.org>; Fri, 26 May 2023 09:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C24FC4339E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ae30:9d2b:3228:d21])
	by baptiste.telenet-ops.be with bizsmtp
	id 1Moc2A0074eYoVn01Mocvu; Fri, 26 May 2023 11:48:38 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q2U3X-0038jr-Jx;
	Fri, 26 May 2023 11:48:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q2U3o-00EFZR-2m;
	Fri, 26 May 2023 11:48:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.5
Date: Fri, 26 May 2023 11:48:28 +0200
Message-Id: <cover.1685094238.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.5.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.5

    - Refresh shmobile_defconfig for v6.4-rc1.

  [GIT PULL 2/3] Renesas driver updates for v6.5

    - Enable watchdog reset support on R-Car V3U.

  [GIT PULL 3/3] Renesas DTS updates for v6.5

    - Add partial display support for the RZ/G2L and RZ/V2L SoCs and the
      RZ/G2L{,C} SMARC EVK development boards,
    - Add camera support for the RZ/GV2L SoC and the RZ/V2L and RZ/G2LC
      SMARC EVK development boards,
    - Add Multi-Function Timer Pulse Unit 3 support for the RZ/G2L and
      RZ/V2L SoCs,
    - Add PWM support for the R-Car V3U SoC.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
