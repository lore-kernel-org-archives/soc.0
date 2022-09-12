Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B16FC6FA89
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CA2DC43140; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9560C433B5;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996625;
	bh=Wk2KQrI3OAwJFWCIvMwgmHCW3gEwXsLMta9mvpQWvxw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=M6ajSUUhThDxEhC91h0oKPg20a5dWFS0OPbFdSYb8wlmajr6iHhOovY1tFb9EPbXQ
	 LDFPxlzjbF+ZGji8H5IePsXeuJq0Ns03J+EItISYCcfFlsjMHKEdAg0EYV5YAF0WHj
	 UPnOa5ybgMohlfOj7+P46iQeRCSUjylceSzPAKr7VlowE2pVuBksj9yVgDUhwAGUZQ
	 zBdHl5ESqNkKVj2PwabUeueYGC8JTndAQ1cZNCNzuPbj6Xx+uG5LU6p0vYiP/TvyNk
	 g4gnkFq6T98Sq+cvBa/kbasVudSgsWIdWLcK0FsZRbZ94Z1LI6gQONfeohYIv+s5Qx
	 S88yUiI/VB4pQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB3FAC4166F;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662482.5098.7647398632701667347.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:24 +0000
References: <2645885.mvXUDI8C0e@phil>
In-Reply-To: <2645885.mvXUDI8C0e@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Sep 2022 03:19:36 +0200 you wrote:
> The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:
> 
>   Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.0-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.0
    https://git.kernel.org/soc/soc/c/78c94808a459

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


