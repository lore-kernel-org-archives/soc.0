Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67A2C19F2C
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68F8AC43470; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 525A5C433B5;
	Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659450031;
	bh=8ZVYtYyBtD3Oo9qMBda0/7M0+3pF6o0U5zbIpvPxgmw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IAOHq93t5emZDqTKK8OxF8RH9WwLTi6DOhtywMFtsTxgzcHjEYwJWjDupI7T7/jpB
	 xGjFu6IM0y0uhRQB30JgNEdLFua00bSNS7y3TurCfvmZf3AftqPnTtXE0vtgXrpRoD
	 sccSlzNgeXQGjuF2YDXXv6GZDgFnUFGqz/Z9RNem9ySbFqsFEMajDmc9rLBDQRUe/g
	 7wVNVpZVs1KFFR4cNM8x7eUp8Msip/2mGrppYuXzDQ6BzHVh8njnN/ZywgBPc2VElo
	 bRDmj1A05cm9sleJJCDpa1GMJLWbAbTrj6NMxuSn4bM8CiwLSgZkJ6eDYZXs+od5CA
	 mUKE5zNqyL0nQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E862C43145;
	Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165945003118.4474.16425525007030959759.git-patchwork-notify@kernel.org>
Date: Tue, 02 Aug 2022 14:20:31 +0000
References: <20220729133620.488379-1-p.zabel@pengutronix.de>
In-Reply-To: <20220729133620.488379-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 Jul 2022 15:36:20 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v5.20
    https://git.kernel.org/soc/soc/c/d2fd1ddd311d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


