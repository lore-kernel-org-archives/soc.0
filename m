Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76237C35276
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B326C3410C; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5621FC34105;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=AqCkLX+Nkkk8KFZnkgobHin+ZlExrPTPXkKC9+8LPTQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=i9aNA+x7HsKDihq+UXIe8lCOAguPh272o31+NJO1JW9w1AYrNHjvNVwdWzUjes56m
	 quRYJaRb9rR7ng+77X38BRs9kHQD828PyKoRxsKtf/HGiudwVSvFZAr10B1frXlhx2
	 WIB5Usj6FBsZpc+zcSCFKNz1ga5gxWiGOraSe50AZfXcLI8etoxn4++z0UOuqwVZOQ
	 T2SWuqx/vk9pFGBS7gItambiL62r6kiCiQd9pl81XceybJhUnUs9Q4C1MHPI6SHt8T
	 /HQnSVU8m9pSGwUw03wZPZGD0XrgTgdbY/TEyRmkW97RGqgUpw9OFTa23f0h2vgCjp
	 VwFC68ZL0GEBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 412B6E6D4BB;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS updates for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966326.15608.10790088814227247448.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <CACRpkdaDcEqtSnWzRBnBHVweh2n=Dj3meHG9LND+K0Czb9ORGg@mail.gmail.com>
In-Reply-To: <CACRpkdaDcEqtSnWzRBnBHVweh2n=Dj3meHG9LND+K0Czb9ORGg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Feb 2022 22:55:57 +0100 you wrote:
> Hi SoC team,
> 
> please pull the following Ux500 DTS-related changes into the
> SoC tree for v5.18! Details in the signed tag.
> 
> Yours,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS updates for v5.18
    https://git.kernel.org/soc/soc/c/7743b59fc033

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


