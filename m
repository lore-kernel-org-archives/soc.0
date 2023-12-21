Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA18C47DA2
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F7F6C116B8; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A6CBC116B3;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=/QM/p2egkKDDfEbMSkRsWawuyI7W9vwxR5IIn3MyR4o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GkGKvEw//00EJX1LQK9+UhHgtvxfxi6haz78CgK4nisT1fzhqjaMWcdUmAYudfcJ3
	 nTiqwe9iZM2LXV6wrtHyFr9eg4u/5E2Pi5C+MgT/RfXUDPzrRXmARd3fanYkxgH7nV
	 0sgFqiZo3rLCP4B4CsHaNyrOJ4nEI4ejiTPvF/xj7HRCJOoWbqzEp45E17top4PvCc
	 gGfQjZMyKsVo1d2FOCDmPOGEIa+f798Zj4LZeT0UIzaQyI/oQ60PfCpuTfRYyzDIVK
	 4jHlbCsXAAZCA6GBJjBdjZyktab2x3YijgCtNnl/zwCWb9Q10C80BSMX0GtASxlaip
	 z+34R/sEU5Okg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 69390DD4EF7;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 HREF520 DTS regression fix
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046642.3302.13978590422001364574.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <CACRpkdZ9wCV7oohF2KX6MFwmuSPR_i7et8O5SH=op6gyQ4mOvQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ9wCV7oohF2KX6MFwmuSPR_i7et8O5SH=op6gyQ4mOvQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Dec 2023 19:55:53 +0100 you wrote:
> Hi SoC maintainers,
> 
> this system is probably only used by me so there is no rush
> to get this in, please pull it for v6.8.
> 
> I sent a single DTS patch before but they should not collide.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 HREF520 DTS regression fix
    https://git.kernel.org/soc/soc/c/5a256cf710cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


