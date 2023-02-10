Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714CAC636D3
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FA30C433D2; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A50DC433EF;
	Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676025618;
	bh=09BbIQIsCRU85V1AiFB/R4z7+E5zulWG2I0FlIIDr+g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cfek8PtNEqlWS6LEON/OUO7Vrvq9ZalbJbhGkyOloi/6FYdScIgO5+R2DKXBNj1rD
	 2XFxhxbWbV3H+KH5n23SOgr9RALjuMy+ZpUx9T3JkUkeUOIdjfYyIMvVdFfrn3q99J
	 RsfAyosshw3+Rps27t6YFzufNF0fif662mafLsVkRjK2y32O/epxP5w4pcqXsKGm9B
	 6uH3d0HN9XZpIvq78ppJ+iqzv+H8wAnZfXsGB3UbppUemivTGGWPJ8fEWvFO6e+jhD
	 0Iq91EzFaOThvv5phGKiJwUywamcKbZUoMco3EeNLqVb/dn4OMoQW3xph79UxVlwKA
	 FUBVTLby64k6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 090B4C41677;
	Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic fixes for v6.2-rc, take2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167602561803.9597.18297665986465321419.git-patchwork-notify@kernel.org>
Date: Fri, 10 Feb 2023 10:40:18 +0000
References: <761c2ebc-7c93-8504-35ae-3e84ad216bcf@linaro.org>
In-Reply-To: <761c2ebc-7c93-8504-35ae-3e84ad216bcf@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
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


