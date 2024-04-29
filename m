Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FBAC25B5C
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CC56C4AF60; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 261B7C4AF4D;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=up0DZlKzCjD66nDSnaGBnSn2QcxoUSnPd4Xs1iaY11M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=T86x2x24RyGeMPiOdpfSMqJbRM3reU7+9vWRQDgnpfvurfMOOoN42oY9cdMHID0Xh
	 WH6mpksCQRBT+/3ZuwBLkndgQuEp5neNc8OkUVqnnsZGOE8iUtRDy+NI9QpAIQLG0T
	 kDkX4K6yGmL3CrNnGUQjiRUaUsEJlww4ngu8Ow99pIT67/y2i97B2XjMuQbvJFIdD4
	 q2YgTP9sz8zwDsm6shZoB//0ScZQBZm7nh+qzjp9JN10RMLMVNwx21xt70HrG1nPaj
	 f5gM5WrvHEleF3MzmReXrIn9ZQJ7pJJTkMxt5nx4vG+j/v8AReylOJa2X/yRH9HO00
	 CcodSkfRcrSvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 15683E2D48A;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip arm64 defconfig changes for 6.10 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444708.17402.4124109936420801238.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <8976550.lOV4Wx5bFT@phil>
In-Reply-To: <8976550.lOV4Wx5bFT@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 23:46:20 +0200 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.10-rockchip-defconfig64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip arm64 defconfig changes for 6.10 #1
    https://git.kernel.org/soc/soc/c/c356ab9b8f6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


