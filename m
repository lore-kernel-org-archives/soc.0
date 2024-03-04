Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCA1C54E49
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C2F5C433B2; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36503C43399;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=Kr+3EpU/+9z5v6I09a3dGOKHYPmAxWuKKt8m9mHQ61w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=F/Y/oPNtn88lRTeJnqnIDY5Mjv4GACfw5SFG32oulIRZjAq6UU5UUrcqBiJztNZtj
	 fCjgAXyCaaykSPjW94+uMmresU+XyJcs+8BkQAr5Gu+yLwCGDhr2HsRYwM8F8hJEUY
	 iGBO/g+43Q0yET1PmLM7Vp7FBxday8al+Np9OHdikvOQqvyX77YTtUbOZiXbYg1u1j
	 7ywlvbCb+0jN7n96FMFJfKka9a6AiL04Gky/tLKiQKbWybdeVmBixMXZ5VUD+mTY6A
	 osHCL5/UYawDz4W75j5zRvpbs71pc/RhF0r+s0Ruu2xSrEU5pOO5j+cUU61RD3U//S
	 yAby2IamRgmnA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18FCAD88F8A;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.9, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403209.23732.2107316922936619240.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 27 Feb 2024 09:07:53 +0100 you wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.9, part two
    (no matching commit)
  - [PULL,v6.9,2/3] ARM: defconfig: enable STMicroelectronics accelerometer and gyro for Exynos
    https://git.kernel.org/soc/soc/c/a254ec05aeb9
  - [PULL,v6.9,3/3] ARM: dts: samsung: exynos4412: decrease memory to account for unusable region
    https://git.kernel.org/soc/soc/c/784c93e3ca2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


