Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26569C761A6
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E31DC433AC; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAF76C433A1;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=ePA82wtuFroOPYz91TyOhYZFvUceBu32lixKsVlMb64=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Vehz/ZuCMovx7D8lNJwRyAMMkcQtTxtKQSR/FWQNc4bwHlJ9ZweP2P8Q9q1xh5lsE
	 othdlfydICfbrf3GNSJ49ckJLdRhzX7tBRCPeoYBCuFrGB+xntZgqEpoJf0KKMqshH
	 ma2WAsgd6scC7mFpUNVlYwOFJSadx9RBqqvyEcch+jPhGeznkMUHXj5LHn9jqxjkm8
	 xoMhKiZm8ZlCYvjeqXVGhlZK/mZGi5K7kB7Kdg5QyfdNMy6KL1/brXVB+oly9KFm5g
	 73tlX9M6rZLubv75VzCiGaCiOgfEjD1/AFIL3qrg8BqAoYJXnxoit7Qaay9UiZIkoX
	 4jniMC1Eyj12g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BCB6FE29F4E;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE per-cpu irq for v6.4.
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928376.17322.1523231159564588997.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:23 +0000
References: <20230404062727.GA2765560@rayden>
In-Reply-To: <20230404062727.GA2765560@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 4 Apr 2023 08:27:27 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these patches which add support for using per-cpu interrutps
> to signal asynchronous notifications from OP-TEE in secure world to the
> OP-TEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE per-cpu irq for v6.4.
    https://git.kernel.org/soc/soc/c/0d3becec770e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


