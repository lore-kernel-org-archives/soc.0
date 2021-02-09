Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914F4C433E6
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 16:40:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 451B464EB8; Tue,  9 Feb 2021 16:40:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2E3BC64E9D;
	Tue,  9 Feb 2021 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612888850;
	bh=kGI8CLKFhFgGL7CUsqB/qBn1n1Q171hS+T+MnUTwTUo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JzI/4sKGY4P8TarIdV6qjxIEeXREG9fwMrxhfjUbaHzmjAmuwmCXX67m+udNidxBp
	 sTVEsYKOIpsjTq0oO7vkVqCtt8uURBqIWGHrbrBIc/I+eGDcVJf7JJaPNVK9EQTJ38
	 hSDjg2mldfiHfOLaM3zhk4l3YWDRLFqdUddoBC1o1yEfDh767RkFx8sxXAqZfpjZso
	 1i6mX++9zs46Og7xTH/qfEVwStg9V54JUp7C7TClIE/AcCeqc7NyaGRgBEh3vUaLqq
	 BFepuMsaWQKv5ai5GoCKDTzwMYtz22wqSMcoc0bGpNyxyfynE6LFFZd4RePFCUBiYG
	 Ri8BHfIxXGt0g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E16D609E2;
	Tue,  9 Feb 2021 16:40:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161288885011.29773.7157902107899764019.git-patchwork-notify@kernel.org>
Date: Tue, 09 Feb 2021 16:40:50 +0000
References: <20210204160129.2249394-1-arnd@kernel.org>
In-Reply-To: <20210204160129.2249394-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu,  4 Feb 2021 17:01:20 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compiling with the clang integrated assembler warns about
> a recently added instruction:
> 
> <instantiation>:14:13: error: unknown token in expression
>  ldr tmp1, =#0x00020010UL
> arch/arm/mach-at91/pm_suspend.S:542:2: note: while in macro instantiation
>  at91_plla_enable
> 
> [...]

Here is the summary with links:
  - ARM: at91: use proper asm syntax in pm_suspend
    https://git.kernel.org/soc/soc/c/d30337da8677

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


