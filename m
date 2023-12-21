Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BA0C4706E
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 322EEC4339A; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CCB7C433D9;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=0EU7GVTtk/2eTPxOAm3mLv9aqLXcIyKF0Ls5ZSSc3e0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tf4KYLNYO70Bgslq8PwTRRaeU5dU0ZbZgjeSkDAPtMcrDpVCxgQ/tWg1M1T1pfQ9O
	 MMns/FZ+gxjQ19eRoUAXKj92X20nzBXDR+DEnURox1xcH0pfINqvGICOcyQQ2F8dqD
	 E0z3kWKKMdTkv8L26QE3xtyt4uxptn7EWtvFNFDgfaSajfaF4Z0tVXlSvuj4pvguL2
	 pNChv7bARK4IPhdLBzn4f+37YoMalGZ9DkmbktTB/klF3gRl8G8qG//FGr1iL99QCe
	 q2VMbXDnQQ+ky8Zb+j9J/DXlXKf/V3JmJdCiSUlNqGWlPihfG3w5z5ocQSjoIzecN1
	 qM45mIFXi2sSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA57FDD4EF7;
	Thu, 21 Dec 2023 17:41:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.8 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046595.3302.4367830225841845953.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:05 +0000
References: <3197878.5fSG56mABF@phil>
In-Reply-To: <3197878.5fSG56mABF@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Dec 2023 22:33:47 +0100 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.8-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.8 #1
    https://git.kernel.org/soc/soc/c/965c83326e18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


