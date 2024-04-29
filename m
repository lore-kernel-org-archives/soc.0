Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4451BC25B5F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36911C4AF60; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21259C4AF52;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=F/xJG+f0kVL0SrpSm09vfFA0gf791XExID2m4N/54B4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=T/baenaOWNLfEdOA1HfTzICNqARks8ffQjve9pcCX9MxiVQmYYOfAhf6V8qYxzBck
	 gG30vXpbH7LD5HUaarxjuWjXNrTOOWzlJNncwR9Ex41l1M3VyfV03S8jvRK6wYpSwf
	 zgUeQj1KqyNOvZrjtmxBwfOUD4/pQCdXx7Xq7Bzbgp8NL8DJmnyoDBA0/+HU+yJJgD
	 bh0jS0uoE4h7NjT1ofFQ1fP1B4G9iJWN/clkpPKzthYH6riTqMMgdB0G63mGDi2X7i
	 dSNDW4tPSVmPKzlLjyLFGIKJ8mhjH2G8YiVpZmGtFkgPPpIMtTPQ2B6dp+V5tEikmJ
	 6+IvnqkbzAwqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 128E3E2D48A;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.10, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888806.20509.3900015169379044596.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <20240427133006.GA146501@jernej-laptop>
In-Reply-To: <20240427133006.GA146501@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 27 Apr 2024 15:30:06 +0200 you wrote:
> Hi!
> 
> Here are some last minute DT changes. They apply on top of
> sunxi-dt-for-6.10-1.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.10, part 2
    https://git.kernel.org/soc/soc/c/b0a1bb4668c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


