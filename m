Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9535C678D5
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0A24C4339B; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85A8DC433F1;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673304083;
	bh=wFH0IVy0fu2fAuSYSKUvCHk0QrQHN7eO1kURuHp0DBA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=H2Cc2seckU9o57504XOuntAvVGmUtZaVdiBAn7CotnuC9ywYIA9DF2vzLE1EbO92C
	 SU7YXmNt5ZD7btpo6lZa4sQX2Q9rr41+40XoN3tQxATIrHGlFToxebWPlElJD3Wlba
	 spZxH8Fi7tqPtU4SJ6VajmomCUBYcJQReDVszd2Q/4jFTQW0aP6BMI8c6EbdgQVoo9
	 reF9hxRKRo+y7BFuSVjBnr/gJTPhC3Ei0mqMsH6QvxS+8pbyQ0eSfErIuLslkQTWR0
	 0HnWUIL/tGLVOzIc+ttjXttvsEyMHrSpzd9jKP9l2h5nJ+ds5SKSFd2dfwisDX+CmB
	 7zS8oE7HxY26g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 69C0FE50D62;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167330408343.13717.10026895357647829388.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jan 2023 22:41:23 +0000
References: <20230104095855.3809733-1-p.zabel@pengutronix.de>
In-Reply-To: <20230104095855.3809733-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 Jan 2023 10:58:55 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.2
    https://git.kernel.org/soc/soc/c/97bcdf24e000

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


