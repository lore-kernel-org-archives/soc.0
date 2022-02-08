Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3618AC4167E
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E1B7C34107; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17D2CC34102;
	Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311579;
	bh=QbAikODIMOWlHICRx+4S5tdC58VrLpvCiBajnvV34Qg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nyasvTquHSmXmavQLi8/c8bm9ISStNkF0rZV86jLqJafbwtVA4AUjNowp9ZZPjMZc
	 iZz2K3SF5vPyOB/VMGnkKWsbrSnrw3tEWodOdHzyZ2Mge8hfvHI/wAzgfG/dekPzVI
	 Ai9fdNQ4CkSyQemVh6nCCj0VC5vjnU4lpnsbkKOYHLiguWQl/MqDkvkFj75P++JPUM
	 seW8EoUnW3hZ8mO1ulCeZFemMMTyIVS+xwSHCWS19RZ/cbrO/gLHUNw2RsfvjC6S9H
	 uOYFZtQDEoyGXlKSJHIEDhpBZi1JDJtn6253l0AhlN8v4Ks1XFkyDRVJR0kzYxtr55
	 4wAZAuoAS9G9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F122AE5D084;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: Fix boot regression on Skomer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157898.18327.3616544706630689074.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <20220205235312.446730-1-linus.walleij@linaro.org>
In-Reply-To: <20220205235312.446730-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  6 Feb 2022 00:53:12 +0100 you wrote:
> The signal routing on the Skomer board was incorrect making
> it impossible to mount root from the SD card. Fix this up.
> 
> Cc: stable@vger.kernel.org
> Cc: Stefan Hansson <newbyte@disroot.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: Fix boot regression on Skomer
    https://git.kernel.org/soc/soc/c/d9058d6a0e92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


