Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B30C433FE
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C9FAC3460D; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E6AC3460B;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639518011;
	bh=VV15lHl8o0SzKo1WE+S7dVXbnk6SR1TYsN9twy5q934=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=C2TVOyywDFWzAmupnbF4lF/vM6gbmh3lnrTk6PugAfplVAHEwIWTIHpK0UPiIWvOn
	 RNvjTDT3ukof5HuYeA9J5L+YwzbLHA8vkd3WIDhDLjLda33WzO+jSgRzKY128ozx0g
	 jqiKcVjzvV2FKsHQTg917PqkxS4zEX3xk00bERGg/NQs+wU88B8ot2hBS1rx8NYsIv
	 69h4Z4eR2wKUfIO+tvSeZymk4azeb05TqqB27LeWOwAHlFDWCmVWvmkpUMzODHjXCP
	 NvYtz1NdxF1w7nh7k6bPBbZDEifwH3zR8Xjp1mOGQnxyoDcsv+J0LAaoE+TVLeBsr5
	 h5omry4lflszw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3B70A60A9C;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE add async notifications for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163951801123.19193.10989335799757326459.git-patchwork-notify@kernel.org>
Date: Tue, 14 Dec 2021 21:40:11 +0000
References: <20211213102359.GA1638682@jade>
In-Reply-To: <20211213102359.GA1638682@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Dec 2021 11:23:59 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these patches which adds support for asynchronous notifications
> from OP-TEE in secure world to the OP-TEE driver.
> 
> An edge-triggered interrupt is used to notify the the driver.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE add async notifications for v5.17
    https://git.kernel.org/soc/soc/c/c6e5bdae04a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


