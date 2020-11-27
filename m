Return-Path: <SRS0=nAAS=FB=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777C1C2D0E4
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 13:22:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2030422244; Fri, 27 Nov 2020 13:22:07 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38EEE2224B
	for <soc@kernel.org>; Fri, 27 Nov 2020 13:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38EEE2224B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by andre.telenet-ops.be with bizsmtp
	id xRN32300Y4C55Sk01RN3ik; Fri, 27 Nov 2020 14:22:04 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1kidhL-0065FP-Ll; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1kidhL-000K9p-1i; Fri, 27 Nov 2020 14:22:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL 2/3] Renesas ARM SoC updates for v5.11
Date: Fri, 27 Nov 2020 14:21:54 +0100
Message-Id: <20201127132155.77418-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
References: <20201127132155.77418-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v5.11-tag1

for you to fetch changes up to d4a617c9bbef94e4a776901cf12c95eafd54504a:

  ARM: shmobile: Stop using __raw_*() I/O accessors (2020-11-23 09:54:59 +0100)

----------------------------------------------------------------
Renesas ARM SoC updates for v5.11

  - Stop using static I/O mappings and __raw_*() I/O accessors.

----------------------------------------------------------------
Geert Uytterhoeven (8):
      ARM: shmobile: r8a7778: Introduce HPBREG_BASE
      ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
      ARM: shmobile: r8a7779: Use ioremap() to map SMP registers
      ARM: shmobile: r8a7779: Remove obsolete static mappings
      ARM: shmobile: sh73a0: Use ioremap() to map L2C registers
      ARM: shmobile: sh73a0: Use ioremap() to map SMP registers
      ARM: shmobile: sh73a0: Remove obsolete static mapping
      ARM: shmobile: Stop using __raw_*() I/O accessors

 arch/arm/mach-shmobile/platsmp-scu.c   |  2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c | 12 +++++---
 arch/arm/mach-shmobile/setup-r8a7779.c | 56 ++++++++++++----------------------
 arch/arm/mach-shmobile/setup-sh73a0.c  | 21 +------------
 arch/arm/mach-shmobile/smp-r8a7779.c   | 12 ++++++--
 arch/arm/mach-shmobile/smp-sh73a0.c    | 33 +++++++++++++-------
 6 files changed, 59 insertions(+), 77 deletions(-)
