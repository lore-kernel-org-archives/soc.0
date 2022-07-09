Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CA1C43334
	for <soc@archiver.kernel.org>; Sat,  9 Jul 2022 03:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38254C341CA; Sat,  9 Jul 2022 03:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FED6C341C0;
	Sat,  9 Jul 2022 03:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657337243;
	bh=f//QSfOQe0zOVYUgw0WdiMXRd+eQIjciYke4yk0bSz4=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=PvMRGWO79F469JK3gI+EQHzbFociIaW5JnzqINdfr2XuIcj1BCsnFgDckzXm0O6Gg
	 b3TWsT1BG8BWsZ79nWpq2y4E3OabPj31T5jvHed2l1gwFalQM5dCVT9tpMXKhkHgxd
	 VB7qz12FYBbQj/i1P+OkOsYbh8T3elFWIFp6fQtiWbjYeUGTYrybZ3mBxZzxurL0qv
	 RcOlEEOmdb06Sp8IcnNwo8Lo9f18uwFeO5WPN2tqgCgvbjSwZSdlcvsGYw1nurSxl8
	 2+nSx4Fx7jDQbel8bmrzvjpsyY90EUf0u1qqpqz6O6TfsrCdmX5wEmAougjdp7WcDv
	 JLU6vrmG7ve0A==
Date: Sat, 9 Jul 2022 11:27:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.19, round 3
Message-ID: <20220709032716.GA9868@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8630354f42bef90f51e003a7ce62b69aceb735ca:

  arm64: dts: imx8mp-icore-mx8mp-edim2.2: correct pad settings (2022-06-27 15:55:41 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.19-3

for you to fetch changes up to 6177a50fd32c6fd956c7265bc5297e725d221bfc:

  ARM: dts: colibri-imx6ull: fix snvs pinmux group (2022-07-08 16:12:48 +0800)

----------------------------------------------------------------
i.MX fixes for 5.19, round 3:

- Fix GPIO property for imx6qdl-ts7970 board.
- Fix touchscreen pinctrl for imx6ull-colibri board by moving iomuxc-snvs
  pin to the correct controller device.
- Fix SFP node of fsl-ls1028a to have a required clock property.

----------------------------------------------------------------
Kris Bahnsen (1):
      ARM: dts: imx6qdl-ts7970: Fix ngpio typo and count

Max Krummenacher (1):
      ARM: dts: colibri-imx6ull: fix snvs pinmux group

Sean Anderson (1):
      arm64: dts: ls1028a: Update SFP node to include clock

 arch/arm/boot/dts/imx6qdl-ts7970.dtsi          | 2 +-
 arch/arm/boot/dts/imx6ull-colibri.dtsi         | 9 +++++++--
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 5 ++++-
 3 files changed, 12 insertions(+), 4 deletions(-)
