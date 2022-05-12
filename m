Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEBFC433FE
	for <soc@archiver.kernel.org>; Thu, 12 May 2022 20:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60FAAC385B8; Thu, 12 May 2022 20:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ED36C34113;
	Thu, 12 May 2022 20:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652388015;
	bh=MUyOxpkM7QGkGtiePq4hYcZPmTdGBifyEAszZZEUYbg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u8YoRwqYkqFlGG6wS35ZO4UrLGc0xDe53W+R+JEWD46bNMJP3HNfMzGZKMLF4jl8e
	 3+9P3bfu9mVqOxWZvqBvYjs18EPSSvvMMlsuEGcc6QTluQnvj7BKR2JtKT3ys4sHOJ
	 HZowWi0oPYSxS5cLZm8g5WEC4r2zz30X/OZM/rRRPqCK0e22U8Ieq1kJSEuKmJcLsp
	 EEP4LpcW497pop64XraxtURx0BCTM5jh2x1qbjY8Ms8pp+ZogeHfc0Aq1rc+CTKmr2
	 TI97mxiNT0y+EJWoBQUFN8huSeNoQzuN3J5zfxJYuQmwWyQuLGKgbelENum/2/hP0P
	 5vAO3E3ryXyIg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1ACE2F03935;
	Thu, 12 May 2022 20:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165238801510.21441.172693572195770696.git-patchwork-notify@kernel.org>
Date: Thu, 12 May 2022 20:40:15 +0000
References: <2300256.NG923GbCHz@phil>
In-Reply-To: <2300256.NG923GbCHz@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 11 May 2022 06:07:07 +0200 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.18
    https://git.kernel.org/soc/soc/c/609a097f5f06

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


