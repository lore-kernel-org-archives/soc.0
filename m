Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAB0C2FC20
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75D62C433C9; Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F92EC433C7;
	Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692276628;
	bh=HUUY12bnROW2hO7fDqGcOuRIAxNHsc9Fxu/JOnI69kk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=saldJXmBPsG8cvNYeSj+Ew7ro9zihV6gs+AxzPJPCqws0Bc8TK8rhmqqFdSjfIO69
	 neovBlmCwBjP4goE17xFwPQJDmwxMagJrnfQb2at54NkffJLzR38PJ7fFV8eSFqyqI
	 f9XQ6r2hVZuHemQB2IRzv0GHEoalR3fj9g7kTzvMxEADJx/mVcjreBXnEnYY2/lZ+W
	 3d0PqSd8ouF3xJDfLiTiW10nwVl967Ye8w6b+EywRJtEETpazYM3AAJWnzjT/zid/i
	 kOSKT3uLwGo3Otf5vsyfGdXc3yk7x3lsLRgMZXI+wJadjXm+O2NlylwyycvAAKukyD
	 ZclW/QtOT7+zw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4AC94C395C5;
	Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169227662829.28155.12729274354170941968.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 12:50:28 +0000
References: <4519945.8hzESeGDPO@phil>
In-Reply-To: <4519945.8hzESeGDPO@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Aug 2023 00:02:04 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.5
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.5
    https://git.kernel.org/soc/soc/c/e7c12167a294

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


