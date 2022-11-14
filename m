Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F197FC43219
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C44AFC43146; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD998C43140;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439820;
	bh=j6ygHCFuW+y3HxT8YtsazDnrom+2I61Gy2Yf9OjrhLk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=D+pmorz147ZSRnVO5RBuKVJj9+glbNZG1skgtOkyw2A6TvfZMu61GytAaSHYhJudw
	 Lkm2KdxZnoZRaxDbeiGuh6HrqIAHTDJPat/ZLSXJ3SzbwjJVZYkwcYlTzk14z/ZeBW
	 ePLnTKIh/FCCxv+yuU9Ns5qHTAqmMvgfXMHX/r1NukhmMaviSTYkwro9XPovxF6e14
	 p8a+Ash5uPFIJ0PuPrsn7pZBbMja2YxpabrVbDRm547sdSFsWcxZx8Oii6vtE9vqZ/
	 fGP9zdJNO9SCOufSDaD0WX9L4fE4gYx0Xnc2LLwzG4mA0Ee4/fPynXmvvZGf7d8Pzn
	 gWmz8kxWwCVHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8EBEFE50D99;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 defconfig updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843982058.12382.13554933562427897367.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 15:30:20 +0000
References: <20221110115422.180893-1-claudiu.beznea@microchip.com>
In-Reply-To: <20221110115422.180893-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Nov 2022 13:54:22 +0200 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 defconfig updates for 6.2
    https://git.kernel.org/soc/soc/c/8db131b29f9f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


