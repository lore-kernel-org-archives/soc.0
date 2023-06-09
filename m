Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F13C7EE29
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE11EC433B4; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEEFCC433EF;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316227;
	bh=nCyqzlE1K32AKGRbqTDpC4Y7EeDfzOlUIlqs1Pj3Pvs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KsGhqh4k+mwCBwhoVu6mq/hDbw/Ogg8cVSRGAu/xivcGFi8URuqD31S5x7hEExq+d
	 D5en78TXOCYKjepUwR2/68322elxfpYkPgFMxSSUBk/1zT9ysCIn5+VmNbBLFqr2Bj
	 Svfn+AD4ru8Vu+YRDPJt47z1PDrUKS2Gz8Xocl4X8ydMUvjOH+WZ39+IUm5cM3ExoT
	 LuxToL1AKXvQO34aQe+iknI06gfi9+rIvK2SGO54IJE0tbshV1beqpscps1pteaKow
	 7Ij0hSEr/YUjvY98BUyB8PU5lTF6RSIdI/7vxDSfH9KiKUbUSLmEa20udENvmXS9/q
	 6ZfCyqDlAOjIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5A69E29F37;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Clean-up for omaps for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622767.816.15540736758984033559.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <pull-1685946511-835910@atomide.com>
In-Reply-To: <pull-1685946511-835910@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 Jun 2023 09:28:53 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Clean-up for omaps for v6.5
    https://git.kernel.org/soc/soc/c/54cb981c2996

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


