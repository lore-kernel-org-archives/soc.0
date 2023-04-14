Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85C3C77B6E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84006C433A4; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68FE8C4339C;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=CH2eNufVHRWLHXYaMUuf2sOUujmHxr4Rsn58W0Rh384=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NWSI5ZBjZ+pmCWYaE0nWFrXSYGkuyouJi9OMCFAvng7YfyqU6TabgF48z8575dRQU
	 91d0Lk3lpGJPHISc72Ta4DaOkbUQhPQ9IWte/+Rdmy2QsiinnIIq9hmgplqrrGwUPm
	 BshXBGXRZUAvA+CksnPzBu5vC/6E1hJZ1oS2K+MAlnjaIER0Zn4DKt27OvKhzvM9wN
	 LxuN70hawtnjh0OoW+dytvcMMoSw3cnQ7mRWLDKh1qkdQ58FbdPQ+Z/KKEim3wUnSq
	 ubQtkk0oG2Z9hybzCVuCTjILYWw/TGpKrA5wG+9CllnQXoC7f3+ItQ8CgkqOewuk4e
	 f+oxIcl4aZ+sQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F631E29F41;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/7] ARM: tegra: Core changes for v6.4-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926332.30442.16735881968540352524.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <20230406124804.970394-1-thierry.reding@gmail.com>
In-Reply-To: <20230406124804.970394-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  6 Apr 2023 14:47:58 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] ARM: tegra: Core changes for v6.4-rc1
    (no matching commit)
  - [GIT,PULL,2/7] soc/tegra: Changes for v6.4-rc1
    (no matching commit)
  - [GIT,PULL,3/7] soc/tegra: Changes for v6.4-rc1
    (no matching commit)
  - [GIT,PULL,4/7] dt-bindings: Changes for v6.4-rc1
    https://git.kernel.org/soc/soc/c/065b3ec77f77
  - [GIT,PULL,5/7] ARM: tegra: Device tree changes for v6.4-rc1
    https://git.kernel.org/soc/soc/c/31e985a2c4e9
  - [GIT,PULL,6/7] arm64: tegra: Device tree changes for v6.4-rc1
    https://git.kernel.org/soc/soc/c/acda89d621df
  - [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v6.4-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


