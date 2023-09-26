Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F684E7F12D
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F625C4167D; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 397BDC43140;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=Hr8SIqzfjd01VHRbI9i4pHmvX12SQNMjL8XdBMfeKqY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DZ0TrVGkpH6be4q5pPD+E/vlHgDRGoNaNB3zQd0EBAqXVJIJbdrDt4IAuwgb/7bdu
	 I6OglwDm7Zok1HnlbpOx2eRhXKQQ2a68VASROV1q9BEV0BEECBpZI/a/p1k8GD6+n6
	 t+5XNI6lIyD7X7mOquDJtFoKWs1zGDd6TEEjCQU0wh/mqOOvwl1RGgV/qfpuopz/Sw
	 PbDvpCM2UEFRKc7nI3266LVoiN7F6Gh+QDraBlXjImGez9l4t0L82wpzF8j9wOPOSx
	 luWRghqaXs8fgXDHZZXdmPi1ma/vV8Vu7G3xkXaeeMlWtTxWTvWVNsQLF+zgFUtj+F
	 JTI2Jcj7sQhRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1FB4BC691EF;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223312.24546.12807520415266125477.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <20230926123710.GT7231@dragon>
In-Reply-To: <20230926123710.GT7231@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 Sep 2023 20:37:10 +0800 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.6
    https://git.kernel.org/soc/soc/c/b0ed7eeee0ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


