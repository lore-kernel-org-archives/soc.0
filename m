Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978F7C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79B9B60F39; Mon, 16 Aug 2021 21:21:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E22460F11;
	Mon, 16 Aug 2021 21:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148888;
	bh=aI8efoaCxMX9buTKx1yYutE/U7M6S1HQoY4SyxY6B78=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b4x9gQRH/3munsAxRLPiRFNFhxEeCJ5roKcBDagdYetGKp6s0r2ZzL1dr4HpBCoIy
	 2FHhYfXVM/KBc8QcCH/Wajn7HhvkGum16CI/NzLePFh0kOlVd3g5USno/2r3lHAU9M
	 VLmrl7Os69NUxvEvl0EyVOv8xmcjPeYN/KPM//4+kGHOGHjvjmoi3V0gX4xNyGc0qR
	 59CV7vAhe3/yp8oyHghYYFfQFJfdnW5dFjjAuVo11BK2I8tfli9akGGrau3c6NZl6a
	 JZBSzxCEpzMfy1EovwcniWb9PKBTU/RNL3aPt9+JC+6OJa0s0X7oM1j6f5Rwhurqaq
	 uKMVYKfcgZW0w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 2/4] i.MX arm32 device tree changes for 5.15
Date: Mon, 16 Aug 2021 23:21:24 +0200
Message-Id: <162914887787.238436.2285917910205643269.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210814133853.9981-2-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org> <20210814133853.9981-2-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 14 Aug 2021 21:38:51 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9b35ab1e314c3f563f8d6982c0a8f2c8964e4a36

       Arnd
