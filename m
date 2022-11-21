Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA3DC352A1
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE1ECC43150; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7BBDC43148;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=zOmK/9pecfClewKGOItFZnWxmCoaBinfQa77tzv6ngQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nMQxdGeAB25j1xSdYlYtuZrU2D0h//nUm4CbqYAT1vlsGpB+4pOtOAh/D4JN3KVhi
	 grkgcDZxIRUJdO+/S2W7/sUIyJgTlM29JenI88+7Rftz/4bZeI3Z5mKOfWsJqLHmbT
	 YJ6m5P4zog5XGmjd/NZcPoIhd7YzRdz9GIBUO2cnZeVgEj8B4y44oNYB2IKmKT+bfE
	 /lXOD/CcPR9GrP8MAdquVhjSMCM2UUCGzoak39MSeQ4yBnxUhEA24LqDFlkTS4MTiw
	 SHwfy5yrZlb9cnoXqLYahoc2332dQ1EJv2CzrI6hkJuKtu9JVmbEwUdyWxE92d+Ei1
	 CQM39zdiaAftQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9D4F8E4D016;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/8] soc/tegra: Changes for v6.2-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234364.4359.18242062186340781445.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 19 Nov 2022 02:20:18 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/8] soc/tegra: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,2/8] firmware: tegra: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,3/8] clk: tegra: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,4/8] dt-bindings: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,5/8] memory: tegra: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,6/8] ARM: tegra: Device tree changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,7/8] arm64: tegra: Device tree changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,8/8] arm64: tegra: Default configuration updates for v6.2-rc1
    https://git.kernel.org/soc/soc/c/4b7067ae9309

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


