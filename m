Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CEFC6FA83
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3445BC43470; Mon, 12 Sep 2022 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10C5CC433D7;
	Mon, 12 Sep 2022 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996617;
	bh=srZrvp31K1ijK6O8z7e//e7DmpCsjwbFHCD2YoRULzw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=q7dVa1WNXQZ5zhNQkoJ7F1heL8WPkRPNGnhn1wVNuxvI763Jz5oV5AZ4ttJRDEo63
	 g+E912kBFCtJIGOKkdmh8bF3+L5JIscQ2q5Vwbu6dkHeEyL90uG7zb2CdxYx8rtV/F
	 DLdGCfyhFrHhr+mjONOIRhdMlhvSKXWLNEehFMEkIXriJMXAMh7tqAQjuPNCUleKHR
	 CAvJpEAowG+hOyDfnglH1TFfZDLWC2XfTsdioFejW3yp1JhSOY+IwsNxrS9vhQJos1
	 UmGV4H95K1IFexTpUWH4QaQPeuES3mQNJgU60JqKYMr9EMIcZZwTc6aGj4JUzNUKIq
	 04TqWt8ei4JZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E39A1C04E59;
	Mon, 12 Sep 2022 15:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299661692.5098.1585833041495715007.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:16 +0000
References: <2645885.mvXUDI8C0e@phil>
In-Reply-To: <2645885.mvXUDI8C0e@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Sep 2022 03:19:36 +0200 you wrote:
> The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:
> 
>   Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.0-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.0
    https://git.kernel.org/soc/soc/c/78c94808a459

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


