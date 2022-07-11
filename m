Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14BDCCA47B
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C52F1C341CF; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4F7EC34115;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657556427;
	bh=wA7eUe83gPEkE+xW/tjk/fy9EXSddjFtKFSa84g+X6k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eKKDRgaPaAECprH6XbzYLQgvu+YiCDVJyf66IYT3st532AK+bH3qKh9cnf0gGZp5t
	 ak3Ys2tklwltRHIyJYuLvcumqUH3uhCWHq+KYlh9Xv0o50khjdlBdcuzdOqTOMJxM9
	 zj9Ef7o3HDbTrMoOw5huE7BR2r9HWqvjxfITKIgOweDrx2sCYkPMv79UmHDMVAXfer
	 c/bKoKWusIPGRbKwagny3o7SPzPljtFRUpWMSCS3k6kY8OtkOk8IY3vDG1Grg/4rjN
	 cQhnzRwoEcW3w9DmqoX9I/+pFYjJwtjk8GUDRRd7PVBMElennW6WZaX2KOyGQEFW+h
	 CVG9HfsvW+ydg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 91961E4521F;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/7] NVIDIA Tegra changes for v5.20-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165755642759.9192.8915408544614669477.git-patchwork-notify@kernel.org>
Date: Mon, 11 Jul 2022 16:20:27 +0000
References: <20220708185608.676474-1-thierry.reding@gmail.com>
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  8 Jul 2022 20:56:01 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> here's a set of Tegra pull requests for v5.20-rc1.
> 
> One thing that I would very much have liked to include in this is the
> Multi-Gigabit Ethernet (MGBE) controller support for Tegra234. That's
> very important because it unlocks much broader coverage using our test
> farms and makes the devices generally a lot more useful. Unfortunately
> there were some unforeseen delays and I don't have a final Acked-by on
> the device tree bindings yet. I do expect that we'll finalize this in
> the next few days, though. If we do, would it be acceptable if I sent
> an update to two of these PRs (dt-bindings and arm64/dt) to enable this
> critical piece of functionality?
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] soc/tegra: Changes for v5.20-rc1
    (no matching commit)
  - [GIT,PULL,2/7] firmware: tegra: Changes for v5.20-rc1
    (no matching commit)
  - [GIT,PULL,3/7] dt-bindings: Changes for v5.20-rc1
    https://git.kernel.org/soc/soc/c/a41bf1aabd46
  - [GIT,PULL,4/7] memory: tegra: Changes for v5.20-rc1
    (no matching commit)
  - [GIT,PULL,5/7] ARM: tegra: Device tree changes for v5.20-rc1
    https://git.kernel.org/soc/soc/c/ed1646fe0232
  - [GIT,PULL,6/7] arm64: tegra: Device tree changes for v5.20-rc1
    https://git.kernel.org/soc/soc/c/c784744b0405
  - [GIT,PULL,7/7] arm64: tegra: Default configuration updates for v5.20-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


