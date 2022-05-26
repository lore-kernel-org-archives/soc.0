Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B749C43217
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1823FC3411E; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA05FC34119;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576014;
	bh=yUErDc+4XLd8sUab+SFFV9Ox9hiEk+TSuHHa1Y1970w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZYpc7yBz1U51V1jYsXcIvq0AA6kVGvD9X+99sbzG2+SVxHxyVlsmSJTvdQSm4zLuH
	 9Mp0LRm7+78Qih0Ccb+PUd3fqHfzAKeG1ettviMK/uIAWEcsa6siTYMqlXBw+j3L/D
	 vaF1OBdgss0UZM7T/Q3qXvhT3BRfU4Zrb7VmWYZMs3ndBB2ipz92p5jaO46KOD7TC6
	 CPyhwFJryBwCIpHNKCwDR8RyA2o4IM9ZHgqTbUNemy+m6Uv2sRmC7F8z+FciB1IUoh
	 E6/YYjHrpEPKe9F5cPhHVbjjk/GTM3yu141oRXjqyoJQfh8FqTNzKRdoulAEgmeJ0j
	 eur15eIJV7MmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C76D6F03943;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 0/8] Introduce HPE GXP Architecture
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165357601381.28072.3127620534658024.git-patchwork-notify@kernel.org>
Date: Thu, 26 May 2022 14:40:13 +0000
References: <20220516163310.44842-1-nick.hawkins@hpe.com>
In-Reply-To: <20220516163310.44842-1-nick.hawkins@hpe.com>
To: Hawkins@ci.codeaurora.org, Nick <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 May 2022 11:33:10 -0500 you wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Changes since v7:
>  *Fixed comment format in watchdog driver
>  *Added the Acked-by tag to the device tree patch.
>  *Resubmitted the dt-bindings patches hpe,gxp and hpe,gxp-timer with
>   Reviewed-by tags from previous patch in descriptions to keep patchset
>   continuity for v8.
> Changes since v6:
>  *Resubmitted the dt-bindings patches hpe,gxp and hpe,gxp-timer with
>   Reviewed-by tags from previous patch in descriptions to keep patchset
>   continuity for v7.
>  *Fixed the subject on dt-binding patch:
>   dt-bindings: timer: hpe,gxp-timer: Creation to
>   dt-bindings: timer: hpe,gxp-timer: Add HPE GXP Timer and Watchdog
>  *Changed the following in MAINTAINERS:
>   arch/arm/boot/dts/hpe-bmc-dl360gen10.dts to arch/arm/boot/hpe-bmc*
>   arch/arm/boot/dts/hpe-gxp.dtsi to arch/arm/boot/dts/hpe-gxp*
>   arch/arm/mach-hpe/gxp.c to arch/arm/mach-hpe
>  *Changed cache register area length from 0xFFC to 0x1000 in hpe-gxp.dtsi
>  *Added space between "," in compatible list for the
>   hpe-bmc-dl360gen10.dts
>  *Added aliases, chosen, and memory to hpe-bmc-dl360gen10.dts
>  *Removed memory from hpe-gxp.dtsi
>  *Changed conditional statements around COMPILE_TEST and TIMER_OF if of
>   for GXP in clocksource Kconfig
>  *Changed commit description for watchdog driver where Adding became Add
>   and compliment became complement.
>  *Removed unused include files of_address.h and of_platform.h in gxp-wdt.c
>  *Fixed the max timeout on watchdog to be 655350 in gxp-wdt.c
>  *Changed time variable computations in gxp_wdt_set_timeout to be clear in
>   gxp-wdt.c
>  *Decreased reboot delay to 10ms from 100ms in gxp-wdt.c
>  *Added comment to explain why it is necessary to pass the base address
>   over a private interface from the timer driver in gxp-wdt.c
> 
> [...]

Here is the summary with links:
  - [v8,7/8] ARM: dts: Introduce HPE GXP Device tree
    https://git.kernel.org/soc/soc/c/53658de4fadb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


