Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C42C3ABB2
	for <soc@archiver.kernel.org>; Mon, 16 Sep 2024 12:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51DB4C4CEC7; Mon, 16 Sep 2024 12:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A2BC4CEC4;
	Mon, 16 Sep 2024 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726491030;
	bh=1FHQ/Pk8ASyqmm5Vc6rTwBVID2dJYwIxYatzj5Y8dug=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GVpG91XheR7xxhrniSIY8Dk8yKhwIdDPcJ/eP2oGfn2UxmCdIyVEg7b/cuJGn8e4B
	 Q2eCei71W3diWHCXkICHyccdBGfeojro02E8xTueqHaL0OrfbI9+GSeUPFO0ZSsR9Y
	 Xfd84Mr9m/jpoLG87y8G7YVPP1ARGc+sm3/C/fcpKWqZ4qSzwK3y5TnFT7Z9Lid+8w
	 fulM9oM++9lpMe8UrhluAt4Pgu4IvxStxgbA4selxhWECAD49S2iyMDi5/VHXeKXMB
	 RCg8l0ihrbyNfbdMtlXXKTpkMGLFnnDv7HVaiyb3JMNnoHU3+LgU4jIlZ18mI7sw0X
	 LsnLejsEmNsnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3AD3806644;
	Mon, 16 Sep 2024 12:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: cirrus: use snprintf() to calm down gcc 13.3.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172649103177.3685310.13348352806380971292.git-patchwork-notify@kernel.org>
Date: Mon, 16 Sep 2024 12:50:31 +0000
References: <b1f03ac53b358c135516bec98e626c98aee9d867.camel@gmail.com>
In-Reply-To: <b1f03ac53b358c135516bec98e626c98aee9d867.camel@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 12 Sep 2024 16:21:06 +0200 you wrote:
> Even though it's a false positive (highest channel number is "9"), refer to
> "struct ep93xx_edma_data edma_m2p", we can avoid new warning by using
> snprintf().
> 
>    drivers/dma/ep93xx_dma.c: In function 'ep93xx_dma_of_probe':
> >> drivers/dma/ep93xx_dma.c:1365:51: warning: '%u' directive writing between 1 and 8 bytes into a region of size 2 [-Wformat-overflow=]
>     1365 |                         sprintf(dma_clk_name, "m2p%u", i);
>          |                                                   ^~
>    drivers/dma/ep93xx_dma.c:1365:47: note: directive argument in the range [0, 16777216]
>     1365 |                         sprintf(dma_clk_name, "m2p%u", i);
>          |                                               ^~~~~~~
>    drivers/dma/ep93xx_dma.c:1365:25: note: 'sprintf' output between 5 and 12 bytes into a destination of size 5
>     1365 |                         sprintf(dma_clk_name, "m2p%u", i);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - dmaengine: cirrus: use snprintf() to calm down gcc 13.3.0
    https://git.kernel.org/soc/soc/c/d7333f9d3377

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


