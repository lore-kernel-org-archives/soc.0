Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE56FC47258
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3CCBC116B7; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83BDFC41679;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=u28BqNjFK5pE9FKmcVhgGSiGfQIEMUZ7QeHfjUwudpY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MN5Z1z2tRkJvc+V2Fj05pHUjWNLn3CCiKVLEyYiiSI65zN6aikPj2zuQEXjLi6ZAG
	 LeVGQKHsJL5zSrh3SnXz3uxYzovAtFZQsWjrdm8pnlEHYpGKb5NzYi5dTlz5745oCx
	 /E5v+PlPjaz6tUfmcahox1HpLwmzZdSFRbUy30eL1iq9P+hNcrG2BYtN/dPkNOTpET
	 La8gbvoGybpUj/1eXA8RlLkSMtdzWbRwPeIz89NpHrBHYjHDWu9GfsAjhxPZn9vmHg
	 9Io+6ZdwWDYrbWuXnu/M3FbJ/sMqGh7kDEnybBCiu/trrC6F5kQv5RYI6/MQRjbGVE
	 PiGIisGgGXDVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68AFADD4F0A;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Renesas driver updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646742.10550.12241396663730064965.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <cover.1702642340.git.geert+renesas@glider.be>
In-Reply-To: <cover.1702642340.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Dec 2023 13:15:20 +0100 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.8-tag1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas driver updates for v6.8
    https://git.kernel.org/soc/soc/c/827601c40c6d
  - [GIT,PULL,2/2] Renesas DTS updates for v6.8 (take two)
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


