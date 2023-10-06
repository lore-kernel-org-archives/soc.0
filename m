Return-Path: <SRS0=yOxS=FU=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3C7E92FF4
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 07:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EE98C433C7; Fri,  6 Oct 2023 07:46:19 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24187C433CA
	for <soc@kernel.org>; Fri,  6 Oct 2023 07:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24187C433CA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:cb63:209b:6bfe:e326])
	by albert.telenet-ops.be with bizsmtp
	id uXm62A00G1BD6Ej06Xm6Dh; Fri, 06 Oct 2023 09:46:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qofWl-005KIG-V1;
	Fri, 06 Oct 2023 09:46:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qofXC-0062Zl-7Z;
	Fri, 06 Oct 2023 09:46:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.6
Date: Fri,  6 Oct 2023 09:46:04 +0200
Message-Id: <cover.1696578170.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.6-tag1

for you to fetch changes up to c1ec4b450ab729e30d043e927fdfcc9f764f61b7:

  soc: renesas: Make ARCH_R9A07G043 (riscv version) depend on NONPORTABLE (2023-10-05 15:07:57 +0200)

----------------------------------------------------------------
Renesas fixes for v6.6

  - Fix RISC-V multi-platform kernels by excluding RZ/Five.

Thanks for pulling!

----------------------------------------------------------------
Jisheng Zhang (1):
      soc: renesas: Make ARCH_R9A07G043 (riscv version) depend on NONPORTABLE

 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
