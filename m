Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6133EC6FA83
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B24AC43143; Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14A52C433C1;
	Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116418;
	bh=SzAH0+DRKb4xh+sFrTwiHdi64A7hBpFRe6tW9zOjfX8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nQL/5uSr2tOSqL2xxuXpfrRdlka60ou3vaweb3aiXHRdITy49gwamZQ10wZjQ3P5J
	 zJNtC8o/+fQC8aNHt0vwXjcAq5PPHX0XKHexlG7T2pggtay4hxVBMJ7+88vvfYI4/i
	 7iKPiaPksO7SW5wDS1sAV2Fn4uzpaiAgZspDJF7c+dWlmxJA505KAqTQ1Y4JLu9X/r
	 rGG7HNO6tfVNJXfpbKkmWVOFeEESNtfIRzmHUSXzWwWhtAtr/g/pQSJJJ7WeVNrKdH
	 DRIdcwW6QEiU8Fsj01eOjFNRXHe8GietrQiV00VEtQCI/JDa26WixqSI5UEYr1IhSw
	 7I61Gv/d8wwPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE5D4E924E8;
	Fri,  2 Sep 2022 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1 RESEND] soc: fsl: select FSL_GUTS driver for DPIO
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211641797.12856.14700760201274401613.git-patchwork-notify@kernel.org>
Date: Fri, 02 Sep 2022 11:00:17 +0000
References: <20220901052149.23873-2-matt@traverse.com.au>
In-Reply-To: <20220901052149.23873-2-matt@traverse.com.au>
To: Mathew McBride <matt@traverse.com.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  1 Sep 2022 05:21:49 +0000 you wrote:
> The soc/fsl/dpio driver will perform a soc_device_match()
> to determine the optimal cache settings for a given CPU core.
> 
> If FSL_GUTS is not enabled, this search will fail and
> the driver will not configure cache stashing for the given
> DPIO, and a string of "unknown SoC" messages will appear:
> 
> [...]

Here is the summary with links:
  - [1/1,RESEND] soc: fsl: select FSL_GUTS driver for DPIO
    https://git.kernel.org/soc/soc/c/9a472613f5bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


