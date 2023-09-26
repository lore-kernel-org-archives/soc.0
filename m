Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CE9E7F12F
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F60AC433BF; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2879CC433BC;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=l8FMSbJMWm14tUdxd4qvXfoeJG0T+RoB61SZnxrTyK0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hq1fw46obaHHw0zJ9nu1DHeJI+jUCCsmt3zUeJ24S/IE2HYYbPOtQ4JsRvuPrRwsU
	 IgSypzhYsxwUU3L3Gv6y/d4+ccNLH7BGeudfGufSCOYUj/c6aSZq5wQeUX8FBOH2tj
	 CN9cjV8rUW+0jduGeHVo69ztr3qFNS4os1Yvwad92op8/gx1BlOn6YkbnQ/fj1MT4R
	 DcbucjZlOl2r2kJwo244/mQuetLmCq61QxwuOIfGoOob4ZdK2EuVMKifUaS+ijNrcx
	 OYzFx5VfxOWZFnVs3YJ1x8Nz3D0i8T9UPVoGjbXx6UaEeTkpho6O0zOAviIv6MKOOR
	 zRtChyApM7cZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 160E8E29AFF;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223308.24546.18328084654401701051.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
In-Reply-To: <20230829213441.310655-1-ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Tue, 29 Aug 2023 23:34:41 +0200 you wrote:
> Hi Linus,
> 
> Here's a pull-request that introduces the genpd provider subsystem.
> 
> Most of the changes have been shared via an immutable branch/tag, which has
> been pulled in by Arnd Bergmann into the soc tree. However, as I have also
> queued up a couple of additional changes on top, I am sending this pull request
> for you.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC/genpd driver updates for v6.6
    https://git.kernel.org/soc/soc/c/c66403f62717

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


