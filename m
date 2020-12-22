Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84041C433E0
	for <soc@archiver.kernel.org>; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3789123103; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1FE8B23105;
	Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608656407;
	bh=0z2kOrJWmp4rwTVzTO7e+cRY6gOg+s5KPTJupRJCwbU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rjsWLmysKWz5xoDtQhwYneRX4jxCOuilCBa2oomnniXpT270bPO/FmVe/vxjegnlS
	 71uYUraaJaULZ7PWlwzwxi2q/d5peKi/W+OkGGlH18GeXjfXXUu/lLngVgNyRNnXal
	 MN4PD0h5WggrUItqlTUUh/IsEIpNCoimUj7QudFcDX6lUDwnxhcr499XEoxQtPMGpZ
	 5vGomL8lm5zjbpdrQ7kr3Mfuyj/zVKjpHZUgT5kyDWzXidvTP3bzFUISHAe9Ord0o6
	 Nhpcwdz4+wp1cofCiBuWdUaXL9w84QXHj6wF/UaLE51b9INfoyp1mDUWEW7DAr+arW
	 Pv+Ht8wRAcCsA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 1030D6019C;
	Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ux500/golden: Set display max brightness
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160865640706.31426.9253439790508104050.git-patchwork-notify@kernel.org>
Date: Tue, 22 Dec 2020 17:00:07 +0000
References: <20201214223413.253893-1-linus.walleij@linaro.org>
In-Reply-To: <20201214223413.253893-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Mon, 14 Dec 2020 23:34:13 +0100 you wrote:
> A too high brightness by default (default is max) makes the
> screen go blank. Set this to 15 as in the Vendor tree.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC folks: this is a plain regression fix, please apply
> it directly for fixes.
> 
> [...]

Here is the summary with links:
  - ARM: dts: ux500/golden: Set display max brightness
    https://git.kernel.org/soc/soc/c/f012afb6af3d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


