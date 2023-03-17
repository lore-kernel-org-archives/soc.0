Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9442EC761AF
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49CE2C43444; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 319C5C433EF;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068354;
	bh=XriIMsF33uMTLHPUjwPWd4mJ/39AhkSuPwTd7JfxITs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jIKGnqli8XHwWK08YReWFor1uZ5wWKYwX/3V7/rwUZrLiy4KOeQJXRCWOonc6nrUB
	 UNrUbuxDRUzflOzvw3GByf1xH0p5o/g7Q0h9YYb210p1PKoMfacZpkX816XUdzryTV
	 4U2qMdXwYwO4fIsOXMXAmBN1Hq/QYQUWultTErLWiFZxotAVmBWLSDnzAv6dQNRvuz
	 OdA2NsWpFq2rzvNtZ6C/D25Ul6Ke1NXjxji+HszumQHCdTMBBfQFhbD5ui5tGtmEHz
	 zYHA9SPq0QdxTho55APAkyb2xb8uCL1o4wMuFxlshwRuJyZ9H9wqWBeVG43sO9NKX/
	 lvrFrb0kgPfXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C7D9E66CBF;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v6.3-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167906835411.32307.16870136813046677315.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 15:52:34 +0000
References: <20230302094213.3874449-1-thierry.reding@gmail.com>
In-Reply-To: <20230302094213.3874449-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  2 Mar 2023 10:42:13 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 682e1c498ae793ad90587171c93c1f7ec87aa208:
> 
>   arm64: tegra: Drop I2C iommus and dma-coherent properties (2023-01-27 17:08:58 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: tegra: Device tree fixes for v6.3-rc1
    https://git.kernel.org/soc/soc/c/e5bd1002443d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


