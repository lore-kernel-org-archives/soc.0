Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C2FC77B7E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED493C43323; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5EB8C4331D;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=sXR7112DU8xPUutpW8DGwcn2PWNOjX9gXSu/ryyYZCA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=e70uKFzkgKqIoIPXKXuxtAfDetSzravFAJeHSS0AEnBV94HbvCmpT4Xkn3S+pyI12
	 3k90MzgBJBrIq9Gey1UunM5YSHf9amrPCokn1DnJtmjW+eLV6/AqgPKbZEUyEBimHW
	 SFqTbJLgBL2AaNOy9/bPaQ/Yd/v354jVdp0EL8RM/oB2KUPTRSirMMT9xisBIsFIfz
	 eZ1g6lQ2CkDqRlHJNB3XOFbmlQUdIKhaIE1TzyZamw8vdg4lN+pRkziHcpIc3S5+r2
	 2kn5yidVwbVx8wqmiY7d9K+qCapo2AKoyywriTpAJOSzGhDuP92uLA2gEZaF4j4aTZ
	 IiJz20M/dt3kg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BEADBE55B35;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC RTKit updates for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783075.23940.15280844716227077270.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <0dbd2dc1-6a2c-5b21-354b-d8314937e8e7@marcan.st>
In-Reply-To: <0dbd2dc1-6a2c-5b21-354b-d8314937e8e7@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Apr 2023 16:21:57 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these RTKit changes for 6.4.
> 
> This time it's just one bugfix (only relevant to upcoming drivers) and
> one improvement to syslog forwarding.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC RTKit updates for 6.4
    https://git.kernel.org/soc/soc/c/5d2e8343e412

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


