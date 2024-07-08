Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA66C3DA52
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15D5DC4AF51; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 000A5C4AF1A;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451508;
	bh=nLTzgj7GVaowDhCLxDZO+lY4iXVHpEm8XmHKFrzpkDk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Rf0yYLaLSQ+KhJVxcUj4WwcqBidKYAJ86KhL/L8Y6DO317XzRRszD4xfKfx8Hsyme
	 q6OZZO6eOEef/hU5cAkjhLOOPLR++sU3HRHz8prU8hwW8tX3Fm1/0lNIrkUzkwhPAa
	 XzgpDOONnRtVTnWDO+r5iptfK0L7vEQiDfAEnwv7gQDeFRCydy1FSKiAO9Ja2/9zXu
	 2GNnqMpr1lCOSjCTe9sTM0ionO6UWQXOqXjRtXBtA9CW0My9Y8JLFcRq4qVNSi1+1k
	 EMofKlElOo05kdUiPTDY7lHbDZbN7klQhDqYM2+xWG4DM+koRJSh2ENba25WY/TgN9
	 x8qHrtx9iM8eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6D18C433E9;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: samsung: DTS for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150794.17395.753355760873970487.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240702063514.6215-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240702063514.6215-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  2 Jul 2024 08:35:08 +0200 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.11
    https://git.kernel.org/soc/soc/c/c36a19ed7ed0
  - [GIT,PULL,2/2,-,drivers] soc: samsung: exynos-pmu: add support for PMU_ALIVE non atomic registers
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


