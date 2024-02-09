Return-Path: <SRS0=B8S/=JS=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B7BC4828F
	for <soc@archiver.kernel.org>; Fri,  9 Feb 2024 16:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6AC2C433B1; Fri,  9 Feb 2024 16:55:19 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA15DC43142
	for <soc@kernel.org>; Fri,  9 Feb 2024 16:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA15DC43142
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4TWg2M3xPtz4wxLg
	for <soc@kernel.org>; Fri,  9 Feb 2024 17:55:07 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by albert.telenet-ops.be with bizsmtp
	id l4uy2B0054RKXn6064uy1C; Fri, 09 Feb 2024 17:55:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9O-0008GW-7b;
	Fri, 09 Feb 2024 17:54:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9S-0061GG-DS;
	Fri, 09 Feb 2024 17:54:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.9
Date: Fri,  9 Feb 2024 17:54:49 +0100
Message-Id: <cover.1707487826.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.9.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.9

    - Disable obsolete board staging support in the Renesas ARM and ARM V7
      multi-platform defconfigs,
    - Enable support for the Renesas R-Car V4M (R8A779H0) SoC in the ARM64
      defconfig.

  [GIT PULL 2/4] Renesas driver updates for v6.9

    - Initial support for the Renesas R-Car V4M (R8A779H0) SoC.

  [GIT PULL 3/4] Renesas DT binding updates for v6.9

    - Document support for the Renesas R-Car V4M (R8A779H0) SoC, and the
      White Hawk Single and Gray Hawk Single development boards.

  [GIT PULL 4/4] Renesas DTS updates for v6.9

    - Add GPIO keys and watchdog support for the RZ/G3S SMARC development
      board,
    - Add GNSS support for Renesas ULCB development boards equipped with
      the Shimafuji Kingfisher extension,
    - Add support for the standalone White Hawk CPU board,
    - Add support for the R-Car V4H ES2.0 (R8A779G2) SoC and the White
      Hawk Single development board,
    - Add initial support for the R-Car V4M (R8A779H0) SoC and the Gray
      Hawk Single development board,
    - Add camera support for the RZ/G2UL SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
