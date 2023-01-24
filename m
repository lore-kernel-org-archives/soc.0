Return-Path: <SRS0=M/nb=5V=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D69C25B4E
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 13:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29638C433EF; Tue, 24 Jan 2023 13:22:13 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id DF07BC433D2;
	Tue, 24 Jan 2023 13:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF07BC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id C891D8125;
	Tue, 24 Jan 2023 13:22:02 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] Clean-up for omamps for v6.3
Date: Tue, 24 Jan 2023 15:21:56 +0200
Message-Id: <pull-1674566471-434733@atomide.com-2>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <pull-1674566471-434733@atomide.com>
References: <pull-1674566471-434733@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.3/cleanup-signed

for you to fetch changes up to 5fc1f76a85ce50b501b1d2ef04a29bc79910807d:

  ARM: OMAP2+: Fix spelling typos in comment (2023-01-19 12:19:39 +0200)

----------------------------------------------------------------
Clean-up for omaps for v6.3

Non-urgent fixes for missing of_node_put() and clk_put(), drop few
unnecessary includes, and fix a typo. None of these are urgent and
can be merged along with other clean-up when suitable.

----------------------------------------------------------------
Chen Hui (1):
      ARM: OMAP2+: Fix memory leak in realtime_counter_init()

Geert Uytterhoeven (2):
      ARM: OMAP2+: Remove unneeded #include <linux/pinctrl/pinmux.h>
      ARM: OMAP2+: Remove unneeded #include <linux/pinctrl/machine.h>

Liang He (1):
      ARM: OMAP2+: omap4-common: Fix refcount leak bug

Nir Levy (1):
      ARM: OMAP2+: Fix spelling typos in comment

 arch/arm/mach-omap2/devices.c      | 1 -
 arch/arm/mach-omap2/omap4-common.c | 1 +
 arch/arm/mach-omap2/pm33xx-core.c  | 1 -
 arch/arm/mach-omap2/sleep34xx.S    | 2 +-
 arch/arm/mach-omap2/timer.c        | 1 +
 5 files changed, 3 insertions(+), 3 deletions(-)
