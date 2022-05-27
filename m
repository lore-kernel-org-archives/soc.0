Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71317C433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 13:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C342C385A9; Fri, 27 May 2022 13:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 166F2C34113;
	Fri, 27 May 2022 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653658095;
	bh=m407yO+lXgkeVW7R7peS2FNRWIixNvZD2bEBdLVGuuk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nTKA+TA0TYVJfXWIJ1y1kDawwc0uomaWxYWS7wQ74lLMVeiBa/FjaHK56HzgF5e+T
	 jhev0Ja4ah3GbrbsSgyYdE9U+HgRXGyDCKhiXo3orUZwNPS9X1MkMcKHbegXVPuI3t
	 pmifUYQOa7wIPojQf7JZNNuuQNcpnJjxxs6IvrhahAILSJA8ScP8KYfT28W8gqCQre
	 +idLW/hnHMON0WbPQ/Fd4jfFgk+Gj8KVJxVZCnQ0w52fS3Nx7GX1qOJQoQz9GNxRxI
	 yIqUIoEmpAZXKL9LHsoUHfYcGiwwecH6d3LbNrgFFOY+VUtKPHCt95PBbLjSyoXGIk
	 OticHR/hIhATw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC3EAF03947;
	Fri, 27 May 2022 13:28:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/5] ARM: SoC changes for 5.19, part 1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165365809496.30025.1486569524530346820.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 13:28:14 +0000
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
In-Reply-To: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 26 May 2022 16:44:02 +0200 you wrote:
> This is a large chunk of ARM related changes, but larger than average
> patches for both DT and drivers, plus a series for multiplatform conversion.
> Today's patches contain the first 1084 changesets, but I am planning for
> a follow-up with another 100 or so next week that had some late rebases.
> 
> Most active developers this time are:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] ARM: updates for 32-bit SoCs
    https://git.kernel.org/soc/soc/c/c011dd537ffe
  - [GIT,PULL,2/5] ARM: DT changes for 5.19, part 1
    https://git.kernel.org/soc/soc/c/ae862183285c
  - [GIT,PULL,3/5] ARM: driver changes for 5.19
    https://git.kernel.org/soc/soc/c/cc3c470ae4ad
  - [GIT,PULL,4/5] ARM: defconfig updates for 5.19
    https://git.kernel.org/soc/soc/c/a0439cf4eca0
  - [GIT,PULL,5/5] ARM: ARMv4T/v5 multiplatform support for v5.19, part 1
    https://git.kernel.org/soc/soc/c/ecf0aa5317b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


