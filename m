Return-Path: <SRS0=+TGo=F3=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2690FCDB47E
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 12:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6F43C433CB; Fri, 13 Oct 2023 12:26:58 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1352AC433C7
	for <soc@kernel.org>; Fri, 13 Oct 2023 12:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1352AC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
	by michel.telenet-ops.be with bizsmtp
	id xQSm2A00g56FAx306QSmrh; Fri, 13 Oct 2023 14:26:48 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qrHFb-006Gfe-5a;
	Fri, 13 Oct 2023 14:26:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qrHFe-002JL0-Hn;
	Fri, 13 Oct 2023 14:26:46 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.6 (take two)
Date: Fri, 13 Oct 2023 14:26:44 +0200
Message-Id: <cover.1697199963.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit c1ec4b450ab729e30d043e927fdfcc9f764f61b7:

  soc: renesas: Make ARCH_R9A07G043 (riscv version) depend on NONPORTABLE (2023-10-05 15:07:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.6-tag2

for you to fetch changes up to 1531309aa2092a96c092fa662863ffa53da3ba93:

  soc: renesas: Make ARCH_R9A07G043 depend on required options (2023-10-12 19:46:49 +0200)

----------------------------------------------------------------
Renesas fixes for v6.6 (take two)

  - Fix build failures due to missing RZ/Five dependencies.

Note that this conflicts with renesas-drivers-for-v6.7-tag1, which I
have sent a PR for two weeks ago, but which you haven't merged yet.
The proper solution is to take the ARCH_R9A07G043 section from
renesas-fixes-for-v6.6-tag2.

Thanks for pulling!
----------------------------------------------------------------
Conor Dooley (1):
      soc: renesas: Make ARCH_R9A07G043 depend on required options

 drivers/soc/renesas/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
