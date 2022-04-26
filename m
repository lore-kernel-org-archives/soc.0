Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA29C433F5
	for <soc@archiver.kernel.org>; Tue, 26 Apr 2022 01:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B2CFC385A7; Tue, 26 Apr 2022 01:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B5DC385A4;
	Tue, 26 Apr 2022 01:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650936874;
	bh=p7vfegad7VOMKWLqyVEsk4ngGf1kdZ76IWSSMSZTPDY=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=fwPnx2G8MblbjJINie7iJoa6PnnD/MkZeyWe6dVBBHwN5MPkoCd+C54ewRiqJiSw9
	 qNIH8FJ1V2UwqigTk+RDpHazwFht7ZzcWeEixr5tf9aTOEPZy0BKDqvRVz4rQIjyyt
	 ObLIeEd079pKwrkkRhTdhss9umNF4Cwwa7hSKN+hZklhXxeQKxNoM8gT0sFThtaXT1
	 qe8UJsVS/Zp47SRiOflsDAQtq3s6q2+cdrporX4jZncvpsMTUa78eLo7qXQJaSr1np
	 VVKw0jwkh99HvOHAkWurmN9UVWDRVe96INZQ0G4OYJe75N4giRDU5OAcgeLJLitWAw
	 kOr8kZ0cC9ZPA==
Date: Tue, 26 Apr 2022 09:34:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.18, 2nd round
Message-ID: <20220426013427.GB14615@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f571e9c9aafed2fbd60fd99aa4b9823221338b98:

  arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes (2022-04-11 09:38:07 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.18-2

for you to fetch changes up to 0310b5aa0656a94102344f1e9ae2892e342a665d:

  arm64: dts: imx8mn-ddr4-evk: Describe the 32.768 kHz PMIC clock (2022-04-24 21:16:18 +0800)

----------------------------------------------------------------
i.MX fixes for 5.18, 2nd round:

- Fix one sparse warning on imx-weim driver.
- Fix vqmmc regulator to get UHS-I mode work on imx6ull-colibri board.
- Add missing 32.768 kHz PMIC clock for imx8mn-ddr4-evk board to fix
  bd718xx-clk probe error.

----------------------------------------------------------------
Fabio Estevam (1):
      arm64: dts: imx8mn-ddr4-evk: Describe the 32.768 kHz PMIC clock

Max Krummenacher (1):
      ARM: dts: imx6ull-colibri: fix vqmmc regulator

Wei Yongjun (1):
      bus: imx-weim: make symbol 'weim_of_notifier' static

 arch/arm/boot/dts/imx6ull-colibri.dtsi            | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts | 4 ++++
 drivers/bus/imx-weim.c                            | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)
