Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9962EC6FA98
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 621BFC43157; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C956C43154;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=S9+O0aGAYoJehl+LCz1XSAnWy1CKoW0rPp+BjcgpwmE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dmR0IsYY6UFlm4Y7DBWqGY4IrZtbKFAozELsAbgJWSGlmEtryGT4Vp5tEKeJfjo9l
	 jnKM08LZwn9G9AGUv4IhhUz0AhPv2JPNaJjl5K3hZm7v8yS2u6FKdyJmND950VQDGS
	 nTqZr0m1/ci2ESBUdYabBRCmfiHVvphlX86AddxAGVFy1pe5/Hx2YcTlcYDrGLs4tN
	 JQVIWlvaoHgDNzSthgnlgut79vBhPtMqZzu16ttunFJ/lJUwq8P9NMmw4jhsbz8RY0
	 irZaBfIfHr7Ja+xGOpEo24Me6YN7kY+Lai9Vbx7otPwaLb/RItqPbR2bYSpM99svHl
	 k3gG3tfVJ/Etg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3A839E4D03B;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] HiSilicon driver updates for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002723.3905.12371097382138319941.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:27 +0000
References: <631FE463.6070701@hisilicon.com>
In-Reply-To: <631FE463.6070701@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Sep 2022 10:01:07 +0800 you wrote:
> Hi ARM-SoC team,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] HiSilicon driver updates for v6.1
    https://git.kernel.org/soc/soc/c/4cb59d5069f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


