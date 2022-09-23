Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2D8C6FA90
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE06DC43142; Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D21AFC433C1;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950026;
	bh=jWQO3BOM1Rp8r0Uo96r1fUkQN5MVlLpty1SaA7mCsg0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=X6GlweNkBRz8wyCnxyEP3Hzk/J4q1Hb6UPrb2EmXKq198A31TT4Jtc+jrzzHocdNT
	 d/n+uD1+FeEzfpGp4cW7z2Gwf83zh5Zoe7yFFzMrcGv25WHu8pNsSt3PbgdzsXgKWC
	 ZM1MbazanvYK/GTQXcvWjf/h58myDJubKN0KQ5oU4bU8AlFrN10sH06ISNbYaGWANK
	 13k19sanxs/VKxLp48vskFB8pBGvr5gbv0kp9HL9oycGsZqdDPajBFGR7Hzf4382/b
	 0WEDbBoIttAUByqwtKqkyPqNjPpt7w2jc2Z+JLC45CtFtMmMj4p+JPNXjsuE2gx2Ps
	 jpgQctTUHFr5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B877AE4D03F;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] soc/tegra: Changes for v6.1-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002675.3905.7706831095836758590.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Sep 2022 12:19:52 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] soc/tegra: Changes for v6.1-rc1
    https://git.kernel.org/soc/soc/c/3879b6604cf4
  - [GIT,PULL,2/6] soc/tegra: cbb: Changes for v6.1-rc1
    https://git.kernel.org/soc/soc/c/3919d905351f
  - [GIT,PULL,3/6] firmware: tegra: Changes for v6.1-rc1
    https://git.kernel.org/soc/soc/c/a30f202fdc27
  - [GIT,PULL,4/6] dt-bindings: Changes for v6.1-rc1
    (no matching commit)
  - [GIT,PULL,5/6] arm64: tegra: Device tree changes for v6.1-rc1
    (no matching commit)
  - [GIT,PULL,6/6] arm64: tegra: Default configuration changes for v6.1-rc1
    https://git.kernel.org/soc/soc/c/7b04ab83762e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


