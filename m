Return-Path: <SRS0=TaMd=W7=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF19CCA473
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 12:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4872FC34114; Fri, 24 Jun 2022 12:01:59 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54E74C341D0
	for <soc@kernel.org>; Fri, 24 Jun 2022 12:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54E74C341D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4LTwhY31S0z4x46v
	for <soc@kernel.org>; Fri, 24 Jun 2022 14:01:49 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
	by michel.telenet-ops.be with bizsmtp
	id n01e2700L4C55Sk0601eDD; Fri, 24 Jun 2022 14:01:42 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o4i0I-000gWY-Cd; Fri, 24 Jun 2022 14:01:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o4i0H-009mpx-Qm; Fri, 24 Jun 2022 14:01:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.20
Date: Fri, 24 Jun 2022 14:01:28 +0200
Message-Id: <cover.1656069631.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.20.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.20

    - Enable support for the Renesas R-Car V4H SoC,
    - Refresh shmobile_defconfig for v5.19-rc1.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.20

    - ADC and SPI support for the RZ/G2UL Soc and the RZ/G2UL SMARC EVK
      development board,
    - Ethernet support for the RZ/V2M SoC and the RZV2MEVK2 development
      board,
    - Thermal, IOMMU, Universal Flash Storage, octal Cortex-A55, and full
      serial support for the R-Car S4-8 SoC on the Spider development
      board,
    - RTC support for the RZN1D-DB board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.20

    - Small fixes and improvements.

  [GIT PULL 4/4] Renesas DT binding updates for v5.20

    - Reorganize the renesas,prr DT binding document.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
