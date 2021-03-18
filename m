Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540C4C433E0
	for <soc@archiver.kernel.org>; Thu, 18 Mar 2021 09:01:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1050464F18; Thu, 18 Mar 2021 09:01:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68D606148E;
	Thu, 18 Mar 2021 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616058111;
	bh=1CaeqjzTDN5MXdLj74768GDiTbrkvP1IB1LRx7ToJ74=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=cFxsACFFPTH4rfQU2VL9hLMGpKBfsphrLZiMMecjlx/84a7cLP1to2DvbVe2gaCnQ
	 InQ+x4BkewCF0r2ufY6i1Lbn4T3o43vLulMyvVTYqkJZBDB1RonA+sj2/t81bGJpJP
	 AAkG7Xxb1crMMLufg1itplrki1hetYhfpNkUEzxnyqw+PlK3SOF3p2Ga2lW4JnnpO5
	 9uQ41OSe5BK9LWpYJx9MQnqP8K/IoKiIsv8Ze7PgSJ/kmBjfXYLAbPYTGid9sJVKdc
	 YCMAIxm/dJBialCcW1ibJFGFae9HFtLLUvB/+z/fx/ra4Mc7cVRE91lvkZw/+DRWyn
	 bQVzmLNbcdWDw==
Date: Thu, 18 Mar 2021 17:01:46 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.12
Message-ID: <20210318090145.GA22955@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.12

for you to fetch changes up to e4817a1b6b77db538bc0141c3b138f2df803ce87:

  ARM: dts: imx6ull: fix ubi filesystem mount failed (2021-03-18 12:06:28 +0800)

----------------------------------------------------------------
i.MX fixes for 5.12:

- Fix an Ethernet issue on imx6ul-14x14-evk board that is caused by
  independent PHY reset.
- Add missing `dma-coherent` property for LayerScape device trees to fix a
  kernel BUG report.
- Use IRQCHIP_DECLARE for AVIC driver to fix a boot issue on i.MX25 with
  fw_devlink=on.
- Add missing I2C pinctrl entry for imx8mp-phyboard-pollux-rdk board to
  fix the broken I2C GPIO recovery support.
- Add `fsl,use-minimum-ecc` property for imx6ull-myir-mys-6ulx-eval
  device tree to fix UBI filesystem mount failure.

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: imx6ul-14x14-evk: Do not reset the Ethernet PHYs independently

Horia Geantă (3):
      arm64: dts: ls1046a: mark crypto engine dma coherent
      arm64: dts: ls1043a: mark crypto engine dma coherent
      arm64: dts: ls1012a: mark crypto engine dma coherent

Saravana Kannan (1):
      ARM: imx: avic: Convert to using IRQCHIP_DECLARE

Teresa Remmet (1):
      arm64: dts: imx8mp-phyboard-pollux-rdk: Add missing pinctrl entry

dillon min (1):
      ARM: dts: imx6ull: fix ubi filesystem mount failed

 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            | 22 ++++++++++++++------
 arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dts   |  1 +
 arch/arm/mach-imx/avic.c                           | 16 ++++++++++++++-
 arch/arm/mach-imx/common.h                         |  1 -
 arch/arm/mach-imx/mach-imx1.c                      | 11 ----------
 arch/arm/mach-imx/mach-imx25.c                     | 12 -----------
 arch/arm/mach-imx/mach-imx27.c                     | 12 -----------
 arch/arm/mach-imx/mach-imx31.c                     |  1 -
 arch/arm/mach-imx/mach-imx35.c                     |  1 -
 arch/arm/mach-imx/mm-imx3.c                        | 24 ----------------------
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  1 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  2 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |  2 +-
 15 files changed, 37 insertions(+), 71 deletions(-)
