Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167EEC64EC6
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB083C433B4; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3EAAC43445;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=odV8TjtqlT1kQ6zH8UbD6zTAtQpVzKdnQar40H+zNls=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a60JuAiVosFpFkAuqCOEZePYpijQr6qE9KP3iKFUdXPwodNriiMBJ4dlL4UpIkKVx
	 yVzOh9uUuN/eIfCU289j+EheoVCQJ0R4zgLpOptO0y9U88jv/3fuNnaObsM70h6xbO
	 tkPih1ULyyYGTnSWgHPFhsqqlqO6FZddfg9J7C5kEGQjY09O6mBbjM/I+v+Gj9lDG8
	 3DZcdGK6z4ArTe1WGaGki0F+VRSVYmaXy51BkNdKft2qOloU16EcLq8yHuJVwKxI2C
	 zA3EjWehbcZ2eBb0Dtp4ONw3GlS820Q/avGqK6WbhVIIIogjZgcr/UVGMClPtSjbc4
	 nLI3alX4UkyMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A144EE52560;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] ARM: dts: samsung: exynos for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786065.29049.5298226450980918776.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Jan 2023 15:39:42 +0100 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] ARM: dts: samsung: exynos for v6.3
    https://git.kernel.org/soc/soc/c/00ef63ec1cc6
  - [GIT,PULL,2/3] arm64: dts: samsung: second for v6.3
    https://git.kernel.org/soc/soc/c/5868fc77e257
  - [GIT,PULL,3/3] ARM: samsung: pull for v6.3
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


