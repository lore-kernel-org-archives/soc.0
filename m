Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809EEC433F5
	for <soc@archiver.kernel.org>; Thu, 23 Sep 2021 06:34:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 45DD361019; Thu, 23 Sep 2021 06:34:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1D576103D;
	Thu, 23 Sep 2021 06:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632378846;
	bh=aVnY3qupI8HisDSAgQV1WYTf85N8gCMRXHmkRiCT0WU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=i+L4HqfJVbJqElZcTxTP1l7xnEjGI159sm6vUGodIl0uh5mSZiPzTKgrf4Llhukid
	 3GlAKM0txjeil3tAq8fBOPjaIGe5EPX8lWWBbnqUBygVe0lZANkQtQo51nZGT1JXpv
	 rENBkhtt91InvWFUHc79g2dheb9wpUnWWJoTXrcLYPY/fbefWQ3l+pNsOQJrg08UtC
	 1YescDmkP2MDqM1llE7KWSCVmIKaKNN5RBuFRSqXHeNwzeYlRMt9lnDqkDYoG4K5V4
	 LWdlgH9+9o24xXpFzp2p966sxwAZERYpfPV7qixxnspwVMLzuz7HiePD4mOqhKjqXb
	 QL7fdldLTohaQ==
Date: Thu, 23 Sep 2021 14:34:00 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.15
Message-ID: <20210923063356.GK13480@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15

for you to fetch changes up to c54467482ffd407a4404c990697f432bfcb6cdc4:

  ARM: imx_v6_v7_defconfig: enable fb (2021-09-22 16:47:34 +0800)

----------------------------------------------------------------
i.MX fixes for 5.15:

- Revert cc8870bf4c3a to fix the regression on i.MX6 that suspend
  support becomes broken.
- Add `qca,clk-out-frequency` property to fix Ethernet support on
  imx6qdl-pico board.
- Re-enable FB support in imx_v6_v7_defconfig.  It gets lost due to
  f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB").
- Fix LP5562 LED support on imx6dl-yapp4 board.
- Add missing pinctrl-names for panel on M53Menlo board.
- Fix USB host power regulator polarity on M53Menlo board.

----------------------------------------------------------------
Fabio Estevam (2):
      Revert "ARM: imx6q: drop of_platform_default_populate() from init_machine"
      ARM: dts: imx6qdl-pico: Fix Ethernet support

Marcel Ziswiler (1):
      ARM: imx_v6_v7_defconfig: enable fb

Marek Vasut (2):
      ARM: dts: imx: Add missing pinctrl-names for panel on M53Menlo
      ARM: dts: imx: Fix USB host power regulator polarity on M53Menlo

Michal Vokáč (1):
      ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe

 arch/arm/boot/dts/imx53-m53menlo.dts       |  4 ++--
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi |  5 +++++
 arch/arm/boot/dts/imx6qdl-pico.dtsi        | 11 +++++++++++
 arch/arm/configs/imx_v6_v7_defconfig       |  1 +
 arch/arm/mach-imx/mach-imx6q.c             |  3 +++
 5 files changed, 22 insertions(+), 2 deletions(-)
