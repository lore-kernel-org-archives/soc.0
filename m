Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBA2EB64DB
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 457E0C4339A; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B0A9C433D9;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=EZFTQEYeO4veG6PSBBKcQeMX7MWrvaFg+85liqHsu0A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=r1J9XoGLIaEcf6CWMBEDBKy9FD12Io22SFQGV+lDlLdH182owvBdVu9wwF3A+hevC
	 ZQE+P9J0r+P5AUGlRHqh/c0LGS/BxUfHK0lDIx7a1YI6WTTU5yimX15g+3zWAMBACV
	 znemY1qdYnXvjgJEd7t1//XI51aOVhfZnEuErYRP76lPMoO1qmA3djroR+VNlq2uhs
	 V+lUItEjGsPSt5gBtFvY8U0Xrd8Z5MpSCShX224UGGYj4dqMBgdNUfrR0ldqy1Fwlh
	 LGhpkdtwTdMcKJ3OuUrO7bUC/XF3zp0wDRRhpK0zmA+yuWqh0xRrznEtUk+q2ONoUs
	 KBuDy1ev7FDmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EFA5FC691F1;
	Thu, 22 Jun 2023 16:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 6.5 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745022997.12309.11983479127040981070.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:29 +0000
References: <10286366.nUPlyArG6x@phil>
In-Reply-To: <10286366.nUPlyArG6x@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 11 Jun 2023 23:12:12 +0200 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.5-rockchip-drivers1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 6.5 #1
    https://git.kernel.org/soc/soc/c/618d12930905

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


