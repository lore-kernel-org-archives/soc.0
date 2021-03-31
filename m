Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D20DC433DB
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 04:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1B0CC619DF; Wed, 31 Mar 2021 04:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5770B619E1;
	Wed, 31 Mar 2021 04:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617163843;
	bh=CRIgsnvwwULTMw1iyO8MWQDFQ2WdQ73eLpPPYM2yeAo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOejjoZUOxbjksZ15DFPwvvo6Qr2HvYyFB6Y0bpbsn4+DJ3LIL0JQYoU5UERU6o5X
	 hU4A3gMHY65rqIHkh6o7H3PTjMrguhzvDi6+mudROrSsn4kTrxnMb+2iWlg0Oi9Toy
	 GTdSuVhn9ywbkGnN4YQ9MNgFyqv8Bj2HIVu2vze78fc+dprUqGf+DXP2VQI2ti7VnB
	 aAvcm/GxeByLrHNI+NLcQni2Dg6i7nJolk2T8XZEsDNNTc4fONX9e45F5g4PtyjV5q
	 ACRBl0gno4wVxl8HrcAxd4pz5eRxtj5OzV4fKQVCtFrLFegEAxHCP+0p9inJSdnpvz
	 sYv+FDWBeozhw==
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
Subject: [GIT PULL 3/6] i.MX DT bindings update for 5.13
Date: Wed, 31 Mar 2021 12:10:16 +0800
Message-Id: <20210331041019.31345-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindgins-5.13

for you to fetch changes up to 6634b2d252accd3fcdc94a5e0a1319009363892e:

  dt-bindings: arm: fsl: Add the reMarkable 2 e-Ink tablet (2021-03-29 09:42:11 +0800)

----------------------------------------------------------------
i.MX bindings update for 5.13:

- Add vendor prefix for reMarkable.
- Add compatible for reMarkable 2 e-Ink tablet, Kontron pITX-imx8m
  board, Engicam i.Core MX8M Mini devices.
- Add compatbile 'fsl,imx8qm-mu' for i.MX mailbox bindings.
- One correction on example clock-names in imx8qxp-lpcg bindings.

----------------------------------------------------------------
Alistair Francis (2):
      dt-bindings: Add vendor prefix for reMarkable
      dt-bindings: arm: fsl: Add the reMarkable 2 e-Ink tablet

Dong Aisheng (2):
      dt-bindings: arm: fsl: add imx8qm boards compatible string
      dt-bindings: mailbox: mu: add imx8qm support

Heiko Thiery (1):
      dt-bindings: arm: fsl: add Kontron pITX-imx8m board

Jagan Teki (2):
      dt-bindings: arm: fsl: Add Engicam i.Core MX8M Mini C.TOUCH 2.0
      dt-bindings: arm: fsl: Add Engicam i.Core MX8M Mini EDIMM2.2 Starter Kit

Peng Fan (1):
      dt-bindings: clock: imx8qxp-lpcg: correct the example clock-names

 Documentation/devicetree/bindings/arm/fsl.yaml           | 16 ++++++++++++++++
 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml          |  6 +++---
 Documentation/devicetree/bindings/mailbox/fsl,mu.yaml    |  5 ++++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml   |  2 ++
 4 files changed, 25 insertions(+), 4 deletions(-)
