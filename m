Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B031FC4707F
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A457AC36AEC; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A2EAC36AE5;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=0ocQilRmbguIEB0yldWELRGzAncNBPmLFV3oS5aDv7E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MivO9N4hKDSU3OIdORCNdvgyZ8/GHKtTyDXZtgoRfLZiJIcf/DApuRorPd3a7coGy
	 4T7aNtqFmGfwPIVu+NyFrUvgdymJ0/H+p36TW7MzavljnLW0jnjQ2z24iVewwxfz43
	 ntpIeeWIaGLLyb8cm/FqFmX9I4n3m4ybuPICxZE4mcA1TSmNV/YaO73eeDOf3ztN93
	 iBGO7QqddIiq/4C5v9ohvzH03i0ca6+4SJAlkK/ce5QC4cB2NQAF6osNrNRMbZVXuj
	 SREic9prpLF5nUhmtSxV1jJD4/LveakK5EUGxIlE6tgzMwjgX8A15ljsMRxsN1inKz
	 6aCZo2Cr1p6TQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76D7AE6D453;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: mstar: Select ARM_ERRATA_814220
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966348.15608.603399697792462328.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <20220223064807.261878-1-daniel@0x0f.com>
In-Reply-To: <20220223064807.261878-1-daniel@0x0f.com>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Feb 2022 15:48:07 +0900 you wrote:
> All of the SoCs that are supported so far are Cortex A7 r0p5.
> So it seems like this errata is present.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  Arnd/Olof: Please apply this directly if acceptable.
>  I don't think we'll have enough for a PR.
> 
> [...]

Here is the summary with links:
  - ARM: mstar: Select ARM_ERRATA_814220
    https://git.kernel.org/soc/soc/c/16018c0d27ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


