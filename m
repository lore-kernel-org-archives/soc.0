Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E1C6FA92
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31F40C4314E; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10F47C43145;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=B7GQedrRJljO08Et1BQTuH6eu66VQngibI5tjm3H2so=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KgHLbyGDV+Whuk/TZwVWR966xjpZEQgti5QUQy4d6itEEGqskJdVm9JLpAWDvcZsW
	 y35m4XiyMIWTfdTLFycDv9nvk0KhGnijLxXPX3qa55dhR/RnSqsXeXIGr/WnczitMv
	 vBjztxQcNlBvU2rFC9F4oqvVv9HU0DBAVrdjWW13I4dCmddKq1h63gUleCW0p6vGiL
	 NZF4HV2Lf7TDwg1xuE6WL36GLWNGFhl2zYZw7hEupvTa4UCj4zxgrxTTTjGuouSrGG
	 dFeAxh4bnZ4Ep+ty1IZc8dFa3N3lVz+43E9pgf98IjhwGhgdh6KKAn+/ENOTKB+Eev
	 II1mcFjL+P/Rg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F24B0E4D03B;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: soc: MediaTek related SoC diver updates for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002698.3905.4307387363035302249.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
References: <498fe3e5-a237-121a-d500-fbb0994906cb@gmail.com>
In-Reply-To: <498fe3e5-a237-121a-d500-fbb0994906cb@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Sep 2022 12:54:33 +0200 you wrote:
> Hi Arnd and Olof,
> 
> Hopefully not too late, see below the MediaTek updates for v6.1.
> 
> The most important updates are support for the PMIC wrapper on MT8183. MT6795
> got support for the display mutex part and MT8186 for the MDP3 mutex.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: soc: MediaTek related SoC diver updates for v6.1
    https://git.kernel.org/soc/soc/c/b49aae5e9493

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


