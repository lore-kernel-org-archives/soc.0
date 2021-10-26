Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C071C43217
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 03125610A1; Tue, 26 Oct 2021 16:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E09F56109E;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635265810;
	bh=fRnl4+9X0c3X8ebAlN79bnNeGZBVZ1lLeh8/L2PPWJg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oTxCx3izANRhWTxFG7BUHhoE6eohPxP/fVfNE4qw6EJ/FSveYM+xuvOgWJW4ezshm
	 C5XIx/R4ncKoV2k5Xmq//S9YeiM8pAAyT1yolWvfyi20s+Ud3bg18+2lYkqPBMCX2o
	 dhEUIEGErxNa4KEbK8Czfg/ll2vwQPYTIXblUUvxqPLgiGNZBAcwcamQp3C9ztqRGm
	 d5D3F205W42T2HowYovht2Kcwkp0Q2pwt68pJf6x4yv57z5dtG8x0TSqwZ2YWIimTk
	 RuB4D4usdQhY18LJRrW+4BgkQkjBuvjJt7OfjKD1guz2P0PU4Yfoo5H5ve8orkcq8a
	 dHuMDGv/oCEVg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CE7BF60726;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.16 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163526581084.16112.13644270283389552371.git-patchwork-notify@kernel.org>
Date: Tue, 26 Oct 2021 16:30:10 +0000
References: <20211025163428.26285-1-nicolas.ferre@microchip.com>
In-Reply-To: <20211025163428.26285-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Oct 2021 18:34:28 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are a couple more dt changes for 5.16. As we are late in the
> development cycle, you can surely postpone their inclusion for 5.17.
> They are in linux-next for a handful of days.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.16 #2
    https://git.kernel.org/soc/soc/c/2ec492731a1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


