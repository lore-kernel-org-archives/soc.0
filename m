Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34E6C4167E
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8705C4314B; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A34D9C43147;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=twiViIIGNl8/7bvJh62gOrrASkwzUBUkWM5eAGEfic8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JnAAbPRGMPV8DByaXItfJd3WDE51MzeDbc42TDIs6AiFU9Zx0/xfNCWaSQBadX7Q4
	 YYU62oSQoqwWWZBbSVhJA34/o8YIFvkQTmd1ixy/Fii+nWmU8SUDaV77Zg15++o/wg
	 nA/9TICzF3vCSMsqh1pOr5kWNV5ULPm46Z6PJg2vTPBCAnkQKYVoQ2GtBagT8lufEL
	 af4lcxwXNAhOZcXtrE2LNWCZ44ebZMPcAAapBlibr+hZ0ibwItfBzFOxxSR3i8hmH+
	 U+tKIAebhLTr434oRsYqPTnQe959W3fAY6t1Su9kcYUXSkPmXTQoPA7+6TmPgiDyzD
	 WbeQ7ClGClSTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 914FDE29F40;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2 - PATCH] ARM: dts: exynos: Add new SoC specific
 compatible string for Exynos3250 SoC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234359.4359.6040756350295997303.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <20221116093010.18515-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116093010.18515-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Nov 2022 10:30:09 +0100 you wrote:
> From: Aakarsh Jain <aakarsh.jain@samsung.com>
> 
> Exynos3250 and Exynos5420 are using same compatible string for MFC codec
> device but they have different clock hierarchy and complexity.  Add new
> compatible string followed by mfc-v7 fallback for Exynos3250 SoC.
> 
> Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> Link: https://lore.kernel.org/r/20221114115024.69591-4-aakarsh.jain@samsung.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2,-] ARM: dts: exynos: Add new SoC specific compatible string for Exynos3250 SoC
    https://git.kernel.org/soc/soc/c/84b63565f887
  - [GIT,PULL,2/2] arm64: dts: samsung: Pull for v6.2
    https://git.kernel.org/soc/soc/c/6f8d2a203799

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


