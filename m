Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189E7C4332F
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C29A46137C; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AA2436136A;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634737813;
	bh=jUol8daC0GTzilqqT9dpSxQIDf+KtTltrqEIx34kwG4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DJu3Bu1+YiLnZdeY1Tdw50ksMm0eYs9BYgT3sdaoyVKROckbzmTJXiBm9JYJgo9sg
	 4NjtXPlvWuOz23CnYvRzsDqrGwug73cZt+QPl/damn9X2LhtSkb/kyuOXBrEby7cnH
	 TGv4jCfPgNaabdk9BlBpgxMvlboQEYvg9M2lgyT04MrMTxh5hT8fU3mndnpZP7i3wO
	 rHY+LSoWPyYhaks34cyyDfO/Mp1PAeEnWFs1NvB5wsHMyRPRfb8bRX2lgke08+yQUp
	 hVXgy26LdL2oYa7ZN09FBzl9ft8vcf2L72eR7a2pL8zH7C79RKwyaL+Im+S1OYFyyW
	 ZZOAReh6noJFA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A4D0260A24;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] IXP4xx changes for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163473781367.13902.390796501508122040.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 13:50:13 +0000
References: <CACRpkdbSJ662h_B9mAGdXWBeq8ZwKTQvSJ7cZ2x2d8UgELP5QA@mail.gmail.com>
In-Reply-To: <CACRpkdbSJ662h_B9mAGdXWBeq8ZwKTQvSJ7cZ2x2d8UgELP5QA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Oct 2021 02:40:24 +0200 you wrote:
> Hi SoC maintainers,
> 
> just a few IXP4xx DTS changes this merge window, described in the
> signed tag. Please pull it in!
> 
> Yours,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] IXP4xx changes for v5.16
    https://git.kernel.org/soc/soc/c/804565cd9994

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


