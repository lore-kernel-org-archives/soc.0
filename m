Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1865C05027
	for <soc@archiver.kernel.org>; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6A26C4339C; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B2E3C433A4;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675951221;
	bh=XVyaU7Iu2Lyy7sEYRBGT8p2y2Svbj6vM6Jafh+0++wY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u7BlZqCPVSadWvOa5be38+TNj4/ilB/3l5MrEs+09xbBsBNyoZduFrjzud6Oef2mu
	 IIExBaflGRFNLbJBTPZw2oob9IW5NkTC8n0nYpWPQA7Su+AioFWy1lBWlPum9rpxDN
	 LZ+21u9MIdf/8RwTNmtF5pmOPpCt5s80E3R0Un7H8D6PuezJHeIJl6LErO3/CbZJ0l
	 WIljuZbi2KW35AMAV9fzHtsB0B1rRFGE7gIch7T1ms0OqtbZDM72PvTFG91a+yt2KD
	 Y2nIH+4ObECpcKEgV2h2NVyS2+G1YnYof7Ua2UkQISA702DRH9I4hdjKq98Rfj+Znw
	 +YT886CSOq/Hg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7E684E49FB3;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH PULL] memory: renesas-rpc-if: Remove redundant division of
 dummy
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167595122151.31919.17334089896067956759.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 14:00:21 +0000
References: <20230207173051.449151-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207173051.449151-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 Feb 2023 18:30:51 +0100 you wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
> 
> The dummy cycles value was wrongly calculated if dummy.buswidth > 1,
> which affects QSPI, OSPI, HyperFlash on various SoCs. We're lucky in
> Single SPI case since its dummy.buswidth equals to 1, so the result of
> the division is unchanged
> 
> [...]

Here is the summary with links:
  - [PULL] memory: renesas-rpc-if: Remove redundant division of dummy
    https://git.kernel.org/soc/soc/c/637581ce6040

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


