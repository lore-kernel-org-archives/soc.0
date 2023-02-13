Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A56C64EC7
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DE24C433D2; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88B25C4339C;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676302229;
	bh=UC/TlwKkn2+IGoOnCYHcg5kSibPFfbB8xyGTcSxowCg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=POv9+VURLG7VYTu3lKDOCc+N6J/2oZ9BwPvZteFKtuhPprFimzQJ7M1DNe50cknjQ
	 pkYIo+LBCzAISSuQMx75BRQ1XFMtniyn4LmayMMjgyVRi7cljHO3eMH0n2s+x29y+k
	 ArjDR5L8R29TpmubAKneSBb9TMcdjKnT9uYjPUVEZ0x865Hz4NKP/1Infoy7LliAUu
	 YP1aGlyo9ZHtAszN+ZNCEdVY8Fd077oCojf6cnvlU5P7SxGR/o/rhuZ2Yj9XKGoTEy
	 sOJO4OCqQBFQ73xnfwzzKQZNsJ4V2vyPBEqJ9zy8Km4PA1kpi3Ddf036c/JcSEb1rS
	 Eje8mBHBkN/9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D16AE68D34;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: samsung: Late DTS for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167630222943.5266.8803860131836646795.git-patchwork-notify@kernel.org>
Date: Mon, 13 Feb 2023 15:30:29 +0000
References: <20230211113103.58894-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211113103.58894-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 11 Feb 2023 12:31:03 +0100 you wrote:
> Hi,
> 
> Late pull with DTS cleanups and minor fixes for Exynos ARM boards.  I know it
> is late in the cycle but:
> 1. I am really pushing recently towards full DTS compliance with `dtbs_check`
>    and I am almost there,
> 2. All these should be low-risk cleanups or fixes, so I don't expect anything
>    broken (previous round of my cleanups affected devfreq/exynos-bus on
>    Exynos4412, but this is some weird driver problem which I am still
>    investigating).
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: samsung: Late DTS for v6.3
    https://git.kernel.org/soc/soc/c/59b05cfa5323

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


