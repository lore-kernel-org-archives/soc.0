Return-Path: <SRS0=6t5u=KX=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A290C4708D
	for <soc@archiver.kernel.org>; Fri, 28 May 2021 10:35:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C30B260D07; Fri, 28 May 2021 10:35:55 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC83D613E3
	for <soc@kernel.org>; Fri, 28 May 2021 10:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC83D613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
	by andre.telenet-ops.be with bizsmtp
	id AAbs2500f20MPSF01Absbu; Fri, 28 May 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lmZqK-00AD9W-8a; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lmXtS-007G5u-In; Fri, 28 May 2021 10:30:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas ARM SoC updates for v5.14
Date: Fri, 28 May 2021 10:30:48 +0200
Message-Id: <cover.1622188833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.14.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v5.14

    - Refresh shmobile_defconfig for v5.13-rc1
    - Enable R-Car USB2 clock selector support

  [GIT PULL 2/2] Renesas ARM DT updates for v5.14

    - GPIO extender support for the Falcon development board,
    - Switches support for the ALT development board,
    - Miscellaneous fixes and improvements.

Note that the second part is based on v5.13-rc3, as older versions do
not include tags/renesas-arm-dt-for-v5.13-tag3.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
