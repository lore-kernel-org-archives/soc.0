Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80B8C6FA98
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA415C43155; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B46A9C43151;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=zb+287A56FHf4KBvN4fkeTeenFMXzjHbKkkztft5ImM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KAOpRU+XQFojJzhNe5Xg+3G6otjbdnPGwKyPpLUwRo9d0t6/4h7QFVlxbBHNyhaWk
	 0YUTOhwRUYL3A6vT0NYXXKg25ms9y9GKB8AC46EedT8DMmbEe979TmeIfgrGTAga+0
	 UNBa/n5eFqvSKE7zGfFpOb6tD2lE7cKT3y5seIinByjUAaT+/5XZ2P3dLjKhz1oTBL
	 SH9DfXCG31Qwi+DCK5D7LBe2gIQecXLpx+ldxrtM+qcbJfvuyeiVDORAV+if+yS1al
	 rykt0JgK9zZW6NoNaOeRsXUvYcKD5Y3tFdwZo3tBI0ema4F9lK8voHekDkpqucuX/D
	 Ef1UxptxlAMlw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2A2DE4D023;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: Second round for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882966.18494.7464822193737901725.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <20220926105023.119781-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926105023.119781-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Sep 2022 12:50:23 +0200 you wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: Second round for v6.1
    https://git.kernel.org/soc/soc/c/f6f7d870c5b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


