Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EA3C46467
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 976F0C36AEA; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82241C34113;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=6Ltpw4GxPD3Nkn3BQxRD9FiR/yhpv754DQwSmkrLnCY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=A6565iW1wRgNeWm+cJ9ho/GG1zxxKlxSIQM3HPC2Af/LtAf6fKq3c/4zhofSbMSw2
	 UB9bWcnd5whCH7hDyakdbOiUjQfEI42OYSQ1oH4rAUBZWGuk0y53YAdGQ34nZUrb0A
	 t4+ml0z1eDHQ0mozYWXBKOLdJZkWW4smTDst4060YGlgVDQwMonGtiJ5d/SMRZYZJl
	 wK2+D5vE5e5kVK8OvBZ0bNqxsheNUtXZ3jNWeu3EJYtyB/VXRGL4/QaT0d4eKh28wj
	 9Kuq2fckHPs52G357qekh9D6TmCLZxeCX022IJMepTQd03lZOKVUT1slT8MmyDBr+r
	 oM0zlEnZKaYig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6DB3CE6D4BB;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: Update for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966344.15608.7701619955827036194.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <20220222201812.3338619-1-sudeep.holla@arm.com>
In-Reply-To: <20220222201812.3338619-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Feb 2022 20:18:12 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: Update for v5.18
    https://git.kernel.org/soc/soc/c/1b29d1c1faf3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


