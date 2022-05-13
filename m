Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61132C4332F
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33C4EC34113; Fri, 13 May 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F6CDC34114;
	Fri, 13 May 2022 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652478019;
	bh=kPdOeoVlF0Ge8Xbu/5+T49d47weWu734PMvHxXo/d9o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=G+2r9oycJPWEJkVHr8Jkp7R7WDYYzM8vJGoYtFvqsA+DGgb3onMR9vUCiB/XHB7Y8
	 NiG+ZK8468r8V8BEs5aJM6ZbqDUQihCh3GL1rxjxu53gbCIFaffTvIziK63hb+U0qZ
	 iSxdqQKKXpTKvHuJxsIUYQWQVH1CvEMgSOG+tUafh5sz1wJh8PM3KWBGYFAmxX3LcM
	 VOwdPUvMzpNHCgAi28vK4aoc+ZhrRAQjfp9N4xd3dqaprIqFdK7qJvLOz+A79AkPcw
	 UQlmTuC+U3Ue+qCMt0Pvju6YdpEtC5qunW+32MiyFY5Jgs8w5LYd9eH6Mh/ud0aiSo
	 61AHhXCUlC+rQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1169F03934;
	Fri, 13 May 2022 21:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.19 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165247801891.11200.1236547199004855578.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 21:40:18 +0000
References: <87lev5r2rg.fsf@BL-laptop>
In-Reply-To: <87lev5r2rg.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 May 2022 15:16:51 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v5.19.
> 
> Gregory
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v5.19 (#1)
    https://git.kernel.org/soc/soc/c/7213d3a5a1e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


