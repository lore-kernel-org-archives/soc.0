Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70C4C77B76
	for <soc@archiver.kernel.org>; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93A0EC433A7; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D56AC4339C;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681746620;
	bh=0pnhS5Vv88H0jseRNF4UCyoMhigC+Z4pDij8vV7kdOA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZkBAO3pFPUn0cFxWXgyl0hZJjlEIVt5Lp4sWxFY1J5yGgdmWka9uq+4plfeCpZ7sl
	 03WT2P3VEjwRqcTAiv7wKubggY0A0Yc+dTdTUAbItLcJ9PGWAseU7YFGIMKSXlMTpv
	 MYMKk8XtjHtfJ27a45FzFLXQNJRmpKl+ZAIsSVpJzvzd+l1QEx6s5Psh7JPDtg2dAf
	 +MoVnSnEby13a3hER3Y9pA52HDTCdcOMjdG40pl6ebKG9AwLKiMV0DWtxIo5OOd0+E
	 yLR4K9wERF6c8rZB9nMCGyTzlbeDJMBj7IDqMsf6mzbCJfiG7byh9RkrX9R9y6khx8
	 WNVepVJ9fjsAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 501EBE4508A;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers: late pull for v6.4, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168174662032.17676.17311378232793464333.git-patchwork-notify@kernel.org>
Date: Mon, 17 Apr 2023 15:50:20 +0000
References: <20230416143248.308942-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416143248.308942-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 16 Apr 2023 16:32:48 +0200 you wrote:
> The following changes since commit 69d170c4c28ba0490bd42630cc09d7e1834bbb3d:
> 
>   dt-bindings: memory-controller: Drop unneeded quotes (2023-03-31 21:53:15 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.4-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers: late pull for v6.4, part two
    https://git.kernel.org/soc/soc/c/69bda55a09d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


