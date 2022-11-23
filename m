Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B3BC4167D
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63D13C433D7; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D7E9C433D6;
	Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669206016;
	bh=AFGLmM2+Yg8WnZstrJPA3LYxTt2dX0fkBn7CYe9W+No=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kpIsZZO5uHR3yTtFeXdwLnyjdBYqipKogMwLdHeOyCEGrRuA54VJk08EYvmfLmr77
	 CkP+okzYifsEIbv6iZPiMnSI4u1hfT3p8ItnF0AHQZIFqXXnVScXH5Cld5N3MJ1+o6
	 NxV0vC9jOsMasdEpcyzQAXTLFXFYPhkW2nF5nMC9hsfahkOBO+IOSh1kzPzhD1r1wV
	 0InHE5uNYk4sgAzc70ROez1x3q/0M048fIc3aBcoRaKuBfHL9+avhOfs0P6Ul69jyk
	 ZVWe4zTTIanHjdZ38VnxRWf1zdA37rh8rZT52hs5uMMzzViZ+CA0tub7kJxrRdgNbJ
	 BRhzAU224L/yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22904C395C5;
	Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL V2 2/4] soc: ti: TI updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920601613.19495.14105339866516865896.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:20:16 +0000
References: <20221122223856.fwackjg7fbd5jcz7@wannabe>
In-Reply-To: <20221122223856.fwackjg7fbd5jcz7@wannabe>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 16:38:56 -0600 you wrote:
> Hi,
> 
> Please find the updated v2 pull request for TI SoC driver changes for v6.2-rc1
> below.
> 
> Main change since the first pull request[1] was to drop the regression
> patches as requested in [2]. Apologies on the last min update of the PR.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,V2,2/4] soc: ti: TI updates for v6.2
    https://git.kernel.org/soc/soc/c/a7a7c00cdcc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


