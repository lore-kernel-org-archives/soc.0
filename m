Return-Path: <SRS0=BlQ1=ZF=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B55C38145
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 09:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AD28C4347C; Fri,  2 Sep 2022 09:44:10 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3B25C433B5
	for <soc@kernel.org>; Fri,  2 Sep 2022 09:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3B25C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4MJtKF0jR5z4x2Kq
	for <soc@kernel.org>; Fri,  2 Sep 2022 11:44:01 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
	by andre.telenet-ops.be with bizsmtp
	id Exjs2800Q4C55Sk01xjsLJ; Fri, 02 Sep 2022 11:43:52 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oU3DM-003heM-0X; Fri, 02 Sep 2022 11:43:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oU3DL-007ebe-Bl; Fri, 02 Sep 2022 11:43:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.0
Date: Fri,  2 Sep 2022 11:43:45 +0200
Message-Id: <ab2866f12ca18747413ba41409231d44e0c6149b.1662111547.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi soc folks,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.0-tag1

for you to fetch changes up to ab2866f12ca18747413ba41409231d44e0c6149b:

  arm64: dts: renesas: r8a779g0: Fix HSCIF0 interrupt number (2022-08-29 09:12:12 +0200)

----------------------------------------------------------------
Renesas fixes for v6.0

  - Fix the serial console on the Renesas White Hawk development board.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: renesas: r8a779g0: Fix HSCIF0 interrupt number

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
