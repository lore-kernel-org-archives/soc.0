Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FB8C3DA4C
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E10FC4AF1C; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 704C9C4AF17;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=JZtRwUXuJGSCnv6/j5NwIVMDZoHLqkqBmDHykpFLT5Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=R6O/xbmvxRLuxN3jz+g2pTt7lIGmtjuUc5esk012//nfjkegB0IFTtc2hVhzgQ1oH
	 BBQXYGFBm2fXU8y9nnFj/H09trCQ+W23gOGnKQ3vUyCZPD62+/F7BsAT6iEnpt/OlK
	 FcU26JRn5s4xh8w5GHZBba7CghBS0uI0zGSWD6g4cbub3rB8AJhON5P6HxtJhX8+Rp
	 97WmF1d5QOmeExDzOIFUh4lFOis8yvbhK5xxxlZTW9ofYssJQFMWUMgOrp3jbh8Kgd
	 37iz8eyvnC3xkHJsIk7cC72QSIsOxxRKRV8BofSK7bafeDU+arY4xBeEAO8PqmmfZc
	 46mf7YIwQkfEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 64B4FDF370E;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V firmware drivers for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743840.12156.16039696947441137392.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <20240707-lukewarm-film-8a9da40a1c27@spud>
In-Reply-To: <20240707-lukewarm-film-8a9da40a1c27@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 7 Jul 2024 18:23:45 +0100 you wrote:
> Hey Arnd,
> 
> Attempt 2 with a fixed $subject. I blame being sick for missing that..
> 
> Please pull a handful of changes to the Auto Update driver.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V firmware drivers for v6.11
    https://git.kernel.org/soc/soc/c/9f511474895e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


