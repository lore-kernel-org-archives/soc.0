Return-Path: <SRS0=GeR3=XJ=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32001C43334
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 07:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5DAFC341CA; Mon,  4 Jul 2022 07:11:00 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id BCAB0C3411E;
	Mon,  4 Jul 2022 07:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCAB0C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id C893B80C1;
	Mon,  4 Jul 2022 07:05:33 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Soc changes for omaps
Date: Mon,  4 Jul 2022 10:10:53 +0300
Message-Id: <pull-1656918583-2801@atomide.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.20/soc-signed

for you to fetch changes up to fe71f6e1bbffb99ef28121a22a72859fb276af04:

  ARM: OMAP2+: Kconfig: Fix indentation (2022-06-28 08:50:20 +0300)

----------------------------------------------------------------
SoC changes omaps for v5.20 merge window

SoC changes omaps mostly for missing of_node_put() calls and cosmetic
Kconfig changes. These can be all merged when suitable, there is no urgent
need to merge this as fixes.

----------------------------------------------------------------
Juerg Haefliger (1):
      ARM: OMAP2+: Kconfig: Fix indentation

Liang He (2):
      ARM: OMAP2+: display: Fix refcount leak bug
      ARM: OMAP2+: pdata-quirks: Fix refcount leak bug

Miaoqian Lin (2):
      ARM: OMAP2+: Fix refcount leak in omapdss_init_of
      ARM: OMAP2+: Fix refcount leak in omap3xxx_prm_late_init

 arch/arm/mach-omap2/Kconfig        | 6 +++---
 arch/arm/mach-omap2/display.c      | 3 +++
 arch/arm/mach-omap2/pdata-quirks.c | 2 ++
 arch/arm/mach-omap2/prm3xxx.c      | 1 +
 4 files changed, 9 insertions(+), 3 deletions(-)
