Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDD6C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:35:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B989F23B04; Tue,  8 Dec 2020 16:35:34 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	Li Yang <leoyang.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	kernel@pengutronix.de
Subject: Re: [GIT PULL 6/6] i.MX defconfig update for 5.11
Date: Tue,  8 Dec 2020 17:34:55 +0100
Message-Id: <160744514175.359082.5817516947683230720.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202142717.9262-6-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org> <20201202142717.9262-6-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 2 Dec 2020 22:27:17 +0800, Shawn Guo wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.11
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 249293397ec1ca29ac845c2d5d4c0c04ecdd9e29

       Arnd
