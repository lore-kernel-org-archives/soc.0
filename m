Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFEEC77B61
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E9E5C433B3; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66ED8C433A0;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679680822;
	bh=B4ku7gYKErfhSucf3lnpzGTNLKgW1b8Kbe7qOzqMVjY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Q0maaAcueb7394rcB2kIb4xmCqR3dAEmE6muROY8HRvX5IrZrIMfGmRb6AoTe7b1k
	 I3zo20JPvinjN4MozcxLOyVoZup+mdeUmIskdl0rJFFN4BF7gIewTJ7EOLc12WGJBC
	 eToiE5rwRK0LBo3VLu2Tvv78TGobL717xXfnofrb/utgsVWqX6v53gdbmzJ7TAeGg3
	 vMwfrevMyP7HR+xnQpoGZEbiZZybYZ043jbDz9WQi7g7WGf49kOj1brQiZ79Iw7Mq5
	 6zD3WGyi24GlhqjkaO1O6BUXMUiv/GGKhSxQywYrdWt9yOtA0pgU1CHpCQEYciza/p
	 cqjFXdmK3HXYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44ABCE56265;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: few cleanups for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167968082227.24696.12176385811652756826.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 18:00:22 +0000
References: <20230319152740.34551-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230319152740.34551-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 19 Mar 2023 16:27:40 +0100 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: few cleanups for v6.4
    https://git.kernel.org/soc/soc/c/07fcd6bfce17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


