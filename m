Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E81C25B4F
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6932C4DDED; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A15D7C4DDE7;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=GNFOqy3HvANSF57Nqu7Gcqr17mTOzX71zam76Wmaj6U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lfmsXJQ3WSC6IVQGtRGfxNbz6E0v6Sj6YG89CEt88uwMnhsPs0VomwDMdzHM92dtJ
	 TlmKx9QKwGdDIznY8g7rBU7EcxpwOedfNXxBgWARIwYLiJwfMemDZQzCFVw05A3DFd
	 EMC3baYzzRxr5olNNC3fD8YVwB4TLOWZfFlR2IzOi9xtZUHkAD76hPFmk8JYH/23WM
	 7a9lq5xNo44/z7TsFRolspBCk1uP9j30ofqdyEjkfWjxbgZa4hbRQPlRyX7L9WSsbP
	 1bOIXLA9xFtsCaRnVRwnT15oAaLr5hxj8VHvlBBIow8Sm6m1rFVhiY5ZHOsjYQVnqC
	 6IWqR1mfb4kOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97B51C3276F;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483961.24942.16324905836242330308.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <6030a450-fb4e-4e27-a5c3-6f4e0f326d9a@linaro.org>
In-Reply-To: <6030a450-fb4e-4e27-a5c3-6f4e0f326d9a@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 3 May 2024 10:32:04 +0200 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changes for v6.10, with:
> - Initial Amlogic A4 & A5 support
> - MIPI DSI support for G12A, G12B & SM1 SoCs
> - Overlay for Khadas TS050 panel for the Khadas VIM3/VIM3L
> - Amlogic T7 reset controller
> - New board: MNT Reform 2 CM4 adapter with a BPI-CM4 Module, AV400 (Amlogic A5),
> BA400 (Amlogic A4)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.10
    https://git.kernel.org/soc/soc/c/24ae5d2489b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


