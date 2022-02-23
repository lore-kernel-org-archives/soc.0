Return-Path: <SRS0=CGtJ=TG=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56580C433FE
	for <soc@archiver.kernel.org>; Wed, 23 Feb 2022 08:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25B3EC340E7; Wed, 23 Feb 2022 08:55:54 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 35BE7C340EF;
	Wed, 23 Feb 2022 08:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35BE7C340EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id A3EA180A4;
	Wed, 23 Feb 2022 08:54:50 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date: Wed, 23 Feb 2022 10:55:39 +0200
Message-Id: <pull-1645606483-876944@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 486343d3728be741db13854dc7e983c20cdd7c07:

  Merge tag 'omap-for-v5.17/fixes-for-merge-window-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/fixes (2022-02-07 17:42:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.17/fixes-signed

for you to fetch changes up to 8840f5460a23759403f1f2860429dcbcc2f04a65:

  ARM: dts: Use 32KiHz oscillator on devkit8000 (2022-02-18 10:08:45 +0200)

----------------------------------------------------------------
Fixes for omaps

Fixes for devkit8000 timer regression. Similar to the earlier beagleboard
fixes, we must not configure the clocksource drivers to use an alternative
timer configuration. It causes unnecessary issues with power management.
Only some old designs based on early beagleboard revisions with a miswired
timer need to use the alternative timer.

----------------------------------------------------------------
Anthoine Bourgeois (2):
      ARM: dts: switch timer config to common devkit8000 devicetree
      ARM: dts: Use 32KiHz oscillator on devkit8000

 arch/arm/boot/dts/omap3-devkit8000-common.dtsi | 18 ++++++++++++++
 arch/arm/boot/dts/omap3-devkit8000.dts         | 33 --------------------------
 drivers/clocksource/timer-ti-dm-systimer.c     |  3 +--
 3 files changed, 19 insertions(+), 35 deletions(-)
