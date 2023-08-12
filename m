Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B08C0015E
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64777C433CC; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D466C433C9;
	Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691828596;
	bh=SgKmJBnaGqyQk5yUuxzYV6zoCTxHL+UochkoG8mH6FI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=D7n66BVgaMO6t1ADtHDvwuRcutSBHQXXLzTa/xIOhwoAtjH4QARECee20oOP1OxYr
	 plpUJn5Foe7NHZpwccEGGGdStv097JdBnBhhnCTD3j2o9vQIQ94notD6tR2vaefVdw
	 jI7uTW8D89d0J1bGIvAWkqCPauXvqgtFJRQcV7OXRYyGehQwGYL5LEMsOnGQNVfGFG
	 XpJDr56kjQtRPfeGwWgpzCVsthXzuIz6GeQyQq11kRRPRZ3rCAjxu4ztqLBclvjAaC
	 9byj6vjmeQ1lW/cnAEtcMWFnNnxevBsD+aHmj1N8IMKxTasDxkiLHeDKWohvsQGgRR
	 HxBiFJ1xmyebA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 279F6E505D5;
	Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.5, 2nd round
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169182859615.22229.17401258822804679279.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 08:23:16 +0000
References: <20230809100034.GS151430@dragon>
In-Reply-To: <20230809100034.GS151430@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 9 Aug 2023 18:00:34 +0800 you wrote:
> The following changes since commit 53cab4d871690c49fac87c657cbf459e39c5b93b:
> 
>   soc: imx: imx8mp-blk-ctrl: register HSIO PLL clock as bus_power_dev child (2023-07-19 15:44:02 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.5-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.5, 2nd round
    https://git.kernel.org/soc/soc/c/991e0d9dbbd0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


