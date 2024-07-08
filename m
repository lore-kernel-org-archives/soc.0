Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0023BC3DA42
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E76C0C4AF0C; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFA9CC4AF0A;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451507;
	bh=OCKGsTehSPUj3b7ZTflkUZTq5Rr6MhoMyCR3/y+WveE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oTBUy8mAkPfuPVmLhg5uEPDPUQYGDX+3kwtTMPzKo6H5ZYj0GMUVXH4AP3etOo6oD
	 s+x0fl5c79Dj+5UQ/ggAkN0QvOAHpFKAbEzDsRMuFlGu/UCo+Rem2E+yNZ2Qu1cKI7
	 TJQfJ98VKnTuO6L7wpZMaCzk15kRa9/y4d1m/4RIs/NHtbutK0GgyybBUB/Lh83uXe
	 ZgU3ccLkPb3qWzVSuN4StxT92Wvk1N/kh5RmTp9qe51J0/rH+GqbvQf5Yqr4WEY1Dh
	 2RAFAAJU29wuIcb5XiWWN3gz1cTNrwwLLxS4b67PpoYxUziWv4lQMwJgu4paIfZ8Ek
	 LIlwYFR0QCCDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BADC0DF3716;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] 2/2 ARM: dts: various cleanup for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150776.17395.2125519093193655684.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240702065359.7378-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240702065359.7378-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  2 Jul 2024 08:53:58 +0200 you wrote:
> Hi,
> 
> Bug report for Aspeed-related user-space on using incorrect sysfs ABI is here:
> https://github.com/openbmc/phosphor-state-manager/issues/27
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] 2/2 ARM: dts: various cleanup for v6.11
    https://git.kernel.org/soc/soc/c/7120733d1d12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


