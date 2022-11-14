Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040B3C4167E
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC77CC4314B; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C55D3C43148;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439820;
	bh=g0DOfB2Jmk21662inHikpTGD6UY5JgA5KKsLeR/F/v0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gzP92QjT0UQp7MCGo9XwUhQZnV7aYxnW5KcefDDvaE2byH0n5kOKC49MaM+qIaK/m
	 3rY09LQLl1bph8BsQs/sZRm2vZwCtXtB64ROUbkHX1+P2YaMI1Kn8oEtfXpwqHVKHN
	 81z8jV0eVBWA3WjyBxsX6FGO8BfhxvWNXSus80a6WxVGzH36UL9244rjYJPXku8okT
	 eKdgdK+FJYafK6y50vwkq1f0wuihAbNj/t6GBAb1Ai1Ue7zpQ6imB1q/ovo8Iv9KW4
	 QUiRRzGYcFS+jyyuW5+eJGYOwl8SBytdsMCXhwFNzmzJL1TMD5axR6D/DSdccZXb/C
	 aZQ3nM/Dhw+mA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95385E50D98;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/6] Support new features to the SPEAr600
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843982060.12382.15540758517906659729.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 15:30:20 +0000
References: <20221102171012.49150-1-kory.maincent@bootlin.com>
In-Reply-To: <20221102171012.49150-1-kory.maincent@bootlin.com>
To: =?utf-8?q?K=C3=B6ry_Maincent_=3Ckory=2Emaincent=40bootlin=2Ecom=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  2 Nov 2022 18:10:04 +0100 you wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> This patches series adds two features of the SPEAr600 SOC:
> 
> - Enable the display controller
> 
> - Enable the SPI buses using the SSP controller
> 
> [...]

Here is the summary with links:
  - [v2,1/6] arm: configs: spear6xx: Refresh defconfig
    https://git.kernel.org/soc/soc/c/c39a9e731a1d
  - [v2,2/6] arm: dts: spear600: Fix clcd interrupt
    https://git.kernel.org/soc/soc/c/0336e2ce34e7
  - [v2,3/6] arm: configs: spear6xx: Enable PL110 display controller
    https://git.kernel.org/soc/soc/c/a6a714415eb9
  - [v2,4/6] clk: spear: Fix CLCD clock definition on SPEAr600
    (no matching commit)
  - [v2,5/6] arm: dts: spear600: Add ssp controller nodes
    https://git.kernel.org/soc/soc/c/3f6f5ee17918
  - [v2,6/6] clk: spear: Fix SSP clock definition on SPEAr600
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


