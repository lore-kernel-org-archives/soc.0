Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4860AC64ED9
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E49DEC43326; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8451C4331D;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=7pG9uENAef10KmTuO4ZCMHrslTJzO3sKSndE+zqn5lg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AnjOYToetr2ymtZqb+s/E2lhKY2BkXbBbEZuOR7YZrZZTPkPYp5t5g9PkuMYH2W8p
	 +QtvOetaZSVuE9z8qXmc3bwXioRUEKPD1IeyGJ2Nd8cxwZRMvClUdeRZpO13u660sm
	 02xC9A3no3StRIgYngM3PJKztX1MFJGGybdsbs7CMu0NnqCRdzdrqm+z/0I1sj5YhF
	 eONhYxovU5h3RTbf2KcqkQcjsLlG7yM6+qVvtBGxWke/VBvbPZwNR4kcqmEUsfR0Fq
	 Y/XEm18GPSFqy2UkDficbeJcMklmpYY8FoelolZ66OquTfqx1ArtmddeIkHI+GcYQp
	 kNWg7p1nyfVGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD48BC16ABD;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] dt-bindings: Changes for v6.3-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786070.29049.8396568604546670003.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <20230127163719.460954-1-thierry.reding@gmail.com>
In-Reply-To: <20230127163719.460954-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 Jan 2023 17:37:17 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] dt-bindings: Changes for v6.3-rc1
    https://git.kernel.org/soc/soc/c/3fb0520dcc3a
  - [GIT,PULL,2/3] ARM: tegra: Device tree changes for v6.3-rc1
    https://git.kernel.org/soc/soc/c/cdd070a4e116
  - [GIT,PULL,3/3] arm64: tegra: Device tree changes for v6.3-rc1
    https://git.kernel.org/soc/soc/c/248c07f92c2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


