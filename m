Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F2CC433FE
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0621CC3411B; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2E1CC3411A;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576013;
	bh=zv215JSxl1ZmQ4dKFLPWVB2J3TqbxkcWPI0QPqcM8bw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FjnNReIqbYjwDf3KKtYVQhmq8vNHfWZabmIyFqMOnCmKa5KtJ2pU1Z6NkO7rx7wYq
	 GxUE1kiEVOqixfubhxoPU95SfugdoxAGyOvOwAfCrXvTksul4ER/rA2DKmHbCelu+g
	 tMeBEiB73BzJqt1/E26LTco6Pjn/PLy8HGIL4j0SELr4GAKt7aYrhbN35J2+SNcvdC
	 Kr/s7pF+HO/u4CHGvqvsfQ1/X3X444wg/oj7rmukXpYEsnHWidZvitohdZx5kvObAT
	 UYWxXQyBS9u1Ac/YlzH4NhpgvC0vZq3IEQRHcNoLf6+Y5hDQ4Z5x3mcWhVQHyHgqSS
	 fUmcP8hnq/5tA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7D6DF03942;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: ixp4xx: Consolidate Kconfig fixing issue
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165357601374.28072.10326679314244686167.git-patchwork-notify@kernel.org>
Date: Thu, 26 May 2022 14:40:13 +0000
References: <20220522072356.34062-1-linus.walleij@linaro.org>
In-Reply-To: <20220522072356.34062-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 22 May 2022 09:23:56 +0200 you wrote:
> The IXP4xx Kconfig we ended up with for mach-ixp4xx creates
> as kismet warning:
> 
>    WARNING: unmet direct dependencies detected for GPIO_IXP4XX
>      Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && ARCH_IXP4XX [=y] && OF [=n]
>      Selected by [y]:
>      - ARCH_IXP4XX [=y] && <choice>
> 
> [...]

Here is the summary with links:
  - ARM: ixp4xx: Consolidate Kconfig fixing issue
    https://git.kernel.org/soc/soc/c/1a23accae82d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


