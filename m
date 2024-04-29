Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBFBC04FFE
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EFF52C4AF1A; Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D94C8C4AF14;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408887;
	bh=HOtv2ghXw93NFF/6spPBVu2Jlu+yEoFnC4wC1SSjOFs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=L7xuYMXTSBvMlhutoqodfBX0ZFObU9zYiYekdX3IDLG/lw8Bg1Mt6f4O/cbwqGE8t
	 A7zf8kekepKckWh/rr4N85L0WFPMsCl5//QCHCDQX66JnDxUk0pW7qcVB9waihDnNc
	 Jh3pR1swvNUHaZ9z7Q6GsMXwqGoitrrL6rjEiQwU5pBh2E1UJd/a7LRxKtIlDApskC
	 cyb8Pl9al2PegwtBIWlK8HZhzGxan8soB1sZbbyim2DWWL2YqVvhFXXbz2lNXiyJPu
	 uFj0ra/dngEHECZKTnJgN025fBOZk9rKY3Ery2RLZ52+HC/9NTyu6CtoEvzHBMp7+d
	 6IbgkZZnGnKUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C5A1CC54BAA;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] soc/tegra: Changes for v6.10-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888780.20509.15119597585260853891.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:27 +0000
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Apr 2024 20:05:14 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] soc/tegra: Changes for v6.10-rc1
    (no matching commit)
  - [GIT,PULL,2/5] dt-bindings: Changes for v6.10-rc1
    https://git.kernel.org/soc/soc/c/83c9697436d1
  - [GIT,PULL,3/5] ARM: tegra: Changes for v6.10-rc1
    https://git.kernel.org/soc/soc/c/44923d845d3b
  - [GIT,PULL,4/5] arm64: tegra: Changes for v6.10-rc1
    https://git.kernel.org/soc/soc/c/d4c74f6b0253
  - [GIT,PULL,5/5] arm64: tegra: Default configuration updates for v6.10-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


