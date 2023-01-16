Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B99C677F1
	for <soc@archiver.kernel.org>; Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB793C433F1; Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5BEFC433F0;
	Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673864419;
	bh=nyL0nc+d0eOFb21Jf7/4A9nGgHzPEicJaJOIuu0yeVc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZS4QiPBirAK3pLd4JAqbBYUojYef72yQBYMxnBCHkGhYnRlwC1F5fbqNq5qesMGBu
	 2puMxHJmkWv+aNdS/zRr5o4NA9JiLc5cgMQBKOwJcsDCGrPWUFLKZ9qmqmdqlFZrwp
	 kwDXGaBogVhwC+WlGbk74GlvbbSZ1auyZFeToqXdKkA5f/SXH453Rhv/FXfMujrMgJ
	 UU2WufzBxZ3gahq+g/hq+g4AgUVfW+HM0TJd6rFar1rAmUkDFNk423M06fNTKQ1oHo
	 QY+i1U3IqLoIELd7mDHCC3k0b2E7cO36J64SIxy0DRVJ0XvHKmP8iOtXfa6XrwPUPx
	 9foHM6queR/4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 915C7E54D26;
	Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V DT for v6.2-rc4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167386441959.5760.513291252902802943.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jan 2023 10:20:19 +0000
References: <Y78rn+0fVNOxHLKt@spud>
In-Reply-To: <Y78rn+0fVNOxHLKt@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 11 Jan 2023 21:35:27 +0000 you wrote:
> Hey Arnd!
> 
> Been a quiet period since -rc1, so I only have a single DT fix for you.
> Figured I'd get it out of the way & write the script that I've been
> meaning to write since I sent the first pair of PRs at the same time.
> Hopefully I didn't break anything in the process!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V DT for v6.2-rc4
    https://git.kernel.org/soc/soc/c/e2f7096f1e76

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


