Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F713C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 12:02:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6958D64F6A; Thu,  4 Feb 2021 12:02:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6248764F67;
	Thu,  4 Feb 2021 12:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612440128;
	bh=0jUdnoVi6n9pnGbYm/hiXbQP487D72ZRXXtR2IXpc38=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q0zweP/HBO5eHKBfR3BLnCG93QkRc5hEuZ+VeWqneTVu3kudZ71VnjeH0GnI4mf8m
	 LaN0iHtsm2ViJu+hKW8xyHWwQV1ExI0ljYF9tSwNcPnO3fLrMYZCIHXfnfMYMmTp39
	 B905iW5+YAdhu+XuR8THnOV3mgz7ZEMM58ePTaibxGmIb4Fmpp4bDiGIBJqBWRTHFZ
	 H2ZjjrlqQ35KuiQyoLd4ltdWvxBMo1QylRBkiDyodhFkhxBrfmj9mUGN05kAygb3XY
	 4ubJDugizqbZykkSums7lB+HCvz0c2bWnTVWAkMIMXmr6jdRd6h+8D2Fpcigtxs0w7
	 pE28EUxUH93HA==
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
Subject: [GIT PULL 3/6] i.MX DT bindings update for 5.12
Date: Thu,  4 Feb 2021 20:01:47 +0800
Message-Id: <20210204120150.26186-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.12

for you to fetch changes up to 1447e43c0b735ffc0d48a6aec4f74d6877caffc2:

  dt-bindings: arm: imx: add imx8mm nitrogen support (2021-01-30 22:25:55 +0800)

----------------------------------------------------------------
i.MX DT bindings update for 5.12:

- Various board compatible additions to fsl.yaml.
- Add vendor prefix for Plymovent and Kverneland Group.
- Update simple panel bindings to include compatible for EDT and Kyocera
  panels.

----------------------------------------------------------------
Adam Ford (1):
      dt-bindings: arm: fsl: Add beacon,imx8mn-beacon-kit

Adrien Grassein (1):
      dt-bindings: arm: imx: add imx8mm nitrogen support

Alice Guo (1):
      dt-bindings: soc: imx8m: add DT Binding doc for soc unique ID

Martin Kepplinger (1):
      dt-bindings: arm: fsl: Add the librem 5 Evergreen revision

Michael Walle (1):
      dt-bindings: arm: fsl: add Kontron sl28 variant 1

Oleksij Rempel (11):
      dt-bindings: display: simple: fix alphabetical order for EDT compatibles
      dt-bindings: display: simple: add EDT compatibles already supported by the driver
      dt-bindings: display: simple: Add Kyocera tcg070wvlq panel
      dt-bindings: vendor-prefixes: Add an entry for Plymovent
      dt-bindings: arm: fsl: add Plymovent M2M board
      dt-bindings: arm: fsl: add Plymovent BAS board
      dt-bindings: arm: fsl: add Protonic MVT board
      dt-bindings: arm: fsl: add Protonic PRTI6G board
      dt-bindings: vendor-prefixes: Add an entry for Kverneland Group
      dt-bindings: arm: fsl: add Kverneland UT1, UT1Q and UI1P boards
      dt-bindings: arm: fsl: add Kverneland TGO board

Teresa Remmet (1):
      bindings: arm: fsl: Add PHYTEC i.MX8MP devicetree bindings

Tim Harvey (1):
      dt-bindings: arm: fsl: Add binding for Gateworks boards with IMX8MM

 Documentation/devicetree/bindings/arm/fsl.yaml     | 23 ++++++
 .../bindings/display/panel/panel-simple.yaml       | 19 +++--
 .../devicetree/bindings/soc/imx/imx8m-soc.yaml     | 86 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  4 +
 4 files changed, 124 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml
