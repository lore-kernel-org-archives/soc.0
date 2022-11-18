Return-Path: <SRS0=KCga=3S=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B6EC46467
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 16:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D59AC433C1; Fri, 18 Nov 2022 16:45:23 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DB3BC43145
	for <soc@kernel.org>; Fri, 18 Nov 2022 16:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DB3BC43145
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
	by xavier.telenet-ops.be with bizsmtp
	id lslD2800a29fmst01slD5d; Fri, 18 Nov 2022 17:45:13 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-000pAD-Tz; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UJ-00Frgk-Vy; Fri, 18 Nov 2022 17:45:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/7] Renesas RISC-V defconfig updates for v6.2
Date: Fri, 18 Nov 2022 17:45:02 +0100
Message-Id: <cover.1668788928.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-riscv-defconfig-for-v6.2-tag1

for you to fetch changes up to 1776fca7fadbac2260a22e2ecb708e8a1ba9310d:

  riscv: configs: defconfig: Enable Renesas RZ/Five SoC (2022-11-10 16:37:58 +0100)

----------------------------------------------------------------
Renesas RISC-V defconfig updates for v6.2

  - Enable support for the Renesas RZ/Five SoC and the RZ/Five SMARC EVK
    board in the risc-v defconfig.

----------------------------------------------------------------
Lad Prabhakar (1):
      riscv: configs: defconfig: Enable Renesas RZ/Five SoC

 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
