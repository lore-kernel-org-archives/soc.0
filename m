Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9B6C3DA47
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBC77C4AF12; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5847C4AF0D;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451507;
	bh=WvNsEp4car/bQkDGGv1EEYNO2DVyArgr45UhHqtL1fw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fRcAmhnajJo30tnDy3VYyxfBmVSRi8faUdM2lWd7rt/7jQwHtpc2AUbcho4Uqq4TU
	 OqG+G2j3LWIlW4xjHX4ueruQlQJzoY4ev8CCmJynrwN9HVypwHCX7aERw2xo/d/rE5
	 jum0NSUEIBr1KTv8iBSe81PUeyQrLGZxVC6HsuEceNqg+DwxTAPgU7hGsGRK34qVqc
	 VM3I3OMOVd9MffvpC8PDTDoA9/cLkkTYTqxv2qjusuVGzH1MHNe6ht5tAmUtzjqPuN
	 HxqVSelTQHjjIqNpw+RFHWpMeRtMFQK16twtqwbrdHDCzxDmUGMABIpp+EY6EBYMbh
	 JwnpUvkLiMymw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4D25DF3717;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: ARM: moxa: add Krzysztof Kozlowski as maintainer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150773.17395.12667690026113175600.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240613135956.8899-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240613135956.8899-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Thu, 13 Jun 2024 15:59:56 +0200 you wrote:
> There is no maintainers entry for the ARM MOXA ART SoC, thus patches end
> up nowhere.  Add such entry, because even if platform is orphaned and on
> its way out of the kernel, it is nice to take patches if someone sends
> something.
> 
> I do not plan to actively support/maintain MOXA but I can take odd fixes
> now and then.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: ARM: moxa: add Krzysztof Kozlowski as maintainer
    https://git.kernel.org/soc/soc/c/4c54173d5965

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


