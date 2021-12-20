Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C20C433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39A48C36AE7; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21752C36AEA;
	Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640014826;
	bh=KqbkZ+TtYt3II+Hlmp96GgdlYy1yK4goqvCqKBEZOpc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=StZfr5q3efrrglZeTX0aSVdrPY7y+LbAY6zVFMSBmkJ7g4f/LSD664yuhhKfcVQGN
	 2Kxq8TSbbbn+IgpocXqd8f1JfP+T/u7Rai2NSIJEY5yq0fEAumTsGPoAWM6tS7ejso
	 uCLpz4bEJpbFlJb9lfkaeAyan/nA5iWpmqWoHfpCpSbSbbCciVPObqmYql7037jQ1G
	 2v+6IdYvalFmjw6l6CqxXvQYcmrOG1lKYWgkmpRT9sDhMdivkhnxM6biYtnW2yKPrO
	 31JF20sa4u+6sOMTkDpmSILtNrs25JFFham7kRC0mI5X961nDteMBjqVie5zw4xPkV
	 LXxkBXx/csmtg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EAB82609DA;
	Mon, 20 Dec 2021 15:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: Remove "spidev" nodes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001482595.10364.14782646906170344213.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 15:40:25 +0000
References: <20211217221232.3664417-1-robh@kernel.org>
In-Reply-To: <20211217221232.3664417-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Dec 2021 16:12:32 -0600 you wrote:
> "spidev" is not a real device, but a Linux implementation detail. It has
> never been documented either. The kernel has WARNed on the use of it for
> over 6 years. Time to remove its usage from the tree.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: Remove "spidev" nodes
    https://git.kernel.org/soc/soc/c/8a3804c030e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


