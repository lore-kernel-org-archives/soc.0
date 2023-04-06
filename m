Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD360C7618D
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 02:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93C8FC4339B; Thu,  6 Apr 2023 02:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A57C433D2;
	Thu,  6 Apr 2023 02:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680747369;
	bh=UKkGA9BFofsEa1k3r4E7YEFiQO23pOStxPCjOLK5R54=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=nvDGqIgn1KOlewJhNuQEW78qIXQIeFdeKggoBrRFz7Gsn72wHM5JN+39JF5kHihv4
	 VoxvRuUawrEZMTXYnHv4ZqAVhs826eRfL0wrnFrIxZonOFwVHgsYv1uFXAMxareHRk
	 HPFaYxgX3YWz514FIlRQ3PtvivtQ3nS8uOf2LUWS2y4cCjWBqgvFwPqsKnLiSAXgcP
	 mvoB1+wSNX9ExOxvEleBoBFql4KCXUAKHylkSPDEOtvpnwyISUOOZ1Tn8E+IhAkv0o
	 3jUVu0wXnaOXHT06bIf1ZS77MrkR/aYvAeHT7mXKjX+uHCPN5rQPFJfiaehYPbCw2+
	 XI+n0Aa6c/PPg==
Date: Thu, 6 Apr 2023 10:16:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.3, 2nd round
Message-ID: <20230406021602.GP11367@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b3cdf730486b048ca0bf23bef050550d9fd40422:

  arm64: dts: imx93: add missing #address-cells and #size-cells to i2c nodes (2023-03-14 14:55:17 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.3-2

for you to fetch changes up to 86d5b27b379256cd5d48974b4cd7ad03091eea6b:

  ARM: imx_v6_v7_defconfig: Fix unintentional disablement of PCI (2023-04-06 09:49:34 +0800)

----------------------------------------------------------------
i.MX fixes for 6.3, 2nd round:

- Fix 'reg' address length for i.MX8MP LCDIF2 device.
- A couple of changes from Fabio Estevam to fix DTC warnings caused
  unnecessary address/size cells.
- Re-enable PCI driver support in imx_v6_v7_defconfig.
- Fix PMIC clock source property for imx8mm-evk board.
- A couple of fixes from Peng Fan to correct off-on delay property for
  i.MX8 Verdin boards.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: imx8mp: fix address length for LCDIF2

Fabio Estevam (3):
      ARM: dts: imx7d-remarkable2: Remove unnecessary #address-cells/#size-cells
      ARM: dts: imx6ull-colibri: Remove unnecessary #address-cells/#size-cells
      ARM: imx_v6_v7_defconfig: Fix unintentional disablement of PCI

Peng Fan (3):
      arm64: dts: imx8mm-evk: correct pmic clock source
      arm64: dts: imx8mm-verdin: correct off-on-delay
      arm64: dts: imx8mp-verdin: correct off-on-delay

 arch/arm/boot/dts/imx6ull-colibri.dtsi               | 12 +++---------
 arch/arm/boot/dts/imx7d-remarkable2.dts              |  2 --
 arch/arm/configs/imx_v6_v7_defconfig                 |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi        |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi     |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi     |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mp.dtsi            |  2 +-
 8 files changed, 11 insertions(+), 19 deletions(-)
