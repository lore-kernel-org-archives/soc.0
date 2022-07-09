Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6791C43334
	for <soc@archiver.kernel.org>; Sat,  9 Jul 2022 08:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB0E0C341CD; Sat,  9 Jul 2022 08:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0621C341CA;
	Sat,  9 Jul 2022 08:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657355418;
	bh=7KThHnBYLKEyDXYybvWvNOMjbbYSx2SI3f3UZ+0GdQY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LPQ5wxINtYdEohKmaN8V02KCxPDZLRl7WZdr6Kz3vqJYZ4SlYDuTQ1gdS3scfW+oW
	 cqGMyklo/xK/YfB0+6kVK5X0iGZVaC+bYGuNFj0k7tygZlBKgET0EtfN32zYuGlSHS
	 ME2v1WNft+pxu01rNp4UfBZu/vcB5XAuwJl6vTO+BskmPQkP8ba0hvs3/MD7jdM3Pw
	 XESzDJgSxFmRA6kCtxORFVF9MlVIjBR28LsdLJMGbLq4nsJxY6KyBD8QZnWkm/knoN
	 CrUP0gWDHooU8wHMCMBJ52xo7CdVfBuZ2DCn2IHlhz60/8D75o9puZHOQUSnK2C+rz
	 OFPTYW9MJI73w==
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
Subject: [GIT PULL 3/6] i.MX DT bindings update for 5.20
Date: Sat,  9 Jul 2022 16:29:48 +0800
Message-Id: <20220709082951.15123-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709082951.15123-1-shawnguo@kernel.org>
References: <20220709082951.15123-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.20

for you to fetch changes up to c03d7ab1a636fdf411a37bcb33ed4acd12e66fac:

  dt-bindings: arm: add TQMa8MPxL board (2022-07-09 10:49:17 +0800)

----------------------------------------------------------------
i.MX DT bindings update for 5.20:

- Compatibles for new boards: i.MX7 based Toradex Colibri, DH electronics
  i.MX8M Plus DHCOM and PDK2, TQMa8MPxL, Carrier for Toradex i.MX6 Apalis,
  i.MX93 EVK, PHYTEC i.MX8MM based board.
- A series from Abel Vesa (and Viorel Suman) to split fsl,scu.txt bindings
  into multiple subsystem bindings in yaml format.
- Fix 'line too long' warning caused by Toradex Colibri boards.

----------------------------------------------------------------
Abel Vesa (9):
      dt-bindings: clk: imx: Add fsl,scu-clk yaml file
      dt-bindings: pinctrl: imx: Add fsl,scu-iomux yaml file
      dt-bindings: input: Add fsl,scu-key yaml file
      dt-bindings: nvmem: Add fsl,scu-ocotp yaml file
      dt-bindings: power: Add fsl,scu-pd yaml file
      dt-bindings: rtc: Add fsl,scu-rtc yaml file
      dt-bindings: thermal: Add fsl,scu-thermal yaml file
      dt-bindings: watchdog: Add fsl,scu-wdt yaml file
      dt-bindings: firmware: Add fsl,scu yaml file

Fabio Estevam (1):
      dt-bindings: arm: fsl: Decrease the line length

Marcel Ziswiler (2):
      dt-bindings: arm: fsl: correct 1g vs. 1gb in toradex,colibri-imx6ull-*
      dt-bindings: arm: fsl: add toradex,colibri-imx7s/d/d-emmc-iris/-v2

Marek Vasut (1):
      dt-bindings: arm: Add DH electronics i.MX8M Plus DHCOM and PDK2

Markus Niebel (1):
      dt-bindings: arm: add TQMa8MPxL board

Max Krummenacher (1):
      dt-bindings: arm: fsl: Add carrier for toradex,apalis-imx6q

Peng Fan (1):
      dt-bindings: arm: fsl: add imx93 11x11 evk board

Teresa Remmet (1):
      bindings: arm: fsl: Add PHYTEC i.MX8MM devicetree bindings

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 271 ---------------------
 Documentation/devicetree/bindings/arm/fsl.yaml     |  61 +++--
 .../devicetree/bindings/clock/fsl,scu-clk.yaml     |  43 ++++
 .../devicetree/bindings/firmware/fsl,scu.yaml      | 210 ++++++++++++++++
 .../devicetree/bindings/input/fsl,scu-key.yaml     |  40 +++
 .../devicetree/bindings/nvmem/fsl,scu-ocotp.yaml   |  56 +++++
 .../bindings/pinctrl/fsl,scu-pinctrl.yaml          |  74 ++++++
 .../devicetree/bindings/power/fsl,scu-pd.yaml      |  41 ++++
 .../devicetree/bindings/rtc/fsl,scu-rtc.yaml       |  31 +++
 .../bindings/thermal/fsl,scu-thermal.yaml          |  38 +++
 .../devicetree/bindings/watchdog/fsl,scu-wdt.yaml  |  34 +++
 11 files changed, 614 insertions(+), 285 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,scu-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/firmware/fsl,scu.yaml
 create mode 100644 Documentation/devicetree/bindings/input/fsl,scu-key.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,scu-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/power/fsl,scu-pd.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/fsl,scu-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
