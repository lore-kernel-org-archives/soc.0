Return-Path: <SRS0=UMQL=3Z=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB721C4167B
	for <soc@archiver.kernel.org>; Fri, 25 Nov 2022 08:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7930CC43141; Fri, 25 Nov 2022 08:08:53 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 4E7CEC433C1;
	Fri, 25 Nov 2022 08:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E7CEC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 7882C80CD;
	Fri, 25 Nov 2022 08:08:44 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree fixes for omaps for v6.2
Date: Fri, 25 Nov 2022 10:08:42 +0200
Message-Id: <pull-1669363695-856423@atomide.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 8950f345a67d8046d2472dd6ea81fa18ef5b4844:

  ARM: dts: am335x-pcm-953: Define fixed regulators in root node (2022-11-09 10:09:51 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.2/dt-signed

for you to fetch changes up to 4f15fc7c0f28ffcd6e9a56396db6edcdfa4c9925:

  ARM: dts: Unify pwm-omap-dmtimer node names (2022-11-22 14:15:09 +0200)

----------------------------------------------------------------
Devicetree fixes for omaps for v6.2

Two devicetree fixes for omaps. These fixes are not urgent and
can wait for the merge window:

- Fix up the node names and missing #pwm-cells property for
  ti,omap-dmtimer-pwm to avoid warnings when the the related
  yaml binding gets merged

- Fix TDA998x port addressing

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: dts: am335x: Fix TDA998x ports addressing

Tony Lindgren (1):
      ARM: dts: Unify pwm-omap-dmtimer node names

 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi     | 7 ++++++-
 arch/arm/boot/dts/am335x-guardian.dts            | 3 ++-
 arch/arm/boot/dts/am335x-myirtech-myd.dts        | 7 ++++++-
 arch/arm/boot/dts/am3517-evm.dts                 | 2 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi | 2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi  | 4 ++--
 arch/arm/boot/dts/omap3-gta04.dtsi               | 2 +-
 arch/arm/boot/dts/omap3-n900.dts                 | 2 +-
 8 files changed, 20 insertions(+), 9 deletions(-)
