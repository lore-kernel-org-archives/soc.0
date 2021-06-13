Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53285C48BDF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 08:26:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F26C6124C; Sun, 13 Jun 2021 08:26:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32AA06108D;
	Sun, 13 Jun 2021 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623572760;
	bh=wgVmKZtvUaEb+eyfGekTv3BJ91tsf33aH/xpOr0h88Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OI9l+9Risxyr2d3nYy/yXNipznTSwyVK+tC84zejucqnoOAhMHplzdkfdAzMTCR99
	 oUqm79XUgZFKrTtkOCng0RwrKtJXB3liXbAVVs63773+rlq4NnK0zdEzb9+G3yA1Kq
	 AZT0Doo9TdiVV7ubr1MkOVvOVo3mYl/X1gqm8bjlVSprIUTrL9+tMiww8B5kyKpEgE
	 EbaCIPQvFOXkoHNqpyQ4jz6JcWXxX7DVmiPDhH2q77hU3g6ctpThxztaKiGST66N0Q
	 FVeDFxmsC7c5KQG3b9jXCt41xbHMoLolGid0U/mQBF6tSFonafgAQOgycwdsI5yW5R
	 ZZmcGuS4UO4+A==
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
Subject: [GIT PULL 2/6] i.MX SoC changes for 5.14
Date: Sun, 13 Jun 2021 16:25:40 +0800
Message-Id: <20210613082544.16067-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
References: <20210613082544.16067-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.14

for you to fetch changes up to e34645f45805d8308866de7b69f117f554605bb6:

  ARM: imx: add smp support for imx7d (2021-06-12 12:02:57 +0800)

----------------------------------------------------------------
i.MX SoC changes for 5.14:

- Add SMP support for i.MX7D, as there are i.MX7D devices running in
  field with U-Boot that doesn't support PSCI.
- Fix imx5_cpu_suspend_info reference in i.MX5 PM code comments.
- Add SoC ID initialization for i.MX50.
- Drop unnecessary of_platform_default_populate() call from i.MX6Q
  .init_machine hook.
- A series from Oleksij Rempel to remove most of the i.MX6/7 board
  specific PHY fixups.

----------------------------------------------------------------
Anson Huang (1):
      ARM: imx: add smp support for imx7d

Jonathan Neuschäfer (2):
      ARM: imx: pm-imx5: Fix references to imx5_cpu_suspend_info
      ARM: imx: Initialize SoC ID on i.MX50

Marco Felsch (1):
      ARM: imx6q: drop of_platform_default_populate() from init_machine

Oleksij Rempel (7):
      ARM: imx6q: remove PHY fixup for KSZ9031
      ARM: imx6q: remove part of ar8031_phy_fixup()
      ARM: imx6q: remove BMCR_PDOWN handler in ar8035_phy_fixup()
      ARM: imx6q: remove clk-out fixup for the Atheros AR8031 and AR8035 PHYs
      ARM: imx6q: remove Atheros AR8035 SmartEEE fixup
      ARM: imx6sx: remove Atheros AR8031 PHY fixup
      ARM: imx7d: remove Atheros AR8031 PHY fixup

 arch/arm/mach-imx/Makefile        |   2 +-
 arch/arm/mach-imx/common.h        |   3 ++
 arch/arm/mach-imx/headsmp.S       |   9 ++++
 arch/arm/mach-imx/hotplug.c       |   3 ++
 arch/arm/mach-imx/mach-imx50.c    |   7 +++
 arch/arm/mach-imx/mach-imx6q.c    |  88 ---------------------------------
 arch/arm/mach-imx/mach-imx6sx.c   |  26 ----------
 arch/arm/mach-imx/mach-imx7d.c    |  25 +---------
 arch/arm/mach-imx/platsmp.c       |  26 ++++++++++
 arch/arm/mach-imx/src.c           | 101 ++++++++++++++++++++++++++++++++++----
 arch/arm/mach-imx/suspend-imx53.S |   4 +-
 drivers/soc/imx/soc-imx.c         |   3 ++
 include/soc/imx/cpu.h             |   1 +
 13 files changed, 149 insertions(+), 149 deletions(-)
