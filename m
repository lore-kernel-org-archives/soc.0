Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66443C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 12:02:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 074D864F65; Thu,  4 Feb 2021 12:02:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D6BC64F5C;
	Thu,  4 Feb 2021 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612440125;
	bh=TM1KQsbvxtFKjTK7qmaypFlrAbjUrVOdA33g8M9LEz0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyFGgCACIXJMprsypM04r7qz1nwlLm3G+WsOOMI+ykR4dqqH1hGDKyklD984aprew
	 qB5dMw9ex+KgeEb3+l1xcl9E/b9K1Pu5OLZFcCreP3calrSlVEcRcwW5UH+tSlRgTY
	 /kt1innZTuKyhNPKzBw1PW1b+uA5k1+/GyJASQibq01tBzrqjX8Uraxbg7YXmH5WHy
	 CfztB1+tJMN8np0BcfaeMSp7vUWpYdboVNZX5zGdJSncWNz3QsugFz6vIMd7nb9q2b
	 2LhLQvghEpqHgJ5aQidad0qyXl0MYKpsIIYjoy19w1ssK/W1+/OcH74NLzNw5TCHGu
	 BFymJXi7abc1w==
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
Subject: [GIT PULL 2/6] i.MX SoC update for 5.12
Date: Thu,  4 Feb 2021 20:01:46 +0800
Message-Id: <20210204120150.26186-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.12

for you to fetch changes up to 579c6f925e5ae3a70ec32e936908066707dbfef5:

  ARM: imx: Remove unused IMX_GPIO_NR() macro (2021-01-29 16:47:25 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.12:

- Drop unused IMX_GPIO_NR() macro.
- Remove KSZ8081 PHY fixup from i.MX6UL machine code, because it only
  applies for KSZ8081RNA with 50MHz clock source, but breaks other
  KSZ8081 PHY configurations.
- Add a print of CPU type and SOC revision for i.MX6UL during boot.

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: imx: Remove unused IMX_GPIO_NR() macro

Oleksij Rempel (1):
      ARM: imx: mach-imx6ul: remove 14x14 EVK specific PHY fixup

Stefan Riedmueller (1):
      ARM: mach-imx: imx6ul: Print SOC revision on boot

 arch/arm/mach-imx/hardware.h    |  4 ----
 arch/arm/mach-imx/mach-imx6ul.c | 25 ++++---------------------
 2 files changed, 4 insertions(+), 25 deletions(-)
