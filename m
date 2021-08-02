Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA36C4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:33:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E5F0B60FC2; Mon,  2 Aug 2021 13:33:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97A6F60FC4;
	Mon,  2 Aug 2021 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911180;
	bh=5Utd1jsqdXvkifa65CMmossDe8JRj7ZzI8zHwZTHDqU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+9Nmg43m/vyoQ6+hKtTfxSetJyY0VfI+jYvecW9fd/dxu7xLfJsG6tQRtr51DC7/
	 G0Tr/cwVtdsY5YHx0nQxgdAAlY6SFy43j8Co1PlZd61rk6+1ictczkw7ytA6zWA7c6
	 0HOZqae6IpyY4st13ndHsP9FK1/FOf/8/Bj5vRojWigM2iOtZobxEyNqIQDfKEUWZX
	 IahAWtWvoFvfWx2iwMxfeRirT1fIyOYCnHZ87hcHufDiTOJo1YrNFXBJpYXScRqzln
	 v3074W7adMjdnMXrH+t6y/vgp1nXjCSBoE12LgS8XqJedvdco7m1LcUkmq9tbEMj6a
	 tywufG5G5L0mg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Li Yang <leoyang.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Stefan Agner <stefan@agner.ch>,
	linux-imx@nxp.com
Subject: Re: [GIT PULL] i.MX fixes for 5.14
Date: Mon,  2 Aug 2021 15:32:42 +0200
Message-Id: <162791113528.1139989.15546456709229753234.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210726023221.GF5901@dragon>
References: <20210726023221.GF5901@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 26 Jul 2021 10:32:22 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.14
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: bee757485161e2bb43fd0bcd5f7e17cfe2b11bbf

       Arnd
