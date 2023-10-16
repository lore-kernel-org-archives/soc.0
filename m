Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62363CDB48B
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C505C43215; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0690AC433A9;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=0UnEUFemqjL8YCfBB9A4AfAx0W9pLhyup5J0kKGNNRM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nXQZphC9vcheW/pubMbo0P7m0SQ+iRYFJWh9h+QGsKZ75AskQz++EVshjEnGK+dMu
	 /u6CBsPpaBp/GM+17nIFvV+eqlIMHYqwtE1waVnCelkehtnxvM+/krGcve27R/qi/C
	 qaUsP9NHVgB7HfboTssphvEeMBbNAraSTa4R3dxECHykk89p1vyiEGDAfyJCO+KEvL
	 oVAqX5OL39ZXC3oLwvLLMRu7LC3iuTnTqmtBorUrikFaNLzzk8zB4CZLvxgtXtQUet
	 x8KEDtV90pXNkMAkUABpbgb+pEtWteHzujIscAe2OQQGcN3vGRDtYE/XjZEkNh5KGd
	 aZOxbYGRSqb3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB5E9C595D0;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] soc/tegra: Changes for v6.7-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191789.22284.4127168616629044938.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Oct 2023 17:37:17 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] soc/tegra: Changes for v6.7-rc1
    https://git.kernel.org/soc/soc/c/024d4292e426
  - [GIT,PULL,2/6] firmware: tegra: Changes for v6.7-rc1
    https://git.kernel.org/soc/soc/c/9e6e423a3665
  - [GIT,PULL,3/6] dt-bindings: Changes for v6.7-rc1
    (no matching commit)
  - [GIT,PULL,4/6] memory: tegra: Changes for v6.7-rc1
    https://git.kernel.org/soc/soc/c/78aee16af9c8
  - [GIT,PULL,5/6] ARM: tegra: Device tree changes for v6.7-rc1
    (no matching commit)
  - [GIT,PULL,6/6] arm64: tegra: Device tree changes for v6.7-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


