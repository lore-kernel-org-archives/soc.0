Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E10C433EF
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 03:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65438C385A4; Sun,  8 May 2022 03:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FEFC385AC;
	Sun,  8 May 2022 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651981162;
	bh=XuoUaT48wEzxQMcd5Yov5rRDx8BtAV6PWx7y/ST7jDo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=EHUhy+7dM5Z/u9UXRu9nG5vfhKG4B2n7/S/KDkvNzEAczSzHsS76if7kx+FDVXII8
	 ePIYl+qRrmMGAymIKyeCB/HAU4JNrvMSYpGMmmazk1x7iJ7dDfWBm/a6U5RhJ5QyyL
	 uY8r8FiWXR+PHONHS1XZSYuDkOT2K2G2qk8ADc1ue/uefBbvnjxEARaT5P8x70v+6/
	 h4gmXN+SUacqlbiNkpGrCAAaxt/XoEfe0ClZUl510JP29VKFhapeflil0tTNlbD6dA
	 8mt2GSWRq2q+yk+IqBo6PJ/R/Of6qzkow0b41pRhyepco2P8Qs9pDkXSkF5ysXbSQW
	 UimZo7OBZdnfw==
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
Subject: [GIT PULL 1/5] i.MX dt-bindings update for 5.19
Date: Sun,  8 May 2022 11:38:39 +0800
Message-Id: <20220508033843.2773685-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.19

for you to fetch changes up to 75f9d540862a392395f41a5aa437a7fc2d059c23:

  dt-bindings: arm: Add bosch acc board (2022-05-06 20:28:57 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 5.19:

- Various board compatible additions to fsl.yaml.
- Update fsl-imx-dma bindings to deprecate '#dma-channels' and
  '#dma-requests'.
- Add bindings for i.MX8MP HDMI and media block control.
- Add vendor prefix for Storopack.

----------------------------------------------------------------
Andrej Picej (1):
      dt-bindings: arm: fsl: add PHYTEC phyGATE Tauri i.MX6 ULL

Changming Huang (1):
      dt-bindings: arm: fsl: add ls1021a-iot board

Denys Drozdov (1):
      dt-bindings: arm: fsl: add toradex,colibri-imx6ull

Fabio Estevam (2):
      dt-bindings: vendor-prefixes: Add prefix for Storopack
      dt-bindings: arm: fsl: Add Storopack i.MX7D SMEGW01 board

Krzysztof Kozlowski (1):
      dt-bindings: dmaengine: fsl-imx: deprecate '#dma-channels' and '#dma-requests'

Lucas Stach (2):
      dt-bindings: power: imx8mp: add defines for HDMI blk-ctrl domains
      dt-bindings: soc: add binding for i.MX8MP HDMI blk-ctrl

Manoj Sai (1):
      dt-bindings: arm: fsl: Add Engicam i.Core MX8M Plus EDIMM2.2 Starter Kit

Marcel Ziswiler (1):
      dt-bindings: arm: fsl: add toradex,verdin-imx8mp et al.

Marek Vasut (3):
      dt-bindings: arm: Add Data Modul i.MX8M Mini eDM SBC
      dt-bindings: arm: Add i.MX53 based Menlo board comment
      dt-bindings: arm: Add i.MX8M Mini Toradex Verdin based Menlo board

Matthias Schiffer (1):
      dt-bindings: arm: fsl: add TQ Systems boards based on i.MX6UL(L)

Max Krummenacher (2):
      dt-bindings: arm: fsl: imx6dl-colibri: Drop dedicated v1.1 bindings
      dt-bindings: arm: fsl: Add carriers for toradex,colibri-imx6dl

Michael Walle (1):
      dt-bindings: arm: fsl: add IMX8MN DDR3L eval board

Paul Elder (1):
      dt-bindings: soc: Add i.MX8MP media block control DT bindings

Philip Oberfichtner (1):
      dt-bindings: arm: Add bosch acc board

Tim Harvey (1):
      dt-bindings: arm: Add i.MX8M Plus Gateworks GW74xx board

 Documentation/devicetree/bindings/arm/fsl.yaml     | 119 ++++++++++++++++++---
 .../devicetree/bindings/dma/fsl-imx-dma.txt        |   8 +-
 .../bindings/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml |  84 +++++++++++++++
 .../soc/imx/fsl,imx8mp-media-blk-ctrl.yaml         | 104 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 include/dt-bindings/power/imx8mp-power.h           |  18 ++++
 6 files changed, 315 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
