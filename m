Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE43C4321E
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3440AC34625; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19330C3460E;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405229;
	bh=rAzKIu5ntH7ffaHxB7NTf3C7Y6SkeJvcZ32OcKotC18=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PHJq90H/i2CVrzkxbJL+ceM25PA0LSpmOKLme1JvmUie89E2Upe3BrnZVgoAsrGwY
	 30qb1p9iy+3H42L7KzsMd2SVQRIQAQpQ4BzaWY5HlzhegnO7RM/2mkaMnltt4jqZtt
	 h4gr9jQ3oLsAk5BDe7lEtzrHUvJjm7vGRZfH7mKvgT86qFOL1rCevxQGly0eWNF/Ei
	 IiksQqE0pK94DJ9FLdBfSiHILYyGg5HKShmPXbdXEfSh0os94KyMBZf305urtB9e4m
	 jxx8G6os8x9jMT6e2d6xdZXaepdOPoavHNM6c2LAmTUNfXvDeQYoj5deZqbMgU5uEj
	 UIG3nihxAsFaw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EF3F660A00;
	Mon, 13 Dec 2021 14:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: tegra: Fixes for v5.16-rc5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522897.6863.1304905976329626282.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 14:20:28 +0000
References: <20211207162115.450554-1-thierry.reding@gmail.com>
In-Reply-To: <20211207162115.450554-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 Dec 2021 17:21:15 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit f11c34bddf8cd2a3107a7d11b6446c66deda9590:
> 
>   firmware: tegra: bpmp: Use devm_platform_ioremap_resource() (2021-10-07 20:52:24 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: tegra: Fixes for v5.16-rc5
    https://git.kernel.org/soc/soc/c/7ad1a90a6a6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


