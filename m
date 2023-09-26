Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C4DE7F12C
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CC83C4163D; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1780AC4160E;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695763280;
	bh=t3Aw4rb5d+yWogbMsLemMVK+1tZOVkq/LR04qeNgd9Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kGUTwPRJpY1bzSTHEs2wO2bFzQPexbVKLJjbfKiUL7CWWWARyJ8Yue8K9TLCMTINS
	 m7ZfSBjjWbqrj6bLRv8J2i1zMypvod2Wszb52wohYIQMP/s7tLvh9cP3JoIY7JL0MT
	 g1hFOsMmdhq3e3dbyKQSkGguZf7OStvqVbgSzBpd6baggTVO3w5dX6N0dswaY5Ujd2
	 4xUvJAqwUQ2FxZoVUt6a47V139aEXssWcmNLxxVpi24goAOmRHRPJL2cA91QmJaoUU
	 bTTle/EHmHNaQ85Clkayib5uwvfN1kthINhXLGA5JWEi276BEq3tml02M9zuAytfdh
	 NpdssQb2DG51A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC351C6445B;
	Tue, 26 Sep 2023 21:21:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE fix for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576327996.24546.13910494632948626456.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:21:19 +0000
References: <20230913083909.GA473533@rayden>
In-Reply-To: <20230913083909.GA473533@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Sep 2023 10:39:09 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small fix that removes a few unused function declarations
> in the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE fix for v6.6
    https://git.kernel.org/soc/soc/c/b8c94cc66642

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


