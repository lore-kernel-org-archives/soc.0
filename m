Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0187C6FA91
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8526FC43144; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65426C4347C;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944667;
	bh=2eM3kpY/BnoMeR2KAAremfiUZPE758NAPHpyxw5RkcI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=b1QW7LetZ/pcpGGb+Mux58DvK6upExRiDA8B6jM0Cg282uQkeJnlemLnl3uJ4QGCq
	 iVRoNI+4yzt0RZeU/GR04TvGhr0UXBJMBjVNR5VxKzLEpGPUecpJYMOGj9wyWe79nN
	 h9yFV1OqOsMEdDPlLBZGCVx+8Z2I/9Bfx35TIBao/RZ1B19XJIjPr+jikjV3CsybkR
	 9XrZmJlZPbNPLhVV1Pse9W2cUkNnVaOHMkq9vpOYxD06txzhOuXVgRj1itK/ELFtuV
	 BT6xypzoC6BMhHFxktm0jKSsur3647DEDJXGeM3u1Hfz0sdj0AglNP5CbbufcqiN3o
	 q+6kccZhBf9Tg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4CED4E4D03D;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SoC fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394466731.12526.3493430850635576265.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:51:07 +0000
References: <pull-1663140667-273537@atomide.com>
In-Reply-To: <pull-1663140667-273537@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 14 Sep 2022 10:32:16 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 0b3acd1cc0222953035d18176b1e4aa06624fd6e:
> 
>   Merge tag 'driver-core-6.0-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core (2022-09-02 10:55:23 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SoC fixes for omaps
    https://git.kernel.org/soc/soc/c/415da412257b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


