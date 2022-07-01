Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F31CCA486
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E78EC385A9; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E9EDC341DA;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=OISH1FiiAVvkrWQAyFxOTrng4/+my4KM9gW4q6xKq6Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mONoziYGXS2p4Bv3EyICnCpwFd8sRz49WN8FRs5M2j81GdyB/3XgrXQdMxMOEULQ4
	 GwgcGaw0Cb3kJf6+y47U4lLIiizoaIDakTBuZzswpq5RfEb4ShEhjD3ib8ce2KYKID
	 f6HdLQ19zs2oDxxwDbTIqxlu7gRBwWpqqkTu//rsXSPZSjjfmUVre1zdgxG7FkA82v
	 OKXE37EiEVmoiVmQSDvmdk/ESRYla0Czqgs78znJnD3DERnfKdDARjpfrtAbvPafHw
	 QilyhIigNk9LFz/uG1VvHAi84uiIw+lM4qps6rddI2GgsOQEebnPZxW0YEC3m3ANji
	 hHV1YFwsysINw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 27B2BE49F61;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: microchip: adjust whitespace around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809715.26141.16998916947533680058.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:37 +0000
References: <20220526204110.831805-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204110.831805-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Thu, 26 May 2022 22:41:08 +0200 you wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: microchip: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/09f4933a4fd9
  - [2/2] ARM: dts: at91: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/bc5187b427dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


