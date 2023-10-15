Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35574CDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 13:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7261C433CB; Sun, 15 Oct 2023 13:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CD9C433C7;
	Sun, 15 Oct 2023 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697376207;
	bh=r+5+8Ov+or5whqk2pH4sKVTobvJ2w6jckTWYqYUqMUo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=PXeXTATKPEc6sas7VYIGuhNmcoOGI6sHD37T9HhZExirdPn7ydokHzox/77PtmvMx
	 l1REl+gkM3xwZ8c6dM/B9wElX7mOkf7FGb2DZAFl1Fo82/s18DOZkxWkBK/xoiV3o3
	 D1o/PetqVv4bYJZcx36eZ1amOkQ2GS2AsuyYrQGUzuS0cfZeTaMKIDGIRbsACoYiXt
	 qxJT7keM+IAawMeRTbijdVNj9PTWK9eAvVMRSFtZ0QwTlp85qj8EEbRoqirsSmS7TD
	 3unEDb/mrxejwgXGhTj+m+ANkq0UAN5mfozKuBOnqdzeGlYIj2/1D3wAqTgl9KMKCi
	 SyqFg5A4V8PbQ==
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
Subject: [GIT PULL 1/4] i.MX dt-bindings changes for 6.7
Date: Sun, 15 Oct 2023 21:22:57 +0800
Message-Id: <20231015132300.2268016-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.7

for you to fetch changes up to 3a9dd87084faa6b60ab30a48bc27f849f490d5b3:

  dt-bindings: arm: fsl: Add TQ-Systems LS1088 based boards (2023-10-10 10:17:36 +0800)

----------------------------------------------------------------
i.MX dt-bindings for 6.7:

- Compatibles for new boards: TQ-Systems LS1043A/LS1046A and LS1088
  based boards, VAR-SOM-MX6 SoM, SolidRun LX2162A SoM & Clearfog,
  and phyGATE-Tauri-L board.
- Add missing i.MX23 based board compatibles.

----------------------------------------------------------------
Fabio Estevam (1):
      dt-bindings: arm: fsl: Document the missing imx23 boards

Gregor Herburger (2):
      dt-bindings: arm: fsl: Add TQ-Systems LS1043A/LS1046A based boards
      dt-bindings: arm: fsl: Add TQ-Systems LS1088 based boards

James Hilliard (1):
      dt-bindings: arm: fsl: Add VAR-SOM-MX6 SoM with Custom Board

Josua Mayer (1):
      dt-bindings: arm: Add SolidRun LX2162A SoM & Clearfog Board

Yannic Moog (1):
      dt-bindings: arm: fsl: add phyGATE-Tauri-L board

 Documentation/devicetree/bindings/arm/fsl.yaml | 43 ++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)
