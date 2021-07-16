Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE38CC6379A
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4451C61415; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2772561411;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=33HqbirFnQBDj52BgxUy2b69VW+Na04EH+S0r95ioO4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=j4nEEEe7lf/BuWd+wpdE5xDNHNjUHK7781eKhJJgDHVjMntBY805w1zj+fSwiTNX9
	 nCLYNqGRidpdFtQRfFGMRaCMS73a8xBaGuq3V8/ieGKwFPWpQ2HckkGDD4bObaabHB
	 9aSSj4tn5XndXXJXnAmcmw+DttJPj3jl6/lvFFNbHzbeAul/P/feCWzVqPftfVerto
	 U3MQgJDq8ci+ZTjlo6466F83m+YehRCM3j+52bskzD+9ZDDtJaNzfOW4qsvs4ZKe+z
	 CEH6UueAx74KBlmBr5xoswv9hdLFPIHX9BN21YelawRyvOF1ZtFlYDJ2ZLFOnAM7VM
	 wy3BRhJlvnkiA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2122360963;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Update Versatile defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052613.25202.1546774357527383016.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:06 +0000
References: <20210714081819.139210-1-linus.walleij@linaro.org>
In-Reply-To: <20210714081819.139210-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 14 Jul 2021 10:18:19 +0200 you wrote:
> This updates the Versatile defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - The CONFIG_FB_MODE_HELPERS are not needed when using DRM
>   framebuffer emulation as DRM does.
> - The Acorn fonts are removed, the default framebuffer font
>   works fine. I don't know why this was selected in the first
>   place or how the Kconfig was altered so it was removed.
> 
> [...]

Here is the summary with links:
  - ARM: configs: Update Versatile defconfig
    https://git.kernel.org/soc/soc/c/850d8ec92735

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


