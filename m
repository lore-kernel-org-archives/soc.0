Return-Path: <SRS0=QZeH=L6=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAFBC4345F
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 04:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1960DC2BBFC; Thu, 25 Apr 2024 04:44:17 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C345BC113CC;
	Thu, 25 Apr 2024 04:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C345BC113CC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 111B56054A;
	Thu, 25 Apr 2024 04:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1714020247;
	bh=pKxM3kug+6FaG53pNZPx1vcG2su9BKkq9n/vgd6jrCE=;
	h=From:To:Cc:Subject:Date:From;
	b=g0mgFA3G24Afpq5sNBMk/9N0QpWr0aV+DpH+/1TB3chGYKQLvFq5T+lAfmu+jGOKg
	 /8IP+zN4ui/CJf7wsyK27aaXXchQNr9flJ9rig7/AMhgp0XEcbD9Kz3JIlhkNz2Nz2
	 f8l9EDX6L6PXDyG5fC3U42JpoWQMdDWElMWg5BPBo4HF2N+KZ5zEa4MFHMpJElfiNL
	 deM4sz3dMCFUprrtLD6BVDl4gb2TH0aYBvQkJkTag8JVM3pD92DRoh0XztfqThUFlc
	 SYoC5AOwVSzZJ64A4z5xNamij/PC+5Kx0G3bKdMCtlkKwioX1/XB+ct3EX00KAsANg
	 lAE88RilLYUpQ==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v6.10
Date: Thu, 25 Apr 2024 07:43:36 +0300
Message-ID: <pull-1714020191-304166@atomide.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.10/dt-signed

for you to fetch changes up to 32f4c19f6a52bdfa6ec73a067b6e7382b8d6653e:

  ARM: dts: dra7: Use clksel binding for CTRL_CORE_SMA_SW_0 (2024-04-10 09:15:54 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v6.10

Update n900 charge limit, and make use of the clksel binding for dra7
for the clksel clocks and other dpll output related clocks.

----------------------------------------------------------------
Arthur Demchenkov (1):
      ARM: dts: n900: set charge current limit to 950mA

Tony Lindgren (12):
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_CORE
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_DSP
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_IVA
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_GPU
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_DRR
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_GMAC
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_EVE
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_CORE
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_ABE_PLL_SYS
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_PER
      ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_USB
      ARM: dts: dra7: Use clksel binding for CTRL_CORE_SMA_SW_0

 arch/arm/boot/dts/ti/omap/dra76x.dtsi        |  63 ++++---
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 270 ++++++++++++++++++---------
 arch/arm/boot/dts/ti/omap/omap3-n900.dts     |   2 +-
 3 files changed, 221 insertions(+), 114 deletions(-)
