Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1FDC8300C
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7E70C433AC; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2077C433AA;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686084024;
	bh=8r4u0Ob/pVW1B0/yB5FiroWt4ckmgATrhEjF0xH/JIE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=j3V+gxEJilTkSf8tKDrberZ8oL3RSfumKXnZkGpVZNRGhpdaiDwoCscxM1sG+Udj6
	 VZ7N8NtexnVvNFMhWYFIV7hA2lHrdOJ5Us8/zIdzMbOIvKcfNERfaLSEVzN3VvXpfn
	 zxihQCYfYEhafupdOUvhCq20a1MU9SPAoT+Ykv+QI8Ln77e5vKRmmMJeIMjR9FR16J
	 x8UI1E6vMARNhN+qrcQgA9nhcaZ+ViBbVJC8jmrXJmeUirHgkIbn4tgGGZuYXrwli5
	 tYSer0PGFCEWWUQ53dsUpC5TucMmxRESS0G9rXHGzgH2Z3yOTLzn/DbsliG1igwPl6
	 eavjgOH9KXCVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1D14E29F3B;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168608402465.20407.8719210637847379085.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jun 2023 20:40:24 +0000
References: <20230602091501.15178-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602091501.15178-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  2 Jun 2023 11:14:59 +0200 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.5
    (no matching commit)
  - [GIT,PULL,2/3] ARM: dts: samsung: for v6.5
    https://git.kernel.org/soc/soc/c/33f0ceca111f
  - [GIT,PULL,3/3] ARM: samsung: soc for v6.5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


