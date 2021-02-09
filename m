Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1917EC43381
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 16:41:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9658464ECA; Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F4A264D9D;
	Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612888861;
	bh=875+Lr1sYHveNlSxxiX+yQM0ssA+bARITPIWwjCBsDk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LMGH4+bd6aMD0nOQPGdA/VTvOX/L5q0trrm5Oc26Pu+NU0kXxAB5Ha9wB9xijwBpA
	 OH49/LXANvkExlfyy6lANOOUnq3RY5rFkSr6s6bJVtoGvM7sNTVVJJ/Pq/KJoLWhQw
	 qAvz27h5rAGaO3kM2kPA+BX/YBI/Vn10eG5c4790C7SMMBMNxmFLY6t1xnZeeHNNMr
	 RJthPZpvZl+dH7Y1t46Xy6pCVPtdvOO68dtNdA02H2oKO5MifyonBB4bmGpwjELP2H
	 phs1QcCoBVzOaIvHh1njggmWgvRYoAbczTBBKgET7PQo4s11dmxkzFw4DAWJjpxrr7
	 6r/0cPr+mbLxA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 746A8609E9;
	Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.12 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161288886147.29773.3383293885960209539.git-patchwork-notify@kernel.org>
Date: Tue, 09 Feb 2021 16:41:01 +0000
References: <20210208115753.54730-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210208115753.54730-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 8 Feb 2021 12:57:53 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is the second batch of defconfig changes for 5.12.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: defconfig for 5.12 #2
    https://git.kernel.org/soc/soc/c/cfc9e5631107

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


