Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B59C4332F
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42A20C43147; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D8BFC433B5;
	Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670156416;
	bh=oSk0PVxmUqlIAjO76Gq44YTxdDNDZQc/Odideg/ZeYs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rITsc4M1c/H90757lrRprqtNcmenn92A6QIQfaDZqxTkWE5hoKNoAvnH778JAd1SO
	 VxfvCKfEKkFEOx1OsnwSz15SxO/QJugvhtXZEy4FmJv3iwX4Pj+EccHIVl+2zfRlQd
	 nCBavq+QTAkoVR5ab6iZLVURkzPcxd94VlRlWQAHppPNOpT3CxEmJKHkHMeFNzmXig
	 AWLc4LztH630FXyM0s7L02Q+jU9PnB+U0ee2XOoxnCdQYsVajJvFfE6HeMR0wnYS0g
	 s8QureIIYMoV+70SoOFhbhytUitQdAnjyTwfisgalJzbztLH334QbKPLvMDwTHLrqk
	 o9PwlC1ANW2Mw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 073C0E29F40;
	Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: Second cleanup for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167015641602.6046.18203019468787219880.git-patchwork-notify@kernel.org>
Date: Sun, 04 Dec 2022 12:20:16 +0000
References: <20221204082909.5649-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221204082909.5649-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  4 Dec 2022 09:29:09 +0100 you wrote:
> Hi,
> 
> I had few remaining cleanup patches for ARM DTS.  The imx and lpc32xx one did
> not get maintainer acks, but the rest got.
> 
> On top of previous pull request / tag.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: Second cleanup for v6.2
    https://git.kernel.org/soc/soc/c/9ebe898a3732

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


