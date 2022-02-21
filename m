Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCD3C433F5
	for <soc@archiver.kernel.org>; Mon, 21 Feb 2022 06:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 654A0C340EB; Mon, 21 Feb 2022 06:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FDFC340E9;
	Mon, 21 Feb 2022 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645424967;
	bh=14PlRkXMUjGDE1+/vtbKx6jfjr/STiQ+N0OAdxOvBbc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=HjdPBEfbbhKHU/yg/QpkQJmxwS76Jca6DizdipuwdMRimbWrl9O8IZ/LNV5W2NKi8
	 ShJUCzsjRx1a1hfLsyNPiI++0EElOLpicoX82k+45ijIUgYPzKhmv7T/M8OFABj/nS
	 QIXUQeHlPr1muGumiyZ3GS7g3ymciRxaQp/XJdw6vPmPih1bewPTG9NqtVH6bVxo98
	 XCqw3v0YJxKUOvvM2p0xC2gaTU3ov5Cm1rKdK4zHkD1KB+rj6CMlSiBPlfqKBCJZKA
	 uFXBgWwow2hooZFBGkmWXuDZxwrqaX2sY58qm1oYGZCm+761/1lR/ki+AC7kkciBIF
	 QOuSXJ3RHdIIA==
Date: Mon, 21 Feb 2022 14:29:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.17, round 2
Message-ID: <20220221062921.GO2249@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07:

  Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.17-2

for you to fetch changes up to e1cd5038e9988d5c95d0d32a2c12b63cc5e927d0:

  soc: imx: gpcv2: Fix clock disabling imbalance in error path (2022-02-21 13:45:11 +0800)

----------------------------------------------------------------
i.MX fixes for 5.17, round 2:

- Drop reset signal from i.MX8MM vpumix power domain to fix a system
  hang.
- Fix a dtbs_check warning caused by #thermal-sensor-cells in i.MX8ULP
  device tree.
- Fix a clock disabling imbalance in gpcv2 driver.

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: imx8mm: Fix VPU Hanging

Laurent Pinchart (1):
      soc: imx: gpcv2: Fix clock disabling imbalance in error path

Sudeep Holla (1):
      arm64: dts: imx8ulp: Set #thermal-sensor-cells to 1 as required

 arch/arm64/boot/dts/freescale/imx8mm.dtsi  | 1 -
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 2 +-
 drivers/soc/imx/gpcv2.c                    | 3 ++-
 3 files changed, 3 insertions(+), 3 deletions(-)
