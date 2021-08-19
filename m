Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FC8C4320A
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3703161158; Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F2C261157;
	Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629387005;
	bh=GIwm02RWHfiNQpKicy9OtFbX3kmUvOcj4o4Nr534lqk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=H1frJ57huQQzq9ZvCXDHSrqhs7+FPxTupQSwk+y2riz6YImkZITN68OtM9ouSkWEp
	 tD3er54iEPGKioRJG2uaC3qBJz44seyy1QCiZpX6ViBVO/uVShxs/iDpgFL+E9S1mV
	 VOqij2VWP/qMbg7D78X0iSw608qrmbPyBhQzhIHiJZbrUWrBqIn7d7ducScAADhfIA
	 yFetNfVk8BZcKawoCoukYrNvxYswAK6EwCYCZqvJmMXAiAb7tzlC1sv+M2+INrhDxR
	 jAhdFlQm1aOEiLWckJBWSPCy2Wan8SZo6mZa89jTbwT8Yn6XhI3876/eCLqQWoYUgz
	 SIu3vOXnKn4dg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1138F60997;
	Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix for omap gpt12 timer error handling
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162938700506.11207.6377397789861245090.git-patchwork-notify@kernel.org>
Date: Thu, 19 Aug 2021 15:30:05 +0000
References: <pull-1629354796-830948@atomide.com>
In-Reply-To: <pull-1629354796-830948@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 19 Aug 2021 09:34:36 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 353b7a55dcaf5fb8758e09ebe2ddf5f3adbac7c5:
> 
>   Merge branch 'fixes-v5.14' into fixes (2021-07-27 11:25:08 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix for omap gpt12 timer error handling
    https://git.kernel.org/soc/soc/c/1e16a4021120

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


