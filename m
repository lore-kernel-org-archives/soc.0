Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C51AC4167B
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13FB4C34606; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F094CC34608;
	Mon, 13 Dec 2021 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405229;
	bh=q8izwmBt9FVkOaNjaNju5TuIzvJJy2PgWw/EbvxXedU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MEl0Y4/o0a9uV9MhoApoPdmVpmDtO+gcZclLYSAHTB+sd8Qpi/PiWwKD2q9kcgGfD
	 WegvyL6NDv8KhOaZv431XJrmwBIwCojyJnJEpPaa2nhs0IhcW60JSCMRmXCmOfNlq4
	 ISmNYsUU+1obwbLt8HVZXQOjjWYdfuFu2zYqDffLICLiP9E2Revb+FYclI+cVY8TpT
	 NsrcCjrSHdQiCiP6qSWej7YSQcQO56Bj2bjWx0sucgOgagHgL1jPHXpaEvkaM9k1np
	 Gi1mHp5C/Zhs0vFmZYF0X2J4bKm8I/NLBdPrvFMQerpLvnjSTFPr+UH1b7RKcKD3M4
	 7sA6N3a8xLI6g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DC0AD609CD;
	Mon, 13 Dec 2021 14:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: fix for v5.16, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522889.6863.18058594772028264127.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 14:20:28 +0000
References: <20211203181007.3138381-1-dinguyen@kernel.org>
In-Reply-To: <20211203181007.3138381-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  3 Dec 2021 12:10:07 -0600 you wrote:
> Hi Arnd/Olof,
> 
> please pull in this DTS QSPI fix for v5.16.
> 
> Thanks,
> Dinh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: fix for v5.16, part 2
    https://git.kernel.org/soc/soc/c/ddae25ed97f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


