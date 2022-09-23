Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE4CC6FA9A
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1ED1BC43149; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08FEFC43144;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=AXY5xC7q+dw0HJXvmeBA6aaWKp4/NdB4MzT39eD40U0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YBsxL0kW/XxkoF2OK+JdYCUZNWG+fgm28bSFxoFbO7aDvSsYW8QqsBHEKKjC8pNpd
	 Q+lfUWGYzTeqCpqH+epnA20nARp209/qVwwAElDb+n2+zXgz6TXrp2guNKjqc0E2WR
	 ZOsSwFxVI7UEzk+4oYm8C0DtZ7D/SSvFmxVp5iviBEWJGT7BykFn6SOpW04oO65jnb
	 lOjK/AOw5A3pHjK34wCxK6CXYtr7F9M2ZcMacH0wM+uGAOB1meKikrTjp0Zjwq3sDr
	 N5QjQrwvT57EWcvOyl9rbkLNM2cAH7AJY97NjMZB/rSuFVCpqJ4i1udGKywl0CA0VH
	 SrC5wHctJ3U9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E893DE4D03A;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.1 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002694.3905.5980646361744044641.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
References: <87h70yxfmy.fsf@BL-laptop>
In-Reply-To: <87h70yxfmy.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Sep 2022 16:41:09 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.1.
> 
> Gregory
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.1 (#1)
    https://git.kernel.org/soc/soc/c/141258d4301e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


