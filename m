Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C85C46CA1
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FB79C433B7; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 254A4C433C7;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=3FNeRzGf5gP1nKb71UZiL4ocVuC13arAPgkyGXY+o6M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ACJtqO6FKgCQytzZjhvMJaeAPmAtPmIXnHAhM3udIpktRNQm1dJPEa4NV/Hle/61s
	 +ER6fYDgpG8Kr+fx+XigzuxsHBTLHlFKIVH2hkoN9MaLDzp2Mghq2/f68Acon4nUzC
	 a59p24VEzOWuznRLTnVZVmYR4fIgTjB0zF1zhMofgiAt+PLwJO60ryeHWwjJMJzOM6
	 F42L5Bga5FnCWrh8r4+DMBULAFIO8sktTpCSMk5JxNcz1LnOPkWldoKib82ygMSswa
	 +ljZ5D+4myXGxmQHuM0rwa5eFoU6oAiQMiau/V8UfGBTELLFhD0qpJWz7Z9/Ck8RbG
	 zAsR1hVLrB/mA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01D84E1F66E;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/5] Renesas SoC updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083800.14185.7972834388224613900.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:38 +0000
References: <cover.1695985418.git.geert+renesas@glider.be>
In-Reply-To: <cover.1695985418.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 Sep 2023 13:10:10 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.7.
> 
> It consists of 5 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Renesas ARM defconfig updates for v6.7
    (no matching commit)
  - [GIT,PULL,2/5] Renesas ARM SoC updates for v6.7
    (no matching commit)
  - [GIT,PULL,3/5] Renesas driver updates for v6.7
    (no matching commit)
  - [GIT,PULL,4/5] Renesas DT binding updates for v6.7
    https://git.kernel.org/soc/soc/c/b898a92e94a6
  - [GIT,PULL,5/5] Renesas DTS updates for v6.7
    https://git.kernel.org/soc/soc/c/161e7cc4b15e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


