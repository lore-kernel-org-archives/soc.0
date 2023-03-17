Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594CAC76196
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27345C433A4; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1008DC433D2;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068354;
	bh=t/p4DDMa6aXlW09pTtR35SekGkr8Y9lZ+X/YwAWOnZA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OIMDhYn0Tp5Ch9yJJASTlgPYvouELj5o+3vVp0RvrjVqK2TWMzVHTgRq5dcwOBaq6
	 QOsORx/hFssFbUhzzszLp+VRHzIucke3sTEyjW6VQDjDG7tsp3KwQDy7oVABZbz2HW
	 z6Ec6nuNKsDVk/PiQWjT/aKmfR9F6TS8sAppfmvsEKVgI9FBKcI8xPvLCOIknF015j
	 HmiaCTWPREQzfB2a5/9HNfTl21Ik/JN/adDuDVXMuu1LZdSKSSK2RJoadMshRhtClB
	 pfan5L7W1qRZKvnlGzmlRnMcZTqCJ/VXJyqg1IXA8fdvCQOyGJGwd2ceYsRW1PnCUW
	 53OnKSH7nf1pA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8E34E2A03A;
	Fri, 17 Mar 2023 15:52:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: virtconfig: Further shrink the config
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167906835395.32307.3841013904114099930.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 15:52:33 +0000
References: <20230221-arm64-virtconfig-slim-v1-1-604b64be7ec3@kernel.org>
In-Reply-To: <20230221-arm64-virtconfig-slim-v1-1-604b64be7ec3@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 06 Mar 2023 15:34:21 +0000 you wrote:
> After disabling platform support there's still some more pruning we can
> do to the virtconfig size, there are a number of drivers and subsystems
> which are not likely to be useful on mach-virt and so can be disabled in
> order to further improve build times. Let's do so, noting that having PCI
> device assignment means that PCI devices might potentially appear.
> 
> This is just an initial manual passthrough, there will be further savings
> available especially if we take a much more focused approach.
> 
> [...]

Here is the summary with links:
  - arm64: virtconfig: Further shrink the config
    https://git.kernel.org/soc/soc/c/7bf891434919

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


