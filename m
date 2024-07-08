Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2797C3271E
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6491C4AF0E; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90579C4AF0F;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468245;
	bh=HBSNQzGn8YszsqjgqfcjpgRovIxU4Y6r3DhLksot+K0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QLWZPqw9QYiggurTabB8e/9Bp41n2let1H4bW2ZY+v0UlXwP09aLPOD/jrK881jdN
	 sl+LN7FHD9yJxxkUCpTyLwbvC6raEwgFcI1gMNtvFPEFmw7FQr8byv0ZYECJqom6+z
	 soKi0pKIrRZ62ufMn2ScyH+Ybth/FWxcwFjQZId8dgP+zKCV/nR+14OZswszGhQ9XJ
	 X68w/p6DFW/YwvPn3b2sQbgXEFrxlqvqD4lZu7xSAKU5YR91THiurcvV8Xxty5/xvV
	 Qk7OGSiRcoXpyuweH34WnGt09VXmby+CYa7kqc1vOcHd3Qr7pYM/y3c0nFlX4jRkJe
	 or3vKJyj9xvyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84552DF3717;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 defconfig updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172046824553.24660.3648012365219480097.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 19:50:45 +0000
References: <20240629173634.664081-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240629173634.664081-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 29 Jun 2024 20:36:34 +0300 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 defconfig updates for v6.11
    https://git.kernel.org/soc/soc/c/95b5b10f0393

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


