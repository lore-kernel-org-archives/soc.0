Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922C0C32771
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 21:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 639F9C433D7; Mon, 26 Sep 2022 21:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DC0BC433B5;
	Mon, 26 Sep 2022 21:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664227815;
	bh=uYmAPru8sp8+gHi81t0YhYB8uGsTo92UDe4AiH4sodw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QKzv1if/cYu35xkKsuSSGdWDYyM1hCeE1ZRkdF1H9HMSY4qPx4+txrAMNwGYXZeXB
	 IPTGmKBozXPugwN0RpgEuqq+nKaawRzJXqH/o/QEHwtKzzct9UVaHBBOYDqS1dVrT7
	 qKXYpOdyXIQveHkmq4nbY7zIhUyx32w6iDaElqgPxw6qBpyZm+KN20Ys5CTRtGnN0+
	 jFQfdICnT54mXieo0mVIA60drYQ9CjhAlCM7PyaVEGQMkZEJyJBbLjyoIeXPddFMef
	 yJjWq//Ac/Mlvd6v7XRKlk4MCfXcx7QlsQRtlLGtxuJs8+rEPIXBB6uuVWcy6/UABx
	 8tSbFn7HGJMSQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A8F0E21EC2;
	Mon, 26 Sep 2022 21:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: dts: integrator: Fix DMA ranges
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166422781510.14888.13365795407264685901.git-patchwork-notify@kernel.org>
Date: Mon, 26 Sep 2022 21:30:15 +0000
References: <20220926073311.1610568-1-linus.walleij@linaro.org>
In-Reply-To: <20220926073311.1610568-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Sep 2022 09:33:11 +0200 you wrote:
> A recent change affecting the behaviour of phys_to_dma() to
> actually require the device tree ranges to work unmasked a
> bug in the Integrator DMA ranges.
> 
> The PL110 uses the CMA allocator to obtain coherent allocations
> from a dedicated 1MB video memory, leading to the following
> call chain:
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: integrator: Fix DMA ranges
    https://git.kernel.org/soc/soc/c/7bea67a99430

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


