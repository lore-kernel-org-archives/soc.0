Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060F8C87FDC
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF4B2C43442; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3ABDC433AC;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316227;
	bh=SyFcRTfiEYjpZBH463KyezPgd8yOZDXqtxQax+zpo9M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TwwwkzEEiePHbTB40w0BZ+2dyWcSVVqbOc6sCqsjwdCL3FFJocoql1BCRWfwQXFEH
	 mkc5MqlzCkrwt/oGOnqSf8mRCe7EYYd5hYlHKoSz0v16enuT7Fb2T3OD7aly7Xf0Lq
	 ZoAlpTWSO984iYw2/iewY6Ak+MsQdJ2S+/lPFvGg9A4tQIfRk3Ac8W6Z/K8eYCFv4/
	 Z7q7Xuu1jk+UQ58SyvU1ZFm3TvQGj8lwVYMzX5cN8kZHsowd1gxLlvm6AcDavfNMb/
	 w/ROJPihuS0/7V2kukiFnFVvk45S7JhjbualZ1G0gaK+OS7UjI1SPTqeTayb5u6LP9
	 2k3zNADoQV/kA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE09EC43143;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622770.816.9048011725093399289.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <37e5de2f-47f1-a3f3-f1e4-4a304192e556@linaro.org>
In-Reply-To: <37e5de2f-47f1-a3f3-f1e4-4a304192e556@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 Jun 2023 10:21:24 +0200 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changeset for v6.5 with only:
> - initial DT for Amlogic C4 SoC based AW409
> - missing cache properties
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.5
    https://git.kernel.org/soc/soc/c/1b84450ef02c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


