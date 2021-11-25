Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A77C433F5
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3DCC9610FE; Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 26E7560235;
	Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637854209;
	bh=dJF6P1l5hlqYcz+dWLmgZXRRsmJD0gFYXGaExlRuBh0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MrR+E01R749hhkg2g0H5D4FS7DhzX9yN9NYR56pi1Vkwq3loPFB9S7zIcvgZwpzTb
	 iNYbokxGw+b/uU8ml78oD2g5c3Fdjty9YijPEapMzYiH+ox60t/fYplobErTJ7kfgV
	 RzNtIoj5thVO/cz917hICTT3icnCoKe3MeIsPdNt4Twqd7IxzFkDPFR07YkMQEmcAu
	 Mu8u8bQ3GdjnRbW2nbzlD5ILGbp/LWegPKOuJb4Lxi8MOHXNC3gjEGwGO5yU8jwX5J
	 2MvxedjAPp68VlT95luqeBviur8Q7EYEaV+PJMvjwphpMsdP+2IdEgOIVeVeEbpuAI
	 WZ2LgMZB/DlUQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1D24560A4E;
	Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] fixes for current v5.16: arm64/dts and drivers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163785420911.25928.5685367788273258970.git-patchwork-notify@kernel.org>
Date: Thu, 25 Nov 2021 15:30:09 +0000
References: <20211124085042.9649-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211124085042.9649-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 24 Nov 2021 09:50:40 +0100 you wrote:
> Hi Arnd and Olof,
> 
> I have two fixes for current cycle, in two different trees so I combined
> them in patchset here:
> 1. Samsung ARM64 dts fix,
> 2. Memory controller drivers fix.
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: exynos: drop samsung,ufs-shareability-reg-offset in ExynosAutov9
    https://git.kernel.org/soc/soc/c/5fe762515bc9
  - [2/2] memory: mtk-smi: Fix a null dereference for the ostd
    https://git.kernel.org/soc/soc/c/383a44aec91c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


