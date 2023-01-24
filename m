Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BD8C54EB4
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F3CCC433A4; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54997C433EF;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674580834;
	bh=0tTQXYEK2dAbEY6lcMOpxRwe5u0UwPOVzxnu1m51m1s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dTACQrneyVudOAxKLwR0yJ7T4WIDVIHXXhFpI3Sz0GBqHi9onDITIgH2wTRvcrcNx
	 4KOXnJ116jpgkziJz2v8OWkPcg1ROLK7eURkCqooKDw6Jl3u/FohhnaFFmWS4nyF9a
	 p5MDf7BzXv6fmgYYLLXgBsg+bmqoV1dSri6XKRLS0v55od/feFtq5/XPKcRECi8FwZ
	 OhyZDJxWj8bCEmGc1rDyUWHOYcfDmNm2qOUSCbb5FKTsKabvI8i8ZTWqLLScSpGEZw
	 xi18bwKCKTI97krSa/3vk1lZgkNCzLL3maFErDnbvmmLinArEVWSkBR4QqRQFjfZL+
	 XkI93Jj/c3oxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2EFF3E4522B;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 device tree updates for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167458083418.16533.3962704737458717546.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 17:20:34 +0000
References: <20230119112903.43257-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230119112903.43257-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 Jan 2023 13:29:03 +0200 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 device tree updates for 6.3
    https://git.kernel.org/soc/soc/c/bbabe541dbc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


