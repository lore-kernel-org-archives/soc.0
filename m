Return-Path: <SRS0=/ciS=OV=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1444C433EF
	for <soc@archiver.kernel.org>; Fri,  1 Oct 2021 09:43:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C904161A58; Fri,  1 Oct 2021 09:43:02 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D505361A40
	for <soc@kernel.org>; Fri,  1 Oct 2021 09:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D505361A40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
	by laurent.telenet-ops.be with bizsmtp
	id 0Zj12600B1ZoSwU01Zj1mE; Fri, 01 Oct 2021 11:43:01 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mWF46-000zIi-QA; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mWF45-00BE66-Sw; Fri, 01 Oct 2021 11:42:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.16
Date: Fri,  1 Oct 2021 11:42:42 +0200
Message-Id: <cover.1633081144.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.15.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.16

    - Enable built-in (I2C, DMAC, USB PHY control) and modular (audio,
      ADC) build of drivers for the RZ/G2L SoC and SMARC EVK board,
    - Enable modular build of the Renesas TPU PWM driver for the R-Car
      V3U SoC.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.16

    - I2C EEPROM support on the RZA2MEVB development board,
    - DMA, USB2.0, and audio support for the RZ/G2L SoC,
    - USB2.0, I2C, audio, ADC, and CANFD support for the RZ/G2L SMARC EVK
      development board,
    - Support for more R-Car Gen3e SoCs (H3e, M3e, M3Ne(-2G), D3e, E3e,
      H3Ne),
    - PWM support for the R-Car M3-W+ and V3U SoCs,
    - IPMMU support for SDHI on the R-Car V3U SoC,
    - Switches support for the Falcon development board,
    - Improve Ethernet PHY descriptions to fix reset handling after kexec,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.16

    - Initial support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
      H3Ne SoCs.

  [GIT PULL 4/4] Renesas DT binding updates for v5.16

    - Document support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
      H3Ne SoCs and boards.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
