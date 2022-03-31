Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB1C433FE
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 22:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E870C340EE; Thu, 31 Mar 2022 22:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47A04C340ED;
	Thu, 31 Mar 2022 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648764611;
	bh=ILfIlaydyLH6x4dSDzrx+81+OwNypxAvU2sIO7Hdu/Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ot6nqdahmwuaGC95p8e/5gJbsXY0vM6+ZBWSY1/0zQ6HNCBEupXJuuxULUJkseksC
	 dYfPKhxhXRfj3y+rHFUrFMODYJXuQ3HgpW7P/Tpyi1oOqR8ackibiaNwdMV43Jhu8Y
	 wqLiIOSU/ytA/iFLVO7xrJQFYpthsdERP0aFEQqJy/uHMPHXYZYDtJghLDrrPMbw2f
	 Wff+V7ZMygCaXN6EzLbIq9mcMRrVutf50svDhLqPKKsZO/gjfffgLjjjpyacILFsm/
	 j8kt5SvYZZfeYYuwVSHz468SYcVcWWpFEGYCyzRYhpZB5X6TSDv0s/5jvjKcHLvAHa
	 ady2FKw3W+gXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 28AEBF0384A;
	Thu, 31 Mar 2022 22:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] DT updates for dma-names ordering checks
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164876461116.22027.17973004713760447010.git-patchwork-notify@kernel.org>
Date: Thu, 31 Mar 2022 22:10:11 +0000
References: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
In-Reply-To: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 26 Mar 2022 09:53:08 +0530 you wrote:
> This patchset attempts to fix DTs possessing dma ordering issues.
> The motivation of the series is taken from a discussion done before.
> Link: https://lore.kernel.org/linux-devicetree/20220323175920.93155-1-singh.kuldeep87k@gmail.com/
> 
> Just a quick summary for new visitors.
> There are few DTs which require dma ordering in order to resolve below
> 'make dtbs_check' issues and this patchset is in direction to fix that.
> dma-names:0: 'rx' was expected
> dma-names:0: 'tx' was expected
> 
> [...]

Here is the summary with links:
  - [1/4] ARM: dts: spear13xx: Update SPI dma properties
    https://git.kernel.org/soc/soc/c/31d3687d6017
  - [2/4] ARM: dts: spear1340: Update serial node properties
    https://git.kernel.org/soc/soc/c/583d6b006264
  - [3/4] arm64: dts: ls1043a: Update i2c dma properties
    https://git.kernel.org/soc/soc/c/aa4df840d1c5
  - [4/4] arm64: dts: ls1046a: Update i2c node dma properties
    https://git.kernel.org/soc/soc/c/eeeb4f1075d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


