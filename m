Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE72C5478C
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C53D1C43601; Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEED7C433A6;
	Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693828;
	bh=4Q3gXjDU+fhPSyy3/3j4+LNBW5xTQpplEQzHMw2kptI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Tkdi/+6dqr5LMy/i5D7BODHhB3s1g/nZOgZMSOacKq1ChoxBS/YepEifWy9rE2XRr
	 99psZMDKPUvMTpRBs4VF2zUn/wAx1oqBYGw9hNob/7IH3KJHAmgcaehLcA7tDK/uzT
	 GiLMGwuPy+5FrPOsnvhqTfyT4oU+NTHI3gmaBzQTwZpufdJYhWUf8F3S5xAnC6+4fv
	 MWUF9lly0oqynDc7fPq+sG+ARgeeDGvVYFV2ca1aK25QuPiWuLtOlJDz0SMe6fbwav
	 6nO7J3e025kyElRY9wkK6z6pmuuuISc0htv3/J6hWZNTjmOr2miE3/unRfwiAoKmHe
	 q+b1Xfcxsu0sA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C4CBD84BBC;
	Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip firmware driver fixes for v6.8-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382857.28623.149461954067004836.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 13:10:28 +0000
References: <20240221-recognize-dust-4bb575f4e67b@spud>
In-Reply-To: <20240221-recognize-dust-4bb575f4e67b@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 16:37:15 +0000 you wrote:
> Hey Arnd,
> 
> Please pull a single fix for the single Microchip firmware driver.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip firmware driver fixes for v6.8-rc6
    https://git.kernel.org/soc/soc/c/4d934f94adc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


