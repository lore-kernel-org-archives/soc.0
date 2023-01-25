Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19654C61D9D
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF73FC4339E; Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6855C4339B;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674663618;
	bh=ilHgFDVvuH2PRvtSeqeCb18wXePKlph1VGdG9v8SjGE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Rt0Zi0Y8RQNoWtmfvzUKnRDy3t5rBP9t2V3QPNoux4cnKbmcyN4gFqqQHR4oEBNCu
	 wd9Sy6hr+VYmiEaM//qI8OWldCI74pnW8B47zpUCyTUYdvflm+YMjr2RUektlsGC1m
	 hWNYGw2eRAAzhRpKIRgiEJc1n2GA6qihoAUadjA36qBaXmxu0cwQMPgmJwuEYJpsAn
	 vm/rWt+LsMXtOimEnW8LSkeI43sSFAR5bjcUu4jBNmcFHS7qLk3kUiT3vEntYcRV5U
	 PHDk3b4jYDJWUW+90p7ZjcWVXekUEPApHtWRlcUZLhkBPEvGq8pTcLMXh5Qp3rtsOI
	 eJnVL0VV96opw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADE19C04E34;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: Cleanup for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167466361870.4524.11402035984829673975.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 16:20:18 +0000
References: <20230122121541.29312-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122121541.29312-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 22 Jan 2023 13:15:41 +0100 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: Cleanup for v6.3
    https://git.kernel.org/soc/soc/c/4f848f23f5ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


