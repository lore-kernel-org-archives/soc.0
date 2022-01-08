Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC242C433F5
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D16DAC36AE5; Sat,  8 Jan 2022 22:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8F5CC36AEF;
	Sat,  8 Jan 2022 22:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679210;
	bh=Rofd4euSQsGx0HRNz5cFDCHUiBFk9LOOMtNuxfi42lY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dFU+QCUdAgyb6aoP0/hON+Yz/qCVZbBwz7QcWOYthI8DTJBoQaAQhLRiaq2WJzCbZ
	 N4cso9ViLaykAjWOe3irDGklX7HHoGm9iF+Iq1NxrCro8WeUMzeCVF+qjzT/F2vrOr
	 XTn17/kHDPDvHJcvJUtVBhYhzZGUAdFbuAtYi2wKhFzCqSv5neZBssxOm5DiW2ZNkz
	 9WsdQFVtWeuDWVcCfEkbG61gtcKqz1AYO7h15zxXgLdM0IQOD7ScaOlOPf/F05njaB
	 4D0B6xMtpr8pn9/NGfDdhld7ig5c8Nt0dx9nCFqO+gBJppuNboFfaie3q7gHJu/Fi2
	 h64GBPDy4pBWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B04EF79404;
	Sat,  8 Jan 2022 22:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: gpio-ranges property is now required
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921063.24856.5272264509238287957.git-patchwork-notify@kernel.org>
Date: Sat, 08 Jan 2022 22:00:10 +0000
References: <20220104170247.956760-1-linus.walleij@linaro.org>
In-Reply-To: <20220104170247.956760-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Olof Johansson <olof@lixom.net>:

On Tue,  4 Jan 2022 18:02:47 +0100 you wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> Since [1], added in 5.7, the absence of a gpio-ranges property has
> prevented GPIOs from being restored to inputs when released.
> Add those properties for BCM283x and BCM2711 devices.
> 
> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>     pin-ranges")
> 
> [...]

Here is the summary with links:
  - ARM: dts: gpio-ranges property is now required
    https://git.kernel.org/soc/soc/c/c8013355ead6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


