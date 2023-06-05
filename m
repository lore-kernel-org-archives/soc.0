Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B9C7EE2C
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AAEECC433AA; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F878C4339B;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980254;
	bh=mE0UKYl2Um3TxuGNld9gf7azmAFiO+N9qMuJHTh6S1s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Z7FL/nl7Ht2gA+1DASiBj1CTvU+QxRTkItPu7Oyqls+YCHnJmWdaIUu0rQUQhjGWZ
	 xnU+/GkJOUDo4eKDxcqzBgTrpndC9zttFXlpDj7wcjDzGscg7z1hl+C6xmcybnJBON
	 4KEuNuFz5nzK0ZxeJ/V8GTlrrgms2ZhJNPrpHHbJjE105SZ9IS34VrFIBG39LjJFzZ
	 zRrdhzKK8ItXXeAoDVjS0eb8tNpLKAmpAFG6LrlFhj+I2H6AKw2/ERd7Z85PjBjkZb
	 Ib4e2/S98Uu9KpQfZjpq0o9LYyoA/9k0yy8T8aCep8jewYOnBG5ZspPbAEIkZCFI+Z
	 6d6gM5XGVgbTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A669E4F0A6;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v13 00/10] Introduce Nuvoton ma35d1 SoC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598025449.10098.5010316026145887768.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:54 +0000
References: <20230605040749.67964-1-ychuang570808@gmail.com>
In-Reply-To: <20230605040749.67964-1-ychuang570808@gmail.com>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 Jun 2023 04:07:39 +0000 you wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> This patchset adds initial support for the Nuvoton ma35d1 SoC, including
> initial device tree, clock driver, reset driver, and serial driver.
> 
> This patchset cover letter is based from the initial support for Nuvoton
> ma35d1 to keep tracking the version history.
> 
> [...]

Here is the summary with links:
  - [v13,01/10] arm64: Kconfig.platforms: Add config for Nuvoton MA35 platform
    https://git.kernel.org/soc/soc/c/64b88e9ff6c5
  - [v13,02/10] arm64: defconfig: Add support for Nuvoton MA35 family SoCs
    https://git.kernel.org/soc/soc/c/4cc2272447b8
  - [v13,03/10] dt-bindings: clock: nuvoton: add binding for ma35d1 clock controller
    https://git.kernel.org/soc/soc/c/2f8b5eb589cb
  - [v13,04/10] dt-bindings: reset: nuvoton: Document ma35d1 reset control
    https://git.kernel.org/soc/soc/c/476650a64b6b
  - [v13,05/10] dt-bindings: arm: Add initial bindings for Nuvoton platform
    https://git.kernel.org/soc/soc/c/0545810f7eda
  - [v13,06/10] dt-bindings: serial: Document ma35d1 uart controller
    https://git.kernel.org/soc/soc/c/15b53677e786
  - [v13,07/10] arm64: dts: nuvoton: Add initial ma35d1 device tree
    https://git.kernel.org/soc/soc/c/b69af0984732
  - [v13,08/10] clk: nuvoton: Add clock driver for ma35d1 clock controller
    https://git.kernel.org/soc/soc/c/691521a367cf
  - [v13,09/10] reset: Add Nuvoton ma35d1 reset driver support
    https://git.kernel.org/soc/soc/c/e4bb55d6ccf0
  - [v13,10/10] tty: serial: Add Nuvoton ma35d1 serial driver support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


