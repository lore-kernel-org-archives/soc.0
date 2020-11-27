Return-Path: <SRS0=zdl7=FB=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0668C63777
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 06:58:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 66FF5221FF; Fri, 27 Nov 2020 06:58:32 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 0536221D81;
	Fri, 27 Nov 2020 06:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0536221D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tony@atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 2F21D8063;
	Fri, 27 Nov 2020 06:58:38 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.10-rc cycle
Date: Fri, 27 Nov 2020 08:58:21 +0200
Message-Id: <pull-1606460270-864284@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/fixes-rc5-signed

for you to fetch changes up to 05d5de6ba7dbe490dd413b5ca11d0875bd2bc006:

  ARM: dts: dra76x: m_can: fix order of clocks (2020-11-19 11:37:57 +0200)

----------------------------------------------------------------
Fixes for omaps for various issues noticed during the -rc cycle:

- Earlier omap4 cpuidle fix was incomplete and needs to use a
  configured idle state instead

- Fix am4 cpsw driver compatible to avoid invalid resource error
  for the legacy driver

- Two kconfig fixes for genpd support that we added for for v5.10
  for proper location of the option and adding missing option

- Fix ti-sysc reset status checking on enabling modules to ignore
  quirky modules with reset status only usable when the quirk is
  activated during reset. Also fix bogus resetdone warning for
  cpsw and modules with no sysst register reset status bit

- Suppress a ti-sysc warning for timers reserved as system timers

- Fix the ordering of clocks for dra7 m_can

----------------------------------------------------------------
Grygorii Strashko (2):
      ARM: dts: am437x-l4: fix compatible for cpsw switch dt node
      bus: ti-sysc: suppress err msg for timers used as clockevent/source

Marc Kleine-Budde (1):
      ARM: dts: dra76x: m_can: fix order of clocks

Tony Lindgren (6):
      ARM: OMAP2+: Fix location for select PM_GENERIC_DOMAINS
      ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF
      bus: ti-sysc: Fix reset status check for modules with quirks
      bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw
      ARM: OMAP2+: Manage MPU state properly for omap_enter_idle_coupled()
      Merge tag 'ti-sysc-fixes' into fixes

 arch/arm/boot/dts/am437x-l4.dtsi      |  2 +-
 arch/arm/boot/dts/dra76x.dtsi         |  4 ++--
 arch/arm/mach-omap2/Kconfig           |  3 ++-
 arch/arm/mach-omap2/cpuidle44xx.c     |  8 +++++---
 drivers/bus/ti-sysc.c                 | 29 +++++++++++++++++++----------
 include/linux/platform_data/ti-sysc.h |  1 +
 6 files changed, 30 insertions(+), 17 deletions(-)
