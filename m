Return-Path: <SRS0=F+Ro=B5=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E336FC7EE37
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 10:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B237AC433D2; Fri,  9 Jun 2023 10:06:54 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA6EEC4339B
	for <soc@kernel.org>; Fri,  9 Jun 2023 10:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA6EEC4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
	by michel.telenet-ops.be with bizsmtp
	id 6y6i2A00612zQ4r06y6iPh; Fri, 09 Jun 2023 12:06:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q7Z0d-008L2L-1q;
	Fri, 09 Jun 2023 12:06:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q7Z10-00G42n-1Q;
	Fri, 09 Jun 2023 12:06:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.5 (take two)
Date: Fri,  9 Jun 2023 12:06:35 +0200
Message-Id: <cover.1686304609.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.5.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.5 (take two)

    - Enable support for the Renesas MTU3a counter in the arm64 defconfig.

  [GIT PULL 2/3] Renesas driver updates for v6.5 (take two)

    - Convert the R-Mobile SYSC driver to readl_poll_timeout_atomic().

  [GIT PULL 3/3] Renesas DTS updates for v6.5 (take two)

    - Add IOMMU support for PCIe devices on R-Car Gen3 and RZ/G2 SoCs,
    - Add HSCIF1 serial port support on Renesas ULCB boards equipped with
      the Shimafuji Kingfisher extension,
    - Miscellaneous fixes and improvements.

Note that the conversion to readl_poll_timeout_atomic() depends
on iopoll improvements, which are thus included through an immutable
branch in multiple pull requests:

  "[GIT PULL] clk: renesas: Updates for v6.5 (take two)" (for clk),
  "[GIT PULL 2/3] Renesas driver updates for v6.5 (take two)" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
