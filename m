Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C456C4332F
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 21:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA960C385B5; Fri,  6 May 2022 21:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D57FEC385A8;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651871422;
	bh=zPLazWJTknQrtn32OqBmz8HH47uZVA3QpPQ6bHq4xt4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kEcE0tr2ISePqj3UDPIzUdevg37QVl+cyYFN9HdzBBuRBCk4BJMJZlethCxKjW0TS
	 c7bmXc9KhByDus7QfJaAixu89COMUIX0orlXWVeaLmemiubFhQelUNGcl2MkBpjV82
	 zKu4aOPzUhlfNFfpCnWzcFWdcKnnZ5XmnZ8sVeSOOBMtlm7EDStrsMVGLDOiIHMJ35
	 8wBXtRo0n+TxxxDWeNJPlyGQErHN6mnyn4wvwXvg9ivPCTxlyakM9sHSGWfOU8cuWq
	 66fE9mO7Tf6clB8QcvMuxFYjji+zhllQ2bxp7oqJPkEuAq9aa6O3h7Nt8Oa8NEccUd
	 I0QqcCgbHDIkA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6B15F03929;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165187142274.4183.455641877681695019.git-patchwork-notify@kernel.org>
Date: Fri, 06 May 2022 21:10:22 +0000
References: <20220506085425.58270-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220506085425.58270-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 6 May 2022 10:54:25 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the changes for 5.19 which contains updates for all our
> defconfigs.
> One multi_v7_defconfig patch is also queued.
> Please pull.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: defconfig for 5.19
    https://git.kernel.org/soc/soc/c/a46be400e2c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


