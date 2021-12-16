Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C884BC433EF
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 14:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95BCAC36AE0; Thu, 16 Dec 2021 14:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E7BBC36AE4;
	Thu, 16 Dec 2021 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639664409;
	bh=+2peq+8lzkT5I0AfxcY+WXh6JyQegKwYyICJQcfF6l4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VJSGnERNaK6pa5qmCrfeiXrD/ttxcjIPNvyfrOUx6qRXDLxXUScxKt0YZ5vMCN7tY
	 C1sWYOZjnXF0jVeVNAvttBVJ0kLt4FfLkaEzXnJICrs4AifGBmhV9fWSdtbBvP/W7w
	 fBH9EN+doKIlW4LrHGHRDb8q7CFITNCNQXSeRyLPZW+eGmGwyXJ4GoSKwnJy6xBIva
	 CsEOMbMBDu8LNqFd0Wi50uUqXkiYNNBKTY5pVbfrL9gre4ey9GOH4+pHtFIz3oeyWg
	 mT8ZMONDIn+p8Ax/V69WpEAVZ0TNJ2G0GUG0agl8X7Ib8nw3NQ8tGkFQnQIc9wq+pc
	 lYaNAZqTj7eag==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 68D5060A49;
	Thu, 16 Dec 2021 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/tegra: Fixes for v5.16-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163966440942.28413.16643461329661845095.git-patchwork-notify@kernel.org>
Date: Thu, 16 Dec 2021 14:20:09 +0000
References: <20211215162618.3568474-1-thierry.reding@gmail.com>
In-Reply-To: <20211215162618.3568474-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Dec 2021 17:26:18 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 76d89474310e05d9c592a8beed2aefe4d3396d2d:
> 
>   soc/tegra: pmc: Use devm_platform_ioremap_resource() (2021-10-08 21:42:41 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/tegra: Fixes for v5.16-rc6
    https://git.kernel.org/soc/soc/c/4bc73b7d4880

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


