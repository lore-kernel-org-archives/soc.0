Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F98DC04E69
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 22:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 041DEC43395; Mon, 14 Aug 2023 22:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2B10C433CC;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692051635;
	bh=UMPl+sStSRTHuCLqQsqRT9fcXSiLeoKb6PTPszjPTcs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LW2k6rKRzo69R/z3qX22cK4vBJ/tvxxoZxsbPE2K5WwtvIzfVOy19snvL+nJCj9iS
	 fxN9bT6OYT+IbLOQh9UDAaNTu9LOrj0oIgU2pf0o6EWh5KuCi4F2q2qZonDlBGPxkt
	 vD2w0NSs6RuyNm7HlmbIchzHh6mIPNXPpoQeGJ1SFTtRvYzmDptc47DWb+CSyEucG1
	 XpBm9dmWfwYeJTJIW1opOTyhD4U7cuu/OZYiRcVnKY7MV3tkfY2JgByV2bDJDdG95L
	 nQhwVw4iek6+lWHH6XBtb86QMCFjS4c9QkJghO0XMqtv3JWNilmkyjdCdn/kr5Jrtc
	 aZTBWPUZYgpBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C19A1C395F3;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] i.MX drivers update for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169205163579.23017.9040913150619501090.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 22:20:35 +0000
References: <20230813133354.847010-1-shawnguo@kernel.org>
In-Reply-To: <20230813133354.847010-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 13 Aug 2023 21:33:49 +0800 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] i.MX drivers update for 6.6
    (no matching commit)
  - [GIT,PULL,2/6] i.MX SoC change for 6.6
    (no matching commit)
  - [GIT,PULL,3/6] i.MX dt-bindings update for 6.6
    https://git.kernel.org/soc/soc/c/1d9140d2af8b
  - [GIT,PULL,4/6] i.MX ARM device tree change for 6.6
    https://git.kernel.org/soc/soc/c/a5c3378290dd
  - [GIT,PULL,5/6] i.MX arm64 device tree chanage for 6.6
    https://git.kernel.org/soc/soc/c/f0df584ffad1
  - [GIT,PULL,6/6] i.MX defconfig change for 6.6
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


