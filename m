Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180BAC43219
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 21:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3E9BC43470; Wed,  2 Nov 2022 21:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A95AFC433D7;
	Wed,  2 Nov 2022 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667423416;
	bh=Jais+pMjFaAVcuWd1GkPczIx+c5eq78EY/GG5FlG+cg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PxT0MKCLFmzTGvWY5oR/vFPtFFruFP8v5cxbNhdxyZaYOLpFdbdCTvyPw7/TL74Hl
	 5829qPrxYyM1Epl/auNLBj26ZpOK185CU26ombszbPlhnLvqIhpvmF57VtKGEJAlZ7
	 BRoC1NCsptf9KKBhA2y4TZWnE7j7zGsIf6JRXnnvJxJCarS2GwJc+1PZJ23LoLrYPv
	 A7ept0LQR3D1WZhmn5Vapen6stl7Xz8iSAIb7j3GMz/s8yLSAeZykuIBt314Hw20MO
	 vzU+Gt/yqeAEeY/+76f19oNK67KiOlEcEfbojDybz/6rtQTjGXQ8V71yLanMzbLaZb
	 kO56wrkBwBvIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8EA11C41620;
	Wed,  2 Nov 2022 21:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: Fixes for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166742341658.30442.16744006946985694793.git-patchwork-notify@kernel.org>
Date: Wed, 02 Nov 2022 21:10:16 +0000
References: <20221102140156.2758137-1-sudeep.holla@arm.com>
In-Reply-To: <20221102140156.2758137-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  2 Nov 2022 14:01:56 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: Fixes for v6.1
    https://git.kernel.org/soc/soc/c/5449cabd95bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


