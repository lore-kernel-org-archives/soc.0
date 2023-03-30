Return-Path: <SRS0=FmMO=7W=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37944C761A6
	for <soc@archiver.kernel.org>; Thu, 30 Mar 2023 12:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8868C433A7; Thu, 30 Mar 2023 12:45:35 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 98E8FC433EF;
	Thu, 30 Mar 2023 12:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98E8FC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 488B180FE;
	Thu, 30 Mar 2023 12:45:30 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Clean-up for omaps for v6.4
Date: Thu, 30 Mar 2023 15:45:22 +0300
Message-Id: <pull-1680180293-92168@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.4/cleanup-signed

for you to fetch changes up to 19050da1d1057a7bc73fd9039f94b7f63a00e54e:

  ARM: OMAP2+: hwmod: Use kzalloc for allocating only one element (2023-03-28 08:45:55 +0300)

----------------------------------------------------------------
Clean-up for omaps for v6.4

Some clean-up changes for omaps mostly to use of_property_read_bool() and
of_address_to_resource(). Also included is removal for an obsolete Kconfig
option, a typo fix, a return path change for am33xx_suspend_init(), and a
change to use kzalloc instead of kcalloc for a single element.

----------------------------------------------------------------
Jilin Yuan (1):
      ARM: OMAP2+: fix repeated words in comments

Kenneth Lee (1):
      ARM: OMAP2+: hwmod: Use kzalloc for allocating only one element

Lukas Bulwahn (1):
      ARM: OMAP2+: remove obsolete config OMAP3_SDRC_AC_TIMING

Rob Herring (2):
      ARM: OMAP2+: Use of_property_read_bool() for boolean properties
      ARM: OMAP2+: Use of_address_to_resource()

ye xingchen (1):
      ARM: OMAP2+: Remove the unneeded result variable

 arch/arm/mach-omap2/Kconfig       | 11 -----------
 arch/arm/mach-omap2/cm33xx.c      |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c  | 23 ++++++++++-------------
 arch/arm/mach-omap2/pm33xx-core.c |  6 +-----
 4 files changed, 12 insertions(+), 30 deletions(-)
