Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAEDC433EF
	for <soc@archiver.kernel.org>; Mon, 18 Jul 2022 08:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E43F6C341CA; Mon, 18 Jul 2022 08:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE6D2C341C8;
	Mon, 18 Jul 2022 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658132450;
	bh=Zs9vO0SIFOlfUnPrjmqGvaI00CfyfGHj0C+0/oACrEs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VGk/NyZCLqjmPQ51j2t+y0T1TK0nx1PSlraehIFuxMZCwAnLX8FhyktQLbQ9fKpfR
	 bYL49SneY4tZu+spCgQ4FOuLWh0M+LU2To4INFyzz97qi5ESKxkedzo2/kxKNKE166
	 9NWnN100VzZQnb5QoJ6T7nQgXXqIUNdRiBGPbQlS29COaRPH1X8enIRYeBZBqcVQHJ
	 eSYzY3jpNqRzF8sfdV1vrE2bwKwfHpCYGc3/Xi9gKioVZmW4jLMiR05oVW118qYhpg
	 +ce2WO4ZFag4WFQi6MH0RJ3T1IPpfGr2ICuaG3ANtOi0+Axntj0Tt7mbnT5QpYtGE8
	 /PV5uEpPKbMqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE0F1E45086;
	Mon, 18 Jul 2022 08:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.19, part 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165813245070.27582.8948180371625509948.git-patchwork-notify@kernel.org>
Date: Mon, 18 Jul 2022 08:20:50 +0000
References: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
In-Reply-To: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 15 Jul 2022 14:28:51 +0200 you wrote:
> The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:
> 
>   Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/soc-fixes-5.19-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.19, part 3
    https://git.kernel.org/soc/soc/c/1c49f281c9b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


