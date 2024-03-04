Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBBEC54E5C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12979C43601; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF0ACC43394;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=EOza5XzJ40sRvUFq8avIMx13ZIGW53/7RABwp43VMY8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Z10kzs2sAaqeiXcDvpdpsmsfLHkN+8ntQYizmH2TTZQdqE5AdCnXKiUpl/2R0wSYJ
	 0vemeuV2OzT9xfcnNB5c7QUrHPwN50OResrmZS/oHBhW5oQRQcDzY7OJHnw6si1bwo
	 YVyh8eUzDrk0iochC6aUCM6EtuUrmFy3bo4CkyEcuwfZznKTlcp4twvoJJppUCmAbS
	 ofMGsBrVr5OHiqEC2Wcv0mks0agzBVvCARAm6aU5PJ6GXNevxLJgPw2vtIDB4rWDw6
	 b0ASugpTh5Wb0yZddoIwoVGCRWx61WoPatDlIHYGIMtLoes7axSaN0Jlrn+hLA1N3i
	 MqR+Iex5UY/6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9AB5D88F8A;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.9 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927482.27833.10269208339302151611.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:14 +0000
References: <3258282.tdWV9SEqCh@phil>
In-Reply-To: <3258282.tdWV9SEqCh@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 02 Mar 2024 13:17:03 +0100 you wrote:
> The following changes since commit 15a5ed03000cf61daf87d14628085cb1bc8ae72c:
> 
>   ARM: dts: rockchip: fix rk322x hdmi ports node (2024-02-13 20:22:34 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-dts32-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.9 #2
    https://git.kernel.org/soc/soc/c/73022d5f020d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


