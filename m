Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F15C54E51
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0CD1C433B1; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB38EC433C7;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693829;
	bh=X/LSCgRgS52TUpUx7NCRZRpdTI0dto5e/kQD36KI/Hw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=J/6UVwu+a1DdLtV2+Nfc/1YXUXk3BpKjGF6HMjHRiRmCWrCNpkBs/LELCW8P3OW7P
	 SAjZ7bLMhuUzIzRdmx1Cz6oC63Cg2hUNVefJQX0Kh4pTXooFb/2C54xLdScTgosNvN
	 FqfJMvmjX42yJ5ycxA1TVDScivjm1pI4ViONfWxQWvGDOPCIcvobsO24NeAe9DgISs
	 iUvc3WWZCEmQf03/sccfPQoepBz+T2hvrli/WGxn7Cq0t6A6EPDQQl0ddRuU4gTPSt
	 aFueEg0jNFF/GOUSTS6aKdzLD7R8NnG6Lra8HgQTUO+2rL1PdLTzi6N/23NYcMIedE
	 A9NZnXyF09wEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9027C39563;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip firmware driver fixes for v6.8-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382975.28623.9456595728497842633.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 13:10:29 +0000
References: <20240221-recognize-dust-4bb575f4e67b@spud>
In-Reply-To: <20240221-recognize-dust-4bb575f4e67b@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


