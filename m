Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93289CCA48B
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CD7AC341E1; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 680BCC341DD;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=rCrErv+sealzQ1EbGRt1OBEi1L+Ro6BOAzatuiwzu7M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ih8wqK7A4lGHgbv1RrxJxC63bki2SVgstgeQcZBCTZUgFEUWbwIhlDRJFE4mVK1/M
	 XIp5Y2YTH+7qdzzFuviBzJWdvz2J68hoiIP81giwSefJ8oWtxxm28JXaSC5Co1qVWu
	 Zc/VATvGb29yc/odUa3ZEem1a4A/0AzfCX2TIiTSDiGEFlcCwJwZR9FwI9SlK3Smrs
	 Oihwo8apVyHMAAoCEfjnt+EuiQ3KvTr1EeaBuN+Kg0ai5z7JbPvF8KWob1rSzB8no5
	 I9HrI0zskdNyI+vbWp0QJ40yNoiBj8JCvGb9ohqCc0Y5bUEBFXe0Opzrrp1vBqNF5G
	 mVHZ2ESAK1U5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4FB71E49BBC;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: hisilicon: adjust whitespace around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809732.26141.6729226071608666147.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:37 +0000
References: <20220526204453.832681-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204453.832681-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Thu, 26 May 2022 22:44:53 +0200 you wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - arm64: dts: hisilicon: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/11357f103f2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


