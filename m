Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A37C433E9
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F25CD64F8E; Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DB5B964F86;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612286411;
	bh=OpddJJUW1qxXbCWlGRLBRZbonTYzcHMIiWBBKesC1Go=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ced1+9j1KoT7ClJoKoV6SwAlKI+TXNumRjkKT3YpcBzB4qhGdRMuvvfyCEaVxGC4h
	 r6JTRG+TMLSYy/aUIdP4+Lhn/fxVYzNfZn9bdAhIQWsMbdTrMUebmgMNHEraC6jrX6
	 mHTpzMJDcYhNC2/9Pcp4scrKEYO7yulrO9zPw2i7WKM9fVkR2NQGpmjDvGpk3RoVhH
	 6phMi9EU9aHXJJqb4kKEPtHesVhKM3f0SXK6pMycdI2b7y7TLHx5+0DMOmix54Sl0T
	 aZQAOmRkMG46+mGAUxkU20ucNh6TrLQlpza9w76nnjO7uY8aSq2r5OEFqJkmCheV9P
	 YmcvZHQlXGKpg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CB981609D9;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ux500: Add Flash LEDs to Samsung phones
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161228641183.5662.17819611939998632591.git-patchwork-notify@kernel.org>
Date: Tue, 02 Feb 2021 17:20:11 +0000
References: <20210201091308.284465-1-linus.walleij@linaro.org>
In-Reply-To: <20210201091308.284465-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Mon,  1 Feb 2021 10:13:08 +0100 you wrote:
> This adds the Richtek RT8515 Flash LED to the Golden,
> Skomer and Janice device trees.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC folks: please merge this on the appropriate branch for
> v5.12, we got this driver and bindings merged so it's nice
> to add this support in the next merge window.
> 
> [...]

Here is the summary with links:
  - ARM: dts: ux500: Add Flash LEDs to Samsung phones
    https://git.kernel.org/soc/soc/c/e9cb878ec238

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


