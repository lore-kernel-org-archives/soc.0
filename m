Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7EAC77B61
	for <soc@archiver.kernel.org>; Sat,  8 Apr 2023 10:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 946B4C433D2; Sat,  8 Apr 2023 10:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A25CC433EF;
	Sat,  8 Apr 2023 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680949209;
	bh=9k/Fcd87Pyh9wh18qTzfKdB+LgjR7OrEP1r5yFEeasc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vo5Px6LdKVazpXjYmZPtZmOpOAFJQ+yVptqJSzyW8SmTd2D/FnIdwCBIMKZwrdbMA
	 8chyU7q2TzTiHMnHRVP1IObu2QMXPU2xi/E5NLIjQC+2+IO1m4Jtfz+V056Ng6ILIT
	 SxcJri8vEISn4b5dxcjS3aCgYQR29OBm4YE/5fvkZkZyxVTfBvxF6Sohvzdd6ff5dv
	 uOT60/a8uGt4BOdiUrT3CmgGobNpwsWsfGZCkiF9BBsZ65wEr9AjyZtcfoi4QJHcjD
	 0FchJoyO/pGhFQeV4GdfmRhvbETF2nLzDukc9gLhCBBWPC3e5UloQz7/Np/2ipMYH3
	 HBIBE0NfesQjg==
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
Subject: [GIT PULL 3/6] i.MX dt-bindings update for 6.4
Date: Sat,  8 Apr 2023 18:19:25 +0800
Message-Id: <20230408101928.280271-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230408101928.280271-1-shawnguo@kernel.org>
References: <20230408101928.280271-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.4

for you to fetch changes up to 1c2eb76b9456130c377372727744e9a109abf5e1:

  dt-bindings: arm: Add Data Modul i.MX8M Plus eDM SBC (2023-04-08 15:25:41 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 6.4:

- Add vendor prefix for chargebyte.
- A bunch of new board compatibles: Tolino Vision, Toradex Apalis,
  chargebyte Tarragon, i.MX8M Plus based boards from DH electronics
  and Data Modul, etc.
- A series from Marek Vasut to improve blk-ctrl bindings.

----------------------------------------------------------------
Andreas Kemnade (1):
      dt-bindings: arm: fsl: add compatible string for Tolino Vision

Marcel Ziswiler (1):
      dt-bindings: arm: fsl: add toradex,apalis-imx8 et al.

Marek Vasut (6):
      dt-bindings: soc: imx8mp-media-blk-ctrl: Align block controller example name
      dt-bindings: soc: imx8mp-media-blk-ctrl: Add LDB subnode into schema and example
      dt-bindings: arm: Add DH electronics i.MX8M Plus DHCOM on PDK3
      dt-bindings: soc: imx8m-blk-ctrl: Rename blk_ctrl to blk-ctrl in examples
      dt-bindings: soc: imx-blk-ctrl: Drop leading label in blk-ctrl in examples
      dt-bindings: arm: Add Data Modul i.MX8M Plus eDM SBC

Michal Vokáč (2):
      dt-bindings: arm: fsl: Fix copy-paste error in comment
      dt-bindings: arm: fsl: Add Y Soft IOTA Phoenix, Lynx, Pegasus and Pegasus+

Philippe Schenker (1):
      dt-bindings: arm: fsl: Add colibri-imx8x carrier boards

Stefan Wahren (2):
      dt-bindings: vendor-prefixes: add chargebyte
      dt-bindings: arm: fsl: Add chargebyte Tarragon

 Documentation/devicetree/bindings/arm/fsl.yaml     | 45 ++++++++++++++++--
 .../bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml |  2 +-
 .../bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml  |  2 +-
 .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml |  2 +-
 .../bindings/soc/imx/fsl,imx8mp-hsio-blk-ctrl.yaml |  2 +-
 .../soc/imx/fsl,imx8mp-media-blk-ctrl.yaml         | 53 +++++++++++++++++++++-
 .../bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml  |  2 +-
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  2 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 9 files changed, 102 insertions(+), 10 deletions(-)
