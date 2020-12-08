Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDC3C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:11:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 449A823B00; Tue,  8 Dec 2020 16:11:29 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL] i.MX fixes for 5.10, round 5
Date: Tue,  8 Dec 2020 17:11:13 +0100
Message-Id: <160744385127.3969289.8841342534555969590.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201091820.GW4072@dragon>
References: <20201201091820.GW4072@dragon>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 17:18:21 +0800, Shawn Guo wrote:
> The following changes since commit 33d0d843872c5ddbe28457a92fc6f2487315fb9f:
> 
>   ARM: dts: imx50-evk: Fix the chip select 1 IOMUX (2020-11-10 10:36:10 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.10-5
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 5e2e740247791e9c0663d8c41d04b52f1db22037

       Arnd
