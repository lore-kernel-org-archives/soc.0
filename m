Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC4DC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 16:41:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7043323C2D; Wed,  9 Dec 2020 16:41:53 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 2/6] i.MX SoC update for 5.11
Date: Wed,  9 Dec 2020 17:41:39 +0100
Message-Id: <160753194742.3961338.756595174771230425.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202142717.9262-2-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org> <20201202142717.9262-2-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 2 Dec 2020 22:27:13 +0800, Shawn Guo wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.11
> 
> [...]

Merged into arm/soc, thanks!

merge commit: e7e499ee8a844189edff3e768d4721d1a6cc67fd

       Arnd
