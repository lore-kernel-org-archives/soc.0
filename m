Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB5CC77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 13:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C955AC4339C; Tue, 16 May 2023 13:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A265CC433D2;
	Tue, 16 May 2023 13:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684244196;
	bh=XHu+zsYXNh8Fqxd1I5RCFgLVKWxmy519UEt9PAr5P4k=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=sI+Rxz/a1QOKfq0DJQXYBCXAjSVzwAYAUaFJGZBpUNXQgNvleod1sOYhlgoJJnHh3
	 KB8gd+jiNG6xVRoLY+3Mv5JWeMCw6mS3HNBM3KtHaumci3LPGY6IhLtGZSN2yXiSQw
	 6Aze2tCXUhdy+2tlgVuA4siSquw4Bkznm4SN91b/BNPf5+iBtz/AEj/YIe2BBQNZaC
	 zAPHgUNEKPGtUbFKmxc+4ny94El9VVIf1MAnKsWmeEIqmo2hDhpqhv8JHd3nbTd9rE
	 /pOw0da8riX+JF9dwY0h/LhsdUxAR2614cRVnvLHtBKhAI+ejQvTqhfyaL/SC8LC7R
	 RK06IWlLFOZPg==
Date: Tue, 16 May 2023 21:36:25 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.4
Message-ID: <20230516133625.GI767028@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.4

for you to fetch changes up to 0f554e37dad416f445cd3ec5935f5aec1b0e7ba5:

  arm64: dts: imx8: fix USB 3.0 Gadget Failure in QM & QXPB0 at super speed (2023-05-16 20:43:48 +0800)

----------------------------------------------------------------
i.MX fixes for 6.4:

- A couple of i.MX8MN/P video clock changes from Adam Ford to fix issue
  with clock re-parenting.
- Add missing pvcie-supply regulator for imx6qdl-mba6 board.
- A series of colibri-imx8x board fixes on pin configuration.
- Set and limit the mode for PMIC bucks for imx6ull-dhcor board to fix
  stability problems.
- A couple of changes from Frank Li to correct cdns,usb3 bindings
  cdns,on-chip-buff-size property and fix USB 3.0 gadget failure on
  i.MX8QM & QXPB0.
- Add a required PHY deassert delay for imx8mn-var-som board to fix PHY
  detection failure.

----------------------------------------------------------------
Adam Ford (2):
      arm64: dts: imx8mn: Fix video clock parents
      arm64: dts: imx8mp: Fix video clock parents

Alexander Stein (1):
      ARM: dts: imx6qdl-mba6: Add missing pvcie-supply regulator

Andrejs Cainikovs (1):
      arm64: dts: colibri-imx8x: delete adc1 and dsp

Christoph Niedermaier (1):
      ARM: dts: imx6ull-dhcor: Set and limit the mode for PMIC buck 1, 2 and 3

Emanuele Ghidoli (3):
      arm64: dts: colibri-imx8x: fix eval board pin configuration
      arm64: dts: colibri-imx8x: move pinctrl property from SoM to eval board
      arm64: dts: colibri-imx8x: fix iris pinctrl configuration

Frank Li (2):
      dt-binding: cdns,usb3: Fix cdns,on-chip-buff-size type
      arm64: dts: imx8: fix USB 3.0 Gadget Failure in QM & QXPB0 at super speed

Hugo Villeneuve (1):
      arm64: dts: imx8mn-var-som: fix PHY detection bug by adding deassert delay

 .../devicetree/bindings/usb/cdns,usb3.yaml         |  2 +-
 arch/arm/boot/dts/imx6qdl-mba6.dtsi                |  1 +
 arch/arm/boot/dts/imx6ull-dhcor-som.dtsi           |  7 ++++++
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  1 +
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |  8 ++++++-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          | 28 ++++++++++++----------
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          | 25 +++++++------------
 .../boot/dts/freescale/imx8x-colibri-eval-v3.dtsi  |  6 +++++
 .../boot/dts/freescale/imx8x-colibri-iris.dtsi     |  3 +--
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   | 14 ++++++-----
 10 files changed, 56 insertions(+), 39 deletions(-)
