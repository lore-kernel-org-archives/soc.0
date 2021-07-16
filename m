Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E74C63798
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2BD8F61412; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 15B6F6140C;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=4ITZaAzVBiFWEAWQIPt7DpbRNZm0VhTOMWIbOFxxzK8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=r3HnFxT/N2kuwh3aSQPAtoR3Y9O5GP+w8+hYBNQhXtaxhDkEHC0rDjCaX29SXyNDE
	 KFWulFFlwZ5PCTcHabIfk6NVF77jiY/924LMvjMassnvx3UAzQ4/W/rQMfpo0rq8OC
	 7VQoxcbv1GGRkU/3WD6Rk9cRDUuaWkRiz7AV8LFJ57KluWwUpBYRLOaEfsY5RvVUqC
	 OulStLT2ac3ChumAjjlN68mKsQpyow7WkwII+9wDIxHo3kxHMnSsrr0yGXNQfnl1oC
	 hOxQ6MXqVzCzyBoiHPUp9s5vNhWFfBxNr/teVNp4xG40eQ8KssX6jQrJGJMM+oF6R+
	 keUXYbKTsCdIQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 101FF60970;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Update Integrator defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052606.25202.6410122901114352071.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:06 +0000
References: <20210714122703.212609-1-linus.walleij@linaro.org>
In-Reply-To: <20210714122703.212609-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 14 Jul 2021 14:27:03 +0200 you wrote:
> This updates the Integrator defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - Drop the unused Matrox FB drivers that are only used with
>   specific PCI cards.
> 
> [...]

Here is the summary with links:
  - ARM: configs: Update Integrator defconfig
    https://git.kernel.org/soc/soc/c/2096d6feec83

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


