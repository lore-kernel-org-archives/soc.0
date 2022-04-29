Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F20EC4332F
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEA05C385B0; Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7AD8C385AE;
	Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651267811;
	bh=F8YhYWd0QNkt9RX6QtDrOEoCbzHSvCcyidH9c14nFnA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jUwjHGSxu9MWg/lVxlmUJYMA+WxzwOKC1AIOvXqZ2K/tUSzwMZ8kJCf/ZekT7eXhD
	 m7KA+KI7MHOKci+PKH8dhOleF8j0ZVH8ilTBgqxWGM9uJC59IOkqvRM3Ua1UTaF/Ik
	 xkXhQNeiRJqf0LWfr4jZOZSuwsP2FPBbecEfhOosOkggyXApSRQYDR8vdUGF67JvMU
	 ZVNZAlsB3B9I4H6ZGK8xbPyaS+pv9ZqiQ1RUoZj3k4eORsOnLSavWAy0BAumWKrMpe
	 eg49DytosKcc0eN0G8L47BjcL8679Q3vpDuwu0iLgKLgl8efzh2IBDYgpRbxRmL2Ee
	 QssR6aolkBtmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90C09EAC09C;
	Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.18, 2nd round
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165126781158.28372.10029245187327484014.git-patchwork-notify@kernel.org>
Date: Fri, 29 Apr 2022 21:30:11 +0000
References: <20220426013427.GB14615@dragon>
In-Reply-To: <20220426013427.GB14615@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 Apr 2022 09:34:27 +0800 you wrote:
> The following changes since commit f571e9c9aafed2fbd60fd99aa4b9823221338b98:
> 
>   arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes (2022-04-11 09:38:07 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.18-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.18, 2nd round
    https://git.kernel.org/soc/soc/c/73c7bcdcfddc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


