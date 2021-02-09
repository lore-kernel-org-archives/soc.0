Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546EDC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 18E2764E58; Tue,  9 Feb 2021 23:06:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1435964E40;
	Tue,  9 Feb 2021 23:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912008;
	bh=9Mmxj30d7mhNpCYYq/WROZfkeFz28nIdyxAIml6vc/Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V8LvEZ8STb7IkeY1Ub4uWrnWS634uM3lofIQyfsXQsaWIeO3MjldNAFERj77U34iI
	 i8oPkkhd9qNHw+f0nsf4aU3jTG5PFqwldMeIK/fnhD6+dB5iH6FGRmBLBkyoKcE1wl
	 jOkUEMRUSOVyyXr8FGqLvBJT26iLoKUTav471yMC5iDuUaIG+Yq1tbaRomLeY7RIZA
	 hJHo+R1URf12RxTb9/u8t7Yjm43ExPu9t+zW0aaUDYaGKi5QwVJj5pOy2nQVE0bqbo
	 iGxDkLszBguklTGwJozvG7XGGFfOeXVWuiXYtWTdva2UapMIbs6RO5sGOxh0w88OLM
	 JL5lMMX62jDxA==
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
Subject: Re: [GIT PULL 5/6] i.MX arm64 device tree update for 5.12
Date: Wed, 10 Feb 2021 00:06:14 +0100
Message-Id: <161291108094.974605.9080242291983961036.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-5-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org> <20210204120150.26186-5-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:49 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.12
> 
> [...]

Merged into arm/dt, thanks!

I noticed that this came fairly late in the cycle and has a fairly
large amount of changes in it. It would be nice if you could try
to send some of the contents a little earlier in the future to avoid
risking them to miss out.

It could also help to split up the largest branches to make them a
little smaller, e.g. by having one branch just for new SoC and/or
new board support, and another branch for changes to existing machines.

merge commit: 60c9579a01321003fd353c8f8c13012cac2128ba

       Arnd
