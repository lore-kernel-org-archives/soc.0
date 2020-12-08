Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFFDC4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:11:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F6EC23B28; Tue,  8 Dec 2020 23:11:11 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Li Yang <leoyang.li@nxp.com>,
	Stefan Agner <stefan@agner.ch>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL 3/6] i.MX DT bindings update for 5.11
Date: Wed,  9 Dec 2020 00:09:54 +0100
Message-Id: <160746884773.2839681.9570455725998596230.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202142717.9262-3-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org> <20201202142717.9262-3-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 2 Dec 2020 22:27:14 +0800, Shawn Guo wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 3eaac3aed2e3aff29198a6058069fa7712d13e60

       Arnd
