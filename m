Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E908C61D97
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0707AC433A7; Wed, 25 Jan 2023 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4741C433A4;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674663618;
	bh=wqMkoWlO0upT9jl87tM1qhbFc76MbgynmTfvNPsTdas=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Hf+CLHGBW/qE9eZJ/Diz0sgOAlF5RokNbApId9vod1MW8Fsog3mdz+AL8smJyb8kb
	 KHu68LHLMRzA2hUgnSMi7yMhVYF3pZc+BzikAV66QuAmTRKnCOdnpU0Xqr4DoKoH5k
	 EIA18U5p8QSObP6398fvdGmOoX/WZv2AK1TMyPehptowbAyZJb0k0mVDZ60FyQOvJd
	 pIzjT2GE7PuKI60W8jQHKzqbIwEgllzOA2FUajcsZJuyMzGQhOfARje9qlWZ+Z+8dG
	 8unmB8H8OqgxIGXQ0pyLBPETDZjXIEvqi0x7qbTvdphHtrtxalUR/11gmDxDQa0ctX
	 fxpPGpgKjYyfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4085F83ED5;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Gemini DTS updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167466361879.4524.13500546012761164773.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 16:20:18 +0000
References: <CACRpkdb=dDD-y91jdEM01iuioJVDgDwMgS8F46iN84vw_V8BvA@mail.gmail.com>
In-Reply-To: <CACRpkdb=dDD-y91jdEM01iuioJVDgDwMgS8F46iN84vw_V8BvA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Jan 2023 08:55:44 +0100 you wrote:
> Hi SoC folks,
> 
> here are some Gemini DTS updates that are ripe for merge.
> I was waiting for the USB dependencies to be queued first,
> and not they are in Greg's tree so please pull in these DTS
> changes!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Gemini DTS updates for v6.3
    https://git.kernel.org/soc/soc/c/d5d480412870

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


