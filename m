Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AF2C77B7E
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3748C433A8; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BC52C4339B;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681831220;
	bh=z0DzAcp1JTKvoATQorTCFSj3KAw9FIhYphezd0z0mmQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HYSPpe7ZQL6E9v1Dnj1/ay6N1VoEoZjHw18UTuutVUYbXyjtnpy5I06W9F4Pq3rtV
	 FEVhCTgzlAXGhTuBgxsssUHvmPjNv1LeqDXXaVw3K8PxmbnfMXTOa2ZLn6Q4C2yua7
	 TejX+Kxp9nUV7gJvpDGT/MOgOpBlmpKWKLGjy7XZLr1xXu/39MB9Qi3SzndzC2P9rn
	 rBi3pq6a0+ymXpGlE/mUCJrk64TduIBLi0vC4YBGbgrwDYVLr3vLdsw0MpVS1O76Ud
	 w87tDt6IhLonM9Z1FYbdTK6/zM3+sy1NF/8WuQMVLh/na+zUPL8DhX4r8p5ZDfIKWd
	 MRZ1nhei/k7JQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 531C3C395DC;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: config: Update Vexpress defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168183122033.6966.12004380997603762049.git-patchwork-notify@kernel.org>
Date: Tue, 18 Apr 2023 15:20:20 +0000
References: <20230418082427.186677-1-linus.walleij@linaro.org>
In-Reply-To: <20230418082427.186677-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Apr 2023 10:24:27 +0200 you wrote:
> The Versatile Express should conform to standard contemporary
> kernel features: add NO_HZ_FULL and HIGH_RES_TIMERS. Also add
> the AFS flash partitions as these are used on the platform.
> 
> The removed SCHED_DEBUG is due to Kconfig changes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: config: Update Vexpress defconfig
    https://git.kernel.org/soc/soc/c/2c25b94f881c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


