Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0334BC64EC4
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC1C3C433AA; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6B41C433AF;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=lu12hTsHK2Uhufj0mIyeEUHsdPy4UlsqzDX1FN0B0QM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KchVFWaorK5/RFa35TtIl1tJ4b9ZMbqKxVwauczMcQUYjFrdGnXKvtU3N+8b6r6Q8
	 fqXjN4Cw/OdZ5AvCW4sAkgCpGIx253Pa3ylqCzUbf5uCZpm0831llhDXwrpCFocEm3
	 c8nfX26uZP8KYXIugYl2wWwNA/jIHENQxqm1Gn6ES5/IrGJMtBDZSl7zuv0CCuoy1O
	 dgZP9HcDkshnpmukL2OPNXTfL4LVMSl96li4fYD6rx30ahOQ188NaxnYCMBWBWH07z
	 eDYGwYTsZR7m/bTgcVQ7GG1i928yvZX2M8QGVjf9ETd0PMl2p8W5bN4guXB2BL13HW
	 ldB4pfX8zqJgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C37F0E52558;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786079.29049.18316833612042754647.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <Y9Raak4mhdtL0L8e@jernej-laptop>
In-Reply-To: <Y9Raak4mhdtL0L8e@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 28 Jan 2023 00:12:42 +0100 you wrote:
> Hi!
> 
> Please pull following device tree changes for 6.3. Note that this PR
> depends on following immutable tag:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git soc2arch-immutable
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.3
    https://git.kernel.org/soc/soc/c/ffe4bd3db832

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


