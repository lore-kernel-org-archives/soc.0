Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02CEC3527D
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8368C36AEF; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 924FAC36AE9;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=RWtev9PToALS+FMSpTsXmhAiLWwBH9C4rX+lSGeLaDY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Nqb5zxHpuhjqjnDfT0qOUh24KLg8tU0Cy5gaZV5VPW8FD8SEkUIuLPhWaoz6gr7Kk
	 r80EPMWxoNFXJGk8/LSMf2R3iR73C8JVe7xknovCUprQX3QpJqdHEgeQHA4UJPojuk
	 eG4Hxtm712OOG3Xk+msZGKTlicaFIm2xtq+1TRwe86Iz4EMhAIoXy8a43xYCuLlxJk
	 DqpWM+bxFpH7R/1G1EeX4wcKfoQbibvbqHPnvRJ7CzxmR4MH7uNhkK51+NuO1ojD8H
	 REkiMFnvP3EzHKWCWckLaUAZUixUhqcfEycvqbudi6Zjf9aKND0MGfDC5VmmWWwtJw
	 8JalWSUN9Ni8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7E7D8EAC09F;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v5.18 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966351.15608.5405996312745957591.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <cover.1645784465.git.geert+renesas@glider.be>
In-Reply-To: <cover.1645784465.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 11:24:32 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v5.18.
> 
> It consists of two parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas ARM DT updates for v5.18 (take two)
    https://git.kernel.org/soc/soc/c/b10e270dc9ec
  - [GIT,PULL,2/2] Renesas driver updates for v5.18 (take two)
    https://git.kernel.org/soc/soc/c/f289f1d8a49f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


