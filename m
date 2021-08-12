Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E867C432BE
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:20:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6847860FED; Thu, 12 Aug 2021 21:20:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 524146109D;
	Thu, 12 Aug 2021 21:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628803223;
	bh=hdOhPbtmvi0vz3nVNbYpgmPHgT3cp87rExl8OatX8/I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bfxiJSWkH8xEYiYlhHMn2ZkCR9bb1naPq088KrVhjF5gxh2z6b5jStvquMOLuV816
	 oJn/uZLmXhgX7V5VAJndnYclBcEdfiAT0zU1FsPgpNuZgFGlWwDWZEUHethmYYMx2q
	 rLVKf94NLxjlLpulqlhM2Tcfw+e51vUqUUW9XA7pK/pzINgztRqrJoikxHdH2Qu10s
	 9Wfy7WuQNtXoCEoKktKQwq6jEk5oxKUvfdaroFcut5rN3CW4Y3skPV7eYReQDoyX6e
	 ySazWTJsMa0dRp6WgEzoQ/S9Dt6kIvcz81o7JQQc0/PsAVV6VdyR0RuOS3FsJrLjD8
	 hK6CVW+/MBbVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4B6F9608FA;
	Thu, 12 Aug 2021 21:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] ARM: at91: defconfig for 5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162880322330.12191.13287301801642512695.git-patchwork-notify@kernel.org>
Date: Thu, 12 Aug 2021 21:20:23 +0000
References: <20210809134521.10155-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210809134521.10155-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 9 Aug 2021 15:45:21 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is the second attept about defconfig changes for 5.15 which contains
> addition for SAMA7G5.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] ARM: at91: defconfig for 5.15
    https://git.kernel.org/soc/soc/c/b528dede9bca

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


