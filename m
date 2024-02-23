Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1337DC54E5A
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 067E0C43394; Fri, 23 Feb 2024 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4BCAC433C7;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693829;
	bh=uZRP86ioIeT7rOitleYj1woQEEoeCGrlz+2bNTElhag=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fbg9CTDDeIvOGOQVos3jM9P5mAwDoRiTbI0p+n4NXRKD0IPPcMC64NWRkXdlbBdDB
	 EbKv7V/3OtCYZcpdRvPuO3rmUIT8/Klw2/I4HPIjtqW61zgXOaSfP1Rg3PKDmdI/Q4
	 gTODECGC95a/3p75pccJCH1Q+7TXxUbLi4JVE+b0uk44Fpuh1HG8CZoVQ6dEWDOrUZ
	 wJYa2OqqheSuqkXwHYSdBAhyooudbi4loyeJqODc4NT7OJ7jj/HvzAmFuzXtKM2wLE
	 bSKDnYpu5ItffD2cUqVPx0aH9ClNnDBL9jwgtQ0c4cPv4wvjo1nKXjuC+2fWucvYO1
	 Od604/h9mLpow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE3EFD84BC4;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.8-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382984.28623.9500008757256470751.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 13:10:29 +0000
References: <20240221-foil-glade-09dbf1aa3fe2@spud>
In-Reply-To: <20240221-foil-glade-09dbf1aa3fe2@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 16:55:00 +0000 you wrote:
> Hey Arnd,
> 
> Two small fixes for W=2 issues. The commit from me here co-incidentally
> solves the riscv instance of the warning that the series yall were
> talking with SFR about today promotes out of W=2.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetree fixes for v6.8-rc6
    https://git.kernel.org/soc/soc/c/4bd5b4c2eb43

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


