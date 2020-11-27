Return-Path: <SRS0=zdl7=FB=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B278AC63777
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 07:38:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7F9B7221FF; Fri, 27 Nov 2020 07:38:29 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id E059121D93;
	Fri, 27 Nov 2020 07:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E059121D93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tony@atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id B8FD68063;
	Fri, 27 Nov 2020 07:38:34 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.11 merge window
Date: Fri, 27 Nov 2020 09:38:19 +0200
Message-Id: <pull-1606462656-588116@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/soc-signed

for you to fetch changes up to 2e023b938048c9857af09b96ce672e9a31dbfb38:

  ARM: OMAP1: clock: Use IS_ERR_OR_NULL() to clean code (2020-11-19 11:45:42 +0200)

----------------------------------------------------------------
SoC changes for omaps for v5.11 merge window:

Several non-urgent fixes for various issues found by automated tests.
So far we have not been hitting any of these so these can wait for the
merge window no problem.

----------------------------------------------------------------
Jing Xiangfeng (1):
      ARM: OMAP2+: Remove redundant assignment to variable ret

Tang Bin (1):
      ARM: OMAP1: clock: Use IS_ERR_OR_NULL() to clean code

Xu Wang (1):
      ARM: OMAP2+: Remove redundant null check before clk_prepare_enable/clk_disable_unprepare

Youling Tang (2):
      ARM: OMAP2+: Fix memleak in omap2xxx_clkt_vps_init
      ARM: OMAP2+: Fix kfree NULL pointer in omap2xxx_clkt_vps_init

 arch/arm/mach-omap1/clock.c                  | 14 +++++++-------
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 11 +++++++----
 arch/arm/mach-omap2/display.c                |  6 ++----
 arch/arm/mach-omap2/omap_device.c            |  5 ++---
 4 files changed, 18 insertions(+), 18 deletions(-)
