Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FD8CDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3184C433CC; Tue, 17 Oct 2023 22:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8EF2C433C7;
	Tue, 17 Oct 2023 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580024;
	bh=+t/jZmtkYhmvGe7boHzhAOh9uqP4n69vLckjOkUnCcY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Exeel7drt/EBQYKhunQpDSGJAQKtoiMdNe2pLtFn8MD9vmrcRZAfJsHjqxAM9e89I
	 k7riWNVVJD6SzGcce7R0Ef790jFgExiO1apEFIie5bSQ8Iz84RwY8U2yDwStCGbvad
	 0Trj2kGEJLHgOHRtwTietsO879KynJO6WhCMKg3Rq5Gwya2++9N4xSYJwWdXid/HXP
	 bDBMNVern3wkffRNfyQjiwk+YsU+c0a94zwSsOxZrbDmUBRRyx92y9LhqvCQ0PiP8W
	 Friob+P2i9tONBcrZmuQudzq6omUVajiWGXDi148hWjkpUw7I9frjlupT4yN1feWSw
	 hI17SGA6lpKkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C6DAE4E9BC;
	Tue, 17 Oct 2023 22:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002457.24805.9253215584137974038.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:24 +0000
References: <1965242.usQuhbGJ8B@phil>
In-Reply-To: <1965242.usQuhbGJ8B@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 23:21:54 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.6
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.6
    https://git.kernel.org/soc/soc/c/5e8a5e895a20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


