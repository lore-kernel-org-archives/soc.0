Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694BAC3DA41
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E017C433C9; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1866EC433CA;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691844622;
	bh=NqEsHYvNDkgRtvX2h+5s33lk16Bb+/Rw1GBk11hqq0U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nyMUwgsAwAksQHKw5sr4L/DyPNAt4y+NuEyGLpPq9e56QD72kuPZLrI2lTWGLzh6A
	 R78T268erbK3/SnSHHTcuU8q2oR0LEPpoP2ZktBUjLr37qNqSFETvIn5nLzVQnexoh
	 vqzIUvwV/wC8J1uIi0jAljoRY6GHl/2PcVMaE7hSgWUPW+MF7M8aVDFLSZTu4E+3p7
	 dkt08ilGUhlmL7TsfTMtDMldgPYWIlqeMD79Uc4MxVdajtq5PXYPuucVAJKxLZVJiZ
	 NDY7UWTp5BGxHG4aTxdBbuOfwAWEjZ4h3H3qvA4aS27OrPt1lK75WBMLEF+F7QGCqQ
	 8OAx33vG9MZqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E3796C64459;
	Sat, 12 Aug 2023 12:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Documentation/process: maintainer-soc: document dtbs_check
 requirement for Samsung
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169184462192.4542.3504542470520322277.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 12:50:21 +0000
References: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Jul 2023 10:41:31 +0200 you wrote:
> Samsung ARM/ARM64 SoCs (except legacy S5PV210) are also expected not to
> bring any new dtbs_check warnings.  In fact this have been already
> enforced and tested since few release.
> 
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - Documentation/process: maintainer-soc: document dtbs_check requirement for Samsung
    https://git.kernel.org/soc/soc/c/38d0e83b9656

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


