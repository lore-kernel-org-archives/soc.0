Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D69C3527E
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B033AC36AF2; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B051C36AEB;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=iOjIKaVzqZphZ3Bzu9On6poXRIkAtbHLEYalTD7r+iw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sIrjkR814oANMZTwa6kZDM9sJOlKyqH9+pwm92RV2olILSYzOb7PLYnwpuvmCLYyJ
	 z/vPSovcSq9qv/EeHDf9KsoZXwGT0KDSV33t9p5mvJ8RUVd/hMEJVZ8STA2H3r2bq4
	 ft4IbXd3xB4IrTBIRiQnEnYxFYz8xKEuRk4PB7NXcLaQ4HdbXh8E0VOMt1bb6G1mng
	 6Ta2+0dWrrQT0CPl/TYi8NDO91SEzft4T+Xi+Fo9HJ4JVRA4CRRucvB8PlNQ35ZeEL
	 2dlCFJde2HdXAgdLvuz/RAMYPRSgQpT4ATlB/gYmEPkAM7etZ6GcJDulEg7V/k8Twq
	 2+02Op/FVmYJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 876B8EAC09C;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966355.15608.16291620396954926488.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <6456947.djgVdjDsCv@phil>
In-Reply-To: <6456947.djgVdjDsCv@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 00:19:16 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in subsequent pull-requests
> Rockchip changes for for 5.18 .
> 
> Only the arm64-one is on the bigger side.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.18 #1
    https://git.kernel.org/soc/soc/c/84d08b2e5417

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


