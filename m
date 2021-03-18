Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCAAC433DB
	for <soc@archiver.kernel.org>; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 71B7064F53; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5AA9864F33;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616109012;
	bh=sYmBu/zptOhghQvASLe4f3vIrlNOwWeijdFst9ZIQxk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NuiZcuN5IqxOyi8VJQNisurHkDJL5rZwhMPMiv40LfxzocmNbiRsOWNwIsonMBkxM
	 n2/GzIK6JPjnT9Q44ctDNN1NwxiFZjN7NwR6xnZK4L0f/xPp+awcyfi3KRkMvW6t4O
	 3LrYnoP4wW/23GXFvExrjFM4tmLfhfoCZlfCFwQEQglnxvVxVYCSkmfCzZnhm1jHiw
	 USh5acERrIWsw19qUm4eclPq/wy7XNw5AlQRjqIODdJYhdVtNM19DdUWO8N2wcXmm2
	 FcvbAM2+T8RPL6P7KoBUl9N3EIaft+0fY8Go4aQHwNovhcFIXvAxglpXYFVwZXE7K6
	 iI5Om8siocx4w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4E3396097B;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: fixes for 5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161610901231.20140.279113367869329140.git-patchwork-notify@kernel.org>
Date: Thu, 18 Mar 2021 23:10:12 +0000
References: <20210310160547.55382-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210310160547.55382-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 10 Mar 2021 17:05:47 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are some fixes for 5.12. It's not regression vs. previous revision, this
> is why I send them early in the cycle.
> I based my branch on top of 5.12-rc2 because I noticed that your "master"
> branch was pointing to it (and of course the "-dontuse" suffix from Linus).
> Tell me if you prefer that I use a more usual "-rc1".
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: fixes for 5.12
    https://git.kernel.org/soc/soc/c/3848421f9d1f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


