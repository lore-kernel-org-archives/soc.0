Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DC2C433FE
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D008AC433C1; Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9FC2C433B5;
	Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667424016;
	bh=tkA5ge4lB5w/3HegM7WFgbCzNe83sf8FBUcRf+HNP+E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oOHpZSCfLjb4+x07BwEnDeC4hwNrWVHT5d0hi41dHvB8XOFFFGyjiw18220O5rOSC
	 oVQQwL0jJ6Xt/MUVIpNNSHjjW1LL8dZXTihZPOmjLeiVkNZEsdZU8aeJFfPUBsyXHq
	 YfAXOSSnkQV7/A0+xL2E63Nm50ryH5qujLxUZYmCygASG4fUQ7qgaKIizKZjSuLUjt
	 uHP2vUiOrZYI5pXBYYT/FVqUVikwBbkR4F4JQU5A41mATJ1eBhhINVCWuV8reOtohK
	 zxrBwwBP4ehVranJH1WU7dBJFvTHXUJcAmdoYuAFcXt61FVB+Zz6SgMV/J6LAteTj2
	 Yxf5fe0Kwk0qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 990E1E29F4C;
	Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] soc: fsl: qe: Avoid using gpio_to_desc()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166742401662.4857.1209874993812559903.git-patchwork-notify@kernel.org>
Date: Wed, 02 Nov 2022 21:20:16 +0000
References: <20221027081108.174662-1-linus.walleij@linaro.org>
In-Reply-To: <20221027081108.174662-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Oct 2022 10:11:08 +0200 you wrote:
> The qe gpio driver is a custom API combined GPIO and pin control
> driver that exist outside of the pin control subsystem for historical
> reasons.
> 
> We want to get rid of the old GPIO numberspace, so instead of
> calling gpio_to_desc() we get the gpio descriptor for the requested
> line from the device tree directly without passing through the
> GPIO numberspace, and then we get the gpiochip from the descriptor.
> 
> [...]

Here is the summary with links:
  - [v3] soc: fsl: qe: Avoid using gpio_to_desc()
    https://git.kernel.org/soc/soc/c/84582f9ed090

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


