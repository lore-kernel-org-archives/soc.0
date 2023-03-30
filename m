Return-Path: <SRS0=FmMO=7W=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09355C761A6
	for <soc@archiver.kernel.org>; Thu, 30 Mar 2023 12:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4494C433A1; Thu, 30 Mar 2023 12:46:52 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id E9353C4339E;
	Thu, 30 Mar 2023 12:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9353C4339E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id E807380FE;
	Thu, 30 Mar 2023 12:46:49 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v6.4
Date: Thu, 30 Mar 2023 15:46:45 +0300
Message-Id: <pull-1680180389-756753@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.4/dt-signed

for you to fetch changes up to e341f338180c84cd98af3016cf5bcfde45a041fb:

  ARM: dts: omap: Drop ti,omap36xx compatible (2023-03-28 10:20:42 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v6.4

Devicetree changes for omaps for gta04, Phytec am335x devices, and to
drop a obsolete compatible property:

- A non-urgent fix for gta04 to enable more dma channels for some audio
  configurations

- Update the dts compatible and vendor prefixes for gta04

- A series of updates for Phytec am335x based boards to configure more
  devices like rtc and audio, and a few clean-up patches

- A change to drop the usage of "ti,omap36xx" compatible, the driver
  code already checks for "ti,omap3630" that is also alread set in the
  dts files. This makes the yaml binding conversion a bit simpler.

----------------------------------------------------------------
Andrew Davis (1):
      ARM: dts: omap: Drop ti,omap36xx compatible

H. Nikolaus Schaller (2):
      ARM: dts: gta04: fix excess dma channel usage
      ARM: dts: omap3-gta04: fix compatible record for GTA04 board

Steffen Hemer (8):
      ARM: dts: am335x-phycore-som: Add alias for TPS65910 RTC
      ARM: dts: am335x-wega: Fix audio codec by using simple-audio-card driver.
      ARM: dts: am335x-wega: Change node name of sound card, remove underscores.
      ARM: dts: am335x-pcm-935: Remove underscore in node names.
      ARM: dts: am335x-regor: Remove underscore in node names.
      ARM: dts: am335x-phycore-som: Remove underscore in node names.
      ARM: dts: am335x-pcm-953: Remove superseded/invalid LED trigger.
      ARM: dts: am335x-phycore-som: Remove superseded/invalid GPMC NAND type.

 .../devicetree/bindings/vendor-prefixes.yaml       |  4 ++
 arch/arm/boot/dts/am335x-pcm-953.dtsi              | 24 +++++----
 arch/arm/boot/dts/am335x-phycore-som.dtsi          | 10 ++--
 arch/arm/boot/dts/am335x-regor.dtsi                | 18 +++----
 arch/arm/boot/dts/am335x-wega.dtsi                 | 57 ++++++++++++++--------
 arch/arm/boot/dts/omap3-beagle-xm.dts              |  2 +-
 arch/arm/boot/dts/omap3-cm-t3730.dts               |  2 +-
 arch/arm/boot/dts/omap3-gta04.dtsi                 | 19 +++++++-
 arch/arm/boot/dts/omap3-igep0020-rev-f.dts         |  2 +-
 arch/arm/boot/dts/omap3-igep0020.dts               |  2 +-
 arch/arm/boot/dts/omap3-igep0030-rev-g.dts         |  2 +-
 arch/arm/boot/dts/omap3-igep0030.dts               |  2 +-
 arch/arm/boot/dts/omap3-lilly-dbb056.dts           |  2 +-
 arch/arm/boot/dts/omap3-n9.dts                     |  2 +-
 arch/arm/boot/dts/omap3-n950.dts                   |  2 +-
 arch/arm/boot/dts/omap3-overo-storm-alto35.dts     |  2 +-
 arch/arm/boot/dts/omap3-overo-storm-chestnut43.dts |  2 +-
 arch/arm/boot/dts/omap3-overo-storm-gallop43.dts   |  2 +-
 arch/arm/boot/dts/omap3-overo-storm-palo35.dts     |  2 +-
 arch/arm/boot/dts/omap3-overo-storm-palo43.dts     |  2 +-
 arch/arm/boot/dts/omap3-overo-storm-summit.dts     |  2 +-
 arch/arm/boot/dts/omap3-overo-storm-tobi.dts       |  2 +-
 arch/arm/boot/dts/omap3-overo-storm-tobiduo.dts    |  2 +-
 arch/arm/boot/dts/omap3-pandora-1ghz.dts           |  2 +-
 arch/arm/boot/dts/omap3-sbc-t3730.dts              |  2 +-
 arch/arm/boot/dts/omap3-sniper.dts                 |  2 +-
 arch/arm/boot/dts/omap3-zoom3.dts                  |  2 +-
 27 files changed, 103 insertions(+), 71 deletions(-)
