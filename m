Return-Path: <SRS0=HhLM=RB=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F9CC433EF
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 13:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EBDFC36AE6; Thu, 16 Dec 2021 13:04:55 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 61FA3C36AE4;
	Thu, 16 Dec 2021 13:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61FA3C36AE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 1C17580DB;
	Thu, 16 Dec 2021 13:05:28 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v5.17
Date: Thu, 16 Dec 2021 15:04:41 +0200
Message-Id: <pull-1639659798-679261@atomide.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.17/dt-signed

for you to fetch changes up to fa0fdb78cb5d4cde00430ec481f09fbe7c029376:

  ARM: dts: am335x: Use correct vendor prefix for Asahi Kasei Corp. (2021-12-09 10:06:42 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v5.17 merge window

These changes are mostly minor non-urgent fixes for typos and binding checks.
The system-power-controller gets configured for more am3 devices as it's not
am335x-boneblack speicif. For for am437x we add magnetic card reader support.

Note that the asahi-kasei,ak8975 binding changes may produce a new binding
check warning as the binding related change is merged separately.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: dts: elpida_ecb240abacn: Change Elpida compatible

Drew Fustini (2):
      ARM: dts: am335x-boneblack-common: move system-power-controller
      ARM: dts: am335x-icev2: Add system-power-controller to RTC node

Geert Uytterhoeven (1):
      ARM: dts: motorola-mapphone: Drop second ti,wlcore compatible value

Miquel Raynal (3):
      ARM: dts: am437x-cm-t43: Use a correctly spelled DT property
      ARM: dts: am43xx: Describe the magnetic reader/ADC1 hardware module
      ARM: dts: am437x-gp-evm: enable ADC1

Thierry Reding (1):
      ARM: dts: am335x: Use correct vendor prefix for Asahi Kasei Corp.

 arch/arm/boot/dts/am335x-bone-common.dtsi       |  1 +
 arch/arm/boot/dts/am335x-boneblack-common.dtsi  |  4 ----
 arch/arm/boot/dts/am335x-boneblue.dts           |  2 +-
 arch/arm/boot/dts/am335x-icev2.dts              |  4 ++++
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts     |  2 +-
 arch/arm/boot/dts/am437x-cm-t43.dts             |  2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts             |  8 +++++++
 arch/arm/boot/dts/am437x-l4.dtsi                | 31 +++++++++++++++++++++++--
 arch/arm/boot/dts/am43xx-clocks.dtsi            |  7 ++++++
 arch/arm/boot/dts/elpida_ecb240abacn.dtsi       |  2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi |  2 +-
 11 files changed, 54 insertions(+), 11 deletions(-)
