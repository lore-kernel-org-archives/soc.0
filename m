Return-Path: <SRS0=xbz0=R2=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3403C433F5
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 07:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 806A4C36AF4; Mon, 10 Jan 2022 07:55:50 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id A5231C36AE9;
	Mon, 10 Jan 2022 07:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5231C36AE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 84DAA805F;
	Mon, 10 Jan 2022 07:56:28 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date: Mon, 10 Jan 2022 09:55:38 +0200
Message-Id: <pull-1641801310-149268@atomide.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.17/fixes-for-merge-window-signed

for you to fetch changes up to 31aa7056bbec0259e2ec91db7d3571f66b14f93f:

  ARM: dts: Don't use legacy clock defines for dra7 clkctrl (2021-12-22 08:28:19 +0200)

----------------------------------------------------------------
Fixes for omaps

A series of fixes for omap variants for minor issues, and a fix for a timer
regression for some omap3 beagleboard versions.

The timer fix needs to patch both the dts and the timer code because
otherwise the timer quirk handling for old dtbs will prevent the dts fix
from working.

The other changes are for issues found by automated analysis, a macasp
typo fix, and two cosmetic fixes for clocks.

----------------------------------------------------------------
Jayesh Choudhary (1):
      ARM: dts: am335x-wega: Fix typo in mcasp property rx-num-evt

Tony Lindgren (3):
      ARM: dts: Fix timer regression for beagleboard revision c
      clk: ti: Move dra7 clock devices out of the legacy section
      ARM: dts: Don't use legacy clock defines for dra7 clkctrl

Wan Jiabing (1):
      ARM: OMAP2+: hwmod: Add of_node_put() before break

Ye Guojin (1):
      ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of

 .../devicetree/bindings/arm/omap/omap.txt          |  3 ++
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/am335x-wega.dtsi                 |  2 +-
 arch/arm/boot/dts/dra7.dtsi                        | 20 ++++-----
 arch/arm/boot/dts/omap3-beagle-ab4.dts             | 47 ++++++++++++++++++++++
 arch/arm/boot/dts/omap3-beagle.dts                 | 33 ---------------
 arch/arm/mach-omap2/display.c                      |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c                   |  4 +-
 drivers/clocksource/timer-ti-dm-systimer.c         |  2 +-
 include/dt-bindings/clock/dra7.h                   | 14 +++----
 10 files changed, 74 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap3-beagle-ab4.dts
