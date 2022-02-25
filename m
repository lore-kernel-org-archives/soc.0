Return-Path: <SRS0=3pCC=TI=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4257BC433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 13:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0507BC340F1; Fri, 25 Feb 2022 13:29:50 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66E96C340E7
	for <soc@kernel.org>; Fri, 25 Feb 2022 13:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66E96C340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7d31:13ed:51c6:c7cc])
	by michel.telenet-ops.be with bizsmtp
	id zRVm260010mlTBr06RVmBj; Fri, 25 Feb 2022 14:29:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nNafJ-00221w-Ka; Fri, 25 Feb 2022 14:29:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nNafJ-00E330-2W; Fri, 25 Feb 2022 14:29:45 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas ARM DT updates for v5.18 (take three)
Date: Fri, 25 Feb 2022 14:29:37 +0100
Message-Id: <cover.1645795643.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 6a3b10e5c312cae4c1fc7a27bf9a030360999351:

  ARM: dts: renesas: Align GPIO hog names with dtschema (2022-02-24 13:51:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.18-tag3

for you to fetch changes up to 1ef36224ad6283cb1430cd5029470f9c53f6a915:

  arm64: dts: renesas: spider: Complete SCIF3 description (2022-02-25 14:00:39 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.18 (take three)

  - Pin control support for the R-Car S4-8 SoC on the Spider development
    board.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779f0: Add pinctrl device node
      arm64: dts: renesas: spider: Complete SCIF3 description

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      | 23 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  6 ++++++
 2 files changed, 29 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
