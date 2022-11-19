Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76441C4332F
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 12:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4777BC433D7; Sat, 19 Nov 2022 12:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF96DC43470;
	Sat, 19 Nov 2022 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668862692;
	bh=c7s8PCv+Wj+kMn04Sj1lCGqEVwNoRpr3q8ZZFhdmQUs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y70n3ykgRfUM3/9nQxOWvMNHajujEb4WS/aPxIhkTVFExrAgiJK2JOb4rECOs5Pbd
	 rU/sF0dcfoE0ylNx6b0Bo88jxfDF2y/UL0kgUFQnraxokyBa8q3oC8fa3GyzRS3I5Y
	 vYiMS6SDijQe7GXid6errUxL8WNZwk8yzpqdPQyIPA76NxrhfV2de9MtHZ6ipOOxnQ
	 DieCunlh1gFDKft4xxM+fSkI64Pw/FRsBNAUDwH4nDkX/Hks+XE0++V9EH7XHrStVd
	 w3omd7MAtCLu6UTocQ6XxPmmYQ2nMxiWc/bPLZSX5kFrq4wr8gPRGo35ETftLpi1Ji
	 o7iOlPBpbeubA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] i.MX dt-bindings update for 6.2
Date: Sat, 19 Nov 2022 20:57:30 +0800
Message-Id: <20221119125733.32719-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221119125733.32719-1-shawnguo@kernel.org>
References: <20221119125733.32719-1-shawnguo@kernel.org>

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.2

for you to fetch changes up to 651ae85e5c5be0185f341e82171275b0c3b68868:

  dt-bindings: arm: fsl: Add an entry for Cloos PHG board (2022-11-14 16:56:31 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 6.2:

- New vendor prefix for Cloos and InnoComm.
- New compatible for Cloos PHG board, InnoComm WB15 EVK and Kobo Aura 2.
- Improve snvs-lpgpr bindings schema regarding i.MX8M SNVS LPGRP
  compatible strings.
- Improve fsl-imx-cspi bindings schema for i.MX8MP ECSPI.
- Add bindings schema for i.MX8M ANATOP device.
- Update SCU firmware resource ID header by syncing with the latest
  available SCFW kit version 1.13.0.

----------------------------------------------------------------
Andreas Kemnade (1):
      dt-bindings: arm: fsl: add compatible string for Kobo Aura 2

Fabio Estevam (2):
      dt-bindings: vendor-prefixes: Add an entry for Cloos
      dt-bindings: arm: fsl: Add an entry for Cloos PHG board

Marek Vasut (1):
      dt-bindings: nvmem: snvs-lpgpr: Fix i.MX8M compatible strings

Peng Fan (2):
      dt-bindings: clock: add i.MX8M Anatop
      dt-bindings: spi: fsl-imx-cspi: update i.MX8MP binding

Sascha Hauer (2):
      dt-bindings: vendor-prefixes: Add prefix for InnoComm
      dt-bindings: arm: fsl: Add InnoComm WB15 EVK

Viorel Suman (1):
      dt-bindings: firmware: imx: sync with SCFW kit v1.13.0

 Documentation/devicetree/bindings/arm/fsl.yaml     |   3 +
 .../bindings/clock/fsl,imx8m-anatop.yaml           |  51 ++++
 .../devicetree/bindings/nvmem/snvs-lpgpr.yaml      |  20 +-
 .../devicetree/bindings/spi/fsl-imx-cspi.yaml      |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 include/dt-bindings/firmware/imx/rsrc.h            | 302 ++++++++++++++-------
 6 files changed, 279 insertions(+), 105 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
