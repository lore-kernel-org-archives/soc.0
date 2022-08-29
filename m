Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C29BC0502C
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B4CCC433C1; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4329EC433D6;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661765893;
	bh=Q0sLXYuripcQOHEN1RTtZZx6Y9Mq3NsgeFe4kYuAOJA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kJWSzgL1nb2BBWGuuYjlfNzsDX6VqrurnKRqCWvc8wTuM6dR65QPz9xHLUcdC3H6b
	 jbrnrHYB8Uq6OXFnKQKcHit3nKAI0+rX60bkimjz/ax45qBAMF5SwQwI2ad1aplkHr
	 n8E+6+GNg+MRgRVtfi4cE2PAhsaSaLxlVjnKm08Sic2/Ez7bQMTczoggMMuNk4GkFJ
	 FcQ5g3e7P8FAUmgLoDvUbgVTG+C4ET5Uix+52xE9DEWBEILRJf4GtGApGdx4Eg38OY
	 0o6VEqiA+zOkvB7RVQLNAuIm2lO3+P29jRh0FvfccyIn2xKbNvtxJ4Xzu8Gr0gFORU
	 hs9d7eADFm9lw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25673E924D4;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176589314.19402.4701276992067256286.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 09:38:13 +0000
References: <20220823092631.GV149610@dragon>
In-Reply-To: <20220823092631.GV149610@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 23 Aug 2022 17:26:31 +0800 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.0
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.0
    https://git.kernel.org/soc/soc/c/a3bedd242099

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


