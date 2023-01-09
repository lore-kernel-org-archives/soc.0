Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB702C54EBE
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95F9FC43396; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75101C433D2;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673304083;
	bh=9UET/2vfdBr7xGVgOsli3rKvU50+pHUsxOX5mDNPkfM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=O1beyw0s2xBUinyytdX+dAc4CBbKnLZnF7Bb8CgDVok4I4kzU3ygamrqRZsATXu3W
	 FtSq/AD+4KwwYDuNsOy/M0R+TakUNU2JaIXbf5042N8O0zK0UyVYfX/j9SZ02Ln62g
	 m+gzWZosi1KU7YyaO3SbHJeCk+62TUlcjRDmbvWyKkdM5AVzITgMVgxR+LsbO+ZkDI
	 865myJLArG2M14sZd5txFWpN38OwAyjUiS9+Atp8cCodcfqV/2PW+HFgK1ZI9XzjkB
	 jSHGcKsmofW697TBpwmUPrboKnd+okN8ZauiWxaXCahraSDFcSoEgl8Bbz3IL+z5E8
	 31GRm7TpXlOBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D22DE21EE8;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: footbridge: drop unnecessary inclusion
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167330408337.13717.9200492599200128322.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jan 2023 22:41:23 +0000
References: <20221212135953.212303-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20221212135953.212303-1-alexandre.belloni@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Dec 2022 14:59:52 +0100 you wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> isa-rtc.c doesn't use any definition from bcd.h, remove its inclusion
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  arch/arm/mach-footbridge/isa-rtc.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - ARM: footbridge: drop unnecessary inclusion
    https://git.kernel.org/soc/soc/c/daec8b54e944

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


