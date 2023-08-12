Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA292C04FE0
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD3B2C43395; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 976AAC433CD;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=bvCFGjAGJb6OZrwuNa1c9pAj1LDeH2dYtCEfgoqHrUw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=M96DYf3Tw9dPf6jyR3Bil8nX23ByIKVUtNcXdbOOrAg+UyHuQRqpESR//F8gIpyoo
	 EFf5yj4jBmH0QC9VKcQt0RoPjYZM2pKGHC4aSPNXayToKNtLxrJCp54da43FPNjGCW
	 sQmUwlorgxd/SO4VRd2uIap7vCvxUfS22UoZx37s0i/r4HFFevKd5OciMCMzKuJaiF
	 7SseYKoxvSHGnOv0l4maOo6DK4cxTrSRzMDLVrWK/Qd3RpnHj8bfHM66dPwRcwuR3P
	 PTtgvLbt/RTaQKGB050L+1G0UkqrTonRR8Zl9vCcRpxt8QBJh0EFL3UZISjWOC0x/M
	 p7D1cLG/xZbng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8205FE3308D;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562752.32343.3050018025556168100.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <20230804123231.3258141-1-sudeep.holla@arm.com>
In-Reply-To: <20230804123231.3258141-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Aug 2023 13:32:31 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.6
    https://git.kernel.org/soc/soc/c/800b432012d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


