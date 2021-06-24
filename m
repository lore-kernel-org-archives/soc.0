Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DDEC49EA6
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A8C1A613BE; Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9283A613B7;
	Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502406;
	bh=QAxBpQ5WsGTvvalM7NKW2/7iy7ko7jcPqw7KA4vNVWg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TKbZPQFvqDOn10aVdP813DKXvy5nQPCoiA76JS8VpPM/aN+dCtmybNWM77s6KH1f0
	 6J1tBQAEJC0+Di0zdWeARGqPlAEUDrxV3Z8Q6lI5Nlu/xuvtBWn63+5VW/9KUlpzOO
	 ErFRYJwtQ2/DHUNkPDXig9q9B8Ha8InM0C3JNB5UAT9w+VGYQtxLbTeizNYpMKTwrS
	 mxrlexTTeStgG3ffFzBHnEEImkvR5VH0rvgc85FTS0KJrKUU4GUsJ/eN22PYMFPu3i
	 Ug/omrD+S3HcxoYtwlemJqiqj2fCkv/diVE4evvEpCXQWimZXG/FmZv7rCI+tSgtxt
	 5vvlRz7UZUQ1w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 865DB60A47;
	Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE reviewer for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450240654.24025.6347396443180750730.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:06 +0000
References: <20210622130454.GA2196996@jade>
In-Reply-To: <20210622130454.GA2196996@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 22 Jun 2021 15:04:54 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this patch which adds Sumit Garg as TEE subsystem reviewer.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE reviewer for v5.13
    https://git.kernel.org/soc/soc/c/048c958f12a2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


