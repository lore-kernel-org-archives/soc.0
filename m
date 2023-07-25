Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31351C001DF
	for <soc@archiver.kernel.org>; Tue, 25 Jul 2023 07:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD64DC433CA; Tue, 25 Jul 2023 07:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EE0C433C8;
	Tue, 25 Jul 2023 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690271929;
	bh=NfGM/BrvYpH5oYeMuLyKNCNu5EccECS+fUp9enwUCAI=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=mb9myKfAMxbxhDCNBteWgcS+p1ZtT1P9A/nshC7xd0GAiWQVbiXq7l35JfEF0gXqn
	 PGZBAs17fxa9kb83smKvA7o5HPwCVTzO2NbzoZ3xXxjyQzeYLo1s84fyrJ9If/oDZh
	 AcOeArRhd8MaOSH3OtFxjpVNDgEgCu2XUWzLG+J7TJkR/3V0LWVW9H8L7z4DPmrQ0T
	 5Eu9j09H0uwHF+qjlY9tu/B+BrgA4OftJMILolDGOA5y1uvEUzrk/PgKqu+Md6mHzg
	 YYesiXaE67RGaBrgg2Fm7raoqOOTLw3ZVpyKuwo50KcpSOcFn9iVnXM+VUUWrsdk3X
	 7nRFA97KGV+UA==
Date: Tue, 25 Jul 2023 15:58:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.5
Message-ID: <20230725075837.GR151430@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.5

for you to fetch changes up to 53cab4d871690c49fac87c657cbf459e39c5b93b:

  soc: imx: imx8mp-blk-ctrl: register HSIO PLL clock as bus_power_dev child (2023-07-19 15:44:02 +0800)

----------------------------------------------------------------
i.MX fixes for 6.5:

- A couple of ARM DTS fixes for i.MX6SLL usbphy and supported CPU
  frequency of sk-imx53 board
- Add missing pull-up for imx8mn-var-som onboard PHY reset pinmux
- A couple of imx8mm-venice fixes from Tim Harvey to diable disp_blk_ctrl
- A couple of phycore-imx8mm fixes from Yashwanth Varakala to correct
  VPU label and gpio-line-names
- Fix imx8mp-blk-ctrl driver to register HSIO PLL clock as bus_power_dev
  child, so that runtime PM can translate into the necessary GPC power
  domain action

----------------------------------------------------------------
Benjamin Gaignard (1):
      arm64: dts: freescale: Fix VPU G2 clock

Dmitry Baryshkov (1):
      ARM: dts: nxp/imx: limit sk-imx53 supported frequencies

Hugo Villeneuve (1):
      arm64: dts: imx8mn-var-som: add missing pull-up for onboard PHY reset pinmux

Lucas Stach (1):
      soc: imx: imx8mp-blk-ctrl: register HSIO PLL clock as bus_power_dev child

Tim Harvey (2):
      arm64: dts: imx8mm-venice-gw7903: disable disp_blk_ctrl
      arm64: dts: imx8mm-venice-gw7904: disable disp_blk_ctrl

Xu Yang (1):
      ARM: dts: nxp/imx6sll: fix wrong property name in usbphy node

Yashwanth Varakala (2):
      arm64: dts: phycore-imx8mm: Label typo-fix of VPU
      arm64: dts: phycore-imx8mm: Correction in gpio-line-names

 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts                | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi                      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi       |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts      |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts      |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi           |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi                   |  2 +-
 drivers/soc/imx/imx8mp-blk-ctrl.c                           |  2 +-
 9 files changed, 25 insertions(+), 7 deletions(-)
