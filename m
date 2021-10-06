Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B5EC433F5
	for <soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:57:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A951F610CE; Wed,  6 Oct 2021 12:57:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ABEA61056;
	Wed,  6 Oct 2021 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633525060;
	bh=QqIeRMJUQlvsvOrLinLlGC2/rHslcS9kTy4RmILZ5iw=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=GdlLUmZT4itRtIYFGGOFn4TNy+SRb604n0/r+fiIFgdBFZ3WCQMQZxZd3P0OpgnQg
	 EYEWXqUrZPHHDR6/sO3MGgIKKFoh6fBAOwxcayyPPKnTxYgUSMGclnWjHnR7Be5Oh6
	 ZeG50jquZR04FEv9taVYXfTuw+BfyHpHAgOq67zRXmPndmTA2UcKouiGCZFmdRhOOG
	 3rrAPnLTTgjxtwfflR9KcmH/gqQX9s0HpdOi5jqbaMVYBSrxb6xSu9PkivI4dD+lpV
	 +9iHzECkbUNRVotRCG5GleStt32DE61ID8Ozg4mvghf76+4GFPzDRg3WxNLqGOvdj6
	 IrosiCWJ7oFcQ==
Date: Wed, 6 Oct 2021 20:57:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.15, round 2
Message-ID: <20211006125734.GA10197@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit c54467482ffd407a4404c990697f432bfcb6cdc4:

  ARM: imx_v6_v7_defconfig: enable fb (2021-09-22 16:47:34 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-2

for you to fetch changes up to 3518441dda666696707afe933586151c0fb29db0:

  arm64: dts: imx8m*-venice-gw7902: fix M2_RST# gpio (2021-10-05 14:26:21 +0800)

----------------------------------------------------------------
i.MX fixes for 5.15, round 2:

- A couple of fixes from Haibo Chen to update SPI NOR TX bus width for
  i.MX6 and i.MX8 boards.  This becomes necessary because spi-nor driver
  starts using the setting in DT.
- Mark buck2 always-on for i.MX8MM Kontron-n801x-som board to avoid the
  core supply being turned off unexpectedly.
- Fix eSDHC2 device tree settings for LS1028A SoC.
- Disable GIC CPU interface before calling stby-poweroff sequence to fix
  power-off failure on i.MX6.
- Fix M2_RST# GPIO pinmux on i.MX8M venice-gw7902 boards.

----------------------------------------------------------------
Haibo Chen (2):
      ARM: dts: imx: change the spi-nor tx
      arm64: dts: imx8: change the spi-nor tx

Heiko Thiery (1):
      arm64: dts: imx8mm-kontron-n801x-som: do not allow to switch off buck2

Michael Walle (1):
      arm64: dts: ls1028a: fix eSDHC2 node

Oleksij Rempel (1):
      ARM: imx6: disable the GIC CPU interface before calling stby-poweroff sequence

Tim Harvey (1):
      arm64: dts: imx8m*-venice-gw7902: fix M2_RST# gpio

 arch/arm/boot/dts/imx6sx-sdb.dts                            | 4 ++--
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi                     | 2 +-
 arch/arm/mach-imx/pm-imx6.c                                 | 2 ++
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi              | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-som.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi       | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                | 2 ++
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 2 +-
 13 files changed, 17 insertions(+), 12 deletions(-)
