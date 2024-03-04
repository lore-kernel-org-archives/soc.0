Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC7C54E5E
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B3D2C4167D; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 612D6C4166B;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=I+c20WxfMl1R3pTnY6g69vg5FzmKJH5nCPc1Tpjr1V4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WyZz2koToYcX19Cr0eAhAAexjmUoVzilaBIhqQYi8xuBsdYlCT+Ccv+b+5deLYMhd
	 r9sMBUkI0ue2knZwN0mYHybavfZsEFOhsdfbAUZeYmXUWN+ZeJIe9ZFSzCUgrPpKWD
	 rXAqgfR6AfdoYm0YZk8mWsX1aaPqCg3jOZQ4zJRxQz9SO0dX8On7mGclU1wlkGl/vx
	 JVcbIY6VqC6BYQfZvtPhqcKKBB8eWGtxm8Kc4Ub2WF1IK311jNfRxHG+KeS5lDeptU
	 VhFhm1hWXT7L9pBYQ41Iiu2IjMH/4ILRpoW4GOTVJii3+UJzkvkze+/WEq9QiVqODm
	 Ecvbnsnebs0cw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3E837D9A4BB;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Update TI clksel clocks to use reg
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403225.23732.6851209764009406889.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <pull-1709102378-94138@atomide.com>
In-Reply-To: <pull-1709102378-94138@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Feb 2024 08:40:47 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Update TI clksel clocks to use reg
    https://git.kernel.org/soc/soc/c/794f8770648e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


