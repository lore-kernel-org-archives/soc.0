Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C63C43334
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7698FC341C8; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58B01C341C0;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657661420;
	bh=/bPrJIcm7bQpxa0lDHCYzdk0nP/tcp081lymzPNkx/g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YOfflownaHmRDKWoylWeZCXpPUx2fuPmA8s5cdfImrQTfAiiLztaqUtRUDSkSRyrj
	 K9wK4Rek/O5PTcVBTmVfR7NMweh+8Voz078Tk0inDImKW68i1FnE3tAwDpOlu9tZIT
	 xCUH5Fqp53C5MwmdrMtiQLdQvWghnzf692wiQXinPz6rWjpiizSbOW13qEhXT/iRUK
	 4YpZK03ODe0De9k43kXVAg3PSj6xkdDyqbki3L9mjMMdlY4v+QGWOjIzscD6GPfdjz
	 6KDbvbYtpqftGJqsqzGjHFC+36sx1Xy2W6jhFxT39tw1JFAfr3BW1PIfzgaO3zwd2+
	 Jh4urqrssnTOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3CBAAE4522F;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/7] NVIDIA Tegra changes for v5.20-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165766142024.32298.19083505402787590.git-patchwork-notify@kernel.org>
Date: Tue, 12 Jul 2022 21:30:20 +0000
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
    https://git.kernel.org/soc/soc/c/933edcde4383
  - [GIT,PULL,3/7] dt-bindings: Changes for v5.20-rc1
    (no matching commit)
  - [GIT,PULL,4/7] memory: tegra: Changes for v5.20-rc1
    https://git.kernel.org/soc/soc/c/f10c00ae8628
  - [GIT,PULL,5/7] ARM: tegra: Device tree changes for v5.20-rc1
    (no matching commit)
  - [GIT,PULL,6/7] arm64: tegra: Device tree changes for v5.20-rc1
    (no matching commit)
  - [GIT,PULL,7/7] arm64: tegra: Default configuration updates for v5.20-rc1
    https://git.kernel.org/soc/soc/c/8c1541b161a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


