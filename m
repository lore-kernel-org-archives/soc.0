Return-Path: <SRS0=gIsA=EB=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24080EB64DD
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 04:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4CFEC433C7; Wed, 16 Aug 2023 04:02:48 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 89E05C433C8;
	Wed, 16 Aug 2023 04:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89E05C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 7F90280BB;
	Wed, 16 Aug 2023 04:02:45 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date: Wed, 16 Aug 2023 07:02:41 +0300
Message-ID: <pull-1692158536-457318@atomide.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.5/fixes-signed

for you to fetch changes up to 7aff940ec88658f7fd21137cf515956a7deaaf54:

  ARM: dts: am335x-bone-common: Add vcc-supply for on-board eeprom (2023-08-14 13:27:19 +0300)

----------------------------------------------------------------
Fixes for omaps

A fix external abort on non-linefetch for am335x that is fixed with a flush
of posted write. And two networking fixes for beaglebone mostly for revision
c3 to do phy reset with a gpio and to fix a boot time warning.

----------------------------------------------------------------
Shengyu Qu (2):
      ARM: dts: am335x-bone-common: Add GPIO PHY reset on revision C3 board
      ARM: dts: am335x-bone-common: Add vcc-supply for on-board eeprom

Tony Lindgren (2):
      bus: ti-sysc: Flush posted write on enable before reset
      Merge branch 'omap-for-v6.5/ti-sysc' into omap-for-v6.5/fixes

 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 9 +++++++++
 drivers/bus/ti-sysc.c                             | 2 ++
 2 files changed, 11 insertions(+)
