Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54741C47088
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 347F2C4314C; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EBEFC43144;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=odD1UbkF4p/jy14UvAFrD4XXo24vzS/0nTNGZg7DQjY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XiFQLukyKBESo9CLcN6GmK3s6ZKntjuHBnK61lXPQsZRnaSEPJP8F9hdujvjFAqON
	 BHRb0ZJIrZ7hZvRH7a9jUA6q+ojO6LrPFpqBFp23IK0jPVEzD0x4OdIvynZ5xGSmy4
	 5p/3F4I8IVnaOMCLz1xwtGtc125BzothoNif2jTviWy9dzFHuchzc2OLEVMg00zkx2
	 nXAbVqJA5xbtxbqeNlDFpqUziiQ7EvdKsylYbksQGrO751Oqv1jhE5Mbr5evUEsWSp
	 sY/wiQDZS3THJE98Z1ADPj8oWnxwAtB8WW/oUiFn4TH2trWgobnAUaOf3bokiu+shc
	 AGLk3oeV3vk6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F1CE1E270C9;
	Wed, 23 Nov 2022 12:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482398.7332.4273059816401727359.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:00:23 +0000
References: <6274427.GXAFRqVoOG@phil>
In-Reply-To: <6274427.GXAFRqVoOG@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Nov 2022 10:07:32 +0100 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.1
    https://git.kernel.org/soc/soc/c/706450b5c321

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


