Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2366C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D3381610E9; Thu,  1 Apr 2021 20:15:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D577D610F7;
	Thu,  1 Apr 2021 20:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308152;
	bh=kwWyuDUAJuOzjmy8QsMSGDC1bsN5AwFFHpq5F3sfG0E=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fnXZ9+oy+xCSyh0FAWf+V/VbBvNh3ParmimUP3KAwjcvZlGq1EA+HBzrBGTG+X1Ab
	 yluUOwddRuhDV6p6qZyj/wrzWPEdlWjhDrB7F+7qzrf1hlPXPY//YZbwNVAZxm1nQc
	 Ar46RZokVBb1TFVkRnXfB71oFKItM2t7d7dH5n1rrTr8yBSGtkQuprvncG8zR92JTe
	 2s2mGoxFAwA0X/8js5mEzwYpl33XFjvGZ2fAuNmy8AmqNsKyB1zScU+u2k+Gg4VJh9
	 uq3vUp+uCYlEsJ2SSP3RFgSlj1o+28IIbY8y76lMtZOWr2Rfo1OKzVeqIKfqvtWL0F
	 XlAFuYMrX6gMw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Li Yang <leoyang.li@nxp.com>,
	linux-imx@nxp.com,
	Stefan Agner <stefan@agner.ch>
Subject: Re: [GIT PULL 3/6] i.MX DT bindings update for 5.13
Date: Thu,  1 Apr 2021 22:15:23 +0200
Message-Id: <161730808624.655497.9470372573569537914.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-3-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org> <20210331041019.31345-3-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:16 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindgins-5.13
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 2771bc0dbaad48238b0fc3ae73d1c5215b5e018b

       Arnd
