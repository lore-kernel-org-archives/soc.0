Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4609C43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A87F7C341CE; Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92BE4C341C0;
	Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657314614;
	bh=ewormWmA6rSE1PdcLu1sPMEdWO5zJOLrEeHLje84tYo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=o/0p/jPExX6D+PDPdXkQWdeMHC07z5TRK6l7Rq4gW8Uypt7vfAU9mVMyQYVSEk3d3
	 KbPjrIZZP/6zDhrJt/ladhqFnlaxXshVFUbL0Rcx26TMC00II4M6bdgzBbRmQVmX38
	 HKWHTGZrJnmf1f4EET8bYu7SKBhDZbJU0HSi9+rWtgovSRS48osdqmo2Z5/payKW02
	 ehxJQrDpnTwKwWI1uVuM2NCzcBkuMFABgEH1IUgFumAXtic79RtbUrloXNpS5oOXuS
	 1eR1ll+UuldLwHi+wH2TBghNKT01pm4EBTiIclQKhdfugT99R8Xj0DK8J/bnjgvpjq
	 9cA41Rktn+sHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 73632E45BE0;
	Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 fixes for v5.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165731461446.21745.11976760728295729445.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 21:10:14 +0000
References: <20220708151621.860339-1-claudiu.beznea@microchip.com>
In-Reply-To: <20220708151621.860339-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Jul 2022 18:16:21 +0300 you wrote:
> Hi, Arnd, Olof, ARM SoC maintainers,
> 
> In case it is not too late, please pull these 2 fixes for 5.19.
> They are necessary for proper working of:
> - I2S1 interface on SAMA5D2
> - switch available on kswitch-d10 based boards.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 fixes for v5.19 #2
    https://git.kernel.org/soc/soc/c/5e7230a4daf9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


