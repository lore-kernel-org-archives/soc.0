Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C419C433EF
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 21:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF3DAC385B0; Fri,  6 May 2022 21:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C36C3C385B1;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651871422;
	bh=ovkI85AYHHTSlDLe3bb9DHT+MKt5M/QfX87qxDGBXas=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HzHl9JM2nCqHdqHRPkVWld+4Z7aUV7FcAKjfUNXZnL+sIiq2laDHfxTW8L/ILu1KZ
	 W0B0o6YVQ9+0lu088cxcNqw4KGMEUaF+LyII4WSI3U7FdKZg2jyyKhJZD8j4UbDyiV
	 BQQvddDIaRDjgacPoQ+ChnITIk08DQfz6YI3RtWMhXQhKlzV4Wo5CUaCVC9kINedVm
	 8OSuqhXHRAk9X9Nsr8JzhWLHoHzctx1VK/KFKJu1T+3SqtIt3oHxi2AGtjf082r2a3
	 dwIpDPT+gZ3CYKO1bZpf2agt0bjN8RU2+WFU2VsMgdP7LjtbcC1XqNZqkkh6WqlyF0
	 nZrPtHu3qE/Xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A396BF03912;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] ARM: tegra: Core changes for v5.19-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165187142266.4183.13654142560631735834.git-patchwork-notify@kernel.org>
Date: Fri, 06 May 2022 21:10:22 +0000
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 May 2022 16:30:00 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] ARM: tegra: Core changes for v5.19-rc1
    (no matching commit)
  - [GIT,PULL,2/6] soc/tegra: Changes for v5.19-rc1
    https://git.kernel.org/soc/soc/c/68edb53a4f4b
  - [GIT,PULL,3/6] dt-bindings: Changes for v5.19-rc1
    https://git.kernel.org/soc/soc/c/72a21285a780
  - [GIT,PULL,4/6] ARM: tegra: Default configuration fixes for v5.18
    https://git.kernel.org/soc/soc/c/ef0bf470b0ab
  - [GIT,PULL,5/6] arm64: tegra: Device tree changes for v5.19-rc1
    https://git.kernel.org/soc/soc/c/1bc44c1e79a2
  - [GIT,PULL,6/6] arm64: tegra: Default configuration updates for v5.19-rc1
    https://git.kernel.org/soc/soc/c/77ef40603f3a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


