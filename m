Return-Path: <SRS0=8OOU=O7=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86D9C433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 11:02:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 98A6B61038; Mon, 11 Oct 2021 11:02:50 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 271C160EB4;
	Mon, 11 Oct 2021 11:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 271C160EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id AD9BD8061;
	Mon, 11 Oct 2021 11:03:19 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.16
Date: Mon, 11 Oct 2021 14:02:42 +0300
Message-Id: <pull-1633950030-501948@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/soc-signed

for you to fetch changes up to e60150de94ef1508e77cbf5956ecc0ca84c4fc9b:

  ARM: OMAP2+: Drop unused CM defines for am3 (2021-10-06 12:36:23 +0300)

----------------------------------------------------------------
SoC changes for omaps for v5.16

Few non-urgent comment typo fixes and few changes to drop unused auxdata.
Then a series of changes to drop some a pile of old unused defines. These
can be now dropped for the SoCs that have been updated to use devicetree
data with drivers/clock and drivers/soc device drivers.

----------------------------------------------------------------
Jason Wang (2):
      ARM: OMAP2+: Fix typo in some comments
      ARM: OMAP2+: Fix comment typo

Tony Lindgren (11):
      ARM: OMAP2+: Drop old unused omap5_uevm_legacy_init()
      ARM: OMAP2+: Drop unused old auxdata for dra7x_evm_mmc_quirk()
      ARM: OMAP2+: Drop unused PRM defines for dra7
      ARM: OMAP2+: Drop unused PRM defines for omap5
      ARM: OMAP2+: Drop unused PRM defines for omap4
      ARM: OMAP2+: Drop unused PRM defines for am4
      ARM: OMAP2+: Drop unused PRM defines for am3
      ARM: OMAP2+: Drop unused CM defines for dra7
      ARM: OMAP2+: Drop unused CM and SCRM defines for omap5
      ARM: OMAP2+: Drop unused CM and SCRM defines for omap4
      ARM: OMAP2+: Drop unused CM defines for am3

 arch/arm/mach-omap2/cm-regbits-44xx.h | 101 ------
 arch/arm/mach-omap2/cm1_44xx.h        | 174 ----------
 arch/arm/mach-omap2/cm1_54xx.h        | 168 ---------
 arch/arm/mach-omap2/cm1_7xx.h         | 263 --------------
 arch/arm/mach-omap2/cm2_44xx.h        | 386 ---------------------
 arch/arm/mach-omap2/cm2_54xx.h        | 325 ------------------
 arch/arm/mach-omap2/cm2_7xx.h         | 449 ------------------------
 arch/arm/mach-omap2/cm33xx.h          | 280 ---------------
 arch/arm/mach-omap2/omap_hwmod.c      |   6 +-
 arch/arm/mach-omap2/pdata-quirks.c    |  36 --
 arch/arm/mach-omap2/powerdomain.c     |   6 +-
 arch/arm/mach-omap2/prcm43xx.h        |  94 -----
 arch/arm/mach-omap2/prm33xx.h         |  40 ---
 arch/arm/mach-omap2/prm44xx.h         | 630 ----------------------------------
 arch/arm/mach-omap2/prm54xx.h         | 358 -------------------
 arch/arm/mach-omap2/prm7xx.h          | 613 ---------------------------------
 arch/arm/mach-omap2/scrm44xx.h        | 141 --------
 arch/arm/mach-omap2/scrm54xx.h        | 228 ------------
 18 files changed, 6 insertions(+), 4292 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/scrm54xx.h
