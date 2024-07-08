Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D13C3DA4D
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 098E5C4AF49; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E62C5C4AF14;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451507;
	bh=mtl5DT/Wr+T+cIjYYKMVHDOrxz8jk7xeMt3vXTCH6Hk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ef4O1WXiS1AvRgevV3HSNJnIojnyBaxCfu4+xex/Y2XhTmgCBWwypjr+eHQ+xv39D
	 nsPVhVoQvdd+YrJuVbVOK8V5L3k3kssVIaoJOpkYX7QhjTOj47aUqr/NikdmS1IPQs
	 rAVhdOM3GcWUoJM2lyWToXTq2zBbnZAMfUQqyKGKCct/K768pNtGOypObgFLyXw4hs
	 1ZFL6gmKD1KDVdm45SxdQ46lnkaLpD9NAua4Cu62kkcAnxcEBkw2ia6q0oa8yqFfK8
	 ITmWTWu4HB98GVOpYbsCK1NoDzpw2lrqcwaf0NqqcpLrwnhqUVNT6LvnNQsFVeG6aS
	 pAGVR3XoUJPfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D9CECDF370E;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: ARM: nspire: add Krzysztof Kozlowski as
 maintainer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150788.17395.2264320468874905830.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240612141740.8470-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240612141740.8470-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Wed, 12 Jun 2024 16:17:40 +0200 you wrote:
> Apparently there was never a maintainers entry for the ARM Texas
> Instruments Nspire SoC, thus patches end up nowhere.  Add such entry,
> because even if platform is orphaned and on its way out of the kernel,
> it is nice to take patches if someone sends something.
> 
> I do not plan to actively support/maintain Nspire platform but I can
> take odd fixes now and then.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: ARM: nspire: add Krzysztof Kozlowski as maintainer
    https://git.kernel.org/soc/soc/c/997148228410

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


