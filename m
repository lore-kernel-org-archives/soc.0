Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F50C77B7F
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD11BC433A7; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C141C4339C;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681831220;
	bh=j4eZuOVz5xWVqXIT/trVsWNgMKFr0E5c23qv7Rg5TL8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JxcBF42SWgNCnDvRgYhRXC4WkpnC1H8YBhCfBJMVLfK4iqHD23yqBcEhDTWiUDHh0
	 ZPp7tQeNStBNssSFIxKqCeE8jLOzTaSmpgu4uInaPBwFOLua5Rbw6dp3rnhUr58MHk
	 do9VghIim0hXC/4VBrfVQ2hpIDDNETow8pvo4mpDvu/Pk8+QBT+ZUnpDat6lMz8tyN
	 hKfOkAZ/2UzWa0S4NESnSVrPgrD6LxsMILvz9WUxIOOMybjbtx44yT4O8b2xdLO0Tl
	 HFpSKiMU+RTGf1ZLfYIMzJFbKSwtXyEN21iC9GR4mkmbnk7HOXzqhkUF8aVlZjJEcN
	 WYRAQSDMchQBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5B77BC395C9;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.4 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168183122037.6966.7411756095792646298.git-patchwork-notify@kernel.org>
Date: Tue, 18 Apr 2023 15:20:20 +0000
References: <5144826.MHq7AAxBmi@phil>
In-Reply-To: <5144826.MHq7AAxBmi@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Apr 2023 01:45:05 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> some smallish things for 64bit Rockchip SoCs came up after the first
> pull request. Nothing earth shattering, but if there is still time for
> it, it would be cool if this could make it in for 6.4 .
> 
> Otherwise I'll rebase these changes for 6.5.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.4 #2
    https://git.kernel.org/soc/soc/c/460df798ca70

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


