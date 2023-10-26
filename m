Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360ECC25B48
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B2ECC43395; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E88ECC433C7;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698339030;
	bh=5NS26XwebxFsSg2lAxaie2byryb+HXfdQwVgxf3FTkA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=T/8zFgtoSbCrg1rHUUkU7c/ot+9Hvexa/hBPh/JmCMGxi9WhTupMbBOIbcIuGSj1X
	 3aPPflChAHFGiSlwkLmGXU26LLvwBPaKYqf08w4mexqPHop8JNDLeVSYpcIBPI54X1
	 3LiVx2bWvkdqlAZnIl6fIEUDf9HDw2S10An9ErgLoIiRSs34ZwLXgCbq2EgSZhNoGk
	 o73YVhVUlCV2xqKDj3aW+TFqRCYUWnDfONroERV8R/nOBdQTNzrnXhUH5HBD2rLD4j
	 nbXMslqC6cIbLiu8tJ0HWpTbTmNi/g19Pu1+wUyznNm3EztvkjCCRHmPqN8mg9RCaL
	 f5pQutGyr1PjQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB891C41620;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: usr8200: Fix phy registers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169833903083.20019.12591198175378896818.git-patchwork-notify@kernel.org>
Date: Thu, 26 Oct 2023 16:50:30 +0000
References: <20231020-ixp4xx-usr8200-dtsfix-v1-1-3a8591dea259@linaro.org>
In-Reply-To: <20231020-ixp4xx-usr8200-dtsfix-v1-1-3a8591dea259@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 Oct 2023 15:11:41 +0200 you wrote:
> The MV88E6060 switch has internal PHY registers at MDIO
> addresses 0x00..0x04. Tie each port to the corresponding
> PHY.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC folks: please apply this directly to DTS files or
> fixes whatever comes first.
> 
> [...]

Here is the summary with links:
  - ARM: dts: usr8200: Fix phy registers
    https://git.kernel.org/soc/soc/c/95962b0e8ca6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


