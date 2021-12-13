Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523A3C4167E
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33206C34623; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CBEBC3460F;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405229;
	bh=M2Bt5/CajhH+rVarz6ozoObF2v65q8+Q9zhoFXAIFKk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=q44Hj22EmLGz0xDm61EUaW9Gt+uKahUCVPxxMr9xB4oDPvTlxxUMUcPSQKXHkB1Y2
	 p1o4ZK1BGxMDQE9hc4DyDGeaHao7boW0TOUzeZw2azUPiJ5YidajEsyKp5hwMJMQ2S
	 CH45jUQ5/lqfvkIN694bGfT5pVbF1cigw59tbhYqMgKtdYqtfn9V/yy4G6SeW6OLBU
	 +GhsYkeyG56KboFwbAp0PQ9pqJs2r75Mrua/39TtgcCfPhGBq3ipfVloJcTo6W3nF5
	 7a5Y8wOBht5/gFcIbxfNOHoVigSZAuIYcZOg9buN2hFsr2EGBcjeUtln3u8xEr/0TJ
	 cbFhDjK4/cT6A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 043F560A7D;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.16, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522901.6863.10262591097341928976.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 14:20:29 +0000
References: <20211211015625.GK4216@dragon>
In-Reply-To: <20211211015625.GK4216@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 11 Dec 2021 10:01:54 +0800 you wrote:
> The following changes since commit c88c5e461939a06ae769a01649d5c6b5a156f883:
> 
>   arm64: dts: ten64: remove redundant interrupt declaration for gpio-keys (2021-11-23 20:25:34 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.16-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.16, round 2
    https://git.kernel.org/soc/soc/c/e3c68ab17b5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


