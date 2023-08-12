Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1085C10F00
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5958C116A2; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFCE7C00443;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=rk2Gwr19FzfC2nL2At/br5XTDS5YF1UOSczISENyhFc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Hnio6/FK9mgwZ58L8ExUdzixDsaotj8bX9frLJB2MoZvfc5KuzWRaHMDhD4VoXcFw
	 FIcLZOU/ISUQRBFupJVRatg0pLo37UylBDTSUM8EIdQiCFIVasLhJsz6kX3PQXryRU
	 kIp17K0Ih55b7eSgtD+BIKKLqtg+W8buG1repc99fo7eh8KSXkHlBNWEazXuWf6A1m
	 hxWJ4KZda4vXWA/ItMa779RVfV297FZLcrM8viSpmZCzev7WsTK6qkJGhAUDGf/xtl
	 ptM3RbSj1Odh4JIXj1dwzbMD6PwxKq0rrJApMcu5tGApNjr1hAw8PsZ6ow6ZmednZb
	 LNLLWYk7bg6GA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9D250E1CF31;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: spear: Explicitly include correct DT includes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168964.30475.16496094367465310598.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230717225414.3210914-1-robh@kernel.org>
In-Reply-To: <20230717225414.3210914-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Jul 2023 16:54:13 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - ARM: spear: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/544885aa0750

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


