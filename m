Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B56C25B4D
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D58EFC433B8; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF4D3C433B6;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=L8I4imjz4XOdxh9t2q9p9g+KZ5y4iRkxOutSlo8yhG0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gkkdhzpfxeVSYY5idllUDhbg3nQL+0APWjPrkFS5xoXG4rfN8AE9vOPNG8wGC+NV/
	 djpJXNiZ7D+dQRXsXwO4cbA3SJp5qLPg7fv/zU9oepYeB4lkNEhnGzoQpND/BS7Jye
	 DwL44+XS63+ii2TOeXhAthYLcPP6JV+lXcl2DKLOaq+fUFwoaiIOWTz8mABIY5dBNW
	 FJ2ZG0cQvxwKi1LccOkh3LmxL+/Fzz08wLgZpiVrU1M4opFjBQ1CQHd8iOc9VI8VUY
	 AGYF9Dzwg6v+lAMD//TNI5neJocWQ/xS6p+TrW5Xgm8dSvmNijh1InfcbUXU5YZh0f
	 qYdK1ZSW6vAkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98D3BE21EC3;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: mediatek: Updates for v6.7 - third try
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943062.14534.16710769659082731934.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
References: <298f159c-f80d-3ba8-fde9-b11b59e5a58e@gmail.com>
In-Reply-To: <298f159c-f80d-3ba8-fde9-b11b59e5a58e@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 Oct 2023 13:30:25 +0200 you wrote:
> Hi Arnd and Olof,
> 
> This is the third try to send you a pull request that meets all requirements.
> Sorry for the mess in this round.
> 
> Please find below a few patches for the 64 bit DTS files targeted for v6.7.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: mediatek: Updates for v6.7 - third try
    https://git.kernel.org/soc/soc/c/79d01625c3c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


