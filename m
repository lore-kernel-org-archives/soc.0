Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEDCC7EE23
	for <soc@archiver.kernel.org>; Wed,  7 Jun 2023 14:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F7ADC4339B; Wed,  7 Jun 2023 14:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78002C433D2;
	Wed,  7 Jun 2023 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686147205;
	bh=K8RrKlIzoRGhWGEy0Q+tPHGXior1wsnwgoKplHCOLow=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=RdqQXM/BWMoPUzCF2qhHrgl6XtHv1OCgvm/nA57Opnr6i9PeEP8JfaIpq8jO2M3Dl
	 MMztN8JeESpAhchX1OT4g/RWbrXM9W18Paci4oR7M9wfVnF7m/U2m3QFIFbkWaNK1a
	 4uTG+7+w2lntBQOSYOAV1g7fCOCVfgS9rqcZdUyhQjMglPK1NuM/K0rQAeYDrnlPjg
	 IDp/HFKAITl9Jm9js8w3ztGuiMpxHBSXxadvbkvsZi46MuRWHTfRTDLvHeaRefGAxv
	 prQoyhDJBusueyx/gIo2K5rnQM632nhwrVdhUI9eELXZBdYSX2dVFszxrGPSMHiNMW
	 A5bpJf+g2HTwg==
Date: Wed, 7 Jun 2023 22:13:12 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.4, round 2
Message-ID: <20230607141312.GU4199@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0f554e37dad416f445cd3ec5935f5aec1b0e7ba5:

  arm64: dts: imx8: fix USB 3.0 Gadget Failure in QM & QXPB0 at super speed (2023-05-16 20:43:48 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.4-2

for you to fetch changes up to 9bf2e534313fcf420367668cc1f30e10469901dc:

  arm64: dts: imx8mn-beacon: Fix SPI CS pinmux (2023-06-04 20:31:58 +0800)

----------------------------------------------------------------
i.MX fixes for 6.4, round 2:

- Fix SPI CS pinmux for the final production version of imx8mn-beacon
  board.
- Fix GPIOs for USDHC2 CD and WP signals on imx8qm-mek board.
- Assign default clock rate for i.MX8 LPUARTs to fix UART failure.

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: imx8mn-beacon: Fix SPI CS pinmux

Shenwei Wang (2):
      arm64: dts: imx8qm-mek: correct GPIOs for USDHC2 CD and WP signals
      arm64: dts: imx8-ss-dma: assign default clock rate for lpuarts

 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi             | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts               | 4 ++--
 3 files changed, 12 insertions(+), 4 deletions(-)
