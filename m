Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15F1C43334
	for <soc@archiver.kernel.org>; Wed, 29 Jun 2022 02:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98454C341CB; Wed, 29 Jun 2022 02:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0956EC341C8;
	Wed, 29 Jun 2022 02:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656468770;
	bh=vlTzIAWdjzMlxKEVPo0jINxMb90nhkdPWOMVRtd4csA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=CbQ6nYjr14l7x02UoyufaxGVH9M7POIkPqjt+Tm34lj2q8UJZ9pmkwIlncQK7BqGZ
	 d8HYOxhYwMXXt2UGar0L0d72ejExyoO9hOTAPhaDgMebkFCV1Gw6dxtcPld9QeQvxQ
	 GBLsY+9cS2F7/1pDQv5tcnCn6Zq1YecAds3OJZNWG6ARSzgjxURSPeeUOjPoNcHE1J
	 2G+TtMIgJ6aw3wbgTctcJF2RDe4BBguAqrbU6rHgX0d3Qh3OLyZaLwZHq36y4RUCm3
	 jwUJxjNc8drzfTWi1jDPV1HmLtXq7IV7ziGfokc0NPUuagyDVU7cA98/EzyHOJS8nt
	 Wl4V5nlgyDGQQ==
Date: Wed, 29 Jun 2022 10:12:44 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.19, round 2
Message-ID: <20220629021244.GL819983@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 7c7eaeefb0ae226da9233d5db265652d900e1fcb:

  soc: imx: imx8m-blk-ctrl: fix display clock for LCDIF2 power domain (2022-06-14 11:53:42 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.19-2

for you to fetch changes up to 8630354f42bef90f51e003a7ce62b69aceb735ca:

  arm64: dts: imx8mp-icore-mx8mp-edim2.2: correct pad settings (2022-06-27 15:55:41 +0800)

----------------------------------------------------------------
i.MX fixes for 5.19, round 2:

- Fix the SDIO description for imx7d-smegw01 board to ensure there is
  no communication made at 1.8V.
- Fix pgc_ispdwp power-domain clock, which should be
  IMX8MP_CLK_MEDIA_ISP_ROOT.
- Re-enable framebuffer support in mxs_defconfig to fix a Kconfig
  regression.
- A series from Peng Fan (and Sherry Sun) fixing various pads on i.MX8MP
  based boards to leave reserved bits untouched.

----------------------------------------------------------------
Fabio Estevam (2):
      ARM: dts: imx7d-smegw01: Fix the SDIO description
      ARM: mxs_defconfig: Enable the framebuffer

Peng Fan (14):
      arm64: dts: imx8mp: correct clock of pgc_ispdwp
      arm64: dts: imx8mp-evk: correct mmc pad settings
      arm64: dts: imx8mp-evk: correct gpio-led pad settings
      arm64: dts: imx8mp-evk: correct vbus pad settings
      arm64: dts: imx8mp-evk: correct eqos pad settings
      arm64: dts: imx8mp-evk: correct vbus pad settings
      arm64: dts: imx8mp-evk: correct I2C5 pad settings
      arm64: dts: imx8mp-evk: correct I2C1 pad settings
      arm64: dts: imx8mp-evk: correct I2C3 pad settings
      arm64: dts: imx8mp-venice-gw74xx: correct pad settings
      arm64: dts: imx8mp-phyboard-pollux-rdk: correct uart pad settings
      arm64: dts: imx8mp-phyboard-pollux-rdk: correct eqos pad settings
      arm64: dts: imx8mp-phyboard-pollux-rdk: correct i2c2 & mmc settings
      arm64: dts: imx8mp-icore-mx8mp-edim2.2: correct pad settings

Sherry Sun (1):
      arm64: dts: imx8mp-evk: correct the uart2 pinctl value

 arch/arm/boot/dts/imx7d-smegw01.dts                |   4 +-
 arch/arm/configs/mxs_defconfig                     |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  88 ++++++++--------
 .../dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts  |  40 +++----
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  48 ++++-----
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    | 116 ++++++++++-----------
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   2 +-
 7 files changed, 149 insertions(+), 150 deletions(-)
