Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C904CC6FD1D
	for <soc@archiver.kernel.org>; Wed, 15 Mar 2023 13:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B552C433EF; Wed, 15 Mar 2023 13:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A641C433D2;
	Wed, 15 Mar 2023 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678886902;
	bh=slJa6Exsp+hv/G1q47mIt9h0+GzmCwB+KWDkJ4Axt5A=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Io2CMbAVxTrzn9wh8JCaI/SUH68DsAhaW+9o7ZneSWMSOZgV8EkvBZa8u5dD2qvLj
	 tbT5JiHMQ+shX+Gg9daOy2Qvre5HhVDplQXde7ChYKT37XaHeiTpX2FlDlIi+qECVe
	 v4Wn4PhuX23hN8yJGCWsbSC4xqbhfAzM0hvuazFEgODaTzs5SV9asZc5sMY+Xql24/
	 sJCbQiHRRq+RH5lKb04goahlUuo0awvtszULb5T62DanxThPcx/ETdmbKAaALSdEav
	 JewaCLcZDTcn8cST8LC2DvAlUz8UiYx4A4YFTSwU/wFEK4p/I2zuEeiUxTWrKzVU+i
	 ANGyRIX+P9c+A==
Date: Wed, 15 Mar 2023 21:28:14 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.3
Message-ID: <20230315132814.GF143566@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.3

for you to fetch changes up to b3cdf730486b048ca0bf23bef050550d9fd40422:

  arm64: dts: imx93: add missing #address-cells and #size-cells to i2c nodes (2023-03-14 14:55:17 +0800)

----------------------------------------------------------------
i.MX fixes for 6.3:

- A couple of i.MX93 fixes from Alexander Stein to correct EQoS Ethernet
  properties.
- Correct clock-names of FlexSPI device in imx8-ss-lsio DT.
- Fix EQoS PHY reset GPIO by dropping the deprecated/wrong property and
  switch to the new bindings.
- Fix an issue with imx-weim bus driver that branch condition evaluates
  to a garbage value.
- Correct WM8960 clock name for imx8mm-nitrogen-r2 board.
- Fix LCDIF2 clocks for i.MX8MP DT.
- Add missing #sound-dai-cells properties to SAI nodes for i.MX8MN DT.
- Revert LS1028A DT changes of getting MAC addresses from VPD, as the
  dependency on NVMEM device is not in place.
- A series from Peng Fan to add missing pinctrl property for i.MX6SL
  based devices.

----------------------------------------------------------------
Alexander Stein (3):
      arm64: dts: freescale: imx8-ss-lsio: Fix flexspi clock order
      arm64: dts: imx93: Fix eqos properties
      arm64: dts: imx93: add missing #address-cells and #size-cells to i2c nodes

Andrew Halaney (1):
      arm64: dts: imx8dxl-evk: Fix eqos phy reset gpio

Ivan Bornyakov (1):
      bus: imx-weim: fix branch condition evaluates to a garbage value

Krzysztof Kozlowski (1):
      arm64: dts: imx8mm-nitrogen-r2: fix WM8960 clock name

Marek Vasut (2):
      arm64: dts: imx8mp: Fix LCDIF2 node clock order
      arm64: dts: imx8mn: specify #sound-dai-cells for SAI nodes

Michael Walle (1):
      Revert "arm64: dts: ls1028a: sl28: get MAC addresses from VPD"

Peng Fan (3):
      ARM: dts: imx6sll: e70k02: fix usbotg1 pinctrl
      ARM: dts: imx6sll: e60k02: fix usbotg1 pinctrl
      ARM: dts: imx6sl: tolino-shine2hd: fix usbotg1 pinctrl

 arch/arm/boot/dts/e60k02.dtsi                      |  1 +
 arch/arm/boot/dts/e70k02.dtsi                      |  1 +
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts       |  1 +
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts          | 12 -----------
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |  2 --
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |  8 --------
 .../freescale/fsl-ls1028a-kontron-sl28-var4.dts    |  2 --
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts     | 17 ---------------
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |  5 +++--
 .../boot/dts/freescale/imx8mm-nitrogen-r2.dts      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  4 ++--
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 24 ++++++++++++++++++----
 drivers/bus/imx-weim.c                             |  2 +-
 15 files changed, 36 insertions(+), 52 deletions(-)
