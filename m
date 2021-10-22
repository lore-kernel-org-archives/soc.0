Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC96C433FE
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EE38661208; Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D1ED46112F;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634933408;
	bh=Iruy+doQ5lUW0xU5nbuo20kWVmmdN4Ma2jP674DLTR4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SZDmMOdap54+e4MBHMksYqwQultc7bALNz/wXITNVOcszUa8/f1dj1kTH/dEOSniV
	 NcETZquzMafLmCoyVeXDLQWBcPE8X8mlpBLeIw7YhQg8d74rQ5E5rGd16RV8mTju2m
	 FtCK9TR+YpbqXJv+kSG6xqADNWB+PFNApvgCWAgqKHxZ7USqzT8JOMNw6SjwsYUE9l
	 eq6d2eAz6NkvZlEnsHQAdOcgiefnPZ7uyWa+ML1PCq80Gp2YWOf/wSXlayLnNzVqw6
	 V50zSWymlMMfVHHH8drsoZLgDpowUa9gD0rckB3tLCYrwLOxhrFYVzZ3SBOk6H3QHh
	 q4TwcucM4tYWw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C255F609E7;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: dts: spear13xx: Drop malformed 'interrupt-map' on PCI
 nodes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163493340879.6553.8861360562149569883.git-patchwork-notify@kernel.org>
Date: Fri, 22 Oct 2021 20:10:08 +0000
References: <20211022141156.2592221-1-robh@kernel.org>
In-Reply-To: <20211022141156.2592221-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 22 Oct 2021 09:11:56 -0500 you wrote:
> The spear13xx PCI 'interrupt-map' property is not parse-able.
> '#interrupt-cells' is missing and there are 3 #address-cells. Based on the
> driver, the only supported interrupt is for MSI. Therefore, 'interrupt-map'
> is not needed.
> 
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: spear13xx: Drop malformed 'interrupt-map' on PCI nodes
    https://git.kernel.org/soc/soc/c/5cbd84300b3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


