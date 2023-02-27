Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54174C7EE30
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DD3CC433A4; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 168D8C4339B;
	Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677505818;
	bh=F0cgqgIMxgXO0mw8zvXUkcDjwC5sV6otwKUr2sDG4jo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kvTZZQLUuuLyBD5kIrnpZ8IQ6VvY6VFPbBKGsffB/jIlGZbl5k0LgzYPaIrVJELT2
	 ckTxJQOZ3FWaK+iKNx6ltSQO07trgPamvOz4aDMf1qAI0uWyQr4ON7o1lml5hOkJQu
	 3T6bLRZrhyIXM71tZn2bYu0Eb4C5yb5mEQEQ2b7Pb9qGfz6gN9lmrdHDLxm5yGiGzQ
	 Z0R/T+dvv9+5MoaR8zSa8rL5tcvcUHyNos0FiJri+IWmGgSwqkyvaRuVDHv98GmgV7
	 JIXNyZ5dxVjAia0UIuuIPl++yA2GUnR6O5VFJb4K2MmYqupCWH9lLZRnK3dZSRUqid
	 Whmq+hIS61Nwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8FEAE21EC4;
	Mon, 27 Feb 2023 13:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Add IOSCHED_BFQ to the default configs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167750581795.1456.13934614255166460464.git-patchwork-notify@kernel.org>
Date: Mon, 27 Feb 2023 13:50:17 +0000
References: <20230224135230.2295826-1-linus.walleij@linaro.org>
In-Reply-To: <20230224135230.2295826-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Feb 2023 14:52:30 +0100 you wrote:
> ARM64 systems are often memory constrained and more often than not
> use slow single-channel storage such as flash memory or MMC/SD-cards.
> For any interactive systems (such as mobile phones, tablets,
> chromebooks...) the BFQ I/O scheduler will be desireable.
> 
> Make sure the BFQ I/O scheduler is available on these systems.
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Add IOSCHED_BFQ to the default configs
    https://git.kernel.org/soc/soc/c/e505e6bf4205

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


