Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A281C64EC4
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73EA2C433A1; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F5BEC433A0;
	Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676025618;
	bh=nGmUJTJT2qLFpunDktaL2muQwaedWE2y7u9vjuvf2s0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=D6tVt+7e3z/Bw9TLWW/2yzzdw/EQdrNsqTjhJHIxEmzHMS+KQXmdgSZeTsaUWXWZQ
	 ZkvqFtqm22pYBPRfcJAcbN/166gIpRb5uLagifAudGL7NOh/vktTcHBoD4BYiaPRUh
	 HogHWz+v5tRomj7lrEJxrNwJ4CLjbEgMO5xlr1YyMdyLIQwoVQF6GAdowalzJhhHwo
	 3SE6J+ExIi5NtfqEGAUUIgqybffTEBdRoVBRCZo0qipspg990nLKRiMaEnzrqsv5BQ
	 iONSVajOqrzyVDEks0ut3hHLpLItD74dTuDU3KKslmqIEBo9I7h0C3lsbYrfC9GCfE
	 ky4YdSZrGp04Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46095C41677;
	Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic fixes for v6.2-rc, take2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167602561828.9597.1476128381414563866.git-patchwork-notify@kernel.org>
Date: Fri, 10 Feb 2023 10:40:18 +0000
References: <761c2ebc-7c93-8504-35ae-3e84ad216bcf@linaro.org>
In-Reply-To: <761c2ebc-7c93-8504-35ae-3e84ad216bcf@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Feb 2023 09:16:10 +0100 you wrote:
> Hi,
> 
> Here's 3 DT fixes for v6.2-rc1 which fixes IRQ loss and performance issues with
> system is loaded by switching the MMC controllers interrupt flags to LEVEL.
> A similar change has fixed similar issues with the ethernet controller.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic fixes for v6.2-rc, take2
    https://git.kernel.org/soc/soc/c/bc6772bbab9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


