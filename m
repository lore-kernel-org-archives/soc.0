Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024CBC43381
	for <soc@archiver.kernel.org>; Thu, 18 Mar 2021 23:10:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8341364EF6; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6B84164F40;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616109012;
	bh=ZBcTH3NxG/eKDedDmpT6wOSp1eO/SKH8iChFoE7rQy0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aCJxwYv8FUfceYyjKYASy3riXn0/QqMiJCqMsUBd+vK7okHbPU2LD9xLrr+AHopeC
	 +TrS/3s39WgEmmbd1pi1YtrfoAYyQUYaQD5fpEn2WfhiH/eu9+0uyj1I5cOKWAPJN0
	 ua6RU7+yWgP4yEs/Jmw02BRTm7dNv90FIvNwi1laNIpzJ2jd8O/7KEZZAYklb0xIly
	 Oqta0S3yeV5FNWqygfqfizmvi62nwlqnnhF6hep88BXTgqW5rry9EF/wwP5pKsv5fd
	 ctnItTfuZ3/nB1fyf8mkfA4kV0HA4GX/UugT5TmBTQUU0fPlWhg2PTDbuRx2cwdwHa
	 0LdCpbBgWuSbg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5F191600E8;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps for v5.12-rc cycle
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161610901238.20140.6665098833931527813.git-patchwork-notify@kernel.org>
Date: Thu, 18 Mar 2021 23:10:12 +0000
References: <pull-1614868603-800959@atomide.com>
In-Reply-To: <pull-1614868603-800959@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu,  4 Mar 2021 16:37:18 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit f40ddce88593482919761f74910f42f4b84c004b:
> 
>   Linux 5.11 (2021-02-14 14:32:24 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps for v5.12-rc cycle
    https://git.kernel.org/soc/soc/c/ebccfa8a74dd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


