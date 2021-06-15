Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19F9C48BE8
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 934EF60FE9; Tue, 15 Jun 2021 16:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D33561480;
	Tue, 15 Jun 2021 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772807;
	bh=L8M4guFqvod6PFZOgCZyIGEQXwcyXXp7tSMRGt39Eac=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=N5nUKi6WrsYQJieKBl0HZXOsgbLOwSMOnDVBpv1Cq9Sry0A34DzfJh2SV6NL8K8CB
	 ZanY6iMcAvfZlsP485S4vtK2vYXRNPqcSuYl9am8PHsOq8npeH3tWOFHfqIF0BJrNh
	 EuFK15MbAIIeS0kFrVCL1V3kU3BpwZnB74j8pSt7F0EP1DtixcMgvBS3ua/Z4iOOvy
	 gQqlVXTVsCpV7V2CbsJG8DjEusAfuRFBt3yiLRKq+5TDufMzxvIIRnF295CM94fWNM
	 /6yFqcQNH3UzTz7MBc4sXXq5MnTiIhSmcqMxAg+BDP1VHKWDeh/mhN8CVWrqAwkOXq
	 GjDlmsGzngNrg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 695F460A47;
	Tue, 15 Jun 2021 16:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ux500: Fix LED probing
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377280742.17464.9576651543462148768.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:07 +0000
References: <20210613123356.880933-1-linus.walleij@linaro.org>
In-Reply-To: <20210613123356.880933-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Sun, 13 Jun 2021 14:33:56 +0200 you wrote:
> The Ux500 HREF LEDs have not been probing properly for a
> while as this was introduce:
> 
>      ret = of_property_read_u32(np, "color", &led_color);
>      if (ret)
>              return ret;
> 
> [...]

Here is the summary with links:
  - ARM: dts: ux500: Fix LED probing
    https://git.kernel.org/soc/soc/c/7749510c459c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


