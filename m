Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F801C19F2D
	for <soc@archiver.kernel.org>; Wed, 27 Jul 2022 14:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E905DC433C1; Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3797C43141;
	Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658933413;
	bh=mim+T30vyyLxw785W783Hhv2h1v+4nrsGvPZerSClE0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dnGabIZKwI5EBqE0I6kBNR/7NIwf39GqySot2wsH4xzBZEz2OHUxmD4RzxI/tyxp8
	 W7Re8EYZbEczISIk2bSW7RN3bG9skC54saZBptVKHgPWYisQUg764sVslJv97Yr1sX
	 Uo4Ki/wqPNSMherF9wFX42s4kIdAXsYY2htupqA351vXiDkTqIspngIM6NmEXBptvI
	 Vv9jrbSjHitIg1bGUwTXyeqpskMH27hv1MmaMnyX06TCn7b2OLEeAv8h8At/f/99bx
	 RkLpE8jmjSTitseEjxqcGamLymRLZBw4dWeoWtHjIQ9HrlwqUfIG7TC6kYMlPTqIXv
	 1naBNaImi2tIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B259CC43140;
	Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: lan966x: keep lan966 entries alphabetically sorted
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165893341372.18215.13280368400817559790.git-patchwork-notify@kernel.org>
Date: Wed, 27 Jul 2022 14:50:13 +0000
References: <20220726084931.1789855-1-claudiu.beznea@microchip.com>
In-Reply-To: <20220726084931.1789855-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Claudiu Beznea <claudiu.beznea@microchip.com>:

On Tue, 26 Jul 2022 11:49:31 +0300 you wrote:
> Keep LAN966 entries alphabetically sorted.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
> 
> This is based on [1] which is at the moment only in at91-dt branch.
> 
> [...]

Here is the summary with links:
  - ARM: dts: lan966x: keep lan966 entries alphabetically sorted
    https://git.kernel.org/soc/soc/c/ed65704f3a8f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


