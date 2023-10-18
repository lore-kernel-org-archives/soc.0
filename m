Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA11CDB485
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20E08C433CB; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B13AC433C9;
	Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643634;
	bh=ZHTA4W9vcUQlfe/XKg1oziN+zpfrB57CMkG5VFQnS2w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Zxgw3kszkFCAj1k0/83zrZAMc5ZdULVP68axEI5i4Rnrp2NFBZZKKrj2OKaQjExAi
	 RZNz5StX9jDT3axs4FNlp+y7gw7aRYwdIAASQg5ItRqbgNPJea62N4cWhaYspkXLG9
	 1x9nFNBqfyBiB5MoM931TICvEOURDzQGXXH+F/vLqlEK2EQncojkqLIaLBOgKkei+2
	 A3svMzbArjk1h9VHVjezMQC3inJuwGSUona0MLa9zw5+7QGFFDdt7H4155jeM3NXHa
	 sZIFOCalcq42dzU0uwNirNPWNyrxKaiMmLDSKuT9aOopsnYDn4NzbnFye4LCDF/KHU
	 hz6KTv43sqR/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D85CFE00082;
	Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169764363388.8197.11319815514135929579.git-patchwork-notify@kernel.org>
Date: Wed, 18 Oct 2023 15:40:33 +0000
References: <1870252.CQOukoFCf9@phil>
In-Reply-To: <1870252.CQOukoFCf9@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 23:23:13 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> Rockchip changes for for 6.7 .
> 
> As always the 64bit DTS part is the big one, with some new boards and
> some more rk3588 peripherals.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.7
    https://git.kernel.org/soc/soc/c/70ea4e97902d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


