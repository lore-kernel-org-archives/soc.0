Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2E3C3527C
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D031C36AE7; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 778E0C34111;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=cZ/DXkEixht1Flmtkocb573jXrO6C9Hr51K6w4RVHxU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=clq7Q2I/mDyC5KM9CDhFF8vdEaTtI0HE0eOXmMUuSXsFgYxgbCvLCEBYnCFBS52sl
	 QRd5jo/PtsI04mRcCYz0Smg325JVOhsIkxqaFQXQnwEcow6pyfSElrTSx0OoQq1BMn
	 Uaj73nhyTrSBLa8SSsK7NTvK7r3BpJ5yiWFIPGF2zXc+cK4uaMAsVyewHJLBY7soVS
	 8MaV5hHNJI+cJicnKyxbiQCLEHm/Oqm0SWHZPb9ZEmnlY+lzs7ZV8ru4c8GO/kM9ND
	 H37oH+rq8jEaYdLOmzOrUU0XWTBK+lA9HaplVeTN8R6PDgj1AuGy9XJuIy00YySbCA
	 lUGvwWbvG38Xg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 649EEF0383A;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: soc for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966340.15608.1846916733516722549.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <20220225121943.71494-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220225121943.71494-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 13:19:43 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the soc changes for 5.18 for two MPU families from Microchip: AT91 and
> Polarfire as we agreed with Conor and discussed with Arnd.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: soc for 5.18
    https://git.kernel.org/soc/soc/c/022e5220f272

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


