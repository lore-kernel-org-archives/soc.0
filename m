Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263C0C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C797C36AE2; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA3C1C340F9;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757015;
	bh=07j8lXZEaomhYu7VMg3TJ6ehFFw4jFgUElOPQuxveqY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SQ4oaVXXPa0gNwT0TxJF3zq55vcSafnrZwxFZw5ryYe2qQUdxpV6OTzcjk2s9dHq7
	 TNfNnAvO4n4EVGW6fE1rp7o2c2jtN4JByEEyItCEBKjoD+x6D/wQTRAqhd/GrTdHVM
	 FTfBaDWS30TFYdzHihMszMPUu6EwkxJs8B246RRQdLVl55JCGwuhj6IsKc7aa4y5Cr
	 Yi8SOEFwzEXkjlGNwyMvIH2WY0fRDQEMM7XT70r/dz39G0gjvl6VXSI7wcMpD7lEh1
	 oqvLMd8l34IvTHA+UamySeQmXxopfCoNS90jtd5ZcahXujsU40eDuskMghi+x5Wk3L
	 8k2YLUd4XjUsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CD982F0383A;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.18 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675701483.9628.7854736514727536076.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:30:14 +0000
References: <20220304144746.23779-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220304144746.23779-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Mar 2022 15:47:46 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> A little more defconfig changes for 5.18. Please pull.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: defconfig for 5.18 #2
    https://git.kernel.org/soc/soc/c/9a5872bab1c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


