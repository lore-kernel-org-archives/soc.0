Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D427C8300C
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 094F2C43443; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7450C4339B;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316227;
	bh=1/e0jlTi6pOOnn8EOMrwhp9w1BvweFID0E/5uiz/taU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=N2M1+44r1ipktN9kh9/AEXUH84IS12fVwPLuzjvrPUcXD+f3vefH0Y6qwE/9bqFgb
	 4TPmK7xpIymvMr6sSkYISQY0uduWCtXAVeVBWrA95ysMlxWejy8QAo9+SNlfNwPaSy
	 syhDXnb/L+/2N1GpeH/deT+14fTWJmXWT7H6Ze3fHDnSEgQWR5paOPMaUcxCT5M2NJ
	 RgWDpfGqb90xK2pdWklJkHDroE2yq5xWAJmw7WFpxfD6Uiq/vxpg7NJBVFyb4Jllh9
	 xjmi9C5++9XoiFQEIY9CbiyOwX6eJOzvd9mgX3YMSWUvwaD9ESzbLEg0bSlILhlINE
	 /r34UgTOcVLow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2F48C43157;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: soc: ZynqMP SoC changes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622785.816.8990446668318397114.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <411aee78-e7e8-5966-cbe8-40ff45e27ba2@monstr.eu>
In-Reply-To: <411aee78-e7e8-5966-cbe8-40ff45e27ba2@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 8 Jun 2023 14:09:14 +0200 you wrote:
> Hi,
> 
> please pull these changes to your tree. I have also included changes in
> MAINTAINERS fragments. If you want me to send it separately please let me know.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: soc: ZynqMP SoC changes for v6.5
    https://git.kernel.org/soc/soc/c/b79dec951a5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


