Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E0EE4982
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CFFFC4CEC6; Wed, 11 Sep 2024 09:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268B2C4CEC5;
	Wed, 11 Sep 2024 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046447;
	bh=e+eGfa4flMqGVKBgACgoB3QwX4ZMaGVJ/JBurMwYI3c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=obyiK+Y4o8BvjcifyNzzXqUbzUknJmLa97UMHrpiISemBiHoCkPR8A5zdeBRfU186
	 tc+dGuwrkuoc35n2k1RZzeZoO24M4Rqf+Dorq5W4QDyUnN7r0MV+k/6Z+5tJE3Gx5/
	 2Ng0Y3zCM0tKPm2lVWXMETLy8IwPxjB87Z/rHuzrc2UrJxKcYnKUlaA0OJxgcTxS26
	 wjg6nU+uj7+S8MvqvnQkkHEaHwxdkDGHk8+lWvELgBHVp3f55Y92G6unMkeLZ1qXMl
	 htPd5Z0KsmB59eDJWAm/Kt13OXQ05F8u5b+kR9vtnPWLIZZv099ZLzJMWiFpUOopDU
	 UrmT2GZnhm9rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C133822FA4;
	Wed, 11 Sep 2024 09:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek driver updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604644800.555636.9568310358679669083.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:20:48 +0000
References: <bfa9ab87-9de8-41fc-bfd1-de5ec324cfe0@gmail.com>
In-Reply-To: <bfa9ab87-9de8-41fc-bfd1-de5ec324cfe0@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 9 Sep 2024 21:05:40 +0200 you wrote:
> Hi Arnd,
> 
> Please find below the changes for the SoC driver for MediaTek. Sorry for the
> delay. Hope we are still in time to get the patches in.
> 
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek driver updates for v6.12
    https://git.kernel.org/soc/soc/c/5f79d76727ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


