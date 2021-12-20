Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C42C4332F
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E598C36AEE; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85749C36AEC;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640010612;
	bh=cqJ3KYs8VLYlo32yd7NZQMTbVk5BSFbSW1tL4HoeQ7E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=T1M/F5tJ2D3brno1A6PhNbEl2YmCxfRtJJyeDkrqDC1pqmeFjUtx+cUKFEya6GlSs
	 WFGF3sqLEvdT9cv0RzLqiO5P83Mvt8xT06UYTaq/e0dk5PTMVy/JBoWWp7eNb09MLb
	 DYXcxDCBZaQbIQ8d0SrQN6Yr0BNFmCFECVqSUudV+lSDNHWBtHQKGzltMRRFBW+wgQ
	 XkKrXbXq0+dKr817kzclaqNhvYdt4YTdvayl17igynWHEqmXXgKOxqkHSRtpyr7vzy
	 tClX6sIpcsWH76UFLsims2jFJvOro9FJ7hJTEGVkMx9Uan/KxpKqbF9r9fy4QdzsaD
	 Hp/mcepyQOtpw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 70613609DA;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: Keystone driver update for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001061245.9073.18177880258891229556.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 14:30:12 +0000
References: <20211217154921.cagzppcensxx6wm4@pension>
In-Reply-To: <20211217154921.cagzppcensxx6wm4@pension>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Dec 2021 09:49:21 -0600 you wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-fixes-for-v5.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: Keystone driver update for v5.17
    https://git.kernel.org/soc/soc/c/4f34ebadff06

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


