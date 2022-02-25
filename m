Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536BBC4167B
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 251F1C340FC; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AD34C340F6;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=bG2XWHfEVtOKTR60uFsX6XFda73Zg6FydFYIbztwkDs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rzXIVphwyasq8AttQEKDu7JAA4Z/sOfhS6+C52KbUv49ugIVwaM2PjC6IJHd01iI6
	 uA8EVIn6CaR1TENu15geEZNNZBHwanIdqjMNE6f8nFAswumwQ4rqeHqQChIOi9OozQ
	 x9LeKnnqemTExvQKHyJbZY3bQ7NhRCGxmR7xQj6f0lLO4ePFZ2rRycqhu4m8/hEzUy
	 ZOkuNJ3gXtdzzxjHsEQwmtPIPFattVfGswcxGpptSpPUhe/2ZIQlpWXa1VrSoIsZLW
	 CqZTW1pwERrTYvBva7VKaXyN+GEZtf2aEwieUnkFtwoi3ZSM5pr1fdfnmtx8NRNwKE
	 XjQdYU4296Mrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA87EE6D453;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: mstar: updates for v5.18 
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966295.15608.11650973542692705613.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:02 +0000
References: <20220216193131.59794-1-romain.perier@gmail.com>
In-Reply-To: <20220216193131.59794-1-romain.perier@gmail.com>
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Feb 2022 20:31:31 +0100 you wrote:
> Hi,
> 
> Here's the ARM DTS changes for 5.18:
> - mstar: Add definition for cpupll
> - mstar: Add new boards
> - mstar: Enable gpio support for the ssd20xd SoCs
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: mstar: updates for v5.18
    https://git.kernel.org/soc/soc/c/f7bc3bc5d3eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


