Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8016C25B77
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5EA6C4DDE8; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FDCFC4DDE3;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=gYZok/HWdiepFC2cBn6SUqMolKHdvyU8LHUFO6o/yYk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KIhY8S9agVf0ruBvpGjtPo6zfqqncG6wbeFGDvTi3tqHy4V0OCo/d9eeXBu4veMVJ
	 Dymwr1wRG7z2fFJOIOa1yN093VSETh9Ct5Il/muOcNotqbOWb9VinHrHkRFoOnO2AV
	 m6q7/m4eZbSmdFUcD9lrxf16xfSffM7w8k+xOzQIiqokd6Ye3Ynv7vXtiLHdkTot3c
	 nPRT//N57siufA5+Hzot9N2x0xSw1cigsFMYx7YYBXE4+a07ebxDwiPXtYvtjCzwIq
	 SENxtJybbr6W7fTL349xw+dSoo7WjC+6EPcQYyAluaM85UYcj4TXvyYfORH1xmNlxO
	 4JJl4D8ugbRFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7B396C3276E;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC drivers for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483950.24942.16974102633729247358.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <20240503-mardi-underling-3d81a9f97329@spud>
In-Reply-To: <20240503-mardi-underling-3d81a9f97329@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 3 May 2024 17:00:18 +0100 you wrote:
> Hey Arnd,
> 
> Please pull some SoC-related Kconfig changes for v6.10. LMK if you
> think this stuff should really be going through the actual riscv tree
> in the future and I'll just harass Palmer about it instead of taking
> it myself. That said, Palmer did Ack it all...
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC drivers for v6.10
    https://git.kernel.org/soc/soc/c/a3116c88817e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


