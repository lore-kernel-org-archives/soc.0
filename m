Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B12C25B7C
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8917AC113CD; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72987C4DDE3;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=1r+m6TpjbFa49I1Qj3+IhHY+qUbTL9ZKwpW6yA7vgtI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fMkObC8czAF3fBjXXAXNjRO1xyN5KSIEQSk1BsQtiUikcalUiJL+zyho2p7WDyNT8
	 JezkxZJmg0GMQdux0xIjrvelYUBwyC9B1yW0lvrkcpSbnV4Aeu2Lcmr745ONHd2z6e
	 02i1exQGC4fp/ms1FTe5PnZkj44GV/VoLSPT8Fu0Xp7QdfnUV6I5ucAel1/k3Eh5iW
	 PbcpmLHhmG4VBAFyoYdaJNeCSypO3o10hLeZSCt0lGs2wsAnGb/IXP1OtT99d1k/1f
	 tsHuJ0AggaZxXXNeqP+rhsURy/gZ8gtjDIKtLmTmqVHE4mop7BeRUUshnyAw88B1fi
	 OM/8ZpLYxqHHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68C55C54BA4;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444742.17402.7105824619880801918.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240428162001.28011-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240428162001.28011-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 28 Apr 2024 18:20:01 +0200 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.10
    https://git.kernel.org/soc/soc/c/75c0675f1c28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


