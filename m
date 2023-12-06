Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D073EC46CA0
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A71EDC433D9; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86EF5C433CA;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879541;
	bh=WSCXN0s/87dmux2l3wprGubjsEIc/EPLtKScc1IjSqo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cTFjlZKXqzWacn7PTcZ2EkgZ5FQLtY/mmJZMjFt3+4OvwXGZ80kORjtZjGDxHpHlx
	 e50YY5Zu1Vrsk+5ogDzQDcoyFRGEGPdyIeH1Y/QpWxOsbgC/ICLqVEvfaDLuqtE6Fx
	 OPQLlHKRYyNtOvOHZ7k/3mMNMPfNnPpWPMShZTsUDrlRC4jdSt5+QeggqLWm2OaJ5g
	 1fLK+Kc8OFXeyXxZE7tjHzeicp2Ljs4exW0DxXM2xx2YlZ5pdHw/ZgE0dAxY4pDu+U
	 9HRpOmmd4XXZ3vBPjjuD/ZpYf38KSfkT+aQFz19vbpvAsiK3PrgheQtHkmGYkTD/Ot
	 548FPIsPhfXxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 66FD7C00446;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170187954141.26038.695635794493439036.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:19:01 +0000
References: <20231205225021.653045-1-florian.fainelli@broadcom.com>
In-Reply-To: <20231205225021.653045-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  5 Dec 2023 14:50:21 -0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.7/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree fixes for 6.7
    https://git.kernel.org/soc/soc/c/56d4eaed1e38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


