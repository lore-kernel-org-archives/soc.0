Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86589C001B3
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59837C433AD; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42D6CC43395;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=5VvMpmwjZFrdsku94lE3RwHZ/dItoL3OTlIYq8nz6NA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=V6ZvJyWHRyEDMZKng1QZEg1KLiN0Uo5ko0NdLMUaqBT7gYrnXe2QE02MrS1Aqphls
	 +Fn1hgiK5woxoWrD4kCKs5IoSC24b0uaRGw8/n0L/iK1OBPtp6G87waYJjp/7ROFD7
	 5mQwTEzDL8Sg5PwJWiT8dOFDmgUE/Ets5BjEeOiTyjQ5gbj5iC0ywFpNhltKCrbDfv
	 btLHSizENK9qOH872OUtrS6OH8ORom/KpLvEkhYyuOaw04fLhcokmQNzlXn3ILgpO8
	 6wfGZgYAKoOHh0mBywcPWcflh+LSxPlzEMSF2Sw8AWjOO3BJY1woLHlUJfWNCAu6He
	 3xpyMNhwjILhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 21A58C691EE;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: omap2: Fix copy/paste bug
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745023012.12309.9066723993680101437.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:30 +0000
References: <20230614093032.403982-1-linus.walleij@linaro.org>
In-Reply-To: <20230614093032.403982-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 14 Jun 2023 11:30:32 +0200 you wrote:
> I mistyped one of the SD/MMC GPIO lines on the Nokia n810 which
> was supposed to be "vio" as "vsd".
> 
> Fix it up.
> 
> Reported-by: Peter Vasil <petervasil@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: omap2: Fix copy/paste bug
    https://git.kernel.org/soc/soc/c/c1d57ee6eb99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


