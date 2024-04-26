Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA57CC25B5C
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DCE5C4AF08; Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 888DDC32783;
	Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148531;
	bh=GC+ovUCE6cgLwz4GfxS15JaDoYbTUawmiqrIQ6Z3obA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ixKFjBmiFwwCtrfaeiF8Qt53mAR9eV5joQGIfQx5G8kUezdQNjKajF6bxdMBNCWWr
	 AMBZ+6wNa+MkDV3SoGM4U/4WJHhLZP6i1xDaO7rNiWz64IjpTpVSeyle8AkEVA3dUd
	 pwTL52hWWgTrRASbPZZ3Qz6Vd/FPELE+GjptqRwhuSiHjEUr6Rwk2NvhLkGnl78gTb
	 04h/dSsg5tcVtCyYWJls1WatHtTYvwBUJwhXlECVMwIBBAd/ljMPXyITsT/pKvcZ/I
	 gewifU/GWH2cqxppUeTIkpmSrokhz3rXvdG4dBm6UOnXZnp3gdF9Zqw/18qB8bCb0n
	 NtXaXck/e7Nfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79B44C54BA8;
	Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 fixes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171414853149.5338.4485285284969911311.git-patchwork-notify@kernel.org>
Date: Fri, 26 Apr 2024 16:22:11 +0000
References: <20240421124824.960096-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240421124824.960096-1-claudiu.beznea@tuxon.dev>
To: Claudiu <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 21 Apr 2024 15:48:24 +0300 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 fixes for v6.9
    https://git.kernel.org/soc/soc/c/fdabd4b2fb36

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


