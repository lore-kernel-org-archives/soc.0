Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE92C54EED
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 02:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 416D4C4339B; Mon, 30 Jan 2023 02:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CE2C4339E;
	Mon, 30 Jan 2023 02:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675046419;
	bh=5ZwNFH7Q3RiPy6ErppZvKvzGy/Z+ss80NZ75OEIsKLE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m5BPbFsqpPV8m6agOraJcYbj/SSnJnKTZHuKP8fmL7GC04rh7VXOukKVKbW61mImT
	 MbirYo0map9zNbr4LY7dEgmC4D2YS298wYOZKH4xgYEF7ufh4VJQZcDycsqjbmuq3t
	 iio/Ndldlv5MxaYKZPryLD145qKgzYHVUmyQmEFcVm1MMXZWsRHgRFVESOkpAh5Ydi
	 6gf49QNFnrQfFb6rLGEOzWjg/6rrJou8qeXE2hihXHgmq9mxJ0eR5o/NP/ydDM8sK1
	 Y5wPjpWOUTL+hFEQL5u8dWWFzkrJHGBYtdnFusgFRYdwH6leHjiCS97pskwaBSkRuw
	 a1prLDyfuc0ZQ==
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
Subject: [GIT PULL 3/6] i.MX DT bindings update for 6.3
Date: Mon, 30 Jan 2023 10:39:44 +0800
Message-Id: <20230130023947.11780-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230130023947.11780-1-shawnguo@kernel.org>
References: <20230130023947.11780-1-shawnguo@kernel.org>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.3

for you to fetch changes up to 551460d15a05c2f4dfbb80deedcb1acb7437e165:

  dt-bindings: arm: fsl: Add verdin yavia carrier-board (2023-01-26 19:47:30 +0800)

----------------------------------------------------------------
i.MX DT bindings for 6.3:

- New board compatibles: Beacon EmbeddedWorks i.MX8M Plus kit,
  DHCOM PDK2, PicoITX and DRC02, Enumerate Debix, Starterkit SK-iMX53,
  verdin yavia carrier-board.
- Add vendor prefix for Polyhex Technology Co.
- A series from Krzysztof Kozlowski to fix up fsl,imx-gpc bindings.
- Add clock cells for imx8mp-hsio-blk-ctrl bindings.
- A series from Marek Vasut to shuffle i.MX8MM board entries.
- A couple changes from Stefan Wahren to update compatibles for i.MX28
  based boards.

----------------------------------------------------------------
Adam Ford (1):
      dt-bindings: arm: Add Beacon EmbeddedWorks i.MX8M Plus kit

Christoph Niedermaier (1):
      dt-bindings: arm: fsl: Add PDK2, PicoITX and DRC02 boards for the DHCOM i.MX6ULL SoM

Daniel Scally (2):
      dt-bindings: vendor-prefixes: Add Polyhex Technology Co.
      dt-bindings: arm: fsl: Enumerate Debix Model A Board

Dmitry Baryshkov (2):
      dt-bindings: vendor-prefixes: add Startkit
      dt-bindings: arm: fsl: Add the Starterkit SK-iMX53 board

Krzysztof Kozlowski (3):
      dt-bindings: power: fsl,imx-gpc: document fsl,imx6ul-gpc compatible
      dt-bindings: power: fsl,imx-gpc: correct compatibles
      dt-bindings: power: fsl,imx-gpc: document interrupt-controller

Lucas Stach (1):
      dt-bindings: soc: imx8mp-hsio-blk-ctrl: add clock cells

Marek Vasut (4):
      dt-bindings: arm: Move MX8Menlo board to i.MX8M Mini Toradex Verdin SoM entry
      dt-bindings: arm: Split i.MX8M Mini NITROGEN SoM based boards
      dt-bindings: arm: Split i.MX8M Plus DHCOM based boards
      dt-bindings: arm: Move i.MX8MM Cloos PHG Board to TQM entry

Peng Fan (1):
      dt-bindings: soc: imx: add IOMUXC GPR support

Philippe Schenker (1):
      dt-bindings: arm: fsl: Add verdin yavia carrier-board

Stefan Wahren (2):
      dt-bindings: arm: fsl: Fix bindings for APF28Dev board
      dt-bindings: arm: Document the rest of i.MX28 based boards

 Documentation/devicetree/bindings/arm/fsl.yaml     | 96 ++++++++++++++++++++--
 .../devicetree/bindings/power/fsl,imx-gpc.yaml     | 19 +++--
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       | 57 +++++++++++++
 .../bindings/soc/imx/fsl,imx8mp-hsio-blk-ctrl.yaml |  4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  4 +
 5 files changed, 169 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
