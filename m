Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596C2C48BDF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 08:25:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB62F61248; Sun, 13 Jun 2021 08:25:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 268136120E;
	Sun, 13 Jun 2021 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623572757;
	bh=S22NKWmIySv0C1XXeyvBtUZxb6Y71pYcQkpVQR4QzpE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=m51NhEC31jb+X43u/ZvdjFrGQVSymt/aiUbl8/K9gAWEGJGCvDWvU0hsSBQGMpCj+
	 u4N9w7/ZAt6t4w+CvnUop1lb1JM34+yST9tVpggU2NEsBEClOR+fhI38A+VkPvmC/i
	 CclUlsSAorbFjASCDcVXDrSQF9YMAk/sX03K8Im9UY42YeIgcCHZJlVwHbjXWTHHf9
	 xbB9NWNyj+2ZPschG90PR1UIRua8cSj2xahbjrC3mTCwhOnBdHenFdFXKZ4OJsWnkZ
	 K4M0dFEfd1fGksh0SYntNFjbk2VSc2vwjt/m9Rvlxoqps397t/j7wMKy0EKTUg1UT7
	 Wr+398JAX6gnQ==
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
Subject: [GIT PULL 1/6] i.MX drivers update for 5.14
Date: Sun, 13 Jun 2021 16:25:39 +0800
Message-Id: <20210613082544.16067-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.14

for you to fetch changes up to 2a53b9d47b13ae8816ce5a7e5adeb77009d2ca4d:

  soc: imx: gpcv2: add support for i.MX8MN power domains (2021-06-12 11:51:28 +0800)

----------------------------------------------------------------
i.MX drivers update for 5.14:

- A patch series from Lucas Stach and Peng Fan adding i.MX8MM power
  domains support into i.MX GPCv2 driver.
- A couple of patches from Adam Ford adding i.MX8MN power domains on top
  of i.MX8MM power domain support.

----------------------------------------------------------------
Adam Ford (2):
      dt-bindings: add defines for i.MX8MN power domains
      soc: imx: gpcv2: add support for i.MX8MN power domains

Lucas Stach (11):
      soc: imx: gpcv2: move to more ideomatic error handling in probe
      soc: imx: gpcv2: move domain mapping to domain driver probe
      soc: imx: gpcv2: switch to clk_bulk_* API
      soc: imx: gpcv2: split power up and power down sequence control
      soc: imx: gpcv2: wait for ADB400 handshake
      soc: imx: gpcv2: add runtime PM support for power-domains
      soc: imx: gpcv2: allow domains without power-sequence control
      soc: imx: gpcv2: add support for optional resets
      dt-bindings: power: add defines for i.MX8MM power domains
      soc: imx: gpcv2: add support for i.MX8MM power domains
      soc: imx: gpcv2: Add support for missing i.MX8MM VPU/DISPMIX power domains

Peng Fan (1):
      soc: imx: gpcv2: move reset assert after requesting domain power up

 .../devicetree/bindings/power/fsl,imx-gpcv2.yaml   |   3 +
 drivers/soc/imx/gpcv2.c                            | 634 +++++++++++++++++----
 include/dt-bindings/power/imx8mm-power.h           |  22 +
 include/dt-bindings/power/imx8mn-power.h           |  15 +
 4 files changed, 559 insertions(+), 115 deletions(-)
 create mode 100644 include/dt-bindings/power/imx8mm-power.h
 create mode 100644 include/dt-bindings/power/imx8mn-power.h
