Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51649C6FA91
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CAC5C43144; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 244EDC43140;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=a65PI99wFlsqxave9LBrZOXx7fwz9jzHOGdGIxTu8KU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PiOEv4ebMY6f2mCumuF6oCLaeBYGkRC8eq+izg8FfJVHbDrvyv5DJKtoqNLtD//Rj
	 l7a4G7Shdz3SrDxRWeRpSjj1wQWsdn9jamkXXZufvv6Q61IFw1axiIS81mWmPk+tFh
	 99jH5QOkSypfsA0nwPJm5eEXMV/lS8QLDHp7rgN409cMtb/Zomk+LEnzHOXoVunEOB
	 HR4i7EQmj48Vsy1iC7QdPeZl1eWjAJa5zdAqx9/j26GvFM3F/pOpt3AmnX5HriZQdr
	 D8al07v3Z6bvy1j3upQXX0Q+dRs88R5/dg581/L37hI7uXIJyEGjRj1kIHIrTOiey6
	 h6sMPNbo1CPdA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F509E50D70;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner drivers fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472806.12526.8640824259311274886.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:52:08 +0000
References: <YyeN0m78+m9nNEah@kista.localdomain>
In-Reply-To: <YyeN0m78+m9nNEah@kista.localdomain>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Sep 2022 23:29:54 +0200 you wrote:
> Hi!
> 
> Please pull following driver fixes for 6.0.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner drivers fixes for 6.0
    https://git.kernel.org/soc/soc/c/7e1e2acb7b16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


