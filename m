Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D290C46467
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67E68C43144; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5212FC433B5;
	Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669206016;
	bh=H9mrtqTL566c5ty/MoDtLHTaT/JzLHg5UkqPVgzaipE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kgFwgB6JionNKNRwTCF9APDaa5cLXbZbc6TdfQsjNyU1A9NLOhyz6eXpujP9x1gTh
	 zj6gUPnWatRFWW9rQE4YtFoclsbWVAFGPA2Xg6KjCXN35YGHSBdzsGW2AXhVMN1ykP
	 a1V9fRlZpx6uURWponjtfyko6MD8QGbhKswNgLaWqHQUsunZzpK7i5PBr+SLe6Jiox
	 VQvOaMkEYN4/LfFbkEmeTQbdYwPyLH4jUAdmd1/Y8bFExRIVzhZMXXsq1oYl8d+A23
	 b9pRos/2Y+NCI/xhfXMbR33/RjpIEWfH5V4jknyPyqA6lbKXAeYe5lFHX89WRCCLKt
	 NzAAqSNrQ26sg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A557E21EFD;
	Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] ARM: keystone: TI Updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920601617.19495.17289810611985735418.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:20:16 +0000
References: <20221122185650.nrh7s2g5obndj5vj@dental>
In-Reply-To: <20221122185650.nrh7s2g5obndj5vj@dental>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 13:01:07 -0600 you wrote:
> Hi,
> 
> Please find the keystone2 related changes for v6.2-rc1 below.
> 
> ---
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] ARM: keystone: TI Updates for v6.2
    https://git.kernel.org/soc/soc/c/8b7f4dd73879
  - [GIT,PULL,2/4] soc: ti: TI updates for v6.2
    (no matching commit)
  - [GIT,PULL,3/4] arm64: dts: TI K3 updates for v6.2
    (no matching commit)
  - [GIT,PULL,4/4] arm64: configs: TI K3 updates for v6.2
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


