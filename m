Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B98FC64E7B
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4BAB322240; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606497028;
	bh=fx3X/xgwksnkggloqIuArZZK+tCMOS3LOL1vtvDYIgw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cez/T+TN8Up51PMfxdZJH9UVRzjR30++LJi8H3Ovi5s44ptgDAigsDvsN27bkUXCh
	 JzaIXWhVsnarT8B7BqQ/nr/pMl6Y0vkQH63qcK4y32c3Yt2aj1Ag2H4qUFvpnWlCAa
	 Je8WX54sj1o8qTPaAVyfXNuRanYwwVmbQgjkJGeY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v5.11 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160649702816.7685.9564305600935800449.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2020 17:10:28 +0000
References: <873c17a5-28d5-9261-f691-1b917611c932@foss.st.com>
In-Reply-To: <873c17a5-28d5-9261-f691-1b917611c932@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 27 Nov 2020 09:54:22 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> 
> Please consider this first round of STM32 DT updates for v5.11. As usual
> main changed concern MPU part. Various fixes have been done, a new board
> has been added for DH and USB type C support has been added for ST DK
> boards.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v5.11 #1
    https://git.kernel.org/soc/soc/c/fcc3e3c3a4a2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


