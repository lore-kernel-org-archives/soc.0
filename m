Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E956C433E0
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E442B64DE1; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CD5D964DE2;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611844831;
	bh=INE7DJO1pAB2HLOcRE4Q65PBhcLwmp3IVZJYkwAX4kA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=g5jwxbMpo/6bGdl3GhErYIUhn4q7HtzJO8/YddWYfv1mKQk/5xNDJ+3BgRr+17JuD
	 4LHu+UUVeY62/68gAxMD+uM7AcxGXUMoLamFVOKBkfCw9yvFClhohr/7wiqqkCX2/c
	 4NH3b3Z9oWVPP/IqIjlKcQ9QLEMd8ZfoTQXpMHJo2VqTQpFFdCCMG72AhEZTA4JkwC
	 ogJZ+/1ffPkAfHa5z2EIm2ARXHEW0WZJhRJQyki545oMQWYbLXOlc8XygRu9he3j3B
	 N/VfdbTz45DAPwU7w/uT5rTEaV/cbgnN27AtMv32Nyo/MK5cOTRnf3bpMTfhxlUADI
	 gLdYcFMbBZbFA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C9A7460077;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps for v5.11-rc cycle
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161184483182.28855.13359052654566772769.git-patchwork-notify@kernel.org>
Date: Thu, 28 Jan 2021 14:40:31 +0000
References: <pull-1611818709-243493@atomide.com>
In-Reply-To: <pull-1611818709-243493@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 28 Jan 2021 09:43:50 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps for v5.11-rc cycle
    https://git.kernel.org/soc/soc/c/2a3e487a3e53

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


