Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2DBC433F5
	for <soc@archiver.kernel.org>; Sat, 29 Jan 2022 07:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC369C340EA; Sat, 29 Jan 2022 07:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D74C340E5;
	Sat, 29 Jan 2022 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643441516;
	bh=J59iH+nY7UbkaBCU5KG1GKFs0EwfRuIjEGgXOw1i00A=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=aS/DZDnYClz5FZD67KfRW1Ox/7gWNXwWTzOP92RNas9Yz766ydOEq+whl505jSZ9Z
	 r4cLIWJhV1tfzbt6+I9KCeXmdqpZ0eJquB+l7MS7bpfwaso1yetKIQMfN7agrwnOYK
	 KFIsoELRLFxka1oyvwBU1PGUywX31JKfX6ctUKZsKCWA/RFfimX0AFwb7xSio+fVkp
	 meVbDulKf/lY8gpTHujW7VwJcN1D8uZU5W+0dRO7+Am6POJ0jvvaSTeyMMEtC/ecgI
	 xKIxDekC6o0YKeXgOMc0gtzJwIiNA8Z3FcF7QbHnIqEGIoB/pwVE78VubBKge13jkn
	 7VrkDs1LI3/sQ==
Date: Sat, 29 Jan 2022 15:31:50 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.17
Message-ID: <20220129073150.GZ4686@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.17

for you to fetch changes up to 91f6d5f181f6629dd74ab71759fe92d3f4eff966:

  arm64: dts: imx8mq: fix lcdif port node (2022-01-29 14:39:05 +0800)

----------------------------------------------------------------
i.MX fixes for 5.17:

- Fix sound card model for MBa8Mx board.
- Drop i.MX8MQ LCDIF port node unit-address to fix DTC warning.
- Add missing SD card detect line for imx6qdl-udoo board.
- Remove MX23_PAD_SSP1_DETECT from imx23-evk hog group. It fixes the
  broken SD ard support on the board.
- A couple of fixes from Martin Kepplinger to fix the MIPI_CSI port
  number on i.MX8MQ.
- Re-enable ftm_alarm0 device on ls1028a-kontron-sl28 board which was
  disabled accidentally.
- Fix 'assigned-clocks-parents' typo in i.MX7ULP watchdog device node.
- Disable GPU device on imx8mn-venice-gw7902 board, as it uses
  MIMX8MN5CVTI SoC which does not integrate a GPU.

----------------------------------------------------------------
Alexander Stein (2):
      arm64: dts: freescale: Fix sound card model for MBa8Mx
      arm64: dts: imx8mq: fix lcdif port node

Fabio Estevam (2):
      ARM: dts: imx6qdl-udoo: Properly describe the SD card detect
      ARM: dts: imx23-evk: Remove MX23_PAD_SSP1_DETECT from hog group

Martin Kepplinger (2):
      arm64: dts: imx8mq: fix mipi_csi bidirectional port numbers
      arm64: dts: imx8mq-librem5: fix mipi_csi1 port number to sensor

Michael Walle (1):
      arm64: dts: ls1028a: sl28: re-enable ftm_alarm0

Rob Herring (1):
      ARM: dts: imx7ulp: Fix 'assigned-clocks-parents' typo

Tim Harvey (1):
      arm64: dts: imx8mn-venice-gw7902: disable gpu

 arch/arm/boot/dts/imx23-evk.dts                            |  1 -
 arch/arm/boot/dts/imx6qdl-udoo.dtsi                        |  5 ++++-
 arch/arm/boot/dts/imx7ulp.dtsi                             |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts     | 12 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi          |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mq.dtsi                  | 10 +++++-----
 arch/arm64/boot/dts/freescale/mba8mx.dtsi                  |  2 +-
 8 files changed, 29 insertions(+), 11 deletions(-)
