Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F47C54E58
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF5F5C43601; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA080C43399;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693829;
	bh=8OYf84/ZnrQNvA6WzrsdY8QVVf/SZRWya6CA/GnBb4s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Bl+APN1bcGzh8XzVRL04PJ58DcpQbhty7UpS3Autrj53lWzcZ0eX2Ohe/1NrL+aXc
	 1T+kEJP+XF91EtOWsLcMGttQttv8IRethH06meqDjjvfXmKfXizsCOE1w9T6nC16Y3
	 eFADYrYzckcN4nIMh5QsZ6gm2IIN2RO6wXWmR8Sh+x7B/bmfaAH69dW6WOtSTcoSZF
	 xE4nENvEbgJoJc3/RnzYfCIjbYvAbX/ZgJEZKhoNj6YmoOMRCG9IxN01gaiH6na2mQ
	 scEi0NHaUILdlK218s0OEJ6wJ49C8/Wa/xVehrm03TirvFg7Aj600PBp0x6P2HC51M
	 woktMmvmFNb/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C75D4D84BBC;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC driver fixes for v6.8-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382981.28623.8452845100632265770.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 13:10:29 +0000
References: <20240221-irate-outrage-cf7f96f83074@spud>
In-Reply-To: <20240221-irate-outrage-cf7f96f83074@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 16:44:29 +0000 you wrote:
> Arnd,
> 
> Yet another 1 patch PR.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC driver fixes for v6.8-rc6
    https://git.kernel.org/soc/soc/c/fe514e177532

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


