Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EEBC43219
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42F3FC36AF1; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CFFDC36AED;
	Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640014826;
	bh=wVzzUXXXhLDQABkOESxAoLtFNNP9kQ0FQ+tiqTU39Tw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=m46tMrDgrUWAbJ+3WB/5P2LyYtWvTMpVFj1DipHQdHzhAJCqhI7+Z/ntuhB7Ab5DG
	 5WQeDb9zVenwBZagEY42a8NS5JzPgIuK6uJyeeT1gvaZE+vAMYJS3MLkbjYLbzfEbY
	 J/PBCi6NERqORllI2uKF6+4s1orCOuleiMOK+6c04WpRipevNWpkt+Lp27piOdp+1P
	 IVlIQK/+s+GnSXuIkjXKPgSUCm3B68PmTwYs1UQrHbULMHVmPnCe4CFs8pWP+BsSnf
	 4oepySor7kB+wMNwTfQZoLlFKLbBGP6LZCDGinsrLgArqfE5OKPxYrmOKgBy1VtofB
	 6JPOdBmfxjkcQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0EC7460A49;
	Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001482605.10364.281872942216794018.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 15:40:26 +0000
References: <20211217165850.29694-1-nicolas.ferre@microchip.com>
In-Reply-To: <20211217165850.29694-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Dec 2021 17:58:50 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the defconfig changes for 5.17. Please pull.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: defconfig for 5.17
    https://git.kernel.org/soc/soc/c/6f6287b8b403

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


