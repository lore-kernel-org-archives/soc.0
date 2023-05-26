Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333B4C77B73
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4D30C4339E; Fri, 26 May 2023 11:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEC36C4339B;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685101827;
	bh=vGcECz2cUcSGPtOc628c3Xkxzqn94zQHLkodK6Xv5Hw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=R3WsTZrL4TT7RUhAF2mbL9nNs95XL3b9+1n055chrwqQX6ETz1xvFhJfT/zsyN182
	 M3OH0ax9qJu8HmtL6ss/2Upv5+h2XIq3VmkmTPW+4Pm/W8Dqfj6hHhT2/7J4JrdaRP
	 bbezHhB06T5LHtnmUbI3LB5VWzG7UxSS0NdenSlviYekeywSqTGqL+zc1pMeEPERaY
	 txZ7wCV/mPvhR6iu+ux+UrMuciiLx6UEOSTfhDF+laHMZH4HyE/7KoH9dn1AZlO+V0
	 BxXMSbR3xHAnMX7q9pLiWoWDUXXj8AxLip5B7NlBp56ORLs8AdIgQu+ZI+YidDkQl6
	 5iZ0OIK4QAhmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A6371E270C2;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/13] ARM: SoC: address -Wmissing-prototype warnings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168510182767.28560.13275711874607455114.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 11:50:27 +0000
References: <20230516153109.514251-1-arnd@kernel.org>
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 16 May 2023 17:30:56 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is part of a longer series of patches to address all -Wmissing-prototype
> warnings. I would like to take these through the soc tree directly, but
> if anyone wants to first apply a patch to their platform specific tree,
> I'll drop that one. See the Link below for more background.
> 
> [...]

Here is the summary with links:
  - [01/13] ARM: davinci: fix davinci_cpufreq_init() declaration
    https://git.kernel.org/soc/soc/c/30955b4afc2b
  - [02/13] ARM: ep93xx: fix missing-prototype warnings
    https://git.kernel.org/soc/soc/c/419013740ea1
  - [03/13] ARM: highbank: add missing include
    https://git.kernel.org/soc/soc/c/774f60dd6abc
  - [04/13] ARM: imx: add missing include
    https://git.kernel.org/soc/soc/c/5692520a040b
  - [05/13] ARM: imx: remove unused mx25_revision()
    (no matching commit)
  - [06/13] ARM: lpc32xx: add missing include
    https://git.kernel.org/soc/soc/c/ecd2a5769d09
  - [07/13] ARM: omap1: add missing include
    https://git.kernel.org/soc/soc/c/94c1c0a29bfc
  - [08/13] ARM: omap2: fix missing tick_broadcast() prototype
    https://git.kernel.org/soc/soc/c/861bc1d2886d
  - [09/13] ARM: orion5x: fix d2net gpio initialization
    https://git.kernel.org/soc/soc/c/f8ef12339394
  - [10/13] ARM: pxa: fix missing-prototypes warnings
    https://git.kernel.org/soc/soc/c/a9ae9c526cc2
  - [11/13] ARM: sa1100: address missing prototype warnings
    https://git.kernel.org/soc/soc/c/6475f4bb3fbd
  - [12/13] ARM: spear: include "pl080.h" for pl080_get_signal() prototype
    https://git.kernel.org/soc/soc/c/5e40c79a513b
  - [13/13] ARM: versatile: mark mmc_status() static
    https://git.kernel.org/soc/soc/c/88813f05b834

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


