Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9F3C433FE
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DEA286109D; Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C63576108B;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635265810;
	bh=4aLluw0yL9wmNmb8Nub2BEHvZmuwvcFreDn4AZUZBVs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UIHrGOzlPHlCyVibbgI08pLcW4Y863DDr6xaDm1u6NRY03Uagv1iKGp5xRZ6GWrFX
	 aIFCl6OwYZ29bshX60i36GvuQIPuer27rrThygqwxJLK/4Ozxk/sN7DskJxhTCVCsV
	 zxmp3XubvBTjMWSZE8mW+SdRYpAwG9XwECO3zKSbyQa1IYMkNDDpHYQtzz/Ks1tX+o
	 OqOEXODf2vSkfM8lEDNH3bzAksVr55B9soTV4tH840jkj+1oY96D92V/DjVSGISrHL
	 D1SA79arAbUK2/etNMO5wxjg5B2WztnHbTs1OlVGl0Bl263KBkI/0URM9weg60+2AR
	 2B0kb0zSVPofw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BBB8D60A17;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: arm: Update ICST clock nodes 'reg' and node names
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163526581076.16112.7925468828190496542.git-patchwork-notify@kernel.org>
Date: Tue, 26 Oct 2021 16:30:10 +0000
References: <20211024232239.211822-1-linus.walleij@linaro.org>
In-Reply-To: <20211024232239.211822-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Oct 2021 01:22:39 +0200 you wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Add a 'reg' entry for ICST clock nodes on the Arm Ltd platforms. The 'reg'
> entry is the VCO register address. With this, the node name can be updated
> to use a generic node name, 'clock-controller', and a unit-address.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: arm: Update ICST clock nodes 'reg' and node names
    https://git.kernel.org/soc/soc/c/2d3de197a818

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


