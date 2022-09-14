Return-Path: <SRS0=us5G=ZR=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E37AECAAD8
	for <soc@archiver.kernel.org>; Wed, 14 Sep 2022 07:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3009C433B5; Wed, 14 Sep 2022 07:32:27 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 91E17C433C1;
	Wed, 14 Sep 2022 07:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91E17C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 6567C80F0;
	Wed, 14 Sep 2022 07:24:27 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] SoC fixes for omaps
Date: Wed, 14 Sep 2022 10:32:16 +0300
Message-Id: <pull-1663140667-273537@atomide.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 0b3acd1cc0222953035d18176b1e4aa06624fd6e:

  Merge tag 'driver-core-6.0-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core (2022-09-02 10:55:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-6.0/fixes-signed

for you to fetch changes up to 2a906db2824b75444982f5e9df870106982afca8:

  Merge branch 'am5748-fix' into fixes (2022-09-06 09:45:27 +0300)

----------------------------------------------------------------
Two fixes for omaps

A fix to remove usb4 from am5748 as it does not exist on the SoC, and
a fix for am335x mmc dma that wired direct and should not use the xbar.

Note that the am5748 fix depends on the recent deferred probe regression
fixes to boot. I ended up picking the merge commit to base it on as it
describes what got fixed quite nicely rather than a -rc tag.

----------------------------------------------------------------
Romain Naour (1):
      ARM: dts: am5748: keep usb4_tm disabled

Tony Lindgren (1):
      Merge branch 'am5748-fix' into fixes

YuTong Chang (1):
      ARM: dts: am33xx: Fix MMCHS0 dma properties

 arch/arm/boot/dts/am33xx-l4.dtsi | 3 +--
 arch/arm/boot/dts/am5748.dtsi    | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)
