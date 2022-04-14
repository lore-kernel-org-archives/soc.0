Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5183CC3527C
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C4D6C385AD; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15644C385AE;
	Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970617;
	bh=LmyQgBFs6Q6dKb5auSYZEW3QJaY4191jPLeBX5Uotx0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lqHI3Ysahf/kZnQVXQ8T0P1ILJvSqN8+fxYZ5ntTPYHM+XY+DIOdTvkAzqoW2wMAa
	 uezo40lZHNzPA3s4//Q+2HcMGpiSAylGMKZhy/QCwMNbLCp5dWai0qvxAICkF1WZSR
	 c4jBdLCdgB8O3EI9XK0uogbp/Rd2+e+P4LAtXxnsIYa6cxE1/ugXiqqvySKtdsMVqY
	 6wFTK786ERDkNmydAwwF55KUiet7vgZQULzAvGU7dpsNUG6S0wEV/3PNy4aSkpXj2d
	 Yf5z+qOJqJMeYD4t2Qj9hISVuVOjiqZ9edHdgSrhfcFciNqLmxdsPQKnKChQgiXcaS
	 Or6Pq/H8JZjqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 025F8EAC09C;
	Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: fixes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061700.10394.10744242558332547265.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:17 +0000
References: <20220414143318.26363-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220414143318.26363-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Apr 2022 16:33:18 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the fixes for 5.18 addressing DT issues. Please pull.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: fixes for 5.18
    https://git.kernel.org/soc/soc/c/67e473a303e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


