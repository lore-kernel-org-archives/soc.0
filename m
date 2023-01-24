Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC29C61DA2
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF189C433B3; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7901C433AA;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=+ic1m51jJv1Q4kGLrta5589+eflaw1iykFNUUX1PRew=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=S4N11HwFbG3Ziu8YOZ23GxEVGOBJXH5Pbii5/jDT7S91pMDe6rhmAtQr6Wr1OcT12
	 iScz5VYXUMclFk/FZo7Rr6fTDwX9Y+35xBe/CeHNEMbdhATn1RIIltmGDJS686/MBq
	 0sGLtPStHIW9+On8vikU1+Y0wHws+07S8kP4bOHVMUbOHXHN1t5vICELC8Ryhyiljq
	 sTBZKOgWrTQe+CaDD8+1ApvwWTH9swTXgo1UqzDhROtI+PzzFb7xLD0IQfhB/siKF7
	 fXO8ejf2BsX8/ydT8SYc2uI9Bo4pTO6JeQoXDLPmG6B6FQylvAtTZVTcGcvGFd6glO
	 BIC/w334e9tMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC461E5256F;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: ep93xx: Convert to use descriptors for GPIO LEDs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588970.12731.741146141115993278.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <20230111132210.134478-1-linus.walleij@linaro.org>
In-Reply-To: <20230111132210.134478-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 11 Jan 2023 14:22:10 +0100 you wrote:
> This converts the EP93xx to use GPIO descriptors for the
> LEDs.
> 
> Cc: Nikita Shubin <nikita.shubin@maquefel.me>
> Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Cc: Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Lukasz Majewski <lukma@denx.de>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: ep93xx: Convert to use descriptors for GPIO LEDs
    https://git.kernel.org/soc/soc/c/91aa6280e308

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


