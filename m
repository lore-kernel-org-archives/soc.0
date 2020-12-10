Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228CDC4167B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 15:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DCBDC23117; Thu, 10 Dec 2020 15:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607612406;
	bh=0rTeHBaYln/ShnmIjcUxOF09ZRr/TyxGCdOL/YRuI3w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aCwlr0cjw9hIHy+afMBPu2pSdKgvhEZoDzS5WQN7OnzA39B/g/MxeEwW4SU9nw93Z
	 7UJvfFb+nIJV28nqgTXIIgheMOF5DFkSsYyhhLpyuo0zqsWVg2S2APtIguDsE5P8XN
	 azDjFJYRnMVI6NZGmCvIsbTwxR2xC/yy6xyK22O+wKU+9g0pQg/iEPh8U/L2T7Oxkr
	 Ro9L/e/9gn0EKM1Z/X5DbrclxdfHCrBjzYiJz4k3QpV1GKEbh3p/zDWWVpEbSN2s99
	 HnElFkxnRqITBtcza9Itpdn94uauGiBViYyT/mJiQB6bbPNBNqYpBdqvHZAVzDCG2E
	 MM7F9LDjWqXYQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: bitmain: Use generic "ngpios" rather than "snps,
 nr-gpios"
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160761240675.29964.9074029386731560452.git-patchwork-notify@kernel.org>
Date: Thu, 10 Dec 2020 15:00:06 +0000
References: <20201210094056.54553-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20201210094056.54553-1-manivannan.sadhasivam@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 10 Dec 2020 15:10:56 +0530 you wrote:
> From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> 
> This is to remove similar errors as below:
> 
> OF: /.../gpio-port@0: could not find phandle
> 
> Commit 7569486d79ae ("gpio: dwapb: Add ngpios DT-property support")
> explained the reason of above errors well and added the generic
> "ngpios" property, let's use it.
> 
> [...]

Here is the summary with links:
  - arm64: dts: bitmain: Use generic "ngpios" rather than "snps, nr-gpios"
    https://git.kernel.org/soc/soc/c/43ffe817bfe3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


