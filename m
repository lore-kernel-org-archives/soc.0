Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6ADC7EE2D
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94F79C433D2; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DBDEC433EF;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980240;
	bh=oXqNvNokLzVom9rZ72TxNjfPKuasK4J4tUAniKH/8N4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IWp881zNYs74RNOqnML0OwJhM9PblsmOAyWEc0NrQOyfQNFQI0G8hSxlIwn9+YyIW
	 c81iDYddoYLqFA4YvAvdlq3rcEigr99f8ppLCptnc8KJB/4blYs1sH56mZjhVF1HLp
	 Ad6p8bhbxDuTLrRnXmuhZ5gDSq0ey2Uy1I9WuXpc0TbXG/MJL8KhhSW4UkGRVNLIrv
	 LEVyrL1BYo8mq7y3Q3OZ6Ujb+OEIm1QgZYvtRY04aHrCel2s1q5NWre80zIHl8Do/G
	 iE+PpQFETXXtQOlEE0UJqkEQ3fX4M5YNew8brAQl4HuDBxAZkZYLDiPx/O64Y0zfeT
	 xAdONw9U7i5jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61EC4E87231;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: Fix erroneous ADS touchscreen polarities
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598024039.10098.6825778276909829428.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:40 +0000
References: <20230510105156.1134320-1-linus.walleij@linaro.org>
In-Reply-To: <20230510105156.1134320-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 May 2023 12:51:56 +0200 you wrote:
> Several device tree files get the polarity of the pendown-gpios
> wrong: this signal is active low. Fix up all incorrect flags, so
> that operating systems can rely on the flag being correctly set.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC maintainers: please merge this patch directly for DTS low
> urgency fixes, the Linux kernel will not be affected since the
> polarity is ignored in current codebase (but we expect to change
> that for v6.5).
> 
> [...]

Here is the summary with links:
  - ARM: dts: Fix erroneous ADS touchscreen polarities
    https://git.kernel.org/soc/soc/c/4a672d500bfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


