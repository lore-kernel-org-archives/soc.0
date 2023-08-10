Return-Path: <SRS0=vZI3=D3=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E178C001DE
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 09:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12095C433C9; Thu, 10 Aug 2023 09:17:12 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 50DBEC433C8;
	Thu, 10 Aug 2023 09:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50DBEC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id E58488225;
	Thu, 10 Aug 2023 09:17:09 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] SoC changes for omaps for v6.6
Date: Thu, 10 Aug 2023 12:16:53 +0300
Message-ID: <pull-1691658952-110529@atomide.com-4>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <pull-1691658952-110529@atomide.com>
References: <pull-1691658952-110529@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/soc-signed

for you to fetch changes up to 2c32e600a068b44433e7b453121ef65f4b4210cf:

  Merge branch 'omap-for-v6.5/cleanup' into omap-for-v6.6/soc (2023-08-02 10:46:07 +0300)

----------------------------------------------------------------
SoC changes for omaps for v6.6

SoC changes to include the correct devicetree headers, and an update to
make use of_range_to_resource(). There is also a non-urgent fix for
pwrdm_read_prev_pwrst() array-bounds warning.

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      ARM: OMAP2+: Fix -Warray-bounds warning in _pwrdm_state_switch()

Rob Herring (2):
      ARM: omap2: Use of_range_to_resource() for "ranges" parsing
      ARM: omap2: Explicitly include correct DT includes

Tony Lindgren (1):
      Merge branch 'omap-for-v6.5/cleanup' into omap-for-v6.6/soc

 arch/arm/mach-omap2/board-generic.c |  3 +--
 arch/arm/mach-omap2/omap4-common.c  |  3 +--
 arch/arm/mach-omap2/omap_hwmod.c    | 45 +++++--------------------------------
 arch/arm/mach-omap2/powerdomain.c   |  2 +-
 4 files changed, 9 insertions(+), 44 deletions(-)
