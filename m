Return-Path: <SRS0=B6pf=J7=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70368C48BEB
	for <soc@archiver.kernel.org>; Thu, 22 Feb 2024 10:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D28FC433C7; Thu, 22 Feb 2024 10:43:07 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 530F1C43390
	for <soc@kernel.org>; Thu, 22 Feb 2024 10:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 530F1C43390
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5450:2f24:6e58:231d])
	by laurent.telenet-ops.be with bizsmtp
	id qAiu2B00259vpg201AiuLC; Thu, 22 Feb 2024 11:42:55 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rd6XN-001KZd-Gj;
	Thu, 22 Feb 2024 11:42:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rd6XV-00CYJK-Py;
	Thu, 22 Feb 2024 11:42:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.8
Date: Thu, 22 Feb 2024 11:42:51 +0100
Message-Id: <cover.1708597150.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.8-tag1

for you to fetch changes up to 8c987693dc2d292d777f1be63cb35233049ae25e:

  ARM: dts: renesas: rcar-gen2: Add missing #interrupt-cells to DA9063 nodes (2024-02-22 10:55:03 +0100)

----------------------------------------------------------------
Renesas fixes for v6.8

  - Add missing #interrupt-cells to DA9063 nodes.

Fast-tracked to avoid new dtc interrupt_provider warnings.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: dts: renesas: rcar-gen2: Add missing #interrupt-cells to DA9063 nodes

 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 1 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 1 +
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 1 +
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 1 +
 arch/arm/boot/dts/renesas/r8a7794-alt.dts     | 1 +
 arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 1 +
 8 files changed, 8 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
