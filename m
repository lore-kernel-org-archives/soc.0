Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6981C636D6
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 979B6C433EF; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8244DC433D2;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=cvG1H0tQMiP40skGTs5nEKjvOK1K9+mSGVng4UgPyEE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bbxlaOQ+QbngaMcNppAOJSdIuqDGP3/vkUaUQdUzA2KhyyrZYJzYHCj4ci7UyVrCl
	 A6Uyg8zPTr9GvmHvO69czD4BBviV9RLmWuUs1cBqN4esN7x9Qs+lVJpgxDczEfwrbu
	 LDFJRtWzDaXd7f+uK0v80HfBx24CFpWm+5IONZU7TlCN/3++krE2XbLZomnCSXdhCj
	 YoxKg/OO9EE46MPcFkI9dnmPe3WcBDmPAbZmB/ZehmoV02xd0FsmJWw96zDOIj+uqj
	 jVbdSd7b9BLM6EGOyoIz6HvEz55kOwn0k7fLiRfN4rSjroHqVnzp+j6GwZycTLO+QZ
	 oaQIER31aNppQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 636B4C16ABD;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: cleanup for v6.3, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786040.29049.13221532033951625446.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <20230129144525.5802-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230129144525.5802-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Jan 2023 15:45:24 +0100 you wrote:
> Hi,
> 
> Cleanup of several platforms, not picked up by maintainers. On top of previous
> pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: cleanup for v6.3, part two
    https://git.kernel.org/soc/soc/c/54a39a28aeca
  - [GIT,PULL,2/2] ARM: dts: cleanup for v6.3, part two
    https://git.kernel.org/soc/soc/c/f0f4c73ac03e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


