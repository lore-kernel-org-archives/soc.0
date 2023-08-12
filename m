Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971E4C41513
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B668C433CA; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44337C433C7;
	Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691828596;
	bh=/bKZoDE7XOmvuRznlIM7VjTR+Bne0GaSPotK+N3/RNQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bblBmLSeveVZwZe9LZQWe0eGPyTPmvEP0806wOdOnC84meluOeJUxAKjtmi2UxgfL
	 Ve5KNCe17dRFHX+wKgwe6No5qh2xaCZZtRqTHzV0gnnjq6yqIwssjhpFFTSIME3PPY
	 5JpXyyrljsYFDqsDyzpsEjTVwfRuB7CRq6Kg2SraWta0CtuzywloD82N8DYdOXac3T
	 LXV2WthpX0V7CDT4sL9GcUIw1dd33P+X9TX5DDYuItapsKtgQIOXWr3hdDovPGz+95
	 7wiloHgYrTow7R2W+sytkLbhInoOe0oXcY1VFoGi3bvZaq8qBnPTQjM3ZoI2M1xGPj
	 IHdJMzJBRq9/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1ECB0C595D0;
	Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: integrator: fix PCI bus dtc warnings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169182859612.22229.1559473889662917570.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 08:23:16 +0000
References: <20230811-versatile-dts-v6-6-v1-1-d8cb9d1947ed@linaro.org>
In-Reply-To: <20230811-versatile-dts-v6-6-v1-1-d8cb9d1947ed@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Aug 2023 09:00:06 +0200 you wrote:
> From: Lin Yujun <linyujun809@huawei.com>
> 
> An warning is reported when allmodconfig is used to compile the kernel of the ARM architecture:
> 
> arch/arm/boot/dts/arm/integratorap.dts:161.22-206.4: Warning (pci_bridge): /pciv3@62000000: node name is not "pci" or "pcie"
> 
> Change the node name to pci to clear the build warning.
> 
> [...]

Here is the summary with links:
  - ARM: dts: integrator: fix PCI bus dtc warnings
    https://git.kernel.org/soc/soc/c/42ff49a1967a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


