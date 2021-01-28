Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EA2C433E6
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 74E1964DDC; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5EBFB64DD9;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611844831;
	bh=tZv+oCaDGuCMaGR12IwmKVsZsfzJvNcD0x/42Jlkgdg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZQc+0l4AIUjVPXlZTE8YvVwIn1m6Y2m21xKfgKaE6cuGf0pSL6QkAnCcmtKXBmHTF
	 dDsFqL91RkRhV2BssIW8kAGbJ7YoDIuGHDV3j9D6+8LjV16K2FIsOd6ghDJ/ckAGvC
	 uwwOHX1UKOPc8+EjgEoMMP8Cvs+XC3hXbwQbsbe6KlTywgwhsyR9GL1ch5q/Yjhb5Z
	 dM9lQinEk0bjWiqT+y8ez7v8OSYkLlFRxl58MofaonyZL9L2ULG/Vfr4VUkm3g6j35
	 nksXrVVF9G9KloAXrwsGpQDfIuilF0yi6z5A6ZxbttHQsKUoEYMuxloNovsf9e5C3H
	 qVPAOI4mCx/QA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 416C860077;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161184483126.28855.2158643138502310659.git-patchwork-notify@kernel.org>
Date: Thu, 28 Jan 2021 14:40:31 +0000
References: <5429065.DvuYhMxLoT@phil>
In-Reply-To: <5429065.DvuYhMxLoT@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 28 Jan 2021 09:32:05 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below some Rockchip devicetree fixes for the 5.11 cycle.
> Please pull!
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.11
    https://git.kernel.org/soc/soc/c/f2d514b4f428

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


