Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772FCC04FDF
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4DFDDC433AB; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37946C43391;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691844622;
	bh=bJTrWY3V+62mmAX/y+RKGpsDJTrf/QW8hqrlEx7QOrI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=J2hzu1lABWYx1MQmxZM0cYSi8Fn5oZPtRHA2mJbVLuPL6NG9mal3E6phjSgSB1p3U
	 mcA921ClFbpJ9MfJWdG2BwBxOZcFVqzua5ZZMlMy2ajZwyVT3mj/Q72R+/KDJTqpF3
	 tNtGiZyG0YGvy3M3lF6rtEC2Ko6ngSGw2wHV08RY/3UCeSbh22lGeLJ+GreDbluUv5
	 t1MezSafmnKvvH1qdHZV/PG2A1zOvw9KfLQmcFE/PlNn8GrmnPj1Pb7qbwFcVTfCc1
	 s/sPHi4dxoR9UhAJP/EQcotitlF3vhwFwbQ8fmHZq90k2u28P5GmjQ4/PYl6BGAOaE
	 oO0oCjKu40kfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20F3CE505D5;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Devicetree binding changes for omaps for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169184462212.4542.5811165079581509590.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 12:50:22 +0000
References: <pull-1691658952-110529@atomide.com>
In-Reply-To: <pull-1691658952-110529@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Aug 2023 12:16:50 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Devicetree binding changes for omaps for v6.6
    (no matching commit)
  - [GIT,PULL,2/4] Maintainer file list update for omaps for v6.6
    https://git.kernel.org/soc/soc/c/9b00cb5d4922
  - [GIT,PULL,3/4] Devicetree changes for omaps for v6.6
    (no matching commit)
  - [GIT,PULL,4/4] SoC changes for omaps for v6.6
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


