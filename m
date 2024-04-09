Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B05CD129E
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CACC5C43609; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B59CCC433A6;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677239;
	bh=PCONU8eYhz2bahxiJGZAuORW18LcthMwpaLQujSA0a4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mwVmR9M5v98Lp7Q1PwAOFmfm57qGI1kJVvszgE9aSVpwpFVn0ErVdnUpPxX9YlDYr
	 lKArh2QjyYcdj8XdgQMaprm3cut1J1Pgjc93gu2xEPyjvNsksJRGQLvKTzZLIr+0ym
	 xuaIWxEhE/vHgaU1WCEMtKwPCaRGbBVwznAovPnwL5/L/L8c0BE30nciDqZV0JBm+a
	 sN0C7LNISA29CoeHdDRAhowpy5VOFUCijKxT3QHXm/R/SaVC2Vl31nMW31NOcP82fM
	 N0EHDAjx4VrUvsLMcxxMmeg5iBhFxIgP49AJavwscX0UCM5V8fnXI1fIjV/mFeNNGy
	 RlfDsUBKHVNxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 96ABDD60312;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH fixes] MAINTAINERS: Change Krzysztof Kozlowski's email address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267723961.12038.2167081213925271808.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:40:39 +0000
References: <20240408073234.12968-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240408073234.12968-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  8 Apr 2024 09:32:34 +0200 you wrote:
> Switch Krzysztof Kozlowski's to @kernel.org account.
> 
> Link: https://lore.kernel.org/r/20240329174823.74918-1-krzysztof.kozlowski@linaro.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

Here is the summary with links:
  - [fixes] MAINTAINERS: Change Krzysztof Kozlowski's email address
    https://git.kernel.org/soc/soc/c/011d79ef1cfa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


