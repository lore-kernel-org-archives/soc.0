Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDF6C4167B
	for <soc@archiver.kernel.org>; Thu,  7 Dec 2023 00:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A539C433C9; Thu,  7 Dec 2023 00:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C159CC433C8;
	Thu,  7 Dec 2023 00:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701910328;
	bh=xy/CsR90wJSUlUq/Q6HJGn9dTml1+NMePCp/L+jGeFU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=CUYtmrMUFtzDSn3m8Nd8x/POf6CC6DIzsNipWdCCd0+7uL03h0mX8XEy0bZpvJDvr
	 B9K6T13iqMm/5OJvsq4RcUxWlA0P0vAxSq7thzXbLm0xWwj00PCS+76oBWE4BIorvx
	 eNiStsfhl7MOCTwPdRSXwvYFGhtKx9ETGtSXTSYG/DHxjibj0QOlDL4niqwH56yjbg
	 nhnaCPCwxbGDzJJQv3BlR3uCGIwPNSDcgpCy1WaTDMk1lBgDc0ycMoksCEBRehmvYu
	 rp04zJbMEOynRzpiF5eCpu7HbGeVHqSSASLl8fj9gHBSxW9VUfP159OrWOF2pbMuuU
	 p6T2phmRWTxOw==
Date: Thu, 7 Dec 2023 08:52:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.7
Message-ID: <20231207005202.GF270430@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.7

for you to fetch changes up to 63ef8fc9bcee6b73ca445a19a7ac6bd544723c9f:

  ARM: dts: imx28-xea: Pass the 'model' property (2023-12-06 17:23:58 +0800)

----------------------------------------------------------------
i.MX fixes for 6.7:

- A MAINTAINERS update to reinstate freescale ARM64 DT directory in i.MX
  entry.
- A series from Alexander Stein to fix #pwm-cells for imx8-ss.
- A series from Haibo Chen to fix GPIO node name for i.MX93 and
  i.MX8ULP.
- Add parkmode-disable-ss-quirk for DWC3 on i.MX8MP and i.MX8MQ to fix
  an issue that the controller may hang when processing transactions
  under heavy USB traffic from multiple endpoints.
- Fix mediamix block power on/off for i.MX93 by correcting the power
  domain clock to be 'nic_media'.
- A couple of Ethernet PHY clock regression fixes for imx6ul-pico and
  imx6q-skov board.
- Fix edma3 power domain for i.MX8QM to fix a panic during startup
  process.

----------------------------------------------------------------
Ahmad Fatoum (1):
      MAINTAINERS: reinstate freescale ARM64 DT directory in i.MX entry

Alexander Stein (4):
      arm64: dt: imx93: tqma9352-mba93xxla: Fix LPUART2 pad config
      dt-bindings: pwm: imx-pwm: Unify #pwm-cells for all compatibles
      arm64: dts: freescale: imx8-ss-lsio: Fix #pwm-cells
      arm64: dts: freescale: imx8-ss-dma: Fix #pwm-cells

Fabio Estevam (2):
      ARM: dts: imx6ul-pico: Describe the Ethernet PHY clock
      ARM: dts: imx28-xea: Pass the 'model' property

Haibo Chen (2):
      arm64: dts: imx93: update gpio node name to align with register address
      arm64: dts: imx8ulp: update gpio node name to align with register address

Kunwu Chan (1):
      ARM: imx: Check return value of devm_kasprintf in imx_mmdc_perf_init

Nathan Rossi (1):
      arm64: dts: imx8mp: imx8mq: Add parkmode-disable-ss-quirk on DWC3

Peng Fan (1):
      arm64: dts: imx93: correct mediamix power

Philipp Zabel (1):
      ARM: dts: imx7: Declare timers compatible with fsl,imx6dl-gpt

Stefan Eichenberger (1):
      arm64: dts: imx8-apalis: set wifi regulator to always-on

Stefan Kerkmann (1):
      ARM: dts: imx6q: skov: fix ethernet clock regression

Xiaolei Wang (1):
      arm64: dts: imx8qm: Add imx8qm's own pm to avoid panic during startup

 Documentation/devicetree/bindings/pwm/imx-pwm.yaml           | 10 ++++------
 MAINTAINERS                                                  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dts |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi                   |  2 ++
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi                         |  8 ++++----
 arch/arm/boot/dts/nxp/mxs/imx28-xea.dts                      |  1 +
 arch/arm/mach-imx/mmdc.c                                     |  7 ++++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi          |  5 +----
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi               |  2 +-
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi              |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8mp.dtsi                    |  2 ++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi                    |  2 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi             | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi                   |  6 +++---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts   |  2 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi                     | 10 +++++-----
 16 files changed, 50 insertions(+), 31 deletions(-)
