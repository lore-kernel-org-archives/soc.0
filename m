Return-Path: <SRS0=vZI3=D3=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8754AC001B0
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 09:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E876C433CA; Thu, 10 Aug 2023 09:17:10 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id E9049C433C9;
	Thu, 10 Aug 2023 09:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9049C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 53F758200;
	Thu, 10 Aug 2023 09:17:07 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/4] Devicetree changes for omaps for v6.6
Date: Thu, 10 Aug 2023 12:16:52 +0300
Message-ID: <pull-1691658952-110529@atomide.com-3>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <pull-1691658952-110529@atomide.com>
References: <pull-1691658952-110529@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/dt-take2-signed

for you to fetch changes up to 5821d766932cc816518bdc5304b4fe4e99f65aaf:

  arm: dts: ti: omap: Fix OPP table node names (2023-07-31 09:25:10 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v6.6

Updates for opp and pinctrl nodes to follow the devicetree bindings.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: ti: split interrupts per cells
      ARM: dts: ti: add missing space before {

Nishanth Menon (3):
      arm: dts: ti: omap: omap36xx: Rename opp_supply nodename
      arm: dts: ti: omap: am5729-beagleboneai: Drop the OPP
      arm: dts: ti: omap: Fix OPP table node names

Tony Lindgren (1):
      ARM: dts: Unify pinctrl-single pin group nodes for davinci

 arch/arm/boot/dts/ti/davinci/da850-evm.dts         |  4 +-
 arch/arm/boot/dts/ti/davinci/da850-lcdk.dts        |  4 +-
 arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts    |  4 +-
 arch/arm/boot/dts/ti/davinci/da850.dtsi            | 67 ++++++++++------------
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |  3 +-
 .../boot/dts/ti/omap/am335x-osd335x-common.dtsi    |  3 +-
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           | 10 ++--
 arch/arm/boot/dts/ti/omap/am33xx.dtsi              | 30 ++++++----
 arch/arm/boot/dts/ti/omap/am3517.dtsi              |  6 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi              | 15 +++--
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       | 14 +++--
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           | 12 ++--
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |  6 --
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |  9 ++-
 arch/arm/boot/dts/ti/omap/dra76x.dtsi              |  3 +-
 arch/arm/boot/dts/ti/omap/omap34xx.dtsi            | 12 ++--
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            | 14 +++--
 arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi  |  6 +-
 19 files changed, 121 insertions(+), 103 deletions(-)
