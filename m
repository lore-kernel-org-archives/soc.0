Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EF3C4167B
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A9F561244; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 741D6615E4;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=aPz/8EOOtkr9SNSPfMMdPHvOHlBYhz208Hgx2aHQi/c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hXevbyM3kS5sQew1l7DE9x/I/Uj/kctIKzoRFG3O3FWTurHFIWsZibLBWv6nk6AMc
	 gsfDnX7/9mM+QTgppj933w8GzFZa3aMkNmjsW3+XwIfJjj0wJkzo8BwPxJ9A8w1qlr
	 5DYru801RStBH7tratWHJBmxJaGyo8ubVSKCWpL4QDbodbOZ+JDpDpSFnT51+ZCLNI
	 LZRk3aAnIFZL3Hr/iozaPlbB2unxUPU1Osa1Y5wDe51I4sHmR9iwtH2+Epggmzyih/
	 Q+i6m+y09NUkbRBmmRz2erMY6B1Vj6pnjoyPQ4MrgHFnXTlnSTytFEIHUzPYxt+f+M
	 sS3PuUDxCO+wg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 68FBB60A0E;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: defconfig: gemini: Restore framebuffer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180942.2242.11927077161551733130.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20210922200933.1825752-1-linus.walleij@linaro.org>
In-Reply-To: <20210922200933.1825752-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 22 Sep 2021 22:09:33 +0200 you wrote:
> The framebuffer is gone on the D-Link DIR-685, restore it.
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC folks, please apply this directly for fixes.
> 
> [...]

Here is the summary with links:
  - ARM: defconfig: gemini: Restore framebuffer
    https://git.kernel.org/soc/soc/c/a6949059318a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


