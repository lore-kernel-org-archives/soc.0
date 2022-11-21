Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02946C4708B
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC9DCC43155; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7493C4314D;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=EdRVvRgTrL09taDqWmtPB41SZoLyF9N4qY15JhqtUs0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fE/MzCklLCLiQeFtjIY5LsIcLlbbnDb2hA6Rn/nA3fTMEOFJx9+JoXB3g2lKob/S2
	 nHpoCW9IC5w40fy8Fv5PXTPzRt/Ob3WXjbTMyraJBgtZqFfn/GLgVtfkDX9m1BRck/
	 tX1ZOnax1cL3FJJM2mA6V4+0AeydLnHL8yF4vPbPIovUpRJNeqEJAKAHoZieMtOYwk
	 MAKbwNvuxLnC7o8AFUaRWJgGGbiTYcPtpiJGccVjkaRPTfjNDDqklUM8npwT3DYLS6
	 gDuQH9awLKsfyW3P10l1T4VoIYmKWmwsaFgrOXLeteZDzuK+ED3EkAioMuwK7XR3PJ
	 H/DxCkq5sNj/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD7FFE29F42;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Add UniPhier Pro5 boards support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234370.4359.5855230418383915727.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <20221117163219.3673-1-hayashi.kunihiko@socionext.com>
In-Reply-To: <20221117163219.3673-1-hayashi.kunihiko@socionext.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 01:32:17 +0900 you wrote:
> This series adds support for the boards with Pro5 SoC.
> These boards have UART, I2C, USB, eMMC and PCI endpoint.
> 
> This series is part of the previous series shown below:
> https://lore.kernel.org/linux-arm-kernel/20221107103410.3443-1-hayashi.kunihiko@socionext.com
> 
> Kunihiko Hayashi (2):
>   dt-bindings: arm: uniphier: Add Pro5 boards
>   ARM: dts: uniphier: Add Pro5 board support
> 
> [...]

Here is the summary with links:
  - [1/2] dt-bindings: arm: uniphier: Add Pro5 boards
    https://git.kernel.org/soc/soc/c/2dbcd8b4f208
  - [2/2] ARM: dts: uniphier: Add Pro5 board support
    https://git.kernel.org/soc/soc/c/bdeaf22dfaca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


