Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35706C04FDF
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0279EC433C7; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D486AC433CA;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692033026;
	bh=weghkueY3RetoouhVZx6rwcSrZL5pGA6+haZRadBRlc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bb5FCueHVvmaIVFaY7+EWXCTztmS3OpPWEPVshsk2pvUFpbtXzvJCdpCYy7GdYE5B
	 Ej1UQP4OUH9WbqndLN4ejAdW9hJzc1Rc8oFcXC9fK4JhDU03ihMv27u1BbN4vN8vGA
	 /QFvVkAf+0S6oGxsgwM8rSpUUlpMqtlQXwSDFeQmrmb+WcC3mW0AxBxKxGJjZfkr3M
	 +22KyPJi5DyIwyXYoa6PVG5sDYeEkyxkRXcdDDQlkm77we2C2Oa704G+N5GRUbqX+b
	 TLgmTW051Vq5HFpH8u8gf4d1TzU34aJVm2jY3+q5ixaCS08OZH+SDdsg0t9WkkB+/S
	 Gk4jOWj7PbBKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA3B2E93B37;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v6.6 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169203302676.15030.13744927027358697253.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 17:10:26 +0000
References: <87jzu0t0mu.fsf@BL-laptop>
In-Reply-To: <87jzu0t0mu.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 12 Aug 2023 23:24:25 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v6.6.
> 
> Gregory
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v6.6 (#1)
    https://git.kernel.org/soc/soc/c/00e1ff04d5cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


