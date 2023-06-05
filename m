Return-Path: <SRS0=N118=BZ=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1029FC7EE2A
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 06:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDB22C4339C; Mon,  5 Jun 2023 06:28:58 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id B3D90C433D2;
	Mon,  5 Jun 2023 06:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3D90C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 5C53580C1;
	Mon,  5 Jun 2023 06:28:55 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Clean-up for omaps for v6.5
Date: Mon,  5 Jun 2023 09:28:53 +0300
Message-ID: <pull-1685946511-835910@atomide.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.5/cleanup-signed

for you to fetch changes up to 937e87229ea04e94c4f1a2f3f5ae9d2c56989acd:

  ARM: omap2: Fix checkpatch issues (2023-06-02 12:33:48 +0300)

----------------------------------------------------------------
Clean-up for omaps for v6.5

Two patches for checkpatch warnings, and one change to use pr_err instead
of printk.

----------------------------------------------------------------
Franziska Naepelt (2):
      ARM: omap: Fix checkpatch issues
      ARM: omap2: Fix checkpatch issues

Prathu Baronia (1):
      arm: omap1: replace printk() with pr_err macro

 arch/arm/mach-omap1/pm.c                   |  2 +-
 arch/arm/mach-omap1/sram-init.c            |  2 +-
 arch/arm/mach-omap2/omap-wakeupgen.c       |  1 +
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 11 +++++------
 arch/arm/mach-omap2/omap_phy_internal.c    | 12 ++++++------
 arch/arm/mach-omap2/sdrc2xxx.c             |  2 --
 arch/arm/mach-omap2/sram.c                 |  4 ++--
 arch/arm/mach-omap2/ti81xx-restart.c       |  3 ++-
 8 files changed, 18 insertions(+), 19 deletions(-)
