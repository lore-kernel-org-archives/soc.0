Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DFBC5478C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59FA9C4166B; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44648C43330;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=4BktFlI/vJLCegIWqZyQ/Pxv7Y6IbFISua698lrylR0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kyhHsIujFugCx2FW8gyKvl6o1l9PYt158NpZgQNWTQUfJ19cw6J5rDZ8k4VH0GBaZ
	 Fcq8f4tm2tkCEDmQfvbdyclQsaI0MxUCEEIKmwNyqblB8qG0BWbACrHzFjszkIwU1u
	 nRnjlPULIi17KFqCzzZHz2j0g1if6Q2hFz7eqfqz9yXiVGPmDZ9gNwD8gRVrJ7BvLC
	 i9/JkzqWQOF9qs/xRlWG4KfNNqx34ZobWUYSwAlZ3U0wFisJCUjJnY04+MGM3e0v7M
	 Q/KmXQ1SlPl38U545NgvibvjE0IwdeLhuD2bBG6Tim6Zttt4kk6/8iZF4oSZB8J5lc
	 Hki6eOivlK/hw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D62AD88F8C;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.9, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872018.25915.8977103089451787268.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240229124600.405016-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240229124600.405016-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 29 Feb 2024 13:46:00 +0100 you wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.9, part two
    https://git.kernel.org/soc/soc/c/19a4eaaef2f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


