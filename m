Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890B0C4321E
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58E2BC433D7; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 432FAC4314F;
	Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042286;
	bh=7vupPcq3eQiLi9rDeBmVL8dp20P4N/XrXzVWbhNH954=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BESIq5iDnuR+ezeivQLQIwoatx8svXTFQdFYXpxSAnBJt2xMki2prvEmIwdy3fIMy
	 trcBNAHF6tbEBfjYFeIguf+bUQiYj6/vi/oFKW/+6dtxC8OnpavVGAS3mvwvzHzO8x
	 FWWhz1mOqF+9ETjwtWjunXkaJKL+ClLegJ4XwpWZXuA8+PVv8eunXnakqy2w1MZ2+Q
	 CEhgsc+03UgIAHA21fVc4PgMVUk20foLhQlWN2IY5ThZc6nvW9kYxWSiC9i9Fr8ySh
	 NeG2RJuSe//OVHLePr2p4G3WMmMbYA3nlEpvDgjAAKCgpBOT3gTTBaWmIGCo8bLr9R
	 vHEJgai7tl2Pw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22FF2E29F40;
	Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 fixes for 6.1 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904228613.4359.15022158264755281438.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:51:26 +0000
References: <20221118131205.301662-1-claudiu.beznea@microchip.com>
In-Reply-To: <20221118131205.301662-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 15:12:05 +0200 you wrote:
> The following changes since commit cef8cdc0d0e7c701fe4dcfba4ed3fd25d28a6020:
> 
>   ARM: at91: pm: avoid soft resetting AC DLL (2022-11-01 12:25:19 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.1-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 fixes for 6.1 #2
    https://git.kernel.org/soc/soc/c/37cd15e68fc2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


