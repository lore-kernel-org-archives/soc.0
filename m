Return-Path: <SRS0=CGtJ=TG=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D98C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Feb 2022 08:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECFC9C340EF; Wed, 23 Feb 2022 08:58:53 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 3B626C340E7;
	Wed, 23 Feb 2022 08:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B626C340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 8F6F780A4;
	Wed, 23 Feb 2022 08:57:56 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v5.18
Date: Wed, 23 Feb 2022 10:58:47 +0200
Message-Id: <pull-1645606669-127734@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.18/dt-signed

for you to fetch changes up to 668e2f58ed8b1920143ea1072ad8d02440132306:

  ARM: dts: am335x-sancloud-bbe-extended-wifi: New devicetree (2022-02-18 10:33:15 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v5.18

Devicetree changes for omaps for v5.18:

- The devicetree node naming for pdu001 RTC name gets corrected

- For logicpd-torpedo baseboard, isp1763 USB controller gets added

- New board variant for SanCloud BBE Extended WiFi gets added

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: logicpd-torpedo: Add isp1763 support to baseboard

Paul Barker (1):
      ARM: dts: am335x-sancloud-bbe-extended-wifi: New devicetree

Thierry Reding (1):
      ARM: dts: am334x: pdu001: Use correct node name for RTC

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/am335x-pdu001.dts                |   2 +-
 .../boot/dts/am335x-sancloud-bbe-extended-wifi.dts | 113 +++++++++++++++++++++
 arch/arm/boot/dts/logicpd-torpedo-35xx-devkit.dts  |   8 ++
 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts  |   9 ++
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   |  41 +++++++-
 6 files changed, 172 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-extended-wifi.dts
