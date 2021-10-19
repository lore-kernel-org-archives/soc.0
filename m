Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676E4C43217
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 22:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BAC186136F; Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A03B86134F;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634682014;
	bh=h8k0jjxwA8ojD3bMWckLMOIV40rL2QtqPldsogXU7J4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SsD0uEPtPxe9n2o5kBYDc0pRBP0fuB1WBZytciKNT+bP00SK/fIXyMKZaA7HK+vyH
	 lm4WWpLgqiYmIOfEFyy4JNEKMHGmFP0y6r3xooao5S5cUoErsnHoQ5sO0Ofg93EEih
	 MP5tdjiJDapjluiMhiX45IXJ27hZv1Y9mnT0G0Tg+lFnXzpyrB49kFwOWvLoU6urvG
	 KJ+vedr4D5+evxtZLxPPZbSSBgMW0Z/2e2R5pNJdAvbyntFguj3GFv6bH2aJiQ7aGV
	 G1is6SzBRR7UiVDBq3CeCSoMXy1e0LNUWK9jBvpBcy7ryA7ofLCl5iXYOmcYqWhi6S
	 uGQKVH5/sNeGw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 92E0E609E3;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163468201459.1188.7617975508807867505.git-patchwork-notify@kernel.org>
Date: Tue, 19 Oct 2021 22:20:14 +0000
References: <CACPK8XdrMzY9tzdof7KpzxKquTo7GcWW4N9Zqwtmmu73C7htXA@mail.gmail.com>
In-Reply-To: <CACPK8XdrMzY9tzdof7KpzxKquTo7GcWW4N9Zqwtmmu73C7htXA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Oct 2021 04:01:30 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are the aspeed device tree changes for v5.16.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 5.16
    https://git.kernel.org/soc/soc/c/f6bfe0146895

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


