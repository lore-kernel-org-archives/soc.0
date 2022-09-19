Return-Path: <SRS0=1WsQ=ZW=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA75DECAAD3
	for <soc@archiver.kernel.org>; Mon, 19 Sep 2022 11:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5390C433B5; Mon, 19 Sep 2022 11:42:43 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 7021AC433D6;
	Mon, 19 Sep 2022 11:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7021AC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 21C488050;
	Mon, 19 Sep 2022 11:34:37 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps
Date: Mon, 19 Sep 2022 14:42:37 +0300
Message-Id: <pull-1663587735-853102@atomide.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-6.1/dt-signed

for you to fetch changes up to 8e9d75fd2ec2ad6c7b19dbafe1be966fd13e0f1d:

  ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 2-port devices (2022-09-07 08:18:45 +0300)

----------------------------------------------------------------
Devicetree changes for omaps

A series of changes for am335x baltos and netcom devices to update nand
transfer type and configure gpio-line-names.

----------------------------------------------------------------
Yegor Yefremov (6):
      ARM: dts: am335x-baltos: change nand-xfer-type
      ARM: dts: am335x-baltos: add GPIO names for ir3220 and ir5221 devices
      ARM: dts: am335x-baltos: add GPIO names for ir2110 device
      ARM: dts: am335x-netcan: add GPIO names for NetCAN Plus device
      ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 8-port devices
      ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 2-port devices

 arch/arm/boot/dts/am335x-baltos-ir2110.dts   | 144 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir3220.dts   | 148 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir5221.dts   | 148 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-baltos.dtsi         |   2 +-
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts | 144 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts | 144 +++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts | 156 +++++++++++++++++++++++++++
 7 files changed, 885 insertions(+), 1 deletion(-)
