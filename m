Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4079CC41513
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FEE0C4AF18; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A35FC4AF49;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=7u1I+1NxU24/LNmRJGKBPq5HxylVozOB1yyyyMl5bMc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZJrizsYKjxV2rjFkz0Forje13R1LDCxUYRMzpuw4YZ44Ye6qLOUw61IuU0L0M3YNs
	 KKYG7/S+XMnkdiH5YXAqMg5jAxEH4zknWjDpdGqMzC1uMu8VGzHiTxDMyMKdgvCh3J
	 HBfGIPOXrOhmXHQ6h1AgOpz+9ZvG0Z5ua+RiadKKd4npWcErf87INYKVtAK+4ya4bg
	 OW2SdiLlcSpHUBSh1OksV3ktn2BZvPHPL9VxhSGD1fZcXcwzk4OxEy6C1gpvP93f7H
	 uM2PDB5TQCTDfReByI/xE1FsIQs959iJs9WVzBvYW6j/+KFpz5TpLZMD3m7QJlr7B/
	 krxAihJxNnclQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C9F1C54BA4;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE convert platform callback for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444704.17402.728206356955568742.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240425072835.GA3258167@rayden>
In-Reply-To: <20240425072835.GA3258167@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 09:28:35 +0200 you wrote:
> Hello arm-soc maitainers,
> 
> Please pull this small patch converting the platform remove callback to
> return void for the OP-TEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE convert platform callback for v6.10
    https://git.kernel.org/soc/soc/c/d9f843fbd45e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


