Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A56FC4321E
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B177C4314D; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D295C433B5;
	Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155626;
	bh=kRUJkc1Xcni+XEUcIeIYNEet6QDOqYrGqE55NKrLDd8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=txb4TGXdqvPUWesLZozSJb4jql6NPzzjB2vkXwUlZNJ9w+9pSEUCOUBt6wy02lG0o
	 ujU6G0aArTq2murpM/ZNh+cTYhpOqUHx2MEQGMetvK4k+it4fEhUVIT1hcv8Ns39n6
	 28KDg8Rwcv6Jlov8arYpRamn2TqMlB16Q36titJugGAeAY17wVTYGyvs5PTa+SkMyk
	 owf90OQvxb6JV8wZpT4y+8Ck857vCjd+qqEvALYz9E2GG/01ZdhRUCu9+SyfCRXJFb
	 gh8iMx0RCmsJUUxEQY2XKjKb3k+B/Zo7KTtHxKphEBYX+zr6r+hulubawVcbG8MRMo
	 jlJbHJmoAfOHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0AB4E50D6E;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2 1/7] soc/tegra: Changes for v6.2-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562585.11152.5285226440801985222.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:25 +0000
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
In-Reply-To: <20221121171239.2041835-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 18:12:33 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2,1/7] soc/tegra: Changes for v6.2-rc1
    https://git.kernel.org/soc/soc/c/2a26daeeb851
  - [GIT,PULL,v2,2/7] firmware: tegra: Changes for v6.2-rc1
    https://git.kernel.org/soc/soc/c/a6eeafba1141
  - [GIT,PULL,v2,3/7] clk: tegra: Changes for v6.2-rc1
    https://git.kernel.org/soc/soc/c/381abc230be0
  - [GIT,PULL,v2,4/7] dt-bindings: Changes for v6.2-rc1
    https://git.kernel.org/soc/soc/c/83cbe78a9cdf
  - [GIT,PULL,v2,5/7] memory: tegra: Changes for v6.2-rc1
    https://git.kernel.org/soc/soc/c/19e54b0547ac
  - [GIT,PULL,v2,6/7] ARM: tegra: Device tree changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,v2,7/7] arm64: tegra: Device tree changes for v6.2-rc1
    https://git.kernel.org/soc/soc/c/029467886185

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


