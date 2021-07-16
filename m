Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21DFC63797
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 382A4613FB; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1E3BB6140E;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=iwZzFUsbuMaVDTJ2t6NM2kxWl+epVAbfTmyFgfJAQXw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kEqImHcTB5HIODTEKywbkO8tbscIMhUu60SXGG+3oo+54nBQhHqIBohZWjizB9uX5
	 jefcqO/Scj+MLnD6nMzayg2kI8kSUBIXVk1xzVAcU4u6w6/cD7hdtxVdhtSRytVgnf
	 9hbBm8kb26KQh66MU/8ysWTJ3fZu1HEloDC6QQ8v7Vtc4bpL3GKSH+20r93fKJmUZ3
	 WKEUUsgETsZTkcRrMmdmzGv1AKRY9LmV9z2rmp/ui/KdFtF5uD2SYabFKExNWN6pSi
	 Bxh9BvIe51moH0w54NZtIz4rgIFluxLK1UNcXbj6jYEwyyByb0s49bSPXJqgId4E+A
	 Sej6Dmc1R9kbQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 18D3460BD8;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Update RealView defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052609.25202.4590968871397351522.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:06 +0000
References: <20210714090040.182381-1-linus.walleij@linaro.org>
In-Reply-To: <20210714090040.182381-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 14 Jul 2021 11:00:40 +0200 you wrote:
> This updates the RealView defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - The CONFIG_FB_MODE_HELPERS are not needed when using DRM
>   framebuffer emulation as DRM does.
> - Drop two unused penguin logos.
> 
> [...]

Here is the summary with links:
  - ARM: configs: Update RealView defconfig
    https://git.kernel.org/soc/soc/c/56fa6e8a1844

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


