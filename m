Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A78C19425
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 21:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 05E1023D22; Wed,  9 Dec 2020 21:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607547609;
	bh=6oLd1mMcRl4/GZhIg11CPt1bBe/BThqvBjQ7l/7ZQ/U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ojv6LBtT59LJSk7tXwfxn8kSO4bkv44sJPE6DWUU6SwR7yo+9tTf1NToIVGzDUJzg
	 uclg1zRDfbgSM6wqfxL1BoZcMlceGmGh5PD5YyjRpJKt5fInbWBn4E0secFA93duII
	 HYfOToQ8WQ/nXxTo/6kySi9Q810o8itF9fTgFjfy2hOvvXwGmuaTKz+4AXk9deKa0T
	 pUKVsGwAPmP3vIvu5Co7iAC45lxg6Gtysahe/Hqs+TBN8inCzpVyqr31L8ePEpqxXw
	 08eI+w+LzdVszlKPbPh9w3s+9sT1hO/JLsSEGshZi+pX9AfgTEsicjFd1Q0GyO+/s4
	 9KoStkAnv2dHQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Driver changes for omaps for genpd support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160754760983.22697.13289869352110371262.git-patchwork-notify@kernel.org>
Date: Wed, 09 Dec 2020 21:00:09 +0000
References: <pull-1606806458-694517@atomide.com>
In-Reply-To: <pull-1606806458-694517@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue,  1 Dec 2020 09:18:46 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit e7ae08d398e094e1305dee823435b1f996d39106:
> 
>   bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw (2020-10-26 10:08:53 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Driver changes for omaps for genpd support
    https://git.kernel.org/soc/soc/c/80c25006bc97
  - [GIT,PULL,2/4] Update am335x to boot without platform data
    https://git.kernel.org/soc/soc/c/07dd966db740
  - [GIT,PULL,3/4] Update am437x to boot without platform data
    https://git.kernel.org/soc/soc/c/eb672def8b9d
  - [GIT,PULL,4/4] Remaining genpd changes for omaps for v5.11
    https://git.kernel.org/soc/soc/c/7fbee7e3386c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


