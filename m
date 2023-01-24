Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150C7C61DA4
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04A8EC43442; Tue, 24 Jan 2023 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E12DAC433AF;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=DhcUQIjRcfleARctoOElk9JnvFLTRpwJ3RK7lHFY338=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZJo5fAHHx/rSrebGkZPz5/pOSqPDkPwblVIacqTad331RHliOzqD+QLFdDngvZHkQ
	 vNaKUMfkF//z5J5oQ5V5GQOqu9/XTFfOTP8vySQDhkTWa9I3hhdLH3GwQmcyBcfOgw
	 PHh03X+4wGfnBwVuulEUECP4d7hzS6FuUoe5fwig9O6WNLhcWMQ5o/G98jP78ieK7a
	 jk/Zu+JNHZ2HCy8lmuhm704Ys9zTf9pEslr+kvlaVXpyscqm+9LpicJ/O6viKow8Xf
	 iLaCNeVuiLaHKutQBv1jRIcHHWEmA853/9rRYVBhIJj33BfKebKw0p7efCN3MUiOw9
	 nR/mjIs+BgD6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4400F83ECD;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: soc for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588979.12731.8513567455764812990.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <20230122122605.30720-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122122605.30720-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 22 Jan 2023 13:26:04 +0100 you wrote:
> Hi,
> 
> Driver-related binding changes and one maintainer's entry. I called it a
> "drivers" update but it is really rather generic SoC stuff.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: soc for v6.3
    https://git.kernel.org/soc/soc/c/1ba4a8a6ce7a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


