Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A44ECCA483
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01465C385A2; Fri,  8 Jul 2022 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEC94C341CE;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657266614;
	bh=LAmubvZlPRbjLVUmcUxI8jvLNgM/z3ph0YTaJd1dKLQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YmK5CymWzqkMoIxyM67kX1PIVvfaq/gXVEjrjFOs2SNliAXzjkW+xmuRglFNElmRj
	 QfINFlJqZJ4dbHnuzGu0bwpxTKDlhJF/Os63xvyjMuUC8H1bzy4ScPKejJzpOyyvix
	 RiqeTs1mSZpE4FZSf8K/C2Ylbz+fxvMIHwMqODJhO8XWEGFJ+9VzYCaVrJYSPZ1c6U
	 p+4nY+oZ2G8fz7QzTkLkZYH/NaFEHvCCYrKCvvwt0tG3Ty5G8SVjYhfeuO+xezWadP
	 GqEyASvrfJNxgLQPdd8o2jTNnonsfAiQoJcqSqvZ241jkRLCsdJ3br7rj5JDL4VlYU
	 X2AYxaRumg6ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE314E45BDA;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: soc: ZynqMP SoC changes for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165726661477.10888.15963707120093491430.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 07:50:14 +0000
References: <0196d1f3-e9c7-ef51-143d-e98b14980f63@monstr.eu>
In-Reply-To: <0196d1f3-e9c7-ef51-143d-e98b14980f63@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 Jul 2022 16:11:46 +0200 you wrote:
> Hi,
> 
> please pull the following patch to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: soc: ZynqMP SoC changes for v5.20
    https://git.kernel.org/soc/soc/c/8fcdf10295b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


