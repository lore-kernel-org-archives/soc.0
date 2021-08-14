Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795EBC4338F
	for <soc@archiver.kernel.org>; Sat, 14 Aug 2021 13:39:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E51CB60F91; Sat, 14 Aug 2021 13:39:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3749760F48;
	Sat, 14 Aug 2021 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628948350;
	bh=0BI8Cf8cXNjZtl2BGJ0xZotV/euLVb17InFI8CNieIY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=c2INEHk9EcmhOaqX6a43j8KrtUOt8DXepKOcZgez5yzboCf1tMU+O2m7GSDMFjmhg
	 CeTXjSDjvCepaonZxf69h2EYHQBD+kc5R6lZovte5sxEOg2vajQw1AdckaOK1TRyKB
	 AcZAyOC2YqQU4Uxxl3aoBA4ZlFvGtBV0vmIaAbySaDzF45oKuC2mExDG44e3w2U0kU
	 BdXgF2+1J8VDjYoJaMUC1Omntd/XiYREpWxZ8BgKHatpfDJWc+vNfDyYCg99hikksp
	 3C6hwq5fL0Td0l4Bj+Zr6QckNo/Ka5jqoKdBDfIbM8gMBbblr5aG/43o8STAXTJiRV
	 BRlQRVjeMGkpQ==
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
Subject: [GIT PULL 1/4] i.MX DT bindings update for 5.15
Date: Sat, 14 Aug 2021 21:38:50 +0800
Message-Id: <20210814133853.9981-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.15

for you to fetch changes up to 0fdedc09af18d231aa581331821c9ab6ef0903f1:

  dt-bindings: arm: fsl: Add Traverse Ten64 (LS1088A) board (2021-08-14 13:52:36 +0800)

----------------------------------------------------------------
i.MX DT bindings update for 5.15:

- Add vendor prefix for MNT Research GmbH, SKOV A/S and Traverse
  Technologies.
- Add compatible for Nitrogen8 SoM, MNT Reform2, Traverse Ten64,
  SKOV i.MX6, SolidSense and i.MX8M GW7902 boards.
- Add compatible for i.MX8QM JPEG codec.

----------------------------------------------------------------
Christoph Niedermaier (1):
      dt-bindings: arm: fsl: Add DHCOM PicoITX and DHCOM DRC02 boards

Lucas Stach (3):
      dt-bindings: arm: fsl: add Nitrogen8 SoM
      dt-bindings: vendor-prefixes: add mntre
      dt-bindings: arm: fsl: add MNT Reform2 board

Mathew McBride (2):
      dt-bindings: vendor-prefixes: add Traverse Technologies
      dt-bindings: arm: fsl: Add Traverse Ten64 (LS1088A) board

Mirela Rabulea (1):
      dt-bindings: media: imx-jpeg: Add compatible for i.MX8QM JPEG codec

Oleksij Rempel (2):
      dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
      dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards

Russell King (Oracle) (1):
      dt-bindings: arm: fsl: add SolidSense boards

Tim Harvey (1):
      dt-bindings: arm: imx: add imx8mm/imx8mn GW7902 support

 Documentation/devicetree/bindings/arm/fsl.yaml     | 29 ++++++++++++++++++++++
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 19 ++++++++------
 .../devicetree/bindings/vendor-prefixes.yaml       |  6 +++++
 3 files changed, 47 insertions(+), 7 deletions(-)
