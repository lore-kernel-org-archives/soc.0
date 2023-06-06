Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD43C7EE37
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FEF2C4339C; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81348C433D2;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686084024;
	bh=aWj9zkoDPQtNI9lqKr5HzOZUUHIgKD0ak8Ey7HZcxn4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=R6Uguy1s314a9nXa67JijudLCPhRA+zT/76tZmPOMqK7rOOMnewJo3qql+n+8CIpn
	 tu7oIvyfTAmpWTxZfEmWJN5CfXsNn1c65gmD1q1MhEPiabOnKTwa5aNITcVfVSYziM
	 IyPUoSWU6nfVOiw1vsksc9LKE55463UzhNT0DsuTfhAIxuqdcFPLUJ+ZhFjQSS3PP3
	 ZvrIDOIV0pkPGuQGEov2qtvgghxn2xRysp6QZnIlvN8tD4OdHwPnZuPAc5NQ/FYtdU
	 zWzeX+n9utP3lQBkkrXgiTl5W/19ZIwR1XGpBeo4H0SYejZ+/hTsn+H/eu1RaEnRSo
	 sKyeN+YLecQfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6EA01E87232;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Non-urgent driver fix for ti-sysc for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168608402444.20407.2211950353872412569.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jun 2023 20:40:24 +0000
References: <pull-1685700720-242492@atomide.com>
In-Reply-To: <pull-1685700720-242492@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  2 Jun 2023 13:13:05 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Non-urgent driver fix for ti-sysc for v6.5
    (no matching commit)
  - [GIT,PULL,2/3] Clean-up for omap pinctrl-single nodes for v6.5
    (no matching commit)
  - [GIT,PULL,3/3] Devicetree changes for omaps for v6.5
    https://git.kernel.org/soc/soc/c/c5c3f746c9ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


