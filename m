Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D72C3DA40
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55D71C433AB; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C031C433CD;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=N0hgvxnW+OJD0yc+1XIzzOd/qTr31GdGpEMPdI6MEWw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=arpwEpU2y9dBASrrdd7HcRRMzqOqdRo7+jE3hQlq6XsQO6euIuT4bMxGRMEiHgNJn
	 KNr3bqpPKq8zh/4oqW6g6zys/H7J+G6xprQbT83W7YnYzPhuha/xYdIfRfNWdY5jCC
	 cNUO1cMuiJiNbYhwXpwH++fvbO0+gV4ZqqGnsXgBPmwZLAFKz1IHUydlIcbxRQpY9w
	 l0JF9iPkeYDVXbbleGQQKUSogl6y6akh9CGzdg+bYHDNA7rwaXingCJumTUsMIRDfc
	 H44evvBW8yWm4E6gDuyz1Eu6xwReclWKjWQOaOURkLUCCVkU/cJSSkiXAaYCK9BfwL
	 PFK5Un8Q7ZZ/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 15B13C73FE4;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745023007.12309.6434493323344933343.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:30 +0000
References: <20230612175508.288775-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612175508.288775-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jun 2023 19:55:08 +0200 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.5
    https://git.kernel.org/soc/soc/c/57cf6633f385

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


