Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE21C4332F
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7D1EC34601; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2882C34606;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639438242;
	bh=OLl1Ok/l1k5nUi/8w4fhH4FlHgWgeQGIniWw0jlGzAk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fOxekRjUme1D1OcWM7Z7rDhEhk6hLQYaM+55y7VOn3D6Z631ZLShKisSr/28oQ0IY
	 CEcg1zHnUPpNonQnRaJ6HyYHbzUkoUi1slNUzVqxoY7uVg0GtNbFCDWQpN56muNI98
	 rJea7NqbkzXLC1ijwRB8dBw/xbf+frEsvR/0PrDidKWTp0xstyn76KNlRX/BMLYlo/
	 J5jyfhvKi8i31OnsFQQIfEhyLqr2jEPgbe7tsag/Hr2385YZiiPbE4IHw6Rgy2QVqu
	 sfG/nDQ21vqJ0+pmvGemsFp2a5FGCmgFeo8BFODfOmvx1tBq4yfiNSPy763rDCcbYn
	 JNQH/BJcp4O7A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A911560A4F;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS updates for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163943824268.22239.18350151724295734448.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 23:30:42 +0000
References: <CACRpkdZuDPLj5Tcxbyd+JGfvBGQ8RuMP9PAsGsZT7pY8KoyOKg@mail.gmail.com>
In-Reply-To: <CACRpkdZuDPLj5Tcxbyd+JGfvBGQ8RuMP9PAsGsZT7pY8KoyOKg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 5 Dec 2021 14:23:49 +0100 you wrote:
> Hi SoC folks,
> 
> the following are two small DTS updates for the Ux500 device
> trees for v5.17.
> 
> Please pull it in!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS updates for v5.17
    https://git.kernel.org/soc/soc/c/b9ca111fae48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


