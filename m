Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA407C6FA97
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE6AAC43150; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9639DC43149;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=NHst8L9sP0EiUAgpE7jFfRzWH4gva4lrsOhdI8F6gYM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NWJyLNuJzFGcPXEu1L/bQ/69jxvNWjK+j00gAALN4mRU8npVorFcYnm+At6cKx00C
	 SfwUPIz77qOszv2t/pnR+uncSrZKgpyGgqmpZj1jkP3BmLlIXHU2Hq0Sib4m38R8G/
	 ts3Nm10PrgkzKEEJdODudjW621WWWBTiUmets+zLROlqjcG9+JatJTJU9KRmsKMFA5
	 QI/JlREEOuqtFpzqUxB22Ej+Dd8SGpbb9PZBTu2CChVbl2HNZH5HX8PDOf5UXBP9H/
	 pHCePZZkfufbHASJts3AgVEQ5yf9s3dAJ9UzO03EthKCMKhEZPNmieEzYZZPjYAKOy
	 QPvsCeVQNK2Gw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84F64E4D01B;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 6.1 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882954.18494.5507175406982948772.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <3790767.LM0AJKV5NW@phil>
In-Reply-To: <3790767.LM0AJKV5NW@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Sep 2022 21:00:24 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> I was somehow expecting more driver-stuff so while this
> could've also lived in the dts branch, I put it in the driver
> one, hence the separate pull.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 6.1 #2
    https://git.kernel.org/soc/soc/c/f8acc844c9ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


