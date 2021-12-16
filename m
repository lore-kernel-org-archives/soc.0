Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA47C4321E
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8277AC36AE6; Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AEE9C36AEB;
	Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639664410;
	bh=Lz/oLNIse3vKqUh7ZKx9yF5cb1F1YK8C65ogonTPtEY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LJSn7YtrIhVN1p++zzzJH1e7psv40bvEXg5uUi6BweW1+uUciUO0aS5LXAGOTjRxm
	 xQw/bEJKwTrilTyiOukTH+7FK4TjeXvJdbcHs8d+GIEeoXe7/2qluAk4l2g27K049g
	 N0WcXJa9IIUTKTRotq7YaBD/D9VSP+WLpO1QzYXFpaZUQzDWzXw9PsUBqPiNY2Zmzw
	 gALlZQSIwZ/s/RBGMB8CuxPHX2mOzI6vubkOC9iS69AjlYPRDxHd4bRMjyLBqrXUtQ
	 j2K59Gs2ROkp9RMlZdToyjD7GrlrDILesymp93tioAQVZ8wGpYTM3wxbVCIPV7eZyt
	 5JRWIFpqi+ZtA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 51A8760A3C;
	Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/tegra: Fixes for v5.16-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163966441033.28413.8267929088019246307.git-patchwork-notify@kernel.org>
Date: Thu, 16 Dec 2021 14:20:10 +0000
References: <20211215162618.3568474-1-thierry.reding@gmail.com>
In-Reply-To: <20211215162618.3568474-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


