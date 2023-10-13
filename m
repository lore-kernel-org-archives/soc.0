Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E764CDB48B
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D72BC433BB; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37F51C433AD;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=5pX8vmhrY8vGL1+r7AoDT7ikwWx/TyfaAjmM47S0SOw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=m3kr3MIQIXcPHM2cZ5U0cu2nTXsRZLkq4/hTForyizA5ue/c2A5kRuXSVGVsXSmj/
	 y9pWqXIN3TnU03jNK/8Mo+zT25NQ0cKN58e213+2KGXytZNU695S/07oOQFYlfxosc
	 4HWDkrNSHW9TswH8QCkOZwt0NmijhAZEbmcL/cscs+dcgaGv8YouOT3p9OOdYI/Ftx
	 d0jQkI02xTAdX+VqmZNJthucNsxr9vpWJE8zk/UH/B4fJ8NRnjLFW6ja2IWl7i4QfF
	 HQs6m/oV0KB1Qb+92NZ/PyGPlCtF3oli+GUN1Drh6b/zzPx13BTRhDt4SAaS3HgVCU
	 OTsJ0pj3uP01g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D4ABE1F669;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] IXP4xx DTS updates
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083811.14185.6796754734729286432.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:38 +0000
References: <CACRpkdZZ6W8uic97S9=Aa+S+s0-0k50TDw1e00u6gFcQfAVDdw@mail.gmail.com>
In-Reply-To: <CACRpkdZZ6W8uic97S9=Aa+S+s0-0k50TDw1e00u6gFcQfAVDdw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 9 Oct 2023 22:53:10 +0200 you wrote:
> Hi SoC maintainers,
> 
> here are some updates to the Intel IXP4xx device tree files, and some
> bindings that go with those updates.
> 
> Please pull it in!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] IXP4xx DTS updates
    https://git.kernel.org/soc/soc/c/dcbd30f887d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


