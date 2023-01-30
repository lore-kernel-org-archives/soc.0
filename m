Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D693AC636D3
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A809EC433A8; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DC2FC4339C;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=lLQ9xs4DKR/cJiSvdJiQgHiCsZJ8JDK6rouo3Uj02v4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=R80b3VfyUKQoj0Wtr00pXLDT6QTwc0wGlT2wxBaI8ugw3KfTToTR3YH1WTNy4RHWd
	 byS8rK2Bb4XK+n+Y9gmO9f7r2WAeyQfgnU5zxJf5lLQarN4sNUbnaAZ/E74lTwo8Co
	 rsImIcgXHEV5fsqoDeVDNpdHm8rHrC3QA30ohZIHKkMMIXZ/C7VkeQJpHDoJ0XIUv9
	 fCpUiFaaZsc5idiS+FuJsMl243hzErPUNEqbeMjmTKvhJH5ABiit1c0CuxFFwhAguZ
	 UVk7I/Lfzzh1tXk7nanjj0+vfbagD1Tyq7EvlBwBsCZYg7YtBtaNt50AK9bHtSHf0f
	 MJp9GPclj8W3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7126EE4D014;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] Broadcom defconfig changes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786045.29049.5299764181806663207.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <20230128193823.1628716-1-f.fainelli@gmail.com>
In-Reply-To: <20230128193823.1628716-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 28 Jan 2023 11:38:23 -0800 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.3/defconfig
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Broadcom defconfig changes for 6.3
    (no matching commit)
  - [GIT,PULL,2/5] Broadcom devicetree changes for 6.3
    (no matching commit)
  - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.3
    https://git.kernel.org/soc/soc/c/0c826ec36dbf
  - [GIT,PULL,4/5] Broadcom drivers changes for 6.3
    https://git.kernel.org/soc/soc/c/938370c6684f
  - [GIT,PULL,5/5] Broadcom soc changes for 6.3
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


