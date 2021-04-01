Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A072AC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 19:24:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 72915610CE; Thu,  1 Apr 2021 19:24:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAB4C610D2;
	Thu,  1 Apr 2021 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617305077;
	bh=/a2rDxtxOp4/XjgZGCA19UcmeftTo0SAm1DKhdMlO8k=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TpjUMRG15QNv+CJXFxCH7yc9WEqMgueJCyQqQEUMcjoKEEuWHMigP1JO5iymgpv3G
	 U3x92txZSfwf+OHV4jjzWagHjHQdSBdZOSuQB548NYGY1ORg0juq5ZGa1USa4IksUc
	 NYy+bEhzJbr/6JZkDF7hvvIQqtQWWEpJDUhOa6UIgazGO67te0lYgJ+xOQxIlL705I
	 c/05KSMvs+y0sPwq3BNHJfiZodIEKwJbH6bqIurt0n4/UUQkRTn18B5JA8Obj+PmkW
	 XCKbrCn9f0D6WPcfBOp+W5uyCkSd2RIItY2h5TDs5y4HgOpCCzOEdFjS5gSbtivIt5
	 n3XAgzVacIdBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/5] clk: tegra: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 21:24:16 +0200
Message-Id: <161730504512.632809.13353373466753586224.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-2-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com> <20210401172622.3352990-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:19 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-clk
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 16320d7fe7d6ca19c57523bb5a9b085942842159

       Arnd
