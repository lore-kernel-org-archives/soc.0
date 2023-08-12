Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02DFC3DA40
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C402EC433B6; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD9A4C433AB;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=hfqgN025bW20OnVOFx8CgBBXVtllTZuNQ/4hJOYbzBU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lljPwhN5vdrjPS8ghP9IkO/UrPMJfX7X1OkIOMBHut/V08Ccs9qfy4YyhoUNWCrh1
	 ldmVKgNw1HtcrUBotJxunvZUV6UpHInOatBBnGubyIF3LEn8UDbLxSg6i77PPVb4rl
	 2x0gSp6yC3ZiK5oCdHOKQiZmNUG5eBZmqmDa/TTQGuXuKT9l9pv0fzbEsgR9Tre0gI
	 bBkWuaGJLsvswhRY24zuhvnmfELGEd2rW7YkwzpQBRkgDOAQNB6zhNT2d4yGzLiCxN
	 MpR0SQD3Vk+qTuRznXdVza0bprb1p30T9kk2uvJSwQezXTzP2k6trGvIdPPudqhRJ3
	 uFp8ylOspi5og==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9BF50E505D5;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner drivers changes for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562763.32343.18044876012485267141.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <20230806180650.GA127142@jernej-laptop>
In-Reply-To: <20230806180650.GA127142@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 6 Aug 2023 20:06:50 +0200 you wrote:
> Hi!
> 
> Please pull following driver changes for 6.6.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner drivers changes for 6.6
    https://git.kernel.org/soc/soc/c/347cdfc86b0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


