Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88CAC67861
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D680CC43141; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0F83C43390;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677239;
	bh=RgLaoi8wLDVMJ8kUIY/odBgbYs5ewZOk+Ys9PdmK68Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JrnGxGxWKn0RqsujYl0Uz5swLThMx2zWdSBGafhnJxwlLZhRie8nh815p1EznDC/K
	 fHEnW5zKsfM2NcK2SytMdNsudK6ACWpSXn/+80lIiRFNMH8v6evxgQloe44Gr9k0lA
	 x+P67TTLlSg1HdVJCng0TMfl9EeBaCQ2hXWTtFN29N3cZKRqlT8vSyxgBgzdmfCtbN
	 GguV24kES5wLxT9/duRtOFOW/gVkuMvD+/aGGESWV/ypyQazKeaIOSMIwQQTiG5fsK
	 xzkOuyBhT3929Cwen+JF2nPSoWFH3Q5Hc4aZ9MJJhyO2ZsntqgI2CcL5uRnyvNv60F
	 6nmzZRcvqF0gw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B46D5D60313;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267723973.12038.3800437453945337824.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:40:39 +0000
References: <Zg5rfaVVvD9egoBK@dragon>
In-Reply-To: <Zg5rfaVVvD9egoBK@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 4 Apr 2024 16:57:33 +0800 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.9
    https://git.kernel.org/soc/soc/c/7d177ae11468

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


