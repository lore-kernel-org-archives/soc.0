Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E77C5478B
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30F83C43141; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AA35C433B2;
	Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463502;
	bh=2vDql4w8KriQybwh1S9NXq12SJVGSKV+CuUPNBltFNA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gG2bZLV4s6zRgM0pyAx8zJQW+9efwP9tZoE8hj19QwxL4LNjMAEnQDbu6gDzenjO5
	 WCIYduZSaLKLw/q34vrpB5YWEYF2+zT+QT2Zp+WAvCcvgODZvjC5rjeTc4yLO39UYo
	 QWDFc4rWImNIxr4Eb089HUyvzK2nemiMbf18FAftTpvDpGAg+/5lHb0PT4WAflWczl
	 5811wOOj8ZtYAlTk5JPCizUUJ2gkJxyiytUIwKdjSOuu1dseKmvdSmSe55oJ/8EPzU
	 66COpznlGNysG7TQfekltO/tjLneEGsOYdGnPSFnDx5sFqvuLbNRfMZjDCUAPYI+U+
	 f/949dC01NluQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 04804D84BC0;
	Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: ep93xx: Add terminator to gpiod_lookup_table
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846350201.4365.18389489056883543482.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:11:42 +0000
References: <20240205102337.439002-1-alexander.sverdlin@gmail.com>
In-Reply-To: <20240205102337.439002-1-alexander.sverdlin@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 Feb 2024 11:23:34 +0100 you wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Without the terminator, if a con_id is passed to gpio_find() that
> does not exist in the lookup table the function will not stop looping
> correctly, and eventually cause an oops.
> 
> Cc: stable@vger.kernel.org
> Fixes: b2e63555592f ("i2c: gpio: Convert to use descriptors")
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> [...]

Here is the summary with links:
  - ARM: ep93xx: Add terminator to gpiod_lookup_table
    https://git.kernel.org/soc/soc/c/fdf87a0dc26d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


