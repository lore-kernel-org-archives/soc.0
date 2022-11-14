Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BCAC43217
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD783C43145; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A68BCC433C1;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439820;
	bh=w3sNknHX+ffkWYyNn0Wzri76frNxqHIodANNP+e0ieA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ecf3JVyBe4E9kv0iAAfhj0+CyuqsDMFkVFYxTIQfvF6dwLM+VUQrWixl0B/7wBvR/
	 2KBLiXs/HwGj9Hb/wQGvcJ8FW2JLsRmwD9bIQ/lvRpqs2x5anFvrJojh9c8BRiissB
	 xM+1WoNacmOVWd/sABuYM+RbTHfilOcfDrKYFaL32dEmCIeWAhOK5HnR/M965u9UFF
	 e9MScvQbzifDKpJ/3ISLI6pVOjolXOin/UzNjj9iA5sTknYeQI921M1BGNBBCOYAPm
	 rcNpti7H7715lYjIlc8b2swvFB8+06g7jwkCoz3Dq8g0saRTZU1xsHs93GEGjHLp5a
	 zBMbT6V8LrfKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 880E5E43EFF;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: Cleanups for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843982055.12382.9679488370098669513.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 15:30:20 +0000
References: <20221110092111.18581-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221110092111.18581-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Nov 2022 10:21:11 +0100 you wrote:
> Hi,
> 
> Various cleanups missed or acked by maintainers.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: Cleanups for v6.2
    https://git.kernel.org/soc/soc/c/377eb470390b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


