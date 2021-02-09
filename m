Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA6AC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A3E164E4B; Tue,  9 Feb 2021 23:06:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A47764E50;
	Tue,  9 Feb 2021 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912003;
	bh=N+wrpsvcANkoNLYnDnDHfEuPrrF952t2G46nComfzVE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+v4BUV6Z7H420/g4LSh0oejzN1nhraurspA12nZRO3J78bXQFKaf0hdjIduSKD9H
	 yAYLmpChVsk8IEsiSSHN50KWj139UCVAAtWGEBppg1s6BmnrqeKVGL66LHLZLn1pqa
	 W76FVdwDQfM8vEyWRd3bqzCvQV76Yrer5/kJWzvz2gxM7M/qO1J1BjM/17OBm7+yxu
	 IPXfJA0AV322amPoXAGeLV33weC7Xu7XhLMY2Y5VljewkvYoqmBiH4O/xMjcV3uCPw
	 99Q82bMtGMCcixrzJU3k7PvTatabHyBPzsuDmNJJo9Q49FvnJC7J9+t6bJJD87z48v
	 cU234w3LSVLuw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stefan Agner <stefan@agner.ch>,
	linux-imx@nxp.com,
	Li Yang <leoyang.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/6] i.MX DT bindings update for 5.12
Date: Wed, 10 Feb 2021 00:06:12 +0100
Message-Id: <161291108076.974605.15340898669997318905.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-3-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org> <20210204120150.26186-3-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:47 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.12
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 6f771ce6c3bb2c4dc9d348b578871c7adb8b285b

       Arnd
