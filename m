Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8A4C4708E
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02233C433A8; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCF57C433A0;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465633;
	bh=6akd0X6QdNre7kWoSxby70nYjBrODXDI2cgOCIa8utw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DYlQ801PiypuMqy8iJJPFLyk4OITrQn8QQNgxKwoSpdFQMrg4O40zeDPxli9QzirF
	 EBOfxkt6Tp4LCnQ+VzKosFbPS1oSCWKKRTLP74utrRlY4loxxLqw+uYiwTjsG7ev+3
	 876XkZAOSttXZxXtRKCISAE5NRacMAZqLTETEAfZ95xFqlN6kcp15jg1qK70EaYVoJ
	 JiNZ63vfAPSZLcR5m+mxCQLd9+1Jrxlp8zdTpUT8SxIkuF6/8GmBoKGOwiU3Yxyz+F
	 ki8ru84+jOv8zN7hlcLXecLzN+jHMmOcDf4EhsYnNREzPdCjIFH3/+UyrImMiOo8IO
	 e15emVIRmz5ZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9DCBE451BB;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: spear: drop 0x from unit address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146563369.24111.14110811094543588406.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:33 +0000
References: <20221210113347.63939-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221210113347.63939-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Dec 2022 12:33:46 +0100 you wrote:
> By coding style, unit address should not start with 0x.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/spear300.dtsi | 2 +-
>  arch/arm/boot/dts/spear310.dtsi | 2 +-
>  arch/arm/boot/dts/spear320.dtsi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - ARM: dts: spear: drop 0x from unit address
    https://git.kernel.org/soc/soc/c/2b76cfe19030

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


