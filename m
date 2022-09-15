Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6A4C6FA82
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 621DFC43141; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AC64C433B5;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663273220;
	bh=tx0s/fuSl6/jHlUjLRfESAty8xqMRImwd2Cc8rtn9DI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bD0IgkY6R8I6RcdfNBAdFbL7I6OURdG5PyiJtuISjs8prLQpaZdOIHWa0e54pxqT7
	 pTKUYdlxtzp68Uo49F1B/uFRvXUeIrKApnaOcbZCleoRpBbW9LQwPfLwRDz8Jy0y+Y
	 xmHtEtLRFLyR2YhwRnYoRkfd4NFm7jVH+4jCLmBem+jxxchfWEKRTiQBkHV04HPod8
	 Bd8qvckzmoA6ghhLXyJVPaf1H53Abuc/Em8sjLidHbfyl9kYLwPBlTB0fIzA10E65F
	 9IhMKGjOVse6x1S/QTG5gprMVgYVX02frtBZ/I45dqoTOggPXtVRhRS9o9PJdP552S
	 qGSOH3xuj9q1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 373F9C73FE5;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 fixes for 6.0 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166327322022.27590.6390877145378398987.git-patchwork-notify@kernel.org>
Date: Thu, 15 Sep 2022 20:20:20 +0000
References: <20220915105833.4159850-1-claudiu.beznea@microchip.com>
In-Reply-To: <20220915105833.4159850-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Sep 2022 13:58:33 +0300 you wrote:
> The following changes since commit 3d074b750d2b4c91962f10ea1df1c289ce0d3ce8:
> 
>   ARM: dts: at91: sama5d2_icp: don't keep vdd_other enabled all the time (2022-08-31 10:28:19 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.0-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 fixes for 6.0 #2
    https://git.kernel.org/soc/soc/c/aaa58141a5d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


