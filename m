Return-Path: <SRS0=VMYS=DN=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEF3C0015E
	for <soc@archiver.kernel.org>; Thu, 27 Jul 2023 13:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDB0FC433CA; Thu, 27 Jul 2023 13:13:19 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83F98C433C8
	for <soc@kernel.org>; Thu, 27 Jul 2023 13:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83F98C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d80c:aaca:e11d:6940])
	by xavier.telenet-ops.be with bizsmtp
	id SDDC2A00U4qLm8F01DDCda; Thu, 27 Jul 2023 15:13:13 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qP0nb-002d2H-FG;
	Thu, 27 Jul 2023 15:13:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qP0no-00AYDT-IV;
	Thu, 27 Jul 2023 15:13:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.5
Date: Thu, 27 Jul 2023 15:13:09 +0200
Message-Id: <cover.1690463347.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi soc folks,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-fixes-for-v6.5-tag1

for you to fetch changes up to 4c188fa183ebb45238ef16504c4c7606955cf9d4:

  arm64: dts: renesas: rzg2l: Update overfow/underflow IRQ names for MTU3 channels (2023-07-25 11:40:34 +0200)

----------------------------------------------------------------
Renesas fixes for v6.5

  - Fix interrupt names for MTU3 channels on RZ/G2L and RZ/V2L.

The devices nodes with the incorrect names were added in v6.5-rc1.
Fix them now, so they won't end up in a released version.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: rzg2l: Update overfow/underflow IRQ names for MTU3 channels

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
