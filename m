Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4EFC54E5E
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81E31C43330; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67358C433F1;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709708430;
	bh=94upTpdCpH2VQSpFPPYfrB1JbzL+W3JENdfNL187+PU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Xqui8X6oYRfWW2u34c4KPE2Ajkj52R/HJ+elNuzCrrnarhYhwJyfBtX58E4fLFwEG
	 wnLE9SXEpuMsXR3Sdb42MwPcahF1b5S5zJnMspJPEHvyMxdxCMIoFN7owdKuEOWM1M
	 zf5254xWLGXYv8husgFN47S/xtjoazHIY4n9IkI/ahz7jFgCujyWB5oSU07qmmNCdm
	 NDC58otl5pZLcDjTSsI/J8hffEPrZTs6JqwIb1UQoZMqcM6IJifPw9ebXx22YCKtcI
	 K3+awQlkWX6DQpw6fv5njtIgJPp+rBzXOf7H1oBoNiSFXXqjNY7ogaEX9/C/D8tiuy
	 D3+i2Vbb0BN3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 555D6D88F81;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170970843034.7525.5101798364040197489.git-patchwork-notify@kernel.org>
Date: Wed, 06 Mar 2024 07:00:30 +0000
References: <20240305-iodine-moneywise-53797ae9bf6e@spud>
In-Reply-To: <20240305-iodine-moneywise-53797ae9bf6e@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 5 Mar 2024 19:55:27 +0000 you wrote:
> Hey Arnd,
> 
> I'm a little late this time around, meant to send this before -rc8,
> but I ended up crashing my bike in the surprise bad weather we had
> here on Friday and didn't do anything for the weekend at all.
> 
> There's some binding stuff here that Uwe didn't want to take in PWM
> and then a follow-up patch that ended up in my tree because the original
> was not in his... I'm gonna try to avoid something like that happening
> again, I' prob just send that sort of thing via Rob in the future.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.9
    https://git.kernel.org/soc/soc/c/ee7dad0b8181

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


