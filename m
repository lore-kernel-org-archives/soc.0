Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5558C04FE0
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7620DC433BD; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 600C7C433B7;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=pDLmIFq7u7XTbRHUOzkbZ9iNGoDzvR4HuOkv0RuMnK8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hAgQcMmdT7ddDUxieXDiTQ2FQ3wkZW+d4QPY0e3DDYRQmOUeA8ku2PfU24UJfuk0F
	 UaZ7hfuUHA1z9d7EN7eDXf3YGX33P/uZnhj3ybEpSd1K2Y+N//gN5L5PyrszW31dZ0
	 IOe/sQfdHS9BuEfU7icvOunCmrMyisyjU1WgV5S6CL62DgPd7W3e9d+UWEu5oO0ASj
	 /dO0PXlyqI1vL09Rv2BS5DXyjbLbgiu9A7pgM+07tSQxMhlmxiURFRVFD5VmmMboiv
	 8oxvORyTmw06CZSkscCSjCgg0vpvn4qam+dmqAlLp/eCcUyxtPWWNaOchFBa8uwuwC
	 gocO79oWzRJYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C7CFE505D5;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: st: spear: split interrupts per cells
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168930.30475.5365057002661890583.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230730111536.98164-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230730111536.98164-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 30 Jul 2023 13:15:36 +0200 you wrote:
> Each interrupt should be in its own cell.  This is much more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/st/spear1340.dtsi |  8 ++++----
>  arch/arm/boot/dts/st/spear13xx.dtsi | 24 ++++++++++++------------
>  2 files changed, 16 insertions(+), 16 deletions(-)

Here is the summary with links:
  - ARM: dts: st: spear: split interrupts per cells
    https://git.kernel.org/soc/soc/c/a3265be85428

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


