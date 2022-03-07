Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CF6C433FE
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 22:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B392C340F4; Mon,  7 Mar 2022 22:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A0EFC340E9;
	Mon,  7 Mar 2022 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646693410;
	bh=Pf5+YgyJVMmxAbP2xfD+xkBgnaG7rXqvMvluv0u4xtw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NqMswbHXMupztmIhOmT8V1NoDg6N9QNpTQSc1R0acJqbhIVsifYm2+Pz9CpbhEyhD
	 Yw52X77d01eFrHFtiDdPW307XJG9hIyaSFmlPygeET29ATxnrrkwdZMI1qCzZPQ1hx
	 7xjO2sHtm5sWdAGBvBwTqnhgAgph4CsbhTCN6/4cHbp3yMPixlOd6rf4LEuXuxStSd
	 YzS/TJPrj1uizCMexnW2ZVsArCZ7cDBUiU2uTbySaPFv964jPeILpwwEoDu+mfLcXL
	 K6UzcbwFiP/CeSa2UMqwjiBE9FZbi0btGp6iGVg2Xjj6TuvixhReNfQvrEUhAXovBA
	 nMgb7Y0ONQ46A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D4F2E6D3DE;
	Mon,  7 Mar 2022 22:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164669341024.30729.7361385879459188758.git-patchwork-notify@kernel.org>
Date: Mon, 07 Mar 2022 22:50:10 +0000
References: <20220307182120.2169598-1-thierry.reding@gmail.com>
In-Reply-To: <20220307182120.2169598-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Mar 2022 19:21:20 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 914ed1f56581f99094035f1cc989ab4498104e94:
> 
>   arm64: tegra: Add host1x hotflush reset on Tegra210 (2021-12-17 14:58:58 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: tegra: Device tree fixes for v5.17
    https://git.kernel.org/soc/soc/c/537c3757b4e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


