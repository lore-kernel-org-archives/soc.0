Return-Path: <SRS0=OvUt=GA=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2B4CDB47E
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 05:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6A2CC433CB; Wed, 18 Oct 2023 05:19:40 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id A86E8C433C9;
	Wed, 18 Oct 2023 05:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A86E8C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 97BEA8027;
	Wed, 18 Oct 2023 05:19:37 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date: Wed, 18 Oct 2023 08:19:34 +0300
Message-ID: <pull-1697606314-911862@atomide.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06f114cf7cbe96a07c51c47114d79e9654275919:

  Merge branches 'fixes-mapphone' and 'fixes-ti-sysc' into fixes (2023-09-13 11:11:11 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-fixes-audio-clock-and-modem-signed

for you to fetch changes up to 0b9a4a67c60d3e15b39a69d480a50ce7eeff9bc1:

  clk: ti: Fix missing omap5 mcbsp functional clock and aliases (2023-10-13 11:02:02 +0300)

----------------------------------------------------------------
Few minor fixes for omaps

Regression fixes for mcbsp audio clock, and for ams-delta modem. And two
warning fixes. These all can be merged whenever and are not urgent by any
means. Feel free to defer to the merge window unless other fixes are still
pending.

----------------------------------------------------------------
Dan Carpenter (1):
      ARM: omap2: fix a debug printk

Janusz Krzysztofik (1):
      ARM: OMAP1: ams-delta: Fix MODEM initialization failure

Randy Dunlap (1):
      ARM: OMAP: timer32K: fix all kernel-doc warnings

Tony Lindgren (2):
      clk: ti: Fix missing omap4 mcbsp functional clock and aliases
      clk: ti: Fix missing omap5 mcbsp functional clock and aliases

 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi |  6 +++
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi     |  2 +
 arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi |  6 +++
 arch/arm/mach-omap1/board-ams-delta.c       | 60 ++++++++---------------------
 arch/arm/mach-omap1/timer32k.c              | 14 +++----
 arch/arm/mach-omap2/omap_hwmod.c            |  2 +-
 drivers/clk/ti/clk-44xx.c                   |  5 +++
 drivers/clk/ti/clk-54xx.c                   |  4 ++
 8 files changed, 47 insertions(+), 52 deletions(-)
