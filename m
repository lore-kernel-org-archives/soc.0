Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBA7C30653
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93ACBC4AF11; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78800C4AF0D;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719867637;
	bh=rrUBXq3DRvy867ZxXobJZT1mduuH56rmfJQjJCUwR34=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pgn/ArsBQRaHKlHP9rVALwIgm+x8kUxR9Jf+ztFpntgtuBlVd+4/3q5ljl30e7J/o
	 44dPQrr8/ho0pZKNa/bt8YNvwDfTeElSbneMaeCQF93Od8VSPl1V2xUiBYsn/n16RM
	 aC9SbdBPGXsu6xBJ1aOZTpC1ed0xsJcIppzMbZUo9VLDy8cPXXSGq2EjS2zmMxq8ZG
	 GjxnYmyBAemXxy1G2zvBd8Deggc+uE8zriuZO8GtfUmqRwpNxzZf3ymUUyRgLL/e4G
	 ugt+HgCP72V1cAC+c3t9ZCoUx+ejDrDQ/mFANuUyZLgrF9gxpiFO9ckXkAmh4K2kBw
	 mgHEzE3Y4dpYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 688C2C4333B;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm/arm64: dts: arm: Use generic clock and regulator
 nodenames
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171986763742.7657.13412128348339969945.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jul 2024 21:00:37 +0000
References: <20240630-arm-dts-fixes-2-v1-1-a32ba57e5b1d@linaro.org>
In-Reply-To: <20240630-arm-dts-fixes-2-v1-1-a32ba57e5b1d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 30 Jun 2024 00:15:35 +0200 you wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> With the recent defining of preferred naming for fixed clock and
> regulator nodes, convert the Arm Ltd. boards to use the preferred
> names. In the cases which had a unit-address, warnings about missing
> "reg" property are fixed.
> 
> [...]

Here is the summary with links:
  - arm/arm64: dts: arm: Use generic clock and regulator nodenames
    https://git.kernel.org/soc/soc/c/04f08ef291d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


