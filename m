Return-Path: <SRS0=8gLa=VF=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C72C433FE
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 12:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4047C385A9; Wed, 27 Apr 2022 12:08:40 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 1BFFEC385A7;
	Wed, 27 Apr 2022 12:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1BFFEC385A7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 8A21F816A;
	Wed, 27 Apr 2022 12:05:34 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/4] SoC clean-up for omaps
Date: Wed, 27 Apr 2022 15:08:27 +0300
Message-Id: <pull-1651061256-836848@atomide.com-3>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <pull-1651061256-836848@atomide.com>
References: <pull-1651061256-836848@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 71ff461c3f41f6465434b9e980c01782763e7ad8:

  iommu/omap: Fix regression in probe for NULL pointer dereference (2022-04-08 11:16:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.19/soc-signed

for you to fetch changes up to df3eb1feeb73f17776e559679eaa986572db0837:

  ARM: OMAP2+: drop hwmod-clock helper comment (2022-04-21 14:47:15 +0300)

----------------------------------------------------------------
Soc clean-up for omaps

Soc clean-up for omaps to add missing of_node_put() calls
and drop unused omap_device_register().

----------------------------------------------------------------
Johan Hovold (2):
      ARM: OMAP2+: drop omap_device_register() helper
      ARM: OMAP2+: drop hwmod-clock helper comment

Wang Qing (1):
      ARM: OMAP2+: add missing of_node_put before break and return

 arch/arm/mach-omap2/cm_common.c   |  8 ++++++--
 arch/arm/mach-omap2/control.c     | 19 ++++++++++++++-----
 arch/arm/mach-omap2/omap_device.c | 20 --------------------
 arch/arm/mach-omap2/omap_device.h |  1 -
 arch/arm/mach-omap2/prm_common.c  |  8 ++++++--
 5 files changed, 26 insertions(+), 30 deletions(-)
