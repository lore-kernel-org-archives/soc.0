Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F395C54E60
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7602DC41674; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54AECC43141;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=2H2cfBMunemHNStH6zSLLfirTbcBOkMoMKwHme/uSuI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tubCUPFuCFKwfkbiBCPuZWW1U07rmvsPmG680lWr7d98mPvQkuaAxIJWy5oMjeKvs
	 CW9NlIoTpnzpSlgW8bCFljq5woYO4ubYoEOzU/X1dYnBusrB3F2UNRondnZ/v4IF2c
	 cH3HeXQ2tcLRwAMLsP/sJUK9xvqHK3JiPWGX4asahtzJVVq8CPUmM5UryGNiceHwEy
	 hF7NfhY26lLRjUVHToQBxs4HLRRYR9vd3ZDjyB0F4wsBwwbnO/7cpV8TQ/BYFgeGDN
	 DAIiU3fOGnDvvqbsD/i/lxLl/bhL6Fj9WipxSeyD5zO0565wkQdiRr09AQf4t2KBol
	 uSPMealrXlTRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40FEED88F88;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872026.25915.18237914807804294302.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240223033435.118028-1-sudeep.holla@arm.com>
In-Reply-To: <20240223033435.118028-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 03:34:33 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Sorry for the delayed pull request, was waiting for Ack from clk
> maintainers for some trivial changes but Stephen had some comments/
> discussion on one of them, so dropped all clk changes due to dependencies.
> All the other changes are in -next for a while now.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.9
    https://git.kernel.org/soc/soc/c/857a96e9df33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


