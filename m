Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54FDC43217
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1A81C36AEF; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C3E5C36AEC;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652436018;
	bh=ODVU8CwJYviJyPScYMrM7VUeTkirQjxS4lXJzEj3HWY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gIfBvCQG4azA5AlwkuGjJ9/12BOod2O3jLEBUQiCmS0pKIs9+Zz/0874zXhcBXXg5
	 Ir8odv7g1EqLHs/9JYF3D1GFHxhpbWKCfbNDYd+dl12fmBoRHTufpq9QYkt+NgvGvg
	 dYfhC7LeVzVMIhJy21b9x++k6X1kwEPEqUfJkca1mAfpQO55/h7sbuIyh4uRs3nWBs
	 fG9Wu+FEcWrkMfokyVVo0Y0VTKVSyx2y/5LC0ekTmCTJiyPv9B7DYJWnkU1uLjEK8W
	 so4goLFZXE34t8a3XqqNrWdn4seOL8BJM2F5s7WPMjJgTvVLDjfw76ERZWzYwyh/rA
	 6IP/uSmOVoK4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74F4BF0393A;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.19 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165243601847.30999.2905111206703593264.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 10:00:18 +0000
References: <7748558.DvuYhMxLoT@phil>
In-Reply-To: <7748558.DvuYhMxLoT@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 12 May 2022 01:41:27 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in subsequent pull-requests
> Rockchip changes for for 5.19 .
> 
> As always the 64bit DTS part is the big one.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.19 #1
    https://git.kernel.org/soc/soc/c/835c0d9350fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


