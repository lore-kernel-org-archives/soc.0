Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39235C19F4F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CE32C4AF1B; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 055A2C4AF19;
	Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=+xh7v2DZuN/z/EgwwgBcxxHE5SrAuVEc500xJOMVIaI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KJYGNvddOvCmu7VwJpdwiD9iOfUHESLin39g6okxy5mRqrtzLsG6yhgM3mR7EA8dX
	 k7PIYdj/vdWh3sYnz3CN4UWwhDtaR3oay4JES1eBlyqCXAM0ka249w0PS239ZkDFzi
	 8PBVtVyqUfjWDcc0c5mXN00fojsg3zYrD6NJr+adVbhGTTADQoSUKLJ8HTvCpT4lna
	 HRtrtbhr5mi57Q78yLc/q/sRM6YxqXrA3Wz1GdZf9/uVm2XG5hogE8iqtp72CfG0i2
	 HwiBhDpyjwY1I2A1STvZboZbDb0Jr/JPQH6Gz1zeR1aruLIc9D5xLEUf9Jh7iUQGGC
	 /zWglpYYuMC1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E465EC54BAA;
	Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX SoC changes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444692.17402.11073627908222695105.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:46 +0000
References: <20240428121247.10370-1-shawnguo2@yeah.net>
In-Reply-To: <20240428121247.10370-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 28 Apr 2024 20:12:43 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX SoC changes for 6.10
    https://git.kernel.org/soc/soc/c/e29d430169d7
  - [GIT,PULL,2/5] i.MX DT bindings for 6.10
    (no matching commit)
  - [GIT,PULL,3/5] i.MX ARM device tree for 6.10
    (no matching commit)
  - [GIT,PULL,4/5] i.MX arm64 device tree for 6.10
    (no matching commit)
  - [GIT,PULL,5/5] i.MX defconfig changes for 6.10
    https://git.kernel.org/soc/soc/c/6e0b0f852b2b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


