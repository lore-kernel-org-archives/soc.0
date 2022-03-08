Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AE6C43217
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A27AC340FF; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0329FC340EB;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757015;
	bh=qCIGRKQT1pI2Ejr79N8tSSfXMSyBou4NUQAEHQ0b8xA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=H7ISt+PRpVro/chetgFVbGZXaLncCZDuoULg0mjzLnge2FO/FUMc9oDxgmuOZd3CC
	 4rn2rAMx4ycyFVynbnr20DoCPTxgmXykoAbDpi41cIbSvTxmJtxT0Pzqd/QnnD2e/L
	 RYuPfMApvjRW3btnXw82hskiz7XrpZYIAgvm3RYHYu4lzNo5ZURFDOLa06Ms56nSlf
	 gFEiZbLNNyYtRpWlUbotco9zHWfOhmLfrTwtQAIJLwlP4v3m4/LCNSNhvzcvZ70abk
	 dg2TVKLSbaFYzv7YGICYYTBxEEeqlyLGAFORf14kEaTM9bmlHSevH78ILZsGtJsy9Z
	 aJ65RY7XCIUYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6E82F0383E;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.18 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675701487.9628.17777639292623048540.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:30:14 +0000
References: <20220304160036.27392-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220304160036.27392-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Mar 2022 17:00:36 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Some more dt changes for 5.18.
> I had to modify one patch to remove a dependency with the clock tree because of
> a modification of the header file in [1] which is already in linux-next.
> I tought it would be the simplest solution as I didn't manage to get an
> inmutable branch (which could be an overkill solution for such a small change).
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.18 #2
    https://git.kernel.org/soc/soc/c/1a38f961c4f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


