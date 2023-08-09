Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BDBEB64DD
	for <soc@archiver.kernel.org>; Wed,  9 Aug 2023 10:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B847DC433CA; Wed,  9 Aug 2023 10:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57195C433C8;
	Wed,  9 Aug 2023 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691575245;
	bh=31JHN1rxKC/BwEUDeiuKU353RZNtav81QeiPyYQm7bc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=ZF9VOD1NcJw/0kidVUOn736v1+Q/76QryF0t9yrYbwx52vtd66zroFAuE60XsCsX/
	 de25N/rp3AyeOqK3rOU+2O5UWWLY5yv+ET5468Rcc2xaIXexF1zC3kN5XTvy0otOqc
	 pCPc8Eujb0+Fefnba8ig14iz2eI1eFXwKh+dencCJcw/LPxBAXka58ZS7PJ9Qy0Udw
	 Bpl0+64Y5ECqZmQ4td9tRB4Y17458nAGKTwHT0yLeJJ7p1gnmxn5vSOqfNNJtde+cl
	 ZDsNWbxc1NckNbx/AR/Jrv02vtNYSEvS2Ared2mSsYdCyRINDXkkMW31Qm7wkKTf4r
	 mi6zZo3b418Ug==
Date: Wed, 9 Aug 2023 18:00:34 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.5, 2nd round
Message-ID: <20230809100034.GS151430@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 53cab4d871690c49fac87c657cbf459e39c5b93b:

  soc: imx: imx8mp-blk-ctrl: register HSIO PLL clock as bus_power_dev child (2023-07-19 15:44:02 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.5-2

for you to fetch changes up to 78e869dd8b2ba19765ac9b05cdea3e432d1dc188:

  arm64: dts: imx93: Fix anatop node size (2023-08-06 11:50:04 +0800)

----------------------------------------------------------------
i.MX fixes for 6.5, 2nd round:

- Fix i.MX93 ANATOP 'reg' resource size to avoid overlapping with TMU
  memory area.
- Fix RTC interrupt level on imx6qdl-phytec-mira board.
- Remove LDB endpoint from from the common imx6sx.dtsi as it causes
  regression for boards that has the LCDIF connected directly to
  a parallel display.
- Drop CSI1 PHY reference clock configuration from i.MX8MM/N device tree
  to avoid overclocking.
- Set a proper default tuning step for i.MX6SX and i.MX7D uSDHC to fix
  a tuning failure seen with some SD cards.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: imx93: Fix anatop node size

Andrej Picej (1):
      ARM: dts: imx6: phytec: fix RTC interrupt level

Fabio Estevam (2):
      ARM: dts: imx6sx: Remove LDB endpoint
      arm64: dts: imx8mm: Drop CSI1 PHY reference clock configuration

Marek Vasut (1):
      arm64: dts: imx8mn: Drop CSI1 PHY reference clock configuration

Xiaolei Wang (2):
      ARM: dts: imx: Set default tuning step for imx7d usdhc
      ARM: dts: imx: Set default tuning step for imx6sx usdhc

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              | 14 ++++++++------
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |  6 ++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  7 +++----
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  6 ++----
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  2 +-
 6 files changed, 21 insertions(+), 16 deletions(-)
