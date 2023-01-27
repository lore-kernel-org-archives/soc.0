Return-Path: <SRS0=4MpN=5Y=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E32C38142
	for <soc@archiver.kernel.org>; Fri, 27 Jan 2023 16:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19689C433A4; Fri, 27 Jan 2023 16:28:37 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50304C433EF
	for <soc@kernel.org>; Fri, 27 Jan 2023 16:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50304C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a160:4e65:21d4:30bf])
	by xavier.telenet-ops.be with bizsmtp
	id DsUS2900C2rBNjs01sUSMj; Fri, 27 Jan 2023 17:28:26 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pLRaG-007Zkf-Mi;
	Fri, 27 Jan 2023 17:28:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pLRaS-005TaU-Ei;
	Fri, 27 Jan 2023 17:28:24 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.3 (take two)
Date: Fri, 27 Jan 2023 17:28:11 +0100
Message-Id: <cover.1674815093.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.3.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.3 (take two)

    - Add support for the Renesas RZ/V2M External Power Sequence
      Controller (PWC).

  [GIT PULL 2/3] Renesas DT binding updates for v6.3

    - Document support for the Renesas RZ/V2M External Power Sequence
      Controller (PWC).

  [GIT PULL 3/3] Renesas DT updates for v6.3 (take two)

    - High Performance mode (1.8 GHz) support for the Cortex-A76 CPU cores
      on R-Car V4H,
    - GPIO interrupt support for the RZ/G2UL SoC and the RZ/G2UL SMARC EVK
      development board,
    - USB Function support for the RZ/N1D SoC,
    - Generic Sound Card driver examples for the Renesas R-Car Starter Kit
      Premier/Pro and Shimafugi Kingfisher development board stack,
    - Universal Flash Storage support for the Renesas Spider development
      board,
    - External Power Sequence Controller (PWC) support for the RZ/V2M SoC
      and the RZ/V2M Evaluation Kit 2.0,
    - IOMMU support for MMC on the R-Car S4-8 SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
