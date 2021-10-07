Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F7EC433F5
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 13:20:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 53A1461139; Thu,  7 Oct 2021 13:20:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C55961090;
	Thu,  7 Oct 2021 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633612807;
	bh=Owxh7YxqFvF8F3uO05ZWa2v6dTeMYN62ERcc1k5zEkM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dNefvfwbm+LiwvnZiAltEWxOcGBq6gjFvRb9wMR3pqg4m0iwwYqxYaqOuVUXmuOuX
	 s02G8EatOs991FZvEALszP0xaeJYLcAqb+KxuUBveQSXdNGV6NBoBhUXNsylfGdHHN
	 lhd/D8myv//Bad6xOveJ62UxiZmIzyC2BjWM6N/0rVW6Q39aCGXpOKEVH3NR99wa64
	 SeliAMlJ8h/EtrONDfCPA4E3woAKexGAtxexug2JoVrZAtLOcqP41M0YiCZxQv1tIN
	 /QsL8jdxiR6noTixGGbcruVenxEMJc8K7iqI9Idyv+rG7GIhxDydtSJ3dagRFqzr+V
	 NzUvrXiWxP08g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2F87860A44;
	Thu,  7 Oct 2021 13:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.15, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163361280718.8016.3298464251473999169.git-patchwork-notify@kernel.org>
Date: Thu, 07 Oct 2021 13:20:07 +0000
References: <20211006125734.GA10197@dragon>
In-Reply-To: <20211006125734.GA10197@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Oct 2021 20:57:35 +0800 you wrote:
> The following changes since commit c54467482ffd407a4404c990697f432bfcb6cdc4:
> 
>   ARM: imx_v6_v7_defconfig: enable fb (2021-09-22 16:47:34 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.15, round 2
    https://git.kernel.org/soc/soc/c/2250596374f5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


