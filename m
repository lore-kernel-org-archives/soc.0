Return-Path: <SRS0=FmMO=7W=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1F2C6FD1D
	for <soc@archiver.kernel.org>; Thu, 30 Mar 2023 12:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87346C433EF; Thu, 30 Mar 2023 12:47:47 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 42AE2C4339C;
	Thu, 30 Mar 2023 12:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42AE2C4339C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id AE6F580FE;
	Thu, 30 Mar 2023 12:47:44 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree overlays for omaps for v6.4
Date: Thu, 30 Mar 2023 15:47:42 +0300
Message-Id: <pull-1680180448-508978@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.4/dt-overlays-signed

for you to fetch changes up to a63945c3b56174537a4a655676fbe965f974b6b1:

  ARM: dts: am57xx-idk: Add IDK displays and touchscreens (2023-03-27 11:07:13 +0300)

----------------------------------------------------------------
Devicetree overlays for omaps for v6.4

Devicetree overlays for omaps to enable the optional LCD and touchscreen
modules on am57xx-evm and am57xx-idk boards.

----------------------------------------------------------------
Andrew Davis (3):
      ARM: dts: ti: Add AM57xx GP EVM board support
      ARM: dts: ti: Add AM57xx GP EVM Rev A3 board support
      ARM: dts: am57xx-idk: Add IDK displays and touchscreens

 arch/arm/boot/dts/Makefile                        |   8 ++
 arch/arm/boot/dts/am571x-idk-touchscreen.dtso     |  32 ++++++
 arch/arm/boot/dts/am572x-idk-touchscreen.dtso     |  32 ++++++
 arch/arm/boot/dts/am57xx-evm.dtso                 | 127 ++++++++++++++++++++++
 arch/arm/boot/dts/am57xx-idk-lcd-osd101t2045.dtso |  63 +++++++++++
 arch/arm/boot/dts/am57xx-idk-lcd-osd101t2587.dtso |  66 +++++++++++
 6 files changed, 328 insertions(+)
 create mode 100644 arch/arm/boot/dts/am571x-idk-touchscreen.dtso
 create mode 100644 arch/arm/boot/dts/am572x-idk-touchscreen.dtso
 create mode 100644 arch/arm/boot/dts/am57xx-evm.dtso
 create mode 100644 arch/arm/boot/dts/am57xx-idk-lcd-osd101t2045.dtso
 create mode 100644 arch/arm/boot/dts/am57xx-idk-lcd-osd101t2587.dtso
