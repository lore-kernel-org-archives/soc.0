Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42165C64ED6
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23785C433A0; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CE48C4339C;
	Mon, 27 Feb 2023 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677505818;
	bh=mzZPUYcgk80m0u26N3xwa/6TtUGcRhdWwHr6zrKRdeU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mPVX8zfkWVfptvAHx6vNJ4BWlhwloVGtfibXqKITsf/utShuWKWPShMD6qSroXHql
	 Igf3sG8ns43KzXPluWacF2eIUMC963dRyz2kC4GuiDsac8tun+6r7uv7ttE15q/6UZ
	 EIKXhVR2OaXcA//3mSMeOMa6/tRY07K71qE60QUWt0YY+IIYlbTntLdDHzz9sEaXBQ
	 GAhrhQaJjBEJ0QRf2/6LYgpMBeyUsJTKRnP5HH+O/tfQaRxchvOv0IvRJWnaqlIgJE
	 /ISfsZ1MbHa5hI8fVGhHiS8S11PuUSNFccVIdyDPvBCDwi4kUQVfJM8nibGWjVVBUd
	 cBcVBP1p42shg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DA67FE1CF31;
	Mon, 27 Feb 2023 13:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: spear320-hmi: correct STMPE GPIO compatible
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167750581789.1456.18049538191085019164.git-patchwork-notify@kernel.org>
Date: Mon, 27 Feb 2023 13:50:17 +0000
References: <20230225162237.40242-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225162237.40242-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 25 Feb 2023 17:22:37 +0100 you wrote:
> The compatible is st,stmpe-gpio.
> 
> Fixes: e2eb69183ec4 ("ARM: SPEAr320: DT: Add SPEAr 320 HMI board support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/spear320-hmi.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - ARM: dts: spear320-hmi: correct STMPE GPIO compatible
    https://git.kernel.org/soc/soc/c/33a0c1b850c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


