Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67383C433DB
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1EB0464F91; Wed,  3 Feb 2021 12:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 05D2264F87;
	Wed,  3 Feb 2021 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612354206;
	bh=K3aAGHsVSOOQYAqzF6/c2++N2sRmzt+WLlnhcKo1+SQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=o2kmScavXs6AZuU/B8GlGA/4ZfuI1CmaY42hqkG1Xrhr0b4m8UBrY3l7cgPOjC1hQ
	 giO2a5VOP2Uo4kJqWtfREtq5L7vObZ28gscbVYqC8pGFC3klFm817Ub7U8ZNF/EkiK
	 fW+wJ2v47dku+8amiTnylZQbtbC1/g1GaPyRzsdIhrGUNZXEnMKBgprI1Ij+9m4FbB
	 BxX3vE/ZeRsGAuNvCBnC+6dPPyYGMtUMUNS3+HvgLSoyIPYxQPSWl5WRcraLUdFbRa
	 nMQd2/rG5unz9izSYr1lvf97lswpOfYOn2pq0zhnJWFdRHhVt8TcW3HoNLSIfNuSzw
	 733eufOl3IdKw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EE283609E3;
	Wed,  3 Feb 2021 12:10:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v2] ARM: dts: lpc32xx: Revert set default clock rate
 of HCLK PLL
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161235420597.15182.16052729184698778835.git-patchwork-notify@kernel.org>
Date: Wed, 03 Feb 2021 12:10:05 +0000
References: <20210203090320.GA3760268@piout.net>
In-Reply-To: <20210203090320.GA3760268@piout.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 3 Feb 2021 10:03:20 +0100 you wrote:
> This reverts commit c17e9377aa81664d94b4f2102559fcf2a01ec8e7.
> 
> The lpc32xx clock driver is not able to actually change the PLL rate as
> this would require reparenting ARM_CLK, DDRAM_CLK, PERIPH_CLK to SYSCLK,
> then stop the PLL, update the register, restart the PLL and wait for the
> PLL to lock and finally reparent ARM_CLK, DDRAM_CLK, PERIPH_CLK to HCLK
> PLL.
> 
> [...]

Here is the summary with links:
  - [RESEND,v2] ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL
    https://git.kernel.org/soc/soc/c/5638159f6d93

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


