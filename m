Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E524AC41513
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D526EC32781; Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF3C4C4AF07;
	Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718920283;
	bh=+0r+w8yWZUkb8Avuxru9gZHw2bgSpqxQIDeGO+um4Og=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fQmkZfKK+Tb/jh76TSvg3RKaxCxvXDWroahpmi+NU57Sr7HXBtPvMOTLL3QCFIS5A
	 MWbksb+awUAuamHe5KCzsWbg95MihFz8Tn9Rthga0G+O+R2cjqHF3axjkC/N2TyClt
	 PT/wm95wevc/fcuExLjGKA3ki3kycQn4KXStn3NSNvxqBLLaXj5+Rl3BaeBwKp495v
	 zGdvt3VWDAMzkGyHQh+iO0t+CbY+4Ygjm1xfmqNNeoUY6pGzdiApEiEim3PUSZARpC
	 28Et1j84SDa5hfoNMG83rQo0cBp0/dUKUoXk/HLCT3eg+JzJW/liwCPBzUh+xJbf2B
	 0BXJU9eAVOIwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A34E7CF3B99;
	Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.10-rc4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171892028366.21354.17412374132863986630.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jun 2024 21:51:23 +0000
References: <MA0P287MB28226E34D9390B311201B7C4FECF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB28226E34D9390B311201B7C4FECF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 19 Jun 2024 09:09:27 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt fixes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.10-rc4
    https://git.kernel.org/soc/soc/c/8de8165693d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


