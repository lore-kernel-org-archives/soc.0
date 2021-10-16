Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A727CC433EF
	for <soc@archiver.kernel.org>; Sat, 16 Oct 2021 14:02:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 409CA611AF; Sat, 16 Oct 2021 14:02:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E1E360FED;
	Sat, 16 Oct 2021 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634392931;
	bh=3ZjBBjsmBy/m5I9h0Z86ZlRWbjik6jYcCPlhehrp/E8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=sykHOP4KSvxiDl3OfYqnoz1Xj6V48QrQgRjMhhYAXDpqIJ9tH5ZwxELX1uoZCEzNs
	 8xU6/x9eN70OibzWWHSW3K3b+Ecmft3DdlTP7CGOHVVIy2ARlNAuJhzHwngwcBRYbq
	 iyL3GnamsIHA+4DEzYJRix7J4xARoVU1H5hEV/UMeF44+YdYlQTdHh8jJPuEadUeHP
	 J7NamKcjaZUfjbNSbrX8XeKvEwmkNooPpc+NynLR3tszsm40qxL7bKuRYDfS3PEk+S
	 41F3kfOzyqUrqfUrf8EWge+W7KnAWjzzVF9rot3g0QeGbL3M6dKPQarjAWpBsPvFlH
	 giDqIgRLEqFtA==
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
Subject: [GIT PULL 1/6] i.MX DT bindings update for 5.16
Date: Sat, 16 Oct 2021 22:01:33 +0800
Message-Id: <20211016140138.1603-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.16

for you to fetch changes up to 83ad8d101151a149bfb602a08bf30ac82442f8f9:

  dt-bindings: arm: fsl: add ls1021a-tsn board (2021-10-15 11:13:07 +0800)

----------------------------------------------------------------
i.MX DT bindings update for 5.16:

- Various board compatible addition: NXP S32G2, LS1021A TSN, Toradex
  Colibri i.MX6ULL, LX2160A BlueBox 3 boards.
- Toradex board and module compatibles clean-up.
- Convert fsl-linflexuart bindings to json-schema format and add S32G2
  compatible.
- Add bindings and defines for i.MX8MM VPU and DISP blk-ctrl.

----------------------------------------------------------------
Andreas Kemnade (1):
      dt-bindings: arm: fsl: Add E70K02 based ebook readers

Chester Lin (3):
      dt-bindings: arm: fsl: add NXP S32G2 boards
      dt-bindings: serial: fsl-linflexuart: convert to json-schema format
      dt-bindings: serial: fsl-linflexuart: add compatible for S32G2

Li Yang (1):
      dt-bindings: arm: fsl: add ls1021a-tsn board

Lucas Stach (4):
      dt-bindings: soc: add binding for i.MX8MM VPU blk-ctrl
      dt-bindings: power: imx8mm: add defines for VPU blk-ctrl domains
      dt-bindings: soc: add binding for i.MX8MM DISP blk-ctrl
      dt-bindings: power: imx8mm: add defines for DISP blk-ctrl domains

Marcel Ziswiler (2):
      dt-bindings: arm: fsl: clean-up all toradex boards/modules
      dt-bindings: arm: fsl: add toradex,colibri-imx6ull-emmc

Vladimir Oltean (1):
      dt-bindings: arm: fsl: document the LX2160A BlueBox 3 boards

 Documentation/devicetree/bindings/arm/fsl.yaml     | 99 +++++++++++++---------
 .../bindings/serial/fsl,s32-linflexuart.txt        | 22 -----
 .../bindings/serial/fsl,s32-linflexuart.yaml       | 48 +++++++++++
 .../bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml | 94 ++++++++++++++++++++
 .../bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml  | 76 +++++++++++++++++
 include/dt-bindings/power/imx8mm-power.h           |  9 ++
 6 files changed, 288 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml
