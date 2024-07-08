Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D303C3DA4B
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2B48C4AF18; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBCE4C4AF13;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451507;
	bh=KDjPj0v3+qg/PHLybCOh4gylFkf6MK03nZN66uu5KGk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Bn+C0iFYbvlX4E+73i/sWc/qDNTER13gqGdOrYH8iLhaK7zLUiOSkUAlMyTwzGaOk
	 HtylHjcwj2nkyHwvcl/Smyut4tWXwpVIxpr8gTXmoxFOozPebEjCuPClL7aw6kf/Df
	 MKmKUHfbxyix3PeFDD3FnETC73dItQdzWUA7cG+XLmmK3L8Il5z1EdwNyimzbkc4bu
	 Q093lDbtpQJSB9RofuawiCxYk9QSg2LDn4/43m502OsydTbCXkx2dQ+4Jclh87WeY9
	 JXIpMyX7XOV3eItOnQ6i45w3CmB/NZV8ygZbVxbu9LTdY/KZ7/8gBCN+cG3NSWzzHm
	 f5PLu02V1DdbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C087EDF3719;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: various cleanup for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150778.17395.337949785522269673.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240702065359.7378-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240702065359.7378-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  2 Jul 2024 08:53:57 +0200 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: various cleanup for v6.11
    https://git.kernel.org/soc/soc/c/90a4146de8f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


