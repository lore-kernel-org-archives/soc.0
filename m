Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494B9C2BD09
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 10:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F6EFC4AF07; Fri, 12 Jul 2024 10:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07646C32786;
	Fri, 12 Jul 2024 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720779631;
	bh=RFGu4pzfmE7hE9+cxjChNg1W6Vv3jHSpc7qvA/tUBDg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QJvu0938LLnMPCJ4Y+REMzATRigs0XaNkDqocsYMfII3+/ySJVj0m3I9EeXAx1ejn
	 nDL1HB/9pD7ummxOGLi7MmHzhfND1QBv2wAhzjcE/P6DFFtL+KYJFc8Njg7GMyD2+y
	 dYUEe5B8hFKQPpKhJCtVBhvDroxe145eWSWC+U1iakiwelXn0vJL9VD2DfX/PDqAa/
	 moqyWOIiOe3sMjca08Qu6CliOY66X7OvPksNxvBFNJ0dtNZb25E0MVg+b4RfDF63Z+
	 qwppk+QXO4wqOpd/DnYGGSM7RmIBSIL/c7YhrqdgwjMSxhNg8gaX1ttKtK93qlVL9m
	 aKB98GitNchvw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E395AC4332C;
	Fri, 12 Jul 2024 10:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner SoC device tree changes for 6.11 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172077963092.4770.571058674159686915.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jul 2024 10:20:30 +0000
References: <Zo7O73Afx7lZcBRi@wens.tw>
In-Reply-To: <Zo7O73Afx7lZcBRi@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Jul 2024 02:11:59 +0800 you wrote:
> Hi Arnd,
> 
> Here's a late DT commit for 6.11. The driver parts of the H616 crypto
> engine series was only merged last week, so I only got to it today.
> 
> The whole series has been tested by multiple people including me, so
> I don't expect any issues. And it's just enabling a new IP block.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner SoC device tree changes for 6.11 part 2
    https://git.kernel.org/soc/soc/c/48d224558645

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


