Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C576BC4321E
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A130FC36AED; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BE50C36AE9;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652436018;
	bh=Gi5Zi2i292CgwcMlfuAL1qWT9CSk+iC0VI0ctcYR9vU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u1bObcOm7it7BapiC2xZ9aBXTRQqqhjFzcXaYBDsaaUv0nv7SiTPtGXaR/Cg1yQTd
	 DHyZB7GEkO6KucxQKPWvxxEXkgCIWEzZQv/UAKUo7v/yZtQO9sV4R8DnCLZh7MkZZD
	 6UPSXcVZ6li4u45k57qluFIZA2BPhRgvZ4EeMMJIeJankZnW1U8sxnWz/q2u/2eeKD
	 TTt16i7c3P65+SnG2Jqj4DM3/Ws/xBOxNR+kpQ4iiEAlB3N5bmwGiPvikgApXKWYek
	 vjswqRgHqDzKsFFapywU/IPrfPnlSDnrX120b5D/CmEYscPi/Nk0emU1TNrovEy4c5
	 CI+I8y9eUV1iw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B093F03937;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.19 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165243601843.30999.8487712117380454237.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 10:00:18 +0000
References: <6919636.31r3eYUQgx@phil>
In-Reply-To: <6919636.31r3eYUQgx@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 12 May 2022 01:41:55 +0200 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.19 #1
    https://git.kernel.org/soc/soc/c/eea502e3c503

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


