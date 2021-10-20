Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA8DC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:00:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DACC36137C; Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C2D546136F;
	Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634745607;
	bh=QbcwYU81BBwZ/3d5HMuQNsD6bH844zgRBYTNM35Cstw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eSYl64nBQb4zzaW9dAvrIrg+MElJria1ImW/2qNsk+Q9ti67jtjPj7AhZ+zWOhPXG
	 6vzriEqbPohormMDLwqimTXZxkfX8f43DTHfVq6OQRk3iuT2hZSx4t+B3EMIS+cbKg
	 pSdfHU+af3fSPJdIOPvzfm+ODsvTdN/mo6Z7y4wrtSE7gp5XSQz0HSPOepv33v0yTO
	 uzCXAIypamGpVcHa4HguFtwv+uFOpU7g7hcLTPI/S48NWVPxc/QiE+qv/iXjSpqeRZ
	 xH61/rwKYPuH054ZFTI0Q/vrf2BHIRTVo1abOFbdFuRFUQQK6ytl+vTghYFy/X7LhP
	 F9n0rZFWaeGdA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B62D860A24;
	Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] arm: ep93xx: CCF conversion
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163474560774.11707.10267527939368493693.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 16:00:07 +0000
References: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
In-Reply-To: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Oct 2021 12:31:03 +0200 you wrote:
> This series series of patches converts ep93xx to Common Clock Framework.
> 
> It consists of preparation patches to use clk_prepare_enable where it is
> needed, instead of clk_enable used in ep93xx drivers prior to CCF and
> a patch converting mach-ep93xx/clock.c to CCF.
> 
> Link: https://lore.kernel.org/patchwork/cover/1445563/
> Link: https://lore.kernel.org/patchwork/patch/1435884/
> 
> [...]

Here is the summary with links:
  - [v3,1/2] ASoC: cirrus: i2s: Prepare clock before using it
    https://git.kernel.org/soc/soc/c/f4ff6b56bc8a
  - [v3,2/2] ep93xx: clock: convert in-place to COMMON_CLK
    https://git.kernel.org/soc/soc/c/9645ccc7bd7a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


