Return-Path: <SRS0=KCga=3S=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563C2C41535
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 16:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28C0DC43148; Fri, 18 Nov 2022 16:45:23 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7701CC433C1
	for <soc@kernel.org>; Fri, 18 Nov 2022 16:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7701CC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
	by xavier.telenet-ops.be with bizsmtp
	id lslD2800429fmst01slD5B; Fri, 18 Nov 2022 17:45:13 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-000pAF-Jc; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-00Frgy-16; Fri, 18 Nov 2022 17:45:12 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 7/7] Renesas RISC-V SoC updates for v6.2
Date: Fri, 18 Nov 2022 17:45:04 +0100
Message-Id: <cover.1668788933.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-riscv-soc-for-v6.2-tag1

for you to fetch changes up to 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1:

  riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option (2022-11-10 16:34:05 +0100)

----------------------------------------------------------------
Renesas RISC-V SoC updates for v6.2

  - Add Kconfig option for Renesas RISC-V SoCs.

----------------------------------------------------------------
Lad Prabhakar (1):
      riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option

 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)
