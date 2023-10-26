Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2232EC25B6B
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA1ECC433CB; Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D03DBC433C8;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698339030;
	bh=1+0Xg4FjNjA9Bi7UEEg7A7AN8bo94Ec8K97cw6a+XtA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cX29AIe52ceO3ZK86I610LOdHXs12G1lAqYHEfds+IB8KaWOHM2hJB/puOTxQfKS4
	 RaJb4K3ChY967/HQwM79eFdqAnl1580Qd4qoZ7c1e0ZN8KzeEBVs8aY5JyCLJqHbE3
	 2cU3IaTGmQHue4+rzl4+kG/hgqhPCH/uEk+3ah/2UNgZ4OYANRO71diiCBSA7nyyl6
	 hWeB0zbSoasLGOBxpCYumyD8VlihEgNF6B/xKMIuS6OO75VFDTYX5+cSgaplV/dNXg
	 ouEjsP2bwP4PzcW46xEvhvLDLUOa3n1iVhMGO/gmHP5UFnQILASTi1q+zAI0kM0oJh
	 EUu5WF2lKQE+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE45AC3959F;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for
 OMAP{3,4,5}
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169833903077.20019.15328875692991691128.git-patchwork-notify@kernel.org>
Date: Thu, 26 Oct 2023 16:50:30 +0000
References: <20231025112136.3445-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20231025112136.3445-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Oct 2023 13:21:36 +0200 you wrote:
> Commit d2b310b0234c ("ARM: debug: Use generic 8250 debug_ll for omap2 and
> omap3/4/5 common uarts") adds address definitions of DEBUG_UART_PHYS for
> OMAP2, OMAP3, OMAP4 and OMAP5 in ./arch/arm/Kconfig.debug.
> 
> These definitions depend on DEBUG_OMAP{2,3,4,5}UART{1,2}; however, only
> DEBUG_OMAP2UART{1,2} are defined in ./arch/arm/Kconfig.debug, and
> DEBUG_OMAP{3,4,5}UART{1,2} are not defined. Hence, the script
> ./scripts/checkkconfigsymbols.py warns here on non-existing symbols.
> Simply reuse the config DEBUG_OMAP2UART{1,2}; there is no need to define
> separate config symbols for OMAP{3,4,5}. So, just delete the dead
> references to DEBUG_OMAP{3,4,5}UART{1,2}.
> 
> [...]

Here is the summary with links:
  - arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for OMAP{3,4,5}
    https://git.kernel.org/soc/soc/c/a9838799e2fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


