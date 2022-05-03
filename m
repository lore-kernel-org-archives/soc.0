Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5533CC433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EE30C385B9; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28C74C385B7;
	Tue,  3 May 2022 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651589422;
	bh=i8S/GamZPIRojBXndZSSy4IZtQgtCikKKNSFAt/bpl0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tuODvFR2tSObaPlb3EQFogwMx6wv6M6n2TBMZch5Y6Wlwm5n9kVurqPOfm/0lDuJ3
	 q2uHA6vMh765HrZnxL5oi4780cH5SeteWIw8daDJPm0S49JnudaWd5hIiJBxojOePy
	 c/vBqc79KuZjGilmoHgxdhT5RJ89CZJ3A+pKQUPSK6qsqIvRHZZ4utKODoU4MzdbJo
	 m4jmwHHONcNGaJQE8oPD3ASq8e5brSXPIq4s9FwHj/Ci1h6pfLtp9amoPryfK2/e7r
	 iPWWw5g7c9G1+S0BGgk+awsN6KaGGUeCcRehFr530H8eEs5bjYw2B+KWpt69FLKlS+
	 X6T+d+QQbLbyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13546F03874;
	Tue,  3 May 2022 14:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: nomadik: drop selecting obsolete
 CLKSRC_NOMADIK_MTU_SCHED_CLOCK
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158942207.22061.17053077080501799095.git-patchwork-notify@kernel.org>
Date: Tue, 03 May 2022 14:50:22 +0000
References: <20220410145623.2620380-1-linus.walleij@linaro.org>
In-Reply-To: <20220410145623.2620380-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 10 Apr 2022 16:56:23 +0200 you wrote:
> From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Commit 85b6fcadcf66 ("clocksource/drivers/ux500: Drop Ux500 custom
> SCHED_CLOCK") removes a sched_clock workaround and its corresponding
> config CLKSRC_NOMADIK_MTU_SCHED_CLOCK. Since then, selecting
> CLKSRC_NOMADIK_MTU_SCHED_CLOCK in ./arch/arm/mach-nomadik/Kconfig has no
> effect and ./scripts/checkkconfigsymbols.py warns:
> 
> [...]

Here is the summary with links:
  - arm: nomadik: drop selecting obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK
    https://git.kernel.org/soc/soc/c/2b65c1162ade

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


