Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1116C19F4F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93765C2BD11; Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D1A9C116B1;
	Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148531;
	bh=TuzIeq6b+TE2AOMBZLHTBG4w0Cvb70Ps3HC7EIS2VC8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bWeHlYKY9vSGCyvpo8pDXN/u+Q9koYJ2Jn9sAHctAFaJOISfINUtZV/CW/kCIKSMH
	 EvnnDXUPy7du6mgBUuSmARvCWYluD9FYAkfzUPADGzF15Dxw3VgpxjUO4RSq0UXf4q
	 FHJUrsHEup8V/53palcY2rgag/waWPwAF+2hjr9krUGqTkFjbz0Qs/+egQFYLRxA4T
	 KGgqyK7UApJlwCbCiMPpBBRqCf0boyme1zww/0JWv7gfdBZvnqBXmNyPOKVQMA8qLV
	 iIySO4xeW+xA+NTR/cOA98dUG+0X8bJEq+tTKFxvAMZX7T2eYTE9bUF2eR1oslHjp7
	 19a1pk+UaGz7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7366EDF3C9F;
	Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.9, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171414853146.5338.7490383861474742192.git-patchwork-notify@kernel.org>
Date: Fri, 26 Apr 2024 16:22:11 +0000
References: <ZioopqscxwUOwQkf@dragon>
In-Reply-To: <ZioopqscxwUOwQkf@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 17:55:50 +0800 you wrote:
> The following changes since commit 00b436182138310bb8d362b912b12a9df8f72ca3:
> 
>   arm64: dts: imx8qm-ss-dma: fix can lpcg indices (2024-04-03 20:44:54 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.9-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.9, round 2
    https://git.kernel.org/soc/soc/c/7e685383468e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


